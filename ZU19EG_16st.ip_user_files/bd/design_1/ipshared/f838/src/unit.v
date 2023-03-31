/*
 *-----------------------------------------------------------------------------
 * Title         : unit
 * Project       : EMAX6
 *-----------------------------------------------------------------------------
 * File          : unit.v
 * Author        : Nakashima
 *                <nakashim@is.naist.jp>
 *                 Yamano
 *                <yamano.ryusuke.yo7@is.naist.jp>
 *                 Kikutani
 *                <kikutani.yuma.kw3@is.naist.jp>
 * Created       : 10.20.2017
 * Last modified : 10.20.2017
 *-----------------------------------------------------------------------------
 * Description : Single Row
 *-----------------------------------------------------------------------------
 * Copyright (c) 2016 by NAIST This model is the confidential and
 * proprietary property of NAIST and the possession or use of this
 * file requires a written license from NAIST.
 *-----------------------------------------------------------------------------
 * Modification history :
 * 10.20.2017 : created
 *-----------------------------------------------------------------------------
 */
`timescale 1ns/1ns
`include "common.vh"

`define NOTYET
module unit
#(
  parameter                                   UNIT_NO = 0
)(
  input  wire                                 ACLK,
  input  wire                                 RSTN,
  input  wire [`REG_CTRL_CMD_BITS-1:0]        ctrl_cmd, 
  input  wire [`EMAX_NCHIP_BITS-1:0]          ctrl_chip,
  input  wire                                 axi_busy,           /*      |  |            |                    |            | |            ^            */
  input  wire                                 pi_unit2_exec,      /*     \    /           v                    v           \   /           |            */
  input  wire [1:0]                           pi_unit2_forstat,   /* +--------------------------------------------------------------------------------+ */
  input  wire                                 pi_unit2_stop,      /* | exring_bin  exring_bin_valid   |  lmring_bin_nemp  lmring_bin  lmring_bin_ful  | */
  output reg                                  unit1_exec,         /* | +------- stage1 ------------+  |   (old ful2)                  (old deq_wait)  | */
  output reg                                  unit1_fold,         /* | +------- stage1 ------------+  |   (old ful2)                  (old deq_wait)  | */
  output reg                                  unit1_stop,         /* | +---------------------------+  |                                               | */
  output reg                                  unit2_exec,         /* | +------- stage2 ------------+  |                                               | */
  output reg                                  unit2_fold,         /* | +------- stage2 ------------+  |                                               | */
  output reg  [1:0]                           unit2_forstat,      /* | +------- stage2 ------------+  |                                               | */
  output reg                                  unit2_stop,         /* | +---------------------------+  |                                               | */
  input  wire                                 exring_bin_valid,   /* | +------- stage3 ------------+  |                                               | */
  input  wire [`BREG_BITS*`EMAX_WIDTH-1:0]    exring_bin,         /* | +---------------------------+  |                                               | */
  input  wire                                 lmring_bin_nemp,    /* | +------- stage4 ------------+  |                                               | */
  input  wire [`LMRING_BR_BITS-1:0]           lmring_bin,         /* | +---------------------------+  |                                               | */
  output wire                                 lmring_bin_ful,     /* | +------- stage5 ------------+  |                                               | */
  output wire [`BREG_BITS*`EMAX_WIDTH-1:0]    exring_bout,        /* | +---------------------------+  |   (old ful2)                  (old deq_wait)  | */
  output wire                                 exring_bout_valid,  /* | exring_bout exring_bout_valid  |  lmring_bout_nemp lering_bout lmring_bout_ful | */
  output wire                                 lmring_bout_nemp,   /* +--------------------------------------------------------------------------------+ */
  output wire [`LMRING_BR_BITS-1:0]           lmring_bout,        /*      |  |            |                    |            | |            ^            */
  input  wire                                 lmring_bout_ful     /*     \    /           v                    v           \   /           |            */
`ifdef DEBUG_FPGA
,
  output wire [7:0]                           lmrangew_ok_o,
  output wire [7:0]                           lmranger_ok_o,
  output wire [30:0]                          addr_top_o,
  output wire [30:0]                          addr_bot_o
`endif
);
// synopsys template

  reg  [1:0]                                  cycle;
  reg  [`REG_CTRL_CMD_BITS-1:0]               cmd;

  always @(posedge ACLK or negedge RSTN) begin
    if (~RSTN) begin
      cycle <= 2'h0;
    end
    else begin
      cycle <= cycle + 2'h1;
    end
  end

  reg                                         one_shot;           /* reset to default */
  reg                                         one_shot2;          /* reset to default */
  reg                                         one_shot_fold;      /* reset to default */
  reg                                         one_shot_fold2;     /* reset to default */
  reg                                         one_shot_fold3;     /* reset to default */
  reg                                         one_shot_fold4;     /* reset to default */
  wire [1:0]                                  stage_forstat;      /* reset to default */
  reg  [1:0]                                  unit1_forstat;      /* reset to default */
  reg  [1:0]                                  unit1_forstat2;     /* reset to default */
  reg  [1:0]                                  unit1_forstat_fold; /* reset to default */
  reg  [1:0]                                  unit1_forstat_fold2;/* reset to default */
  reg  [1:0]                                  unit1_forstat_fold3;/* reset to default */
  reg  [1:0]                                  unit1_forstat_fold4;/* reset to default */
  reg  [`EMAX_ROW_BITS-1:0]                   l_row;      /* 0..63 *//* 0§Œ ™Õ˝π‘§¨µØ∆∞§ŒµØ≈¿ */
  reg  [`EMAX_ROW_BITS:0]                     scon_count; /* conf.mapdist*2 */

  wire 				              unit_rstn = ~(cycle==2'h3 && !axi_busy && ctrl_cmd==`REG_CTRL_CMD_RESET);

  /*------------------------ CONF/REGV/REG-EAR -----------------------*/
  reg  [`CONF_BITS-1:0]                       conf0;
  reg  [`CONF_BITS-1:0]                       conf1;
  reg  [`CONF_BITS-1:0]                       conf2;
  reg  [`CONF_BITS-1:0]                       conf3;
  reg  [`EAR_BITS-1:0]                        regv_ear0;
  reg  [`EAR_BITS-1:0]                        regv_ear1;
  reg  [`EAR_BITS-1:0]                        regv_ear2;
  reg  [`EAR_BITS-1:0]                        regv_ear3;
//   reg  [`LDDMRW_BITS-1:0]                     lddmrw0;
//   reg  [`LDDMRW_BITS-1:0]                     lddmrw1;
//   reg  [`LDDMRW_BITS-1:0]                     lddmrw2;
//   reg  [`LDDMRW_BITS-1:0]                     lddmrw3;


  wire [`CONF_BITS-1:0]                            conf   =       (cycle==2'h0) ? conf0 :
                                                                  (cycle==2'h1) ? conf1 :
                                                                  (cycle==2'h2) ? conf2 :
                                                                                  conf3;

//  wire [1:0]                                    stage1_cycle = cycle;
//  wire [1:0]                                    stage2_cycle = cycle + 2'd3;
//  wire [1:0]                                    stage4_cycle = cycle + 2'd1;
//  wire [1:0]                                    stage3_cycle = cycle + 2'd2;
//  wire [1:0]                                    stage5_cycle = cycle;

  /*------------------------ EXRING -----------------------------*/
  wire                                        stage1_exec     = (cmd==`CMD_EXEC && ((unit1_exec && (l_row==0 || exring_bin_valid))
                                                                                || (unit1_fold &&              exring_bout_valid))) ? 1'b1 : 1'b0;
//wire                                        stage1_exec_old = (cmd==`CMD_EXEC && unit1_exec && (l_row==0 || exring_bin_valid)) ? 1'b1 : 1'b0;
  wire                                        stage1_exec_old = (unit1_exec && (l_row==0 || exring_bin_valid)) ? 1'b1 : 1'b0;
//wire                                        stage1_fold     = (cmd==`CMD_EXEC && unit1_fold && exring_bout_valid) ? 1'b1 : 1'b0;
  wire                                        stage1_fold     = (unit1_fold && exring_bout_valid) ? 1'b1 : 1'b0;
  wire                                        stage2_exec;
  wire                                        stage2_fold;
  wire [`CEX_DATA_BITS-1:0]                   stage1_cx0;
  wire [`CEX_DATA_BITS-1:0]                   stage1_cx1;
  wire [`CEX_DATA_BITS-1:0]                   stage1_cx2;
  wire [`CEX_DATA_BITS-1:0]                   stage1_cx3;
  wire [`REG_DATA_BITS-1:0]                   stage1_tx0;
  wire [`REG_DATA_BITS-1:0]                   stage1_tx1;
  wire [`REG_DATA_BITS-1:0]                   stage1_tx2;
  wire [`REG_DATA_BITS-1:0]                   stage1_tx3;
  wire [`REG_DATA_BITS-1:0]                   stage1_ex1;
  wire [`REG_DATA_BITS-1:0]                   stage1_ex2;
  wire [`REG_DATA_BITS-1:0]                   stage1_ex3;
  wire [`EXRING_ADDR_BITS-1:0]                stage1_ea0b;
  wire [`REG_DATA_BITS-1:0]                   stage1_ea0o;
  wire [`EXRING_ADDR_BITS-1:0]                stage1_ea1b;
  wire [`REG_DATA_BITS-1:0]                   stage1_ea1o;

  wire                                        unit1_arbrk;
  wire [`REG_DATA_BITS-1:0]                   stage4_exd;
  wire [`EXRING_ADDR_BITS-1:0]                stage4_ea0woofs; //°˙MEX
  wire [`EXRING_ADDR_BITS-1:0]                stage4_ea1woofs; //°˙MEX
  wire                                        stage4_lmea0sfma;
  wire                                        stage4_lmea0strq;
  wire [1:0]                                  stage4_lmea0strqcol;       /* ea0.strq_col»÷πÊ  4•µ•§•Ø•Î§À ¨§±§∆º¬π‘ */

  stage1 stage1_inst
  (
    .ACLK               (ACLK                   ),
    .RSTN               (RSTN                   ),
    .UNIRSTN            (unit_rstn              ),
    .one_shot           (one_shot               ),
    .one_shot_fold      (one_shot_fold          ),
    .unit1_forstat      (unit1_forstat          ),
    .unit1_forstat_fold (unit1_forstat_fold     ),
    .cmd                (cmd                    ),
    .conf0              (conf0                  ),
    .conf1              (conf1                  ),
    .conf2              (conf2                  ),
    .conf3              (conf3                  ),
    .regv_ear0          (regv_ear0              ),
    .regv_ear1          (regv_ear1              ),
    .regv_ear2          (regv_ear2              ),
    .regv_ear3          (regv_ear3              ),
    .forstat            (stage_forstat          ),
    .exec               (stage1_exec            ),
    .exec_old           (stage1_exec_old        ),
    .fold               (stage1_fold            ),
    .exring_bin         (exring_bin             ), // from previous unit
    .exring_bino        (exring_bout            ), // from previous unit
    .exdrin             (stage4_exd             ), // from stage4
    .ea0drin            (stage4_ea0woofs        ), // from stage4 //°˙MEX
    .ea1drin            (stage4_ea1woofs        ), // from stage4 //°˙MEX
    .lmea0sfma          (stage4_lmea0sfma       ),
    .lmea0strq          (stage4_lmea0strq       ),
    .lmea0strqcol       (stage4_lmea0strqcol    ),
    .stage2_exec        (stage2_exec            ),
    .stage2_fold        (stage2_fold            ),
    .cx0                (stage1_cx0             ),
    .cx1                (stage1_cx1             ),
    .cx2                (stage1_cx2             ),
    .cx3                (stage1_cx3             ),
    .tx0                (stage1_tx0             ),
    .tx1                (stage1_tx1             ),
    .tx2                (stage1_tx2             ),
    .tx3                (stage1_tx3             ),
    .ex1                (stage1_ex1             ),
    .ex2                (stage1_ex2             ),
    .ex3                (stage1_ex3             ),
    .ea0b               (stage1_ea0b            ),
    .ea0o               (stage1_ea0o            ),
    .ea1b               (stage1_ea1b            ),
    .ea1o               (stage1_ea1o            )
  );

//    wire stage2_exec (cmd=`CMD_EXEC && stage1to2_exec) 1'b1 : 1'b0;
`ifdef ENABLE_FPU
  wire                                        stage2_h_ex1_d_s;
  wire [8:0]                                  stage2_h_ex1_d_exp;
  wire [24+`PEXT:0]                           stage2_h_ex1_d_csa_s; //¢£¢£¢£
  wire [24+`PEXT:0]                           stage2_h_ex1_d_csa_c; //¢£¢£¢£
  wire                                        stage2_h_ex1_d_zero;
  wire                                        stage2_h_ex1_d_inf;
  wire                                        stage2_h_ex1_d_nan;
  wire                                        stage2_h_fadd_s1_s;
  wire [8:0]                                  stage2_h_fadd_s1_exp;
  wire [24+`PEXT:0]                           stage2_h_fadd_s1_frac; //¢£¢£¢£
  wire                                        stage2_h_fadd_s1_zero;
  wire                                        stage2_h_fadd_s1_inf;
  wire                                        stage2_h_fadd_s1_nan;
  wire                                        stage2_l_ex1_d_s;
  wire [8:0]                                  stage2_l_ex1_d_exp;
  wire [24+`PEXT:0]                           stage2_l_ex1_d_csa_s; //¢£¢£¢£
  wire [24+`PEXT:0]                           stage2_l_ex1_d_csa_c; //¢£¢£¢£
  wire                                        stage2_l_ex1_d_zero;
  wire                                        stage2_l_ex1_d_inf;
  wire                                        stage2_l_ex1_d_nan;
  wire                                        stage2_l_fadd_s1_s;
  wire [8:0]                                  stage2_l_fadd_s1_exp;
  wire [24+`PEXT:0]                           stage2_l_fadd_s1_frac; //¢£¢£¢£
  wire                                        stage2_l_fadd_s1_zero;
  wire                                        stage2_l_fadd_s1_inf;
  wire                                        stage2_l_fadd_s1_nan;
`endif
  wire                                        stage3_exec;
  wire                                        stage3_fold;
  wire  [1:0]                                 stage2_cxd;
  wire  [`REG_DATA_BITS-1:0]                  stage2_tx0;
  wire  [`REG_DATA_BITS-1:0]                  stage2_tx1;
  wire  [`REG_DATA_BITS-1:0]                  stage2_tx2;
  wire  [`REG_DATA_BITS-1:0]                  stage2_tx3;
  wire  [5:0]                                 stage2_opo;
`ifdef ENABLE_SPU
  wire  [7:0]                                 stage2_ex2passr1;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmapc0;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmanc0;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmapc1;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmanc1;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmapc2;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmanc2;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmapc3;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmanc3;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmapc4;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmanc4;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmapc5;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmanc5;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmapc6;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmanc6;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmapc7;
  wire  [`SPU_DATA_LOG2-1:0]                  stage2_ex2d_sfmanc7;
`endif
  wire  [`REG_DATA_BITS-1:0]                  stage2_ex2d;
  wire  [`REG_DATA_BITS-1:0]                  stage2_ex4o;
  wire  [5:0]                                 stage2_ex5o;
  wire  [`EXE_WORD_BITS-1:0] 		      mexmr0d; //°˙MEX
  wire  [`EXE_WORD_BITS-1:0] 		      mexmr1d; //°˙MEX
  wire  [`EXRING_ADDR_BITS-1:0]               stage2_ea0d;
  wire  [`EXRING_ADDR_BITS-1:0]               stage2_ea0dofs; //°˙MEX
  wire  [`EXRING_ADDR_BITS-1:0]               stage2_ea1d;
  wire  [`EXRING_ADDR_BITS-1:0]               stage2_ea1dofs; //°˙MEX

  stage2 stage2_inst
  (
    .ACLK               (ACLK                   ),
    .RSTN               (RSTN                   ),
    .UNIRSTN            (unit_rstn              ),
    .conf0              (conf0                  ),
    .conf1              (conf1                  ),
    .conf2              (conf2                  ),
    .conf3              (conf3                  ),
    .lmea0sfma          (stage4_lmea0sfma       ),
    .lmea0strq          (stage4_lmea0strq       ),
    .lmea0strqcol       (stage4_lmea0strqcol    ),
    .exec               (stage2_exec            ),
    .fold               (stage2_fold            ),
    .one_shot2          (one_shot2              ),
    .forstat2           (unit1_forstat2         ),
    .cx0                (stage1_cx0             ),
    .cx1                (stage1_cx1             ),
    .cx2                (stage1_cx2             ),
    .cx3                (stage1_cx3             ),
    .tx0i               (stage1_tx0             ),
    .tx1i               (stage1_tx1             ),
    .tx2i               (stage1_tx2             ),
    .tx3i               (stage1_tx3             ),
    .ex1                (stage1_ex1             ),
    .ex2t               (stage1_ex2             ),
    .ex3                (stage1_ex3             ),
    .mexmr0d            (mexmr0d                ), //°˙MEX
    .mexmr1d            (mexmr1d                ), //°˙MEX
    .stage3_exec        (stage3_exec            ),
    .stage3_fold        (stage3_fold            ),
    .stage_forstat      (stage_forstat          ),
    .cxd                (stage2_cxd             ),
    .tx0                (stage2_tx0             ),
    .tx1                (stage2_tx1             ),
    .tx2                (stage2_tx2             ),
    .tx3                (stage2_tx3             ),
    .opo                (stage2_opo             ),
    .ex2d               (stage2_ex2d            ),
    .ex4o               (stage2_ex4o            ),
    .ex5o               (stage2_ex5o            ),
    .unit1_arbrk        (unit1_arbrk            ),
`ifdef ENABLE_FPU
    .h_ex1_d_s          (stage2_h_ex1_d_s       ),
    .h_ex1_d_exp        (stage2_h_ex1_d_exp     ),
    .h_ex1_d_csa_s      (stage2_h_ex1_d_csa_s   ),
    .h_ex1_d_csa_c      (stage2_h_ex1_d_csa_c   ),
    .h_ex1_d_zero       (stage2_h_ex1_d_zero    ),
    .h_ex1_d_inf        (stage2_h_ex1_d_inf     ),
    .h_ex1_d_nan        (stage2_h_ex1_d_nan     ),
    .h_fadd_s1_s        (stage2_h_fadd_s1_s     ),
    .h_fadd_s1_exp      (stage2_h_fadd_s1_exp   ),
    .h_fadd_s1_frac     (stage2_h_fadd_s1_frac  ),
    .h_fadd_s1_zero     (stage2_h_fadd_s1_zero  ),
    .h_fadd_s1_inf      (stage2_h_fadd_s1_inf   ),
    .h_fadd_s1_nan      (stage2_h_fadd_s1_nan   ),
    .l_ex1_d_s          (stage2_l_ex1_d_s       ),
    .l_ex1_d_exp        (stage2_l_ex1_d_exp     ),
    .l_ex1_d_csa_s      (stage2_l_ex1_d_csa_s   ),
    .l_ex1_d_csa_c      (stage2_l_ex1_d_csa_c   ),
    .l_ex1_d_zero       (stage2_l_ex1_d_zero    ),
    .l_ex1_d_inf        (stage2_l_ex1_d_inf     ),
    .l_ex1_d_nan        (stage2_l_ex1_d_nan     ),
    .l_fadd_s1_s        (stage2_l_fadd_s1_s     ),
    .l_fadd_s1_exp      (stage2_l_fadd_s1_exp   ),
    .l_fadd_s1_frac     (stage2_l_fadd_s1_frac  ),
    .l_fadd_s1_zero     (stage2_l_fadd_s1_zero  ),
    .l_fadd_s1_inf      (stage2_l_fadd_s1_inf   ),
    .l_fadd_s1_nan      (stage2_l_fadd_s1_nan   ),
`endif
`ifdef ENABLE_SPU
    .ex2passr1          (stage2_ex2passr1       ),
    .ex2d_sfmapc0       (stage2_ex2d_sfmapc0    ),
    .ex2d_sfmanc0       (stage2_ex2d_sfmanc0    ),
    .ex2d_sfmapc1       (stage2_ex2d_sfmapc1    ),
    .ex2d_sfmanc1       (stage2_ex2d_sfmanc1    ),
    .ex2d_sfmapc2       (stage2_ex2d_sfmapc2    ),
    .ex2d_sfmanc2       (stage2_ex2d_sfmanc2    ),
    .ex2d_sfmapc3       (stage2_ex2d_sfmapc3    ),
    .ex2d_sfmanc3       (stage2_ex2d_sfmanc3    ),
    .ex2d_sfmapc4       (stage2_ex2d_sfmapc4    ),
    .ex2d_sfmanc4       (stage2_ex2d_sfmanc4    ),
    .ex2d_sfmapc5       (stage2_ex2d_sfmapc5    ),
    .ex2d_sfmanc5       (stage2_ex2d_sfmanc5    ),
    .ex2d_sfmapc6       (stage2_ex2d_sfmapc6    ),
    .ex2d_sfmanc6       (stage2_ex2d_sfmanc6    ),
    .ex2d_sfmapc7       (stage2_ex2d_sfmapc7    ),
    .ex2d_sfmanc7       (stage2_ex2d_sfmanc7    ),
`endif
    .ea0b               (stage1_ea0b            ),
    .ea0o               (stage1_ea0o            ),
    .ea1b               (stage1_ea1b            ),
    .ea1o               (stage1_ea1o            ),
    .ea0d               (stage2_ea0d            ),
    .ea0dofs            (stage2_ea0dofs         ),//°˙MEX
    .ea1d               (stage2_ea1d            ),
    .ea1dofs            (stage2_ea1dofs         ) //°˙MEX
  );

//    wire stage3_exec (cmd=`CMD_EXEC && stage2to3_exec) 1'b1 : 1'b0; 
`ifdef ENABLE_FPU
  wire                                        stage3_h_ex2_d_s;
  wire [ 8:0]                                 stage3_h_ex2_d_exp;
  wire [25+`PEXT:0]                           stage3_h_ex2_d_frac; //¢£¢£¢£
  wire                                        stage3_h_ex2_d_inf;
  wire                                        stage3_h_ex2_d_nan;
  wire                                        stage3_l_ex2_d_s;
  wire [ 8:0]                                 stage3_l_ex2_d_exp;
  wire [25+`PEXT:0]                           stage3_l_ex2_d_frac; //¢£¢£¢£
  wire                                        stage3_l_ex2_d_inf;
  wire                                        stage3_l_ex2_d_nan;
`endif
  wire                                        stage4_exec;
  wire                                        stage4_fold;
  wire [1:0]                                  stage3_cxd;
  wire [`REG_DATA_BITS-1:0]                   stage3_tx0;
  wire [`REG_DATA_BITS-1:0]                   stage3_tx1;
  wire [`REG_DATA_BITS-1:0]                   stage3_tx2;
  wire [`REG_DATA_BITS-1:0]                   stage3_tx3;
  wire [2:0]                                  stage3_opo;
`ifdef ENABLE_SPU
  wire  [7:0]                                 stage3_ex3passr1;
  wire  [31:0]                                stage3_ex3so;
`endif
  wire [`REG_DATA_BITS-1:0]                   stage3_ex3d;
  wire [5:0]                                  stage3_ex5o;
  wire [`EXRING_ADDR_BITS-1:0]                stage3_ea0d;
  wire [`EXRING_ADDR_BITS-1:0]                stage3_ea0woofs; //°˙MEX
  wire [`EXRING_ADDR_BITS-1:0]                stage3_ea1d;
  wire [`EXRING_ADDR_BITS-1:0]                stage3_ea1woofs; //°˙MEX

  stage3 stage3_inst
  (
    .ACLK               (ACLK                   ),
    .RSTN               (RSTN                   ),
    .UNIRSTN            (unit_rstn              ),
    .conf0              (conf0                  ),
    .conf1              (conf1                  ),
    .conf2              (conf2                  ),
    .conf3              (conf3                  ),
    .exec               (stage3_exec            ),
    .fold               (stage3_fold            ),
    .cxdi               (stage2_cxd             ),
    .tx0i               (stage2_tx0             ),
    .tx1i               (stage2_tx1             ),
    .tx2i               (stage2_tx2             ),
    .tx3i               (stage2_tx3             ),
    .opi                (stage2_opo             ),
    .ex2di              (stage2_ex2d            ),
    .ex4i               (stage2_ex4o            ),
    .ex5i               (stage2_ex5o            ),
    .stage4_exec        (stage4_exec            ),
    .stage4_fold        (stage4_fold            ),
    .cxd                (stage3_cxd             ),
    .tx0                (stage3_tx0             ),
    .tx1                (stage3_tx1             ),
    .tx2                (stage3_tx2             ),
    .tx3                (stage3_tx3             ),
    .opo                (stage3_opo             ),
    .ex3d               (stage3_ex3d            ),
    .ex5o               (stage3_ex5o            ),
`ifdef ENABLE_FPU
    .h_ex1_d_s          (stage2_h_ex1_d_s       ),
    .h_ex1_d_exp        (stage2_h_ex1_d_exp     ),
    .h_ex1_d_csa_s      (stage2_h_ex1_d_csa_s   ),
    .h_ex1_d_csa_c      (stage2_h_ex1_d_csa_c   ),
    .h_ex1_d_zero       (stage2_h_ex1_d_zero    ),
    .h_ex1_d_inf        (stage2_h_ex1_d_inf     ),
    .h_ex1_d_nan        (stage2_h_ex1_d_nan     ),
    .h_fadd_s1_s        (stage2_h_fadd_s1_s     ),
    .h_fadd_s1_exp      (stage2_h_fadd_s1_exp   ),
    .h_fadd_s1_frac     (stage2_h_fadd_s1_frac  ),
    .h_fadd_s1_zero     (stage2_h_fadd_s1_zero  ),
    .h_fadd_s1_inf      (stage2_h_fadd_s1_inf   ),
    .h_fadd_s1_nan      (stage2_h_fadd_s1_nan   ),
    .h_ex2_d_s          (stage3_h_ex2_d_s       ),
    .h_ex2_d_exp        (stage3_h_ex2_d_exp     ),
    .h_ex2_d_frac       (stage3_h_ex2_d_frac    ),
    .h_ex2_d_inf        (stage3_h_ex2_d_inf     ),
    .h_ex2_d_nan        (stage3_h_ex2_d_nan     ),
    .l_ex1_d_s          (stage2_l_ex1_d_s       ),
    .l_ex1_d_exp        (stage2_l_ex1_d_exp     ),
    .l_ex1_d_csa_s      (stage2_l_ex1_d_csa_s   ),
    .l_ex1_d_csa_c      (stage2_l_ex1_d_csa_c   ),
    .l_ex1_d_zero       (stage2_l_ex1_d_zero    ),
    .l_ex1_d_inf        (stage2_l_ex1_d_inf     ),
    .l_ex1_d_nan        (stage2_l_ex1_d_nan     ),
    .l_fadd_s1_s        (stage2_l_fadd_s1_s     ),
    .l_fadd_s1_exp      (stage2_l_fadd_s1_exp   ),
    .l_fadd_s1_frac     (stage2_l_fadd_s1_frac  ),
    .l_fadd_s1_zero     (stage2_l_fadd_s1_zero  ),
    .l_fadd_s1_inf      (stage2_l_fadd_s1_inf   ),
    .l_fadd_s1_nan      (stage2_l_fadd_s1_nan   ),
    .l_ex2_d_s          (stage3_l_ex2_d_s       ),
    .l_ex2_d_exp        (stage3_l_ex2_d_exp     ),
    .l_ex2_d_frac       (stage3_l_ex2_d_frac    ),
    .l_ex2_d_inf        (stage3_l_ex2_d_inf     ),
    .l_ex2_d_nan        (stage3_l_ex2_d_nan     ),
`endif
`ifdef ENABLE_SPU
    .ex2passi1          (stage2_ex2passr1       ),
    .ex2di_sfmapc0      (stage2_ex2d_sfmapc0    ),
    .ex2di_sfmanc0      (stage2_ex2d_sfmanc0    ),
    .ex2di_sfmapc1      (stage2_ex2d_sfmapc1    ),
    .ex2di_sfmanc1      (stage2_ex2d_sfmanc1    ),
    .ex2di_sfmapc2      (stage2_ex2d_sfmapc2    ),
    .ex2di_sfmanc2      (stage2_ex2d_sfmanc2    ),
    .ex2di_sfmapc3      (stage2_ex2d_sfmapc3    ),
    .ex2di_sfmanc3      (stage2_ex2d_sfmanc3    ),
    .ex2di_sfmapc4      (stage2_ex2d_sfmapc4    ),
    .ex2di_sfmanc4      (stage2_ex2d_sfmanc4    ),
    .ex2di_sfmapc5      (stage2_ex2d_sfmapc5    ),
    .ex2di_sfmanc5      (stage2_ex2d_sfmanc5    ),
    .ex2di_sfmapc6      (stage2_ex2d_sfmapc6    ),
    .ex2di_sfmanc6      (stage2_ex2d_sfmanc6    ),
    .ex2di_sfmapc7      (stage2_ex2d_sfmapc7    ),
    .ex2di_sfmanc7      (stage2_ex2d_sfmanc7    ),
    .ex3passr1          (stage3_ex3passr1       ),
    .ex3so              (stage3_ex3so           ),
`endif
    .ea0di              (stage2_ea0d            ),
    .ea0dofsi           (stage2_ea0dofs         ),//°˙MEX
    .ea1di              (stage2_ea1d            ),
    .ea1dofsi           (stage2_ea1dofs         ),//°˙MEX
    .ea0d               (stage3_ea0d            ),
    .ea0woofs           (stage3_ea0woofs        ),//°˙MEX
    .ea1d               (stage3_ea1d            ),
    .ea1woofs           (stage3_ea1woofs        ) //°˙MEX
  );

  wire [`REG_DATA_BITS-1:0]                   stage4_tx0;
  wire [`REG_DATA_BITS-1:0]                   stage4_tx1;
  wire [`REG_DATA_BITS-1:0]                   stage4_tx2;
  wire [`REG_DATA_BITS-1:0]                   stage4_tx3;
  wire                                        stage4_tx_valid;
  wire [`EXRING_ADDR_BITS-1:0]                stage4_ea0d;
  wire [`EXRING_ADDR_BITS-1:0]                stage4_ea1d;
  wire [`BREG_BITS-1:0]                       mr0;
  wire [`BREG_BITS-1:0]                       mr1;
  wire                                        lmring_ea0bsy; /* to lmring */
  wire                                        lmring_ea1bsy; /* to lmring */
  wire                                        lmlddmqw_ok;
  wire [7:0]                                  lmrangew_ok;
  wire [7:0]                                  lmranger_ok;
  wire [1:0]                                  lmco;  /* -> col#   */
  wire [`EXRING_ADDR_BITS-1:0]                lmca;  /* -> ea01dr */  /* col#§À§Ë§Î2bit ‰¿µ¡∞addr */
  wire [31:0]                                 lmwm;  /* <- axi    */
  wire [`LMRING_DATA_BITS-1:0]                lmwd;  /* <- axi    */

  stage4 stage4_inst
  (
    .ACLK               (ACLK                   ),
    .RSTN               (RSTN                   ),
    .UNIRSTN            (unit_rstn              ),
    .unit1_forstat_fold4(unit1_forstat_fold4    ),
    .one_shot_fold4     (one_shot_fold4         ),
    .cmd                (cmd                    ),
    .conf0              (conf0                  ),
    .conf1              (conf1                  ),
    .conf2              (conf2                  ),
    .conf3              (conf3                  ),
    .exec               (stage4_exec            ),
    .fold               (stage4_fold            ),
    .cxdi               (stage3_cxd             ),
    .tx0i               (stage3_tx0             ),
    .tx1i               (stage3_tx1             ),
    .tx2i               (stage3_tx2             ),
    .tx3i               (stage3_tx3             ),
    .opi                (stage3_opo             ),
    .ex3di              (stage3_ex3d            ),
    .ex5i               (stage3_ex5o            ),
    .tx0                  (stage4_tx0             ),
    .tx1                  (stage4_tx1             ),
    .tx2                  (stage4_tx2             ),
    .tx3                  (stage4_tx3             ),
    .tx_valid             (stage4_tx_valid        ),
    .exd                  (stage4_exd             ),
`ifdef ENABLE_FPU
    .h_ex2_d_s            (stage3_h_ex2_d_s       ),
    .h_ex2_d_exp          (stage3_h_ex2_d_exp     ),
    .h_ex2_d_frac         (stage3_h_ex2_d_frac    ),
    .h_ex2_d_inf          (stage3_h_ex2_d_inf     ),
    .h_ex2_d_nan          (stage3_h_ex2_d_nan     ),
    .l_ex2_d_s            (stage3_l_ex2_d_s       ),
    .l_ex2_d_exp          (stage3_l_ex2_d_exp     ),
    .l_ex2_d_frac         (stage3_l_ex2_d_frac    ),
    .l_ex2_d_inf          (stage3_l_ex2_d_inf     ),
    .l_ex2_d_nan          (stage3_l_ex2_d_nan     ),
`endif
`ifdef ENABLE_SPU
    .ex3passi1            (stage3_ex3passr1       ),
    .ex3si                (stage3_ex3so           ),
`endif
    .ea0di                (stage3_ea0d            ),
    .ea0woofsi            (stage3_ea0woofs        ),//°˙MEX
    .ea1di                (stage3_ea1d            ),
    .ea1woofsi            (stage3_ea1woofs        ),//°˙MEX
    .ea0d                 (stage4_ea0d            ),
    .ea0woofs             (stage4_ea0woofs        ),//°˙MEX
    .ea1d                 (stage4_ea1d            ),
    .ea1woofs             (stage4_ea1woofs        ),//°˙MEX
    .lmring_bin           (lmring_bin             ), /*          from previous unit         */
    .lmlddmqw_ok          (lmlddmqw_ok            ), /*          from lmring                */
    .lmea0sfma            (stage4_lmea0sfma       ),
    .lmea0strq            (stage4_lmea0strq       ),
    .lmea0strqcol         (stage4_lmea0strqcol    ),
    .lmrangew_ok          (|lmrangew_ok           ), /*          from lmring                */
    .lmranger_ok          (|lmranger_ok           ), /*          from lmring                */
    .lmring_bin_nemp      (lmring_bin_nemp        ), /* ful2     from previous unit         */
    .lmring_bin_ful       (lmring_bin_ful         ), /* deq_wait from lmring                */
    .lmring_ea0bsy        (lmring_ea0bsy          ), /* to lmring                           */
    .lmring_ea1bsy        (lmring_ea1bsy          ), /* to lmring                           */
    .lmco                 (lmco                   ), /* -> col#                             */
    .lmca                 (lmca                   ), /* -> ea01dr  col#§À§Ë§Î2bit ‰¿µ¡∞addr */
    .lmwm                 (lmwm                   ), /* <- axi                              */
    .lmwd                 (lmwd                   ), /* <- axi                              */
    .mr0                  (mr0                    ),
    .mr1                  (mr1                    )
  );

  wire 				              lmring_ful1;
  wire [`LMRING_TR_BITS-1:0]                  tr;

  stage5 stage5_inst
  (
    .ACLK               (ACLK                   ),
    .RSTN               (RSTN                   ),
    .UNIRSTN            (unit_rstn              ),
    .cmd                (cmd                    ),
    .chip               (ctrl_chip              ),
    .l_row              (l_row                  ),
    .scon_count         (scon_count             ),
    .unit1_exec         (unit1_exec             ),
    .conf0              (conf0                  ),
    .conf1              (conf1                  ),
    .conf2              (conf2                  ),
    .conf3              (conf3                  ),
    .tr_valid           (stage4_tx_valid        ),
    .tr                 (tr                     ),
    .lmring_ful1        (lmring_ful1            ),
    .tx0i               (stage4_tx0             ),
    .tx1i               (stage4_tx1             ),
    .tx2i               (stage4_tx2             ),
    .tx3i               (stage4_tx3             ),
    .exdi               (stage4_exd             ),
    .ea0di              (stage4_ea0d            ),
    .ea0woofsi          (stage4_ea0woofs        ),//°˙MEX
    .ea1di              (stage4_ea1d            ),
    .ea1woofsi          (stage4_ea1woofs        ),//°˙MEX
    .mr0                (mr0                    ),
    .mr1                (mr1                    ),
    .mexmr0d            (mexmr0d                ), //°˙MEX
    .mexmr1d            (mexmr1d                ), //°˙MEX
    .bout               (exring_bout            ),
    .bout_valid         (exring_bout_valid      )
  );

  /*------------------------ LMRING -----------------------------*/
  lmring lmring
  (
    .ACLK               (ACLK                   ),
    .RSTN               (RSTN                   ),
    .chip               (ctrl_chip              ),
    .l_row              (l_row                  ),
    .conf0              (conf0                  ),
    .conf1              (conf1                  ),
    .conf2              (conf2                  ),
    .conf3              (conf3                  ),
    .regv_ear0          (regv_ear0              ),
    .regv_ear1          (regv_ear1              ),
    .regv_ear2          (regv_ear2              ),
    .regv_ear3          (regv_ear3              ),
    .lmring_bin_nemp    (lmring_bin_nemp        ),
    .lmring_bin         (lmring_bin             ),
    .lmring_bin_ful     (lmring_bin_ful         ),
    .lmring_ea0bsy      (lmring_ea0bsy          ),
    .lmring_ea1bsy      (lmring_ea1bsy          ),
    .lmlddmqw_ok        (lmlddmqw_ok            ),
    .lmrangew_ok        (lmrangew_ok            ),
    .lmranger_ok        (lmranger_ok            ),
    .lmco               (lmco                   ),
    .lmca               (lmca                   ),
    .lmwm               (lmwm                   ),
    .lmwd               (lmwd                   ),
    .mr1                (mr1                    ),
    .lmring_ful1        (lmring_ful1            ),
    .tr                 (tr                     ),
    .lmring_bout_nemp   (lmring_bout_nemp       ),
    .lmring_bout        (lmring_bout            ),
    .lmring_bout_ful    (lmring_bout_ful        )
`ifdef DEBUG_FPGA
    ,
    .addr_top_o         (addr_top_o),
    .addr_bot_o         (addr_bot_o)
`endif
  );

`ifdef DEBUG_FPGA
   assign     lmrangew_ok_o = lmrangew_ok;
   assign     lmranger_ok_o = lmranger_ok;
`endif
   
  /*------------------------ CONF/REGV/REG-EAR -------------------*/

  wire [30:0]                   tr_addr = tr[`LMRING_TR_A];
  wire [31:0]                   tr_dm   = tr[`LMRING_TR_DM];
  wire [`LMRING_DATA_BITS-1:0]  tr_d    = tr[`LMRING_TR_D];
  wire [`EMAX_NCHIP_BITS-1:0]   cdx     = tr_addr[16+`EMAX_NCHIP_BITS-1:16]; // selecting chip
  wire [`EMAX_ROW_BITS-1:0]     row     = tr_addr[12:7]; // selecting logical unit
  wire [1:0]                    col     = tr_addr[6:5];
  always @(posedge ACLK or negedge RSTN) begin
    if (~RSTN) begin
      conf0       <= {(`CONF_BITS){1'b0}};
      conf1       <= {(`CONF_BITS){1'b0}};
      conf2       <= {(`CONF_BITS){1'b0}};
      conf3       <= {(`CONF_BITS){1'b0}};
      regv_ear0   <= {(`EAR_BITS){1'b0}};
      regv_ear1   <= {(`EAR_BITS){1'b0}};
      regv_ear2   <= {(`EAR_BITS){1'b0}};
      regv_ear3   <= {(`EAR_BITS){1'b0}};
//       lddmrw0     <= {(`LDDMRW_BITS){1'b0}};
//       lddmrw1     <= {(`LDDMRW_BITS){1'b0}};
//       lddmrw2     <= {(`LDDMRW_BITS){1'b0}};
//       lddmrw3     <= {(`LDDMRW_BITS){1'b0}};
    end
    else begin
      if (cmd==`CMD_SCON && unit1_exec && scon_count[0]) begin /* scon */
        case (cycle)
          2'h0: conf0 <= exring_bin[256*0+255:256*0];
          2'h1: conf1 <= exring_bin[256*1+255:256*1];
          2'h2: conf2 <= exring_bin[256*2+255:256*2];
          2'h3: conf3 <= exring_bin[256*3+255:256*3];
        endcase
      end
      else if (cmd==`CMD_EXEC && lmring_ful1 && (ctrl_chip == cdx || cdx == `EMAX_NCHIP_BITS'd0) && l_row == row) begin /* reg setup by PIO */
        case(tr[`LMRING_TR_TY]) /* breg§œstage5§Œ√Ê */
          3'h2: begin /* reg/addr */
            case (col)
              2'h0: begin
                if (tr_dm[20]) regv_ear0[8*23+7 :8*20] <= tr_d[8*23+7 :8*20];
                if (tr_dm[16]) regv_ear0[8*19+7 :8*16] <= tr_d[8*19+7 :8*16];
                if (tr_dm[12]) regv_ear0[8*15+7 :8*12] <= tr_d[8*15+7 :8*12];
                if (tr_dm[ 8]) regv_ear0[8*11+7 :8* 8] <= tr_d[8*11+7 :8* 8];
                if (tr_dm[ 4]) regv_ear0[8* 7+7 :8* 4] <= tr_d[8* 7+7 :8* 4];
                if (tr_dm[ 0]) regv_ear0[8* 3+7 :8* 0] <= tr_d[8* 3+7 :8* 0];
              end
              2'h1: begin
                if (tr_dm[20]) regv_ear1[8*23+7 :8*20] <= tr_d[8*23+7 :8*20];
                if (tr_dm[16]) regv_ear1[8*19+7 :8*16] <= tr_d[8*19+7 :8*16];
                if (tr_dm[12]) regv_ear1[8*15+7 :8*12] <= tr_d[8*15+7 :8*12];
                if (tr_dm[ 8]) regv_ear1[8*11+7 :8* 8] <= tr_d[8*11+7 :8* 8];
                if (tr_dm[ 4]) regv_ear1[8* 7+7 :8* 4] <= tr_d[8* 7+7 :8* 4];
                if (tr_dm[ 0]) regv_ear1[8* 3+7 :8* 0] <= tr_d[8* 3+7 :8* 0];
              end
              2'h2: begin
                if (tr_dm[20]) regv_ear2[8*23+7 :8*20] <= tr_d[8*23+7 :8*20];
                if (tr_dm[16]) regv_ear2[8*19+7 :8*16] <= tr_d[8*19+7 :8*16];
                if (tr_dm[12]) regv_ear2[8*15+7 :8*12] <= tr_d[8*15+7 :8*12];
                if (tr_dm[ 8]) regv_ear2[8*11+7 :8* 8] <= tr_d[8*11+7 :8* 8];
                if (tr_dm[ 4]) regv_ear2[8* 7+7 :8* 4] <= tr_d[8* 7+7 :8* 4];
                if (tr_dm[ 0]) regv_ear2[8* 3+7 :8* 0] <= tr_d[8* 3+7 :8* 0];
              end
              2'h3: begin
                if (tr_dm[20]) regv_ear3[8*23+7 :8*20] <= tr_d[8*23+7 :8*20];
                if (tr_dm[16]) regv_ear3[8*19+7 :8*16] <= tr_d[8*19+7 :8*16];
                if (tr_dm[12]) regv_ear3[8*15+7 :8*12] <= tr_d[8*15+7 :8*12];
                if (tr_dm[ 8]) regv_ear3[8*11+7 :8* 8] <= tr_d[8*11+7 :8* 8];
                if (tr_dm[ 4]) regv_ear3[8* 7+7 :8* 4] <= tr_d[8* 7+7 :8* 4];
                if (tr_dm[ 0]) regv_ear3[8* 3+7 :8* 0] <= tr_d[8* 3+7 :8* 0];
              end
            endcase
          end

//          3'h3: begin/* lddmq/tr */
//             case (col)
//               2'h0: begin
//                 if (tr_dm[31]) lddmrw0[8*31+7 :8*31] <= tr_d[8*31+7 :8*31];
//                 if (tr_dm[30]) lddmrw0[8*30+7 :8*30] <= tr_d[8*30+7 :8*30];
//                 if (tr_dm[29]) lddmrw0[8*29+7 :8*29] <= tr_d[8*29+7 :8*29];
//                 if (tr_dm[28]) lddmrw0[8*28+7 :8*28] <= tr_d[8*28+7 :8*28];
//                 if (tr_dm[27]) lddmrw0[8*27+7 :8*27] <= tr_d[8*27+7 :8*27];
//                 if (tr_dm[26]) lddmrw0[8*26+7 :8*26] <= tr_d[8*26+7 :8*26];
//                 if (tr_dm[25]) lddmrw0[8*25+7 :8*25] <= tr_d[8*25+7 :8*25];
//                 if (tr_dm[24]) lddmrw0[8*24+7 :8*24] <= tr_d[8*24+7 :8*24];
//                 if (tr_dm[23]) lddmrw0[8*23+7 :8*23] <= tr_d[8*23+7 :8*23];
//                 if (tr_dm[22]) lddmrw0[8*22+7 :8*22] <= tr_d[8*22+7 :8*22];
//                 if (tr_dm[21]) lddmrw0[8*21+7 :8*21] <= tr_d[8*21+7 :8*21];
//                 if (tr_dm[20]) lddmrw0[8*20+7 :8*20] <= tr_d[8*20+7 :8*20];
//                 if (tr_dm[19]) lddmrw0[8*19+7 :8*19] <= tr_d[8*19+7 :8*19];
//                 if (tr_dm[18]) lddmrw0[8*18+7 :8*18] <= tr_d[8*18+7 :8*18];
//                 if (tr_dm[17]) lddmrw0[8*17+7 :8*17] <= tr_d[8*17+7 :8*17];
//                 if (tr_dm[16]) lddmrw0[8*16+7 :8*16] <= tr_d[8*16+7 :8*16];
//                 if (tr_dm[15]) lddmrw0[8*15+7 :8*15] <= tr_d[8*15+7 :8*15];
//                 if (tr_dm[14]) lddmrw0[8*14+7 :8*14] <= tr_d[8*14+7 :8*14];
//                 if (tr_dm[13]) lddmrw0[8*13+7 :8*13] <= tr_d[8*13+7 :8*13];
//                 if (tr_dm[12]) lddmrw0[8*12+7 :8*12] <= tr_d[8*12+7 :8*12];
//                 if (tr_dm[11]) lddmrw0[8*11+7 :8*11] <= tr_d[8*11+7 :8*11];
//                 if (tr_dm[10]) lddmrw0[8*10+7 :8*10] <= tr_d[8*10+7 :8*10];
//                 if (tr_dm[ 9]) lddmrw0[8* 9+7 :8* 9] <= tr_d[8* 9+7 :8* 9];
//                 if (tr_dm[ 8]) lddmrw0[8* 8+7 :8* 8] <= tr_d[8* 8+7 :8* 8];
//                 if (tr_dm[ 7]) lddmrw0[8* 7+7 :8* 7] <= tr_d[8* 7+7 :8* 7];
//                 if (tr_dm[ 6]) lddmrw0[8* 6+7 :8* 6] <= tr_d[8* 6+7 :8* 6];
//                 if (tr_dm[ 5]) lddmrw0[8* 5+7 :8* 5] <= tr_d[8* 5+7 :8* 5];
//                 if (tr_dm[ 4]) lddmrw0[8* 4+7 :8* 4] <= tr_d[8* 4+7 :8* 4];
//                 if (tr_dm[ 3]) lddmrw0[8* 3+7 :8* 3] <= tr_d[8* 3+7 :8* 3];
//                 if (tr_dm[ 2]) lddmrw0[8* 2+7 :8* 2] <= tr_d[8* 2+7 :8* 2];
//                 if (tr_dm[ 1]) lddmrw0[8* 1+7 :8* 1] <= tr_d[8* 1+7 :8* 1];
//                 if (tr_dm[ 0]) lddmrw0[8* 0+7 :8* 0] <= tr_d[8* 0+7 :8* 0];
//               end
//               2'h1: begin
//                 if (tr_dm[31]) lddmrw1[8*31+7 :8*31] <= tr_d[8*31+7 :8*31];
//                 if (tr_dm[30]) lddmrw1[8*30+7 :8*30] <= tr_d[8*30+7 :8*30];
//                 if (tr_dm[29]) lddmrw1[8*29+7 :8*29] <= tr_d[8*29+7 :8*29];
//                 if (tr_dm[28]) lddmrw1[8*28+7 :8*28] <= tr_d[8*28+7 :8*28];
//                 if (tr_dm[27]) lddmrw1[8*27+7 :8*27] <= tr_d[8*27+7 :8*27];
//                 if (tr_dm[26]) lddmrw1[8*26+7 :8*26] <= tr_d[8*26+7 :8*26];
//                 if (tr_dm[25]) lddmrw1[8*25+7 :8*25] <= tr_d[8*25+7 :8*25];
//                 if (tr_dm[24]) lddmrw1[8*24+7 :8*24] <= tr_d[8*24+7 :8*24];
//                 if (tr_dm[23]) lddmrw1[8*23+7 :8*23] <= tr_d[8*23+7 :8*23];
//                 if (tr_dm[22]) lddmrw1[8*22+7 :8*22] <= tr_d[8*22+7 :8*22];
//                 if (tr_dm[21]) lddmrw1[8*21+7 :8*21] <= tr_d[8*21+7 :8*21];
//                 if (tr_dm[20]) lddmrw1[8*20+7 :8*20] <= tr_d[8*20+7 :8*20];
//                 if (tr_dm[19]) lddmrw1[8*19+7 :8*19] <= tr_d[8*19+7 :8*19];
//                 if (tr_dm[18]) lddmrw1[8*18+7 :8*18] <= tr_d[8*18+7 :8*18];
//                 if (tr_dm[17]) lddmrw1[8*17+7 :8*17] <= tr_d[8*17+7 :8*17];
//                 if (tr_dm[16]) lddmrw1[8*16+7 :8*16] <= tr_d[8*16+7 :8*16];
//                 if (tr_dm[15]) lddmrw1[8*15+7 :8*15] <= tr_d[8*15+7 :8*15];
//                 if (tr_dm[14]) lddmrw1[8*14+7 :8*14] <= tr_d[8*14+7 :8*14];
//                 if (tr_dm[13]) lddmrw1[8*13+7 :8*13] <= tr_d[8*13+7 :8*13];
//                 if (tr_dm[12]) lddmrw1[8*12+7 :8*12] <= tr_d[8*12+7 :8*12];
//                 if (tr_dm[11]) lddmrw1[8*11+7 :8*11] <= tr_d[8*11+7 :8*11];
//                 if (tr_dm[10]) lddmrw1[8*10+7 :8*10] <= tr_d[8*10+7 :8*10];
//                 if (tr_dm[ 9]) lddmrw1[8* 9+7 :8* 9] <= tr_d[8* 9+7 :8* 9];
//                 if (tr_dm[ 8]) lddmrw1[8* 8+7 :8* 8] <= tr_d[8* 8+7 :8* 8];
//                 if (tr_dm[ 7]) lddmrw1[8* 7+7 :8* 7] <= tr_d[8* 7+7 :8* 7];
//                 if (tr_dm[ 6]) lddmrw1[8* 6+7 :8* 6] <= tr_d[8* 6+7 :8* 6];
//                 if (tr_dm[ 5]) lddmrw1[8* 5+7 :8* 5] <= tr_d[8* 5+7 :8* 5];
//                 if (tr_dm[ 4]) lddmrw1[8* 4+7 :8* 4] <= tr_d[8* 4+7 :8* 4];
//                 if (tr_dm[ 3]) lddmrw1[8* 3+7 :8* 3] <= tr_d[8* 3+7 :8* 3];
//                 if (tr_dm[ 2]) lddmrw1[8* 2+7 :8* 2] <= tr_d[8* 2+7 :8* 2];
//                 if (tr_dm[ 1]) lddmrw1[8* 1+7 :8* 1] <= tr_d[8* 1+7 :8* 1];
//                 if (tr_dm[ 0]) lddmrw1[8* 0+7 :8* 0] <= tr_d[8* 0+7 :8* 0];
//               end
//               2'h2: begin
//                 if (tr_dm[31]) lddmrw2[8*31+7 :8*31] <= tr_d[8*31+7 :8*31];
//                 if (tr_dm[30]) lddmrw2[8*30+7 :8*30] <= tr_d[8*30+7 :8*30];
//                 if (tr_dm[29]) lddmrw2[8*29+7 :8*29] <= tr_d[8*29+7 :8*29];
//                 if (tr_dm[28]) lddmrw2[8*28+7 :8*28] <= tr_d[8*28+7 :8*28];
//                 if (tr_dm[27]) lddmrw2[8*27+7 :8*27] <= tr_d[8*27+7 :8*27];
//                 if (tr_dm[26]) lddmrw2[8*26+7 :8*26] <= tr_d[8*26+7 :8*26];
//                 if (tr_dm[25]) lddmrw2[8*25+7 :8*25] <= tr_d[8*25+7 :8*25];
//                 if (tr_dm[24]) lddmrw2[8*24+7 :8*24] <= tr_d[8*24+7 :8*24];
//                 if (tr_dm[23]) lddmrw2[8*23+7 :8*23] <= tr_d[8*23+7 :8*23];
//                 if (tr_dm[22]) lddmrw2[8*22+7 :8*22] <= tr_d[8*22+7 :8*22];
//                 if (tr_dm[21]) lddmrw2[8*21+7 :8*21] <= tr_d[8*21+7 :8*21];
//                 if (tr_dm[20]) lddmrw2[8*20+7 :8*20] <= tr_d[8*20+7 :8*20];
//                 if (tr_dm[19]) lddmrw2[8*19+7 :8*19] <= tr_d[8*19+7 :8*19];
//                 if (tr_dm[18]) lddmrw2[8*18+7 :8*18] <= tr_d[8*18+7 :8*18];
//                 if (tr_dm[17]) lddmrw2[8*17+7 :8*17] <= tr_d[8*17+7 :8*17];
//                 if (tr_dm[16]) lddmrw2[8*16+7 :8*16] <= tr_d[8*16+7 :8*16];
//                 if (tr_dm[15]) lddmrw2[8*15+7 :8*15] <= tr_d[8*15+7 :8*15];
//                 if (tr_dm[14]) lddmrw2[8*14+7 :8*14] <= tr_d[8*14+7 :8*14];
//                 if (tr_dm[13]) lddmrw2[8*13+7 :8*13] <= tr_d[8*13+7 :8*13];
//                 if (tr_dm[12]) lddmrw2[8*12+7 :8*12] <= tr_d[8*12+7 :8*12];
//                 if (tr_dm[11]) lddmrw2[8*11+7 :8*11] <= tr_d[8*11+7 :8*11];
//                 if (tr_dm[10]) lddmrw2[8*10+7 :8*10] <= tr_d[8*10+7 :8*10];
//                 if (tr_dm[ 9]) lddmrw2[8* 9+7 :8* 9] <= tr_d[8* 9+7 :8* 9];
//                 if (tr_dm[ 8]) lddmrw2[8* 8+7 :8* 8] <= tr_d[8* 8+7 :8* 8];
//                 if (tr_dm[ 7]) lddmrw2[8* 7+7 :8* 7] <= tr_d[8* 7+7 :8* 7];
//                 if (tr_dm[ 6]) lddmrw2[8* 6+7 :8* 6] <= tr_d[8* 6+7 :8* 6];
//                 if (tr_dm[ 5]) lddmrw2[8* 5+7 :8* 5] <= tr_d[8* 5+7 :8* 5];
//                 if (tr_dm[ 4]) lddmrw2[8* 4+7 :8* 4] <= tr_d[8* 4+7 :8* 4];
//                 if (tr_dm[ 3]) lddmrw2[8* 3+7 :8* 3] <= tr_d[8* 3+7 :8* 3];
//                 if (tr_dm[ 2]) lddmrw2[8* 2+7 :8* 2] <= tr_d[8* 2+7 :8* 2];
//                 if (tr_dm[ 1]) lddmrw2[8* 1+7 :8* 1] <= tr_d[8* 1+7 :8* 1];
//                 if (tr_dm[ 0]) lddmrw2[8* 0+7 :8* 0] <= tr_d[8* 0+7 :8* 0];
//               end
//               2'h3: begin
//                 if (tr_dm[31]) lddmrw3[8*31+7 :8*31] <= tr_d[8*31+7 :8*31];
//                 if (tr_dm[30]) lddmrw3[8*30+7 :8*30] <= tr_d[8*30+7 :8*30];
//                 if (tr_dm[29]) lddmrw3[8*29+7 :8*29] <= tr_d[8*29+7 :8*29];
//                 if (tr_dm[28]) lddmrw3[8*28+7 :8*28] <= tr_d[8*28+7 :8*28];
//                 if (tr_dm[27]) lddmrw3[8*27+7 :8*27] <= tr_d[8*27+7 :8*27];
//                 if (tr_dm[26]) lddmrw3[8*26+7 :8*26] <= tr_d[8*26+7 :8*26];
//                 if (tr_dm[25]) lddmrw3[8*25+7 :8*25] <= tr_d[8*25+7 :8*25];
//                 if (tr_dm[24]) lddmrw3[8*24+7 :8*24] <= tr_d[8*24+7 :8*24];
//                 if (tr_dm[23]) lddmrw3[8*23+7 :8*23] <= tr_d[8*23+7 :8*23];
//                 if (tr_dm[22]) lddmrw3[8*22+7 :8*22] <= tr_d[8*22+7 :8*22];
//                 if (tr_dm[21]) lddmrw3[8*21+7 :8*21] <= tr_d[8*21+7 :8*21];
//                 if (tr_dm[20]) lddmrw3[8*20+7 :8*20] <= tr_d[8*20+7 :8*20];
//                 if (tr_dm[19]) lddmrw3[8*19+7 :8*19] <= tr_d[8*19+7 :8*19];
//                 if (tr_dm[18]) lddmrw3[8*18+7 :8*18] <= tr_d[8*18+7 :8*18];
//                 if (tr_dm[17]) lddmrw3[8*17+7 :8*17] <= tr_d[8*17+7 :8*17];
//                 if (tr_dm[16]) lddmrw3[8*16+7 :8*16] <= tr_d[8*16+7 :8*16];
//                 if (tr_dm[15]) lddmrw3[8*15+7 :8*15] <= tr_d[8*15+7 :8*15];
//                 if (tr_dm[14]) lddmrw3[8*14+7 :8*14] <= tr_d[8*14+7 :8*14];
//                 if (tr_dm[13]) lddmrw3[8*13+7 :8*13] <= tr_d[8*13+7 :8*13];
//                 if (tr_dm[12]) lddmrw3[8*12+7 :8*12] <= tr_d[8*12+7 :8*12];
//                 if (tr_dm[11]) lddmrw3[8*11+7 :8*11] <= tr_d[8*11+7 :8*11];
//                 if (tr_dm[10]) lddmrw3[8*10+7 :8*10] <= tr_d[8*10+7 :8*10];
//                 if (tr_dm[ 9]) lddmrw3[8* 9+7 :8* 9] <= tr_d[8* 9+7 :8* 9];
//                 if (tr_dm[ 8]) lddmrw3[8* 8+7 :8* 8] <= tr_d[8* 8+7 :8* 8];
//                 if (tr_dm[ 7]) lddmrw3[8* 7+7 :8* 7] <= tr_d[8* 7+7 :8* 7];
//                 if (tr_dm[ 6]) lddmrw3[8* 6+7 :8* 6] <= tr_d[8* 6+7 :8* 6];
//                 if (tr_dm[ 5]) lddmrw3[8* 5+7 :8* 5] <= tr_d[8* 5+7 :8* 5];
//                 if (tr_dm[ 4]) lddmrw3[8* 4+7 :8* 4] <= tr_d[8* 4+7 :8* 4];
//                 if (tr_dm[ 3]) lddmrw3[8* 3+7 :8* 3] <= tr_d[8* 3+7 :8* 3];
//                 if (tr_dm[ 2]) lddmrw3[8* 2+7 :8* 2] <= tr_d[8* 2+7 :8* 2];
//                 if (tr_dm[ 1]) lddmrw3[8* 1+7 :8* 1] <= tr_d[8* 1+7 :8* 1];
//                 if (tr_dm[ 0]) lddmrw3[8* 0+7 :8* 0] <= tr_d[8* 0+7 :8* 0];
//               end
//            endcase
//          end

          default:begin
            conf0       <= conf0;
            conf1       <= conf1;
            conf2       <= conf2;
            conf3       <= conf3;
            regv_ear0   <= regv_ear0;
            regv_ear1   <= regv_ear1;
            regv_ear2   <= regv_ear2;
            regv_ear3   <= regv_ear3;
//             lddmrw0     <= lddmrw0;
//             lddmrw1     <= lddmrw1;
//             lddmrw2     <= lddmrw2;
//             lddmrw3     <= lddmrw3;
          end
        endcase
      end
      else if (cmd==`CMD_NOP && lmring_ful1 && (ctrl_chip == cdx || cdx == `EMAX_NCHIP_BITS'd0) && l_row == row) begin /* reg setup by PIO */
        case(tr[`LMRING_TR_TY]) /* breg§œstage5§Œ√Ê */
          3'h0: begin /* reg/conf */
            case (col)
              2'h0: begin
                if (tr_dm[28]) conf0[8*31+7 :8*28] <= tr_d[8*31+7 :8*28];
                if (tr_dm[24]) conf0[8*27+7 :8*24] <= tr_d[8*27+7 :8*24];
                if (tr_dm[20]) conf0[8*23+7 :8*20] <= tr_d[8*23+7 :8*20];
                if (tr_dm[16]) conf0[8*19+7 :8*16] <= tr_d[8*19+7 :8*16];
                if (tr_dm[12]) conf0[8*15+7 :8*12] <= tr_d[8*15+7 :8*12];
                if (tr_dm[ 8]) conf0[8*11+7 :8* 8] <= tr_d[8*11+7 :8* 8];
                if (tr_dm[ 4]) conf0[8* 7+7 :8* 4] <= tr_d[8* 7+7 :8* 4];
                if (tr_dm[ 0]) conf0[8* 3+7 :8* 0] <= tr_d[8* 3+7 :8* 0];
              end
              2'h1: begin
                if (tr_dm[28]) conf1[8*31+7 :8*28] <= tr_d[8*31+7 :8*28];
                if (tr_dm[24]) conf1[8*27+7 :8*24] <= tr_d[8*27+7 :8*24];
                if (tr_dm[20]) conf1[8*23+7 :8*20] <= tr_d[8*23+7 :8*20];
                if (tr_dm[16]) conf1[8*19+7 :8*16] <= tr_d[8*19+7 :8*16];
                if (tr_dm[12]) conf1[8*15+7 :8*12] <= tr_d[8*15+7 :8*12];
                if (tr_dm[ 8]) conf1[8*11+7 :8* 8] <= tr_d[8*11+7 :8* 8];
                if (tr_dm[ 4]) conf1[8* 7+7 :8* 4] <= tr_d[8* 7+7 :8* 4];
                if (tr_dm[ 0]) conf1[8* 3+7 :8* 0] <= tr_d[8* 3+7 :8* 0];
              end
              2'h2: begin
                if (tr_dm[28]) conf2[8*31+7 :8*28] <= tr_d[8*31+7 :8*28];
                if (tr_dm[24]) conf2[8*27+7 :8*24] <= tr_d[8*27+7 :8*24];
                if (tr_dm[20]) conf2[8*23+7 :8*20] <= tr_d[8*23+7 :8*20];
                if (tr_dm[16]) conf2[8*19+7 :8*16] <= tr_d[8*19+7 :8*16];
                if (tr_dm[12]) conf2[8*15+7 :8*12] <= tr_d[8*15+7 :8*12];
                if (tr_dm[ 8]) conf2[8*11+7 :8* 8] <= tr_d[8*11+7 :8* 8];
                if (tr_dm[ 4]) conf2[8* 7+7 :8* 4] <= tr_d[8* 7+7 :8* 4];
                if (tr_dm[ 0]) conf2[8* 3+7 :8* 0] <= tr_d[8* 3+7 :8* 0];
              end
              2'h3: begin
                if (tr_dm[28]) conf3[8*31+7 :8*28] <= tr_d[8*31+7 :8*28];
                if (tr_dm[24]) conf3[8*27+7 :8*24] <= tr_d[8*27+7 :8*24];
                if (tr_dm[20]) conf3[8*23+7 :8*20] <= tr_d[8*23+7 :8*20];
                if (tr_dm[16]) conf3[8*19+7 :8*16] <= tr_d[8*19+7 :8*16];
                if (tr_dm[12]) conf3[8*15+7 :8*12] <= tr_d[8*15+7 :8*12];
                if (tr_dm[ 8]) conf3[8*11+7 :8* 8] <= tr_d[8*11+7 :8* 8];
                if (tr_dm[ 4]) conf3[8* 7+7 :8* 4] <= tr_d[8* 7+7 :8* 4];
                if (tr_dm[ 0]) conf3[8* 3+7 :8* 0] <= tr_d[8* 3+7 :8* 0];
              end
            endcase
          end

          3'h2: begin /* reg/addr */
            case (col)
              2'h0: begin
                if (tr_dm[20]) regv_ear0[8*23+7 :8*20] <= tr_d[8*23+7 :8*20];
                if (tr_dm[16]) regv_ear0[8*19+7 :8*16] <= tr_d[8*19+7 :8*16];
                if (tr_dm[12]) regv_ear0[8*15+7 :8*12] <= tr_d[8*15+7 :8*12];
                if (tr_dm[ 8]) regv_ear0[8*11+7 :8* 8] <= tr_d[8*11+7 :8* 8];
                if (tr_dm[ 4]) regv_ear0[8* 7+7 :8* 4] <= tr_d[8* 7+7 :8* 4];
                if (tr_dm[ 0]) regv_ear0[8* 3+7 :8* 0] <= tr_d[8* 3+7 :8* 0];
              end
              2'h1: begin
                if (tr_dm[20]) regv_ear1[8*23+7 :8*20] <= tr_d[8*23+7 :8*20];
                if (tr_dm[16]) regv_ear1[8*19+7 :8*16] <= tr_d[8*19+7 :8*16];
                if (tr_dm[12]) regv_ear1[8*15+7 :8*12] <= tr_d[8*15+7 :8*12];
                if (tr_dm[ 8]) regv_ear1[8*11+7 :8* 8] <= tr_d[8*11+7 :8* 8];
                if (tr_dm[ 4]) regv_ear1[8* 7+7 :8* 4] <= tr_d[8* 7+7 :8* 4];
                if (tr_dm[ 0]) regv_ear1[8* 3+7 :8* 0] <= tr_d[8* 3+7 :8* 0];
              end
              2'h2: begin
                if (tr_dm[20]) regv_ear2[8*23+7 :8*20] <= tr_d[8*23+7 :8*20];
                if (tr_dm[16]) regv_ear2[8*19+7 :8*16] <= tr_d[8*19+7 :8*16];
                if (tr_dm[12]) regv_ear2[8*15+7 :8*12] <= tr_d[8*15+7 :8*12];
                if (tr_dm[ 8]) regv_ear2[8*11+7 :8* 8] <= tr_d[8*11+7 :8* 8];
                if (tr_dm[ 4]) regv_ear2[8* 7+7 :8* 4] <= tr_d[8* 7+7 :8* 4];
                if (tr_dm[ 0]) regv_ear2[8* 3+7 :8* 0] <= tr_d[8* 3+7 :8* 0];
              end
              2'h3: begin
                if (tr_dm[20]) regv_ear3[8*23+7 :8*20] <= tr_d[8*23+7 :8*20];
                if (tr_dm[16]) regv_ear3[8*19+7 :8*16] <= tr_d[8*19+7 :8*16];
                if (tr_dm[12]) regv_ear3[8*15+7 :8*12] <= tr_d[8*15+7 :8*12];
                if (tr_dm[ 8]) regv_ear3[8*11+7 :8* 8] <= tr_d[8*11+7 :8* 8];
                if (tr_dm[ 4]) regv_ear3[8* 7+7 :8* 4] <= tr_d[8* 7+7 :8* 4];
                if (tr_dm[ 0]) regv_ear3[8* 3+7 :8* 0] <= tr_d[8* 3+7 :8* 0];
              end
            endcase
          end

//           3'h3: begin/* lddmq/tr */
//             case (col)
//               2'h0: begin
//                 if (tr_dm[31]) lddmrw0[8*31+7 :8*31] <= tr_d[8*31+7 :8*31];
//                 if (tr_dm[30]) lddmrw0[8*30+7 :8*30] <= tr_d[8*30+7 :8*30];
//                 if (tr_dm[29]) lddmrw0[8*29+7 :8*29] <= tr_d[8*29+7 :8*29];
//                 if (tr_dm[28]) lddmrw0[8*28+7 :8*28] <= tr_d[8*28+7 :8*28];
//                 if (tr_dm[27]) lddmrw0[8*27+7 :8*27] <= tr_d[8*27+7 :8*27];
//                 if (tr_dm[26]) lddmrw0[8*26+7 :8*26] <= tr_d[8*26+7 :8*26];
//                 if (tr_dm[25]) lddmrw0[8*25+7 :8*25] <= tr_d[8*25+7 :8*25];
//                 if (tr_dm[24]) lddmrw0[8*24+7 :8*24] <= tr_d[8*24+7 :8*24];
//                 if (tr_dm[23]) lddmrw0[8*23+7 :8*23] <= tr_d[8*23+7 :8*23];
//                 if (tr_dm[22]) lddmrw0[8*22+7 :8*22] <= tr_d[8*22+7 :8*22];
//                 if (tr_dm[21]) lddmrw0[8*21+7 :8*21] <= tr_d[8*21+7 :8*21];
//                 if (tr_dm[20]) lddmrw0[8*20+7 :8*20] <= tr_d[8*20+7 :8*20];
//                 if (tr_dm[19]) lddmrw0[8*19+7 :8*19] <= tr_d[8*19+7 :8*19];
//                 if (tr_dm[18]) lddmrw0[8*18+7 :8*18] <= tr_d[8*18+7 :8*18];
//                 if (tr_dm[17]) lddmrw0[8*17+7 :8*17] <= tr_d[8*17+7 :8*17];
//                 if (tr_dm[16]) lddmrw0[8*16+7 :8*16] <= tr_d[8*16+7 :8*16];
//                 if (tr_dm[15]) lddmrw0[8*15+7 :8*15] <= tr_d[8*15+7 :8*15];
//                 if (tr_dm[14]) lddmrw0[8*14+7 :8*14] <= tr_d[8*14+7 :8*14];
//                 if (tr_dm[13]) lddmrw0[8*13+7 :8*13] <= tr_d[8*13+7 :8*13];
//                 if (tr_dm[12]) lddmrw0[8*12+7 :8*12] <= tr_d[8*12+7 :8*12];
//                 if (tr_dm[11]) lddmrw0[8*11+7 :8*11] <= tr_d[8*11+7 :8*11];
//                 if (tr_dm[10]) lddmrw0[8*10+7 :8*10] <= tr_d[8*10+7 :8*10];
//                 if (tr_dm[ 9]) lddmrw0[8* 9+7 :8* 9] <= tr_d[8* 9+7 :8* 9];
//                 if (tr_dm[ 8]) lddmrw0[8* 8+7 :8* 8] <= tr_d[8* 8+7 :8* 8];
//                 if (tr_dm[ 7]) lddmrw0[8* 7+7 :8* 7] <= tr_d[8* 7+7 :8* 7];
//                 if (tr_dm[ 6]) lddmrw0[8* 6+7 :8* 6] <= tr_d[8* 6+7 :8* 6];
//                 if (tr_dm[ 5]) lddmrw0[8* 5+7 :8* 5] <= tr_d[8* 5+7 :8* 5];
//                 if (tr_dm[ 4]) lddmrw0[8* 4+7 :8* 4] <= tr_d[8* 4+7 :8* 4];
//                 if (tr_dm[ 3]) lddmrw0[8* 3+7 :8* 3] <= tr_d[8* 3+7 :8* 3];
//                 if (tr_dm[ 2]) lddmrw0[8* 2+7 :8* 2] <= tr_d[8* 2+7 :8* 2];
//                 if (tr_dm[ 1]) lddmrw0[8* 1+7 :8* 1] <= tr_d[8* 1+7 :8* 1];
//                 if (tr_dm[ 0]) lddmrw0[8* 0+7 :8* 0] <= tr_d[8* 0+7 :8* 0];
//               end
//               2'h1: begin
//                 if (tr_dm[31]) lddmrw1[8*31+7 :8*31] <= tr_d[8*31+7 :8*31];
//                 if (tr_dm[30]) lddmrw1[8*30+7 :8*30] <= tr_d[8*30+7 :8*30];
//                 if (tr_dm[29]) lddmrw1[8*29+7 :8*29] <= tr_d[8*29+7 :8*29];
//                 if (tr_dm[28]) lddmrw1[8*28+7 :8*28] <= tr_d[8*28+7 :8*28];
//                 if (tr_dm[27]) lddmrw1[8*27+7 :8*27] <= tr_d[8*27+7 :8*27];
//                 if (tr_dm[26]) lddmrw1[8*26+7 :8*26] <= tr_d[8*26+7 :8*26];
//                 if (tr_dm[25]) lddmrw1[8*25+7 :8*25] <= tr_d[8*25+7 :8*25];
//                 if (tr_dm[24]) lddmrw1[8*24+7 :8*24] <= tr_d[8*24+7 :8*24];
//                 if (tr_dm[23]) lddmrw1[8*23+7 :8*23] <= tr_d[8*23+7 :8*23];
//                 if (tr_dm[22]) lddmrw1[8*22+7 :8*22] <= tr_d[8*22+7 :8*22];
//                 if (tr_dm[21]) lddmrw1[8*21+7 :8*21] <= tr_d[8*21+7 :8*21];
//                 if (tr_dm[20]) lddmrw1[8*20+7 :8*20] <= tr_d[8*20+7 :8*20];
//                 if (tr_dm[19]) lddmrw1[8*19+7 :8*19] <= tr_d[8*19+7 :8*19];
//                 if (tr_dm[18]) lddmrw1[8*18+7 :8*18] <= tr_d[8*18+7 :8*18];
//                 if (tr_dm[17]) lddmrw1[8*17+7 :8*17] <= tr_d[8*17+7 :8*17];
//                 if (tr_dm[16]) lddmrw1[8*16+7 :8*16] <= tr_d[8*16+7 :8*16];
//                 if (tr_dm[15]) lddmrw1[8*15+7 :8*15] <= tr_d[8*15+7 :8*15];
//                 if (tr_dm[14]) lddmrw1[8*14+7 :8*14] <= tr_d[8*14+7 :8*14];
//                 if (tr_dm[13]) lddmrw1[8*13+7 :8*13] <= tr_d[8*13+7 :8*13];
//                 if (tr_dm[12]) lddmrw1[8*12+7 :8*12] <= tr_d[8*12+7 :8*12];
//                 if (tr_dm[11]) lddmrw1[8*11+7 :8*11] <= tr_d[8*11+7 :8*11];
//                 if (tr_dm[10]) lddmrw1[8*10+7 :8*10] <= tr_d[8*10+7 :8*10];
//                 if (tr_dm[ 9]) lddmrw1[8* 9+7 :8* 9] <= tr_d[8* 9+7 :8* 9];
//                 if (tr_dm[ 8]) lddmrw1[8* 8+7 :8* 8] <= tr_d[8* 8+7 :8* 8];
//                 if (tr_dm[ 7]) lddmrw1[8* 7+7 :8* 7] <= tr_d[8* 7+7 :8* 7];
//                 if (tr_dm[ 6]) lddmrw1[8* 6+7 :8* 6] <= tr_d[8* 6+7 :8* 6];
//                 if (tr_dm[ 5]) lddmrw1[8* 5+7 :8* 5] <= tr_d[8* 5+7 :8* 5];
//                 if (tr_dm[ 4]) lddmrw1[8* 4+7 :8* 4] <= tr_d[8* 4+7 :8* 4];
//                 if (tr_dm[ 3]) lddmrw1[8* 3+7 :8* 3] <= tr_d[8* 3+7 :8* 3];
//                 if (tr_dm[ 2]) lddmrw1[8* 2+7 :8* 2] <= tr_d[8* 2+7 :8* 2];
//                 if (tr_dm[ 1]) lddmrw1[8* 1+7 :8* 1] <= tr_d[8* 1+7 :8* 1];
//                 if (tr_dm[ 0]) lddmrw1[8* 0+7 :8* 0] <= tr_d[8* 0+7 :8* 0];
//               end
//               2'h2: begin
//                 if (tr_dm[31]) lddmrw2[8*31+7 :8*31] <= tr_d[8*31+7 :8*31];
//                 if (tr_dm[30]) lddmrw2[8*30+7 :8*30] <= tr_d[8*30+7 :8*30];
//                 if (tr_dm[29]) lddmrw2[8*29+7 :8*29] <= tr_d[8*29+7 :8*29];
//                 if (tr_dm[28]) lddmrw2[8*28+7 :8*28] <= tr_d[8*28+7 :8*28];
//                 if (tr_dm[27]) lddmrw2[8*27+7 :8*27] <= tr_d[8*27+7 :8*27];
//                 if (tr_dm[26]) lddmrw2[8*26+7 :8*26] <= tr_d[8*26+7 :8*26];
//                 if (tr_dm[25]) lddmrw2[8*25+7 :8*25] <= tr_d[8*25+7 :8*25];
//                 if (tr_dm[24]) lddmrw2[8*24+7 :8*24] <= tr_d[8*24+7 :8*24];
//                 if (tr_dm[23]) lddmrw2[8*23+7 :8*23] <= tr_d[8*23+7 :8*23];
//                 if (tr_dm[22]) lddmrw2[8*22+7 :8*22] <= tr_d[8*22+7 :8*22];
//                 if (tr_dm[21]) lddmrw2[8*21+7 :8*21] <= tr_d[8*21+7 :8*21];
//                 if (tr_dm[20]) lddmrw2[8*20+7 :8*20] <= tr_d[8*20+7 :8*20];
//                 if (tr_dm[19]) lddmrw2[8*19+7 :8*19] <= tr_d[8*19+7 :8*19];
//                 if (tr_dm[18]) lddmrw2[8*18+7 :8*18] <= tr_d[8*18+7 :8*18];
//                 if (tr_dm[17]) lddmrw2[8*17+7 :8*17] <= tr_d[8*17+7 :8*17];
//                 if (tr_dm[16]) lddmrw2[8*16+7 :8*16] <= tr_d[8*16+7 :8*16];
//                 if (tr_dm[15]) lddmrw2[8*15+7 :8*15] <= tr_d[8*15+7 :8*15];
//                 if (tr_dm[14]) lddmrw2[8*14+7 :8*14] <= tr_d[8*14+7 :8*14];
//                 if (tr_dm[13]) lddmrw2[8*13+7 :8*13] <= tr_d[8*13+7 :8*13];
//                 if (tr_dm[12]) lddmrw2[8*12+7 :8*12] <= tr_d[8*12+7 :8*12];
//                 if (tr_dm[11]) lddmrw2[8*11+7 :8*11] <= tr_d[8*11+7 :8*11];
//                 if (tr_dm[10]) lddmrw2[8*10+7 :8*10] <= tr_d[8*10+7 :8*10];
//                 if (tr_dm[ 9]) lddmrw2[8* 9+7 :8* 9] <= tr_d[8* 9+7 :8* 9];
//                 if (tr_dm[ 8]) lddmrw2[8* 8+7 :8* 8] <= tr_d[8* 8+7 :8* 8];
//                 if (tr_dm[ 7]) lddmrw2[8* 7+7 :8* 7] <= tr_d[8* 7+7 :8* 7];
//                 if (tr_dm[ 6]) lddmrw2[8* 6+7 :8* 6] <= tr_d[8* 6+7 :8* 6];
//                 if (tr_dm[ 5]) lddmrw2[8* 5+7 :8* 5] <= tr_d[8* 5+7 :8* 5];
//                 if (tr_dm[ 4]) lddmrw2[8* 4+7 :8* 4] <= tr_d[8* 4+7 :8* 4];
//                 if (tr_dm[ 3]) lddmrw2[8* 3+7 :8* 3] <= tr_d[8* 3+7 :8* 3];
//                 if (tr_dm[ 2]) lddmrw2[8* 2+7 :8* 2] <= tr_d[8* 2+7 :8* 2];
//                 if (tr_dm[ 1]) lddmrw2[8* 1+7 :8* 1] <= tr_d[8* 1+7 :8* 1];
//                 if (tr_dm[ 0]) lddmrw2[8* 0+7 :8* 0] <= tr_d[8* 0+7 :8* 0];
//               end
//               2'h3: begin
//                 if (tr_dm[31]) lddmrw3[8*31+7 :8*31] <= tr_d[8*31+7 :8*31];
//                 if (tr_dm[30]) lddmrw3[8*30+7 :8*30] <= tr_d[8*30+7 :8*30];
//                 if (tr_dm[29]) lddmrw3[8*29+7 :8*29] <= tr_d[8*29+7 :8*29];
//                 if (tr_dm[28]) lddmrw3[8*28+7 :8*28] <= tr_d[8*28+7 :8*28];
//                 if (tr_dm[27]) lddmrw3[8*27+7 :8*27] <= tr_d[8*27+7 :8*27];
//                 if (tr_dm[26]) lddmrw3[8*26+7 :8*26] <= tr_d[8*26+7 :8*26];
//                 if (tr_dm[25]) lddmrw3[8*25+7 :8*25] <= tr_d[8*25+7 :8*25];
//                 if (tr_dm[24]) lddmrw3[8*24+7 :8*24] <= tr_d[8*24+7 :8*24];
//                 if (tr_dm[23]) lddmrw3[8*23+7 :8*23] <= tr_d[8*23+7 :8*23];
//                 if (tr_dm[22]) lddmrw3[8*22+7 :8*22] <= tr_d[8*22+7 :8*22];
//                 if (tr_dm[21]) lddmrw3[8*21+7 :8*21] <= tr_d[8*21+7 :8*21];
//                 if (tr_dm[20]) lddmrw3[8*20+7 :8*20] <= tr_d[8*20+7 :8*20];
//                 if (tr_dm[19]) lddmrw3[8*19+7 :8*19] <= tr_d[8*19+7 :8*19];
//                 if (tr_dm[18]) lddmrw3[8*18+7 :8*18] <= tr_d[8*18+7 :8*18];
//                 if (tr_dm[17]) lddmrw3[8*17+7 :8*17] <= tr_d[8*17+7 :8*17];
//                 if (tr_dm[16]) lddmrw3[8*16+7 :8*16] <= tr_d[8*16+7 :8*16];
//                 if (tr_dm[15]) lddmrw3[8*15+7 :8*15] <= tr_d[8*15+7 :8*15];
//                 if (tr_dm[14]) lddmrw3[8*14+7 :8*14] <= tr_d[8*14+7 :8*14];
//                 if (tr_dm[13]) lddmrw3[8*13+7 :8*13] <= tr_d[8*13+7 :8*13];
//                 if (tr_dm[12]) lddmrw3[8*12+7 :8*12] <= tr_d[8*12+7 :8*12];
//                 if (tr_dm[11]) lddmrw3[8*11+7 :8*11] <= tr_d[8*11+7 :8*11];
//                 if (tr_dm[10]) lddmrw3[8*10+7 :8*10] <= tr_d[8*10+7 :8*10];
//                 if (tr_dm[ 9]) lddmrw3[8* 9+7 :8* 9] <= tr_d[8* 9+7 :8* 9];
//                 if (tr_dm[ 8]) lddmrw3[8* 8+7 :8* 8] <= tr_d[8* 8+7 :8* 8];
//                 if (tr_dm[ 7]) lddmrw3[8* 7+7 :8* 7] <= tr_d[8* 7+7 :8* 7];
//                 if (tr_dm[ 6]) lddmrw3[8* 6+7 :8* 6] <= tr_d[8* 6+7 :8* 6];
//                 if (tr_dm[ 5]) lddmrw3[8* 5+7 :8* 5] <= tr_d[8* 5+7 :8* 5];
//                 if (tr_dm[ 4]) lddmrw3[8* 4+7 :8* 4] <= tr_d[8* 4+7 :8* 4];
//                 if (tr_dm[ 3]) lddmrw3[8* 3+7 :8* 3] <= tr_d[8* 3+7 :8* 3];
//                 if (tr_dm[ 2]) lddmrw3[8* 2+7 :8* 2] <= tr_d[8* 2+7 :8* 2];
//                 if (tr_dm[ 1]) lddmrw3[8* 1+7 :8* 1] <= tr_d[8* 1+7 :8* 1];
//                 if (tr_dm[ 0]) lddmrw3[8* 0+7 :8* 0] <= tr_d[8* 0+7 :8* 0];
//               end
//             endcase
//           end

          default:begin
            conf0       <= conf0;
            conf1       <= conf1;
            conf2       <= conf2;
            conf3       <= conf3;
            regv_ear0   <= regv_ear0;
            regv_ear1   <= regv_ear1;
            regv_ear2   <= regv_ear2;
            regv_ear3   <= regv_ear3;
//             lddmrw0     <= lddmrw0;
//             lddmrw1     <= lddmrw1;
//             lddmrw2     <= lddmrw2;
//             lddmrw3     <= lddmrw3;
          end
        endcase
      end
      else begin
        conf0       <= conf0;
        conf1       <= conf1;
        conf2       <= conf2;
        conf3       <= conf3;
        regv_ear0   <= regv_ear0;
        regv_ear1   <= regv_ear1;
        regv_ear2   <= regv_ear2;
        regv_ear3   <= regv_ear3;
//         lddmrw0     <= lddmrw0;
//         lddmrw1     <= lddmrw1;
//         lddmrw2     <= lddmrw2;
//         lddmrw3     <= lddmrw3;
      end
    end
  end

  wire                          unit1_exec_next    = unit1_exec          | (`conf0_v && l_row>0 && pi_unit2_exec);
  wire                          unit1_fold_next    = unit2_exec & `conf0_fold;
//wire                          unit1_fold_next    = unit2_exec & `conf_fold;
  wire  [1:0]                   unit1_forstat_next = (l_row == 0) ? stage_forstat : pi_unit2_forstat;
  wire  [1:0]                   unit1_forstat_fold_next  = unit2_forstat;
  wire                          unit1_stop_next    = unit1_arbrk  | (`conf0_v && l_row>0 && pi_unit2_stop);
  wire                          unit2_exec_next    = unit1_exec;
  wire                          unit2_fold_next    = unit1_fold & (`conf0_fold);
//wire                          unit2_fold_next    = unit1_fold & (`conf_fold);
  wire [1:0]                    unit2_forstat_next = unit1_forstat;
  wire                          unit2_stop_next    = unit1_stop;

  always @(posedge ACLK or negedge RSTN) begin
    if (~RSTN) begin
      cmd            <= `CMD_NOP;
      unit1_exec     <= 1'b0; /* reset to default */
      unit1_fold     <= 1'b0; /* reset to default */
      unit1_forstat  <= {(2){1'b0}}; /* reset to default */
      unit1_forstat2 <= {(2){1'b0}}; /* reset to default */
      unit1_forstat_fold  <= {(2){1'b0}}; /* reset to default */
      unit1_forstat_fold2 <= {(2){1'b0}}; /* reset to default */
      unit1_forstat_fold3 <= {(2){1'b0}}; /* reset to default */
      unit1_forstat_fold4 <= {(2){1'b0}}; /* reset to default */
      unit1_stop     <= 1'b0; /* reset to default */
      unit2_exec     <= 1'b0; /* reset to default */
      unit2_fold     <= 1'b0; /* reset to default */
      unit2_forstat  <= {(2){1'b0}}; /* reset to default */
      unit2_stop     <= 1'b0; /* reset to default */
      l_row          <= UNIT_NO; /* 0..63 generate unitª˛§Œ•—•È•·°º•øºË∆¿§«logical row#¿ﬂƒÍ */
      scon_count     <= {(`EMAX_ROW_BITS+1){1'b0}};
      one_shot       <= 1'b0; /* reset to default */
      one_shot2      <= 1'b0; /* reset to default */
      one_shot_fold  <= 1'b0; /* reset to default */
      one_shot_fold2 <= 1'b0; /* reset to default */
      one_shot_fold3 <= 1'b0; /* reset to default */
      one_shot_fold4 <= 1'b0; /* reset to default */
    end
    else begin
      case (cmd)
        `CMD_NOP: begin  /* nop */
          if (cycle==2'h3 && !axi_busy) begin
            case (ctrl_cmd)
              `REG_CTRL_CMD_RESET: begin /* reset */
                unit1_exec     <= 0; /* reset to default */
                unit1_fold     <= 0; /* reset to default */
                unit1_forstat  <= {(2){1'b0}}; /* reset to default */
                unit1_forstat2 <= {(2){1'b0}}; /* reset to default */
                unit1_forstat_fold  <= {(2){1'b0}}; /* reset to default */
                unit1_forstat_fold2 <= {(2){1'b0}}; /* reset to default */
                unit1_forstat_fold3 <= {(2){1'b0}}; /* reset to default */
                unit1_forstat_fold4 <= {(2){1'b0}}; /* reset to default */
                unit2_exec     <= 0; /* reset to default */
                unit2_fold     <= 0; /* reset to default */
                unit2_forstat  <= {(2){1'b0}}; /* reset to default */
                unit2_stop     <= 0; /* reset to default */
                l_row          <= UNIT_NO; /* reset to default */
                scon_count     <= 0; /* reset to default */
                one_shot       <= 0; /* reset to default */
                one_shot2      <= 0; /* reset to default */
                one_shot_fold  <= 0; /* reset to default */
                one_shot_fold2 <= 0; /* reset to default */
                one_shot_fold3 <= 0; /* reset to default */
                one_shot_fold4 <= 0; /* reset to default */
              end
              `REG_CTRL_CMD_SCON: begin /* scon */
		cmd         <= `CMD_SCON;
		scon_count  <= {`conf0_mapdist,1'b0};
		unit1_exec  <= 1'b1;
              end
              `REG_CTRL_CMD_EXEC: begin/* exec */
		if (!`conf0_v) 
		  cmd       <= `CMD_NOP;
		else begin
		  cmd       <= `CMD_EXEC;
		  if (l_row==0) unit1_exec <= 1'b1;
                end
              end
            endcase
          end
        end
        `CMD_SCON: begin /* scon */
          if (cycle==2'h3) begin
            if (unit1_stop) cmd   <= `CMD_NOP;
            if (unit1_exec) begin
              if (scon_count[0]) l_row <= (l_row-1'b1); /* adjust l_row */
              scon_count <= scon_count - 1'b1;
            end
            unit1_exec <= ((scon_count <= 1) ? 1'b0 : 1'b1) & ~((scon_count==1'd1) ? 1'b1 : 1'b0);
            unit1_stop <=                                      ((scon_count==1'd1) ? 1'b1 : 1'b0);
          end
        end
        `CMD_EXEC: begin /* exec */
	  one_shot2 <= one_shot;
	  unit1_forstat2 <= unit1_forstat;
	  unit1_forstat_fold2 <= unit1_forstat_fold;
	  unit1_forstat_fold3 <= unit1_forstat_fold2;
	  unit1_forstat_fold4 <= unit1_forstat_fold3;
	  one_shot_fold2      <= one_shot_fold;
	  one_shot_fold3      <= one_shot_fold2;
	  one_shot_fold4      <= one_shot_fold3;
          if (cycle==2'h3) begin
            if (((!(`conf0_fold)) && unit2_stop)||((`conf0_fold) && unit2_fold && !stage4_fold)) cmd <= `CMD_NOP;
            
            if (unit1_exec && (l_row==0 || exring_bin_valid)) one_shot <= 1'b1; /* active */
            else                                              one_shot <= 1'b0;
	    if (unit1_fold)                                   one_shot_fold <= 1'b1;
	    else                                              one_shot_fold <= 1'b0;
	    
            unit1_exec    <= unit1_exec_next & ~unit1_stop_next;
            unit1_fold    <= unit1_fold_next;
            unit1_forstat <= unit1_forstat_next;
            unit1_forstat_fold <= unit1_forstat_fold_next;
            unit1_stop    <=                    unit1_stop_next;
            unit2_exec    <= unit2_exec_next & ~unit2_stop_next;
            unit2_fold    <= unit2_fold_next;
            unit2_forstat <= unit2_forstat_next;
            unit2_stop    <=                    unit2_stop_next;
          end
        end
      endcase
    end
  end

endmodule
