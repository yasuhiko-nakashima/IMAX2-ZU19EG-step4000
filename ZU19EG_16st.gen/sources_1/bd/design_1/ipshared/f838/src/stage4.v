/*
 *-----------------------------------------------------------------------------
 * Title         : stage4
 * Project       : EMAX6
 *-----------------------------------------------------------------------------
 * File          : stage4.v
 * Author        : Nakashima
 *                <nakashim@is.naist.jp>
 *                 Yamano
 *                <yamano.ryusuke.yo7@is.naist.jp>
 *                 Kikutani
 *                <kikutani.yuma.kw3@is.naist.jp>
 * Created       : 10.20.2017
 * Last modified : 10.20.2017
 *-----------------------------------------------------------------------------
 * Description : fpuのデータ正規化とlmmアクセス制御
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
/* stage4 */
module stage4
(
  input  wire                                 ACLK,
  input  wire                                 RSTN,
  input  wire                                 UNIRSTN,
  input  wire [1:0]                           unit1_forstat_fold4,
  input  wire                                 one_shot_fold4,
  input  wire [`REG_CTRL_CMD_BITS-1:0]        cmd,
  input  wire [`CONF_BITS-1:0]                conf0,
  input  wire [`CONF_BITS-1:0]                conf1,
  input  wire [`CONF_BITS-1:0]                conf2,
  input  wire [`CONF_BITS-1:0]                conf3,
  input  wire                                 exec,
  input  wire                                 fold,
  input  wire [1:0]                           cxdi,
  input  wire [`REG_DATA_BITS-1:0]            tx0i,
  input  wire [`REG_DATA_BITS-1:0]            tx1i,
  input  wire [`REG_DATA_BITS-1:0]            tx2i,
  input  wire [`REG_DATA_BITS-1:0]            tx3i,
  input  wire [2:0]                           opi,
  input  wire [`REG_DATA_BITS-1:0]            ex3di,
  input  wire [5:0]                           ex5i,
  output reg  [`REG_DATA_BITS-1:0]            tx0,
  output reg  [`REG_DATA_BITS-1:0]            tx1,
  output reg  [`REG_DATA_BITS-1:0]            tx2,
  output reg  [`REG_DATA_BITS-1:0]            tx3,
  output reg                                  tx_valid,
  output reg  [`REG_DATA_BITS-1:0]            exd,
`ifdef ENABLE_FPU
  input  wire                                 h_ex2_d_s,
  input  wire [ 8:0]                          h_ex2_d_exp,
  input  wire [25+`PEXT:0]                    h_ex2_d_frac, //■■■
  input  wire                                 h_ex2_d_inf,
  input  wire                                 h_ex2_d_nan,
  input  wire                                 l_ex2_d_s,
  input  wire [ 8:0]                          l_ex2_d_exp,
  input  wire [25+`PEXT:0]                    l_ex2_d_frac, //■■■
  input  wire                                 l_ex2_d_inf,
  input  wire                                 l_ex2_d_nan,
`endif
`ifdef ENABLE_SPU
  input  wire [7:0]                           ex3passi1,
  input  wire [31:0]                          ex3si,
`endif
  input  wire [`EXRING_ADDR_BITS-1:0]         ea0di,
  input  wire [`EXRING_ADDR_BITS-1:0]         ea0woofsi,//★MEX
  input  wire [`EXRING_ADDR_BITS-1:0]         ea1di,
  input  wire [`EXRING_ADDR_BITS-1:0]         ea1woofsi,//★MEX
  output reg  [`EXRING_ADDR_BITS-1:0]         ea0d,
  output reg  [`EXRING_ADDR_BITS-1:0]         ea0woofs, //★MEX
  output reg  [`EXRING_ADDR_BITS-1:0]         ea1d,
  output reg  [`EXRING_ADDR_BITS-1:0]         ea1woofs, //★MEX
  input  wire [`LMRING_BR_BITS-1:0]           lmring_bin,         /*          from previous unit */
  output wire                                 lmea0sfma,
  output wire                                 lmea0strq,
  output wire [1:0]                           lmea0strqcol,       /* ea0.strq_col番号  4サイクルに分けて実行 */
  input  wire                                 lmlddmqw_ok,        /*          from lmring         */
  input  wire                                 lmrangew_ok,        /*          from lmring         */
  input  wire                                 lmranger_ok,        /*          from lmring         */
  input  wire                                 lmring_bin_nemp,    /* ful2     from previous unit */
  input  wire                                 lmring_bin_ful,     /* deq_wait from lmring         */
  output wire                                 lmring_ea0bsy,      /* to lmring                    */
  output wire                                 lmring_ea1bsy,      /* to lmring                    */
  input  wire [1:0]                           lmco,               /* -> col#                      */
  input  wire [`EXRING_ADDR_BITS-1:0]         lmca,               /* -> ea01dr                    */  /* col#による2bit補正前addr */
  input  wire [31:0]                          lmwm,               /* <- axi                       */
  input  wire [`LMRING_DATA_BITS-1:0]         lmwd,               /* <- axi                       */
  output wire [`BREG_BITS-1:0]                mr0,
  output wire [`BREG_BITS-1:0]                mr1
);
// synopsys template

  reg  [1:0]                        cycle;
  wire [1:0]                        cyclep1;
  assign cyclep1 = cycle + 2'h1;
   
  always @(posedge ACLK or negedge RSTN) begin
    if (~RSTN) begin
      cycle <= 2'h0;
    end
    else begin
      cycle <= cyclep1;
    end
  end

  wire [`CONF_BITS-1:0] conf  = (cycle==2'h0)?conf1:(cycle==2'h1)?conf2:(cycle==2'h2)?conf3:conf0;
  wire [1:0]            k     = (lmea0sfma|lmea0strq) ? lmea0strqcol : cyclep1;
  wire [`CONF_BITS-1:0] confk = (k==2'd0)?conf0:(k==2'd1)?conf1:(k==2'd2)?conf2:conf3;
//wire [1:0]            kmex0  = ((`conf2_mex0op==`OP_CMPA_LE || `conf2_mex0op==`OP_CMPA_GE) && `conf_ea0op<`OP_IM_BUFWR) ? (~cyclep1[1]?2'd0:2'd1   ) : k;       //★MEX
  wire [1:0]            kmex0  = (`conf2_mex0op_1 && `conf_ea0op<`OP_IM_BUFWR) ? (~cyclep1[1]?2'd0:2'd1   ) : k;       //★MEX
  wire [1:0]            confkmex0_lmm_mode = (kmex0==2'd0)?`conf0_lmm_mode:(kmex0==2'd1)?`conf1_lmm_mode:(kmex0==2'd2)?`conf2_lmm_mode:`conf3_lmm_mode;//★MEX
//wire [1:0]            kmex1  = ((`conf2_mex0op==`OP_CMPA_LE || `conf2_mex0op==`OP_CMPA_GE) && `conf_ea1op<`OP_IM_BUFRD) ? (~cyclep1[1]?2'd0:cyclep1) : cyclep1; //★MEX
  wire [1:0]            kmex1  = (`conf2_mex0op_1 && `conf_ea1op<`OP_IM_BUFRD) ? (~cyclep1[1]?2'd0:cyclep1) : cyclep1; //★MEX
  wire [1:0]            confkmex1_lmm_mode = (kmex1==2'd0)?`conf0_lmm_mode:(kmex1==2'd1)?`conf1_lmm_mode:(kmex1==2'd2)?`conf2_lmm_mode:`conf3_lmm_mode;//★MEX
    
  /*---------------------------- FPUのデータとEXEのデータ合流 -------------------------------*/

  wire [2:0]                iop  = opi[2:0];

  wire [`REG_DATA_BITS-1:0] ex4d;

  exe3 exe3h
  (
    .ACLK               (ACLK                   ),
    .RSTN               (RSTN&UNIRSTN           ),
    .op                 (iop                    ),
    .ex3d               (ex3di[63:32]           ),
    .ex5                (ex5i [ 5: 0]           ),
    .ex4d               (ex4d [63:32]           )
  );

  exe3 exe3l
  (
    .ACLK               (ACLK                   ),
    .RSTN               (RSTN&UNIRSTN           ),
    .op                 (iop                    ),
    .ex3d               (ex3di[31:0]            ),
    .ex5                (ex5i [ 5:0]            ),
    .ex4d               (ex4d [31:0]            )
  );

`ifdef ENABLE_FPU
  wire [31:0]                   h_fpd;
  wire [31:0]                   l_fpd;
//wire [`REG_DATA_BITS-1:0]     fpd = (`conf_op2==`OP_WSWAP)?{l_fpd, h_fpd}:{h_fpd, l_fpd};
  wire [`REG_DATA_BITS-1:0]     fpd = {h_fpd, l_fpd};

  fpu3 fpu3h /* normalize, no register slice, just combination logic */
  (
    .ex2_d_s     (h_ex2_d_s          ),
    .ex2_d_exp   (h_ex2_d_exp        ),
    .ex2_d_frac  (h_ex2_d_frac       ),
    .ex2_d_inf   (h_ex2_d_inf        ),
    .ex2_d_nan   (h_ex2_d_nan        ),
    .f           (h_fpd              )
  );
  fpu3 fpu3l
  (
    .ex2_d_s     (l_ex2_d_s          ),
    .ex2_d_exp   (l_ex2_d_exp        ),
    .ex2_d_frac  (l_ex2_d_frac       ),
    .ex2_d_inf   (l_ex2_d_inf        ),
    .ex2_d_nan   (l_ex2_d_nan        ),
    .f           (l_fpd              )
  );
`else
  wire [`REG_DATA_BITS-1:0]     fpd = {(`REG_DATA_BITS){1'b0}};
`endif

`ifdef ENABLE_SPU
  wire [7:0]     spd;
  wire [7:0]   	 sps1 = ((!one_shot_fold4 || ((`conf_init&2'd1)&&unit1_forstat_fold4[0])) && cyclep1==2'd0) ? ex3passi1 : exd[7:0];
  /*-------------- Spiking operator ex1 <- ex1 + ex2 * ex3 */
  spu3 spu3
  (
    .s1          (sps1             ),
    .si          (ex3si            ),
    .so          (spd              )
  );
`else
  wire [7:0]     spd = 8'h00;
`endif

  wire [`REG_DATA_BITS-1:0]   exdp = (`conf_op1==`OP_FMA || `conf_op1==`OP_CFMA || `conf_op1==`OP_FMS || `conf_op1==`OP_FAD || `conf_op1==`OP_FML) ? fpd : //★MEX
				     (`conf_op1==`OP_SFMA)                                                                                         ? {56'h00000000_000000,spd} :
				                                                                                                                     ex4d;
   
  /*---------------------------- EX4DR -------------------------------*/
  /* ex3dr -> ex4dr */
  /* LD/STによるLMM参照はlmm_modeの割り当てcycleを厳密に守る. */
  always @(posedge ACLK or negedge RSTN) begin
    if (~RSTN|~UNIRSTN) begin
      exd <= {(`REG_DATA_BITS){1'b0}};
    end
    else begin
      if (exec || fold) begin
        exd <= exdp;
      end
    end
  end

  /*---------------------- EA04DR/EA04DR COMMON --------------------------*/
  /* lmca/ea3dr -> ea4dr */
  /* exring[cid].unit[i].lmranger_ok   = rw==0 && ty==4 && [br->col].top <= br->a && br->a <= [br->col].bot);             */
  /* exring[cid].unit[i].lmrangew_ok   = rw==1 && ty==4 && [br->col].top <= br->a && br->a <= [br->col].bot);             */
  /* exring[cid].unit[i].lmlddmqw_ok   = rw==1 && ty==3 && [br->col].op1==LDDMQ                                           */
  /* exring[cid].unit[i].lmea0strq     = STRQ[*];                                                                         */
  /* exring[cid].unit[i].lmea0strqcol  = STRQ[*];                                                                         */
  /* exring[cid].unit[i].lmring_ea0bsy = EXEC && (normal_op0||STRQ[*]);                                                   */
  /* exring[cid].unit[i].lmring_ea1bsy = EXEC && (normal_op1);                                                            */
  /* exring[cid].unit[i].lmring_ful    = NEXT_TR+NEXT_BR==FULL;                                                           */
  /* exring[cid].unit[i].deq_wait      = lmring_ful | (ranger_ok & ea1bsy) | (rangew_ok & ea0bsy) | (lddmqw_ok & col!=j); */
  /* eaop0/eaop1を直接検査するので,conf.mwsaは使わなくて良い                                                              */
  assign                        lmea0sfma         =  `conf0_ea0op ==`OP_STBR && `conf0_op1==`OP_SFMA;
  assign                        lmea0strq         =  `conf0_ea0op ==`OP_STRQ;       /* ea0.strq存在 4サイクルに分けて実行 */
//assign                        lmea0strq         =  `conf0_ea0op ==`OP_STRQ        /* ea0.strq存在 4サイクルに分けて実行 */
//                                                || `conf1_ea0op ==`OP_STRQ
//                                                || `conf2_ea0op ==`OP_STRQ
//                                                || `conf3_ea0op ==`OP_STRQ;   /* op0 */
  assign                        lmea0strqcol      =  2'd0;
//assign                        lmea0strqcol      =  (`conf0_ea0op ==`OP_STRQ) ? 2'd0 :
//                                                   (`conf1_ea0op ==`OP_STRQ) ? 2'd1 :
//                                                   (`conf2_ea0op ==`OP_STRQ) ? 2'd2 : 2'd3;
  /*------------------------------- EA04DR ------------------------------------*/

  wire                          lmring_w_ok       = ((cmd==`CMD_NOP || cmd==`CMD_EXEC) && lmring_bin_nemp && !lmring_bin_ful && lmrangew_ok) ? 1'b1:1'b0;
//assign                        lmring_ea0bsy     = ((((!(`conf0_fold)) && exec)||((`conf0_fold) && fold)) && (((`conf_ea0op!=5'd0) && (`conf_ea0op<=`OP_IM_BUFWR)) || (lmea0sfma|lmea0strq)));/*op0*//*wire*/
//assign                        lmring_ea0bsy     = ((((`conf_ea0op!=5'd0) && (`conf_ea0op<=`OP_IM_BUFWR)) || (lmea0sfma|lmea0strq)) && (((!(`conf0_fold)) && exec)||((`conf0_fold) && fold)));/*op0*//*wire*/
  assign                        lmring_ea0bsy     =  (((`conf_ea0op!=5'd0) && (`conf_ea0op<=`OP_IM_BUFRD)) && exec) //★MEX
                                                  ||((((`conf_ea0op!=5'd0) && (`conf_ea0op<=`OP_IM_BUFWR)) || (lmea0sfma|lmea0strq)) && (((!(`conf0_fold)) && exec)||((`conf0_fold) && fold)));/*op0*//*wire*/
  
  wire [1:0]                    lmring_w_lmm_mode = (lmring_w_ok) ? ((lmco==2'd0)? `conf0_lmm_mode:  /* 0:off, 1:lmli, 2:lmwd,3:lmri */  /* for STATUS_LOAD */
                                                                     (lmco==2'd1)? `conf1_lmm_mode:
                                                                     (lmco==2'd2)? `conf2_lmm_mode:
                                                                                   `conf3_lmm_mode):
				                    confkmex0_lmm_mode;//★MEX
  wire [1:0]                    ea04_umask        = (lmring_w_lmm_mode==2'd3) ? `LMM_UMASK3: /* UMASK 0x3     4分割モード          */
                                                    (lmring_w_lmm_mode==2'd2) ? `LMM_UMASK2: /* UMASK 0x2     2分割モード          */
                                                    (lmring_w_lmm_mode==2'd1) ? `LMM_UMASK1: /* UMASK 0x0     フルアクセスモード   */
                                                  /*(lmring_w_lmm_mode==2'd0)?*/`LMM_UMASK0; /* UMASK 0x0     書き込み禁止モード?  */
  wire [`EXRING_ADDR_BITS-1:0]  ea04_lmask        = (lmring_w_lmm_mode==2'd3) ? `LMM_LMASK3: /* LMASK 0x07FFF 4分割モード          */
                                                    (lmring_w_lmm_mode==2'd2) ? `LMM_LMASK2: /* LMASK 0x0FFFF 2分割モード          */
                                                    (lmring_w_lmm_mode==2'd1) ? `LMM_LMASK1: /* LMASK 0x1FFFF フルアクセスモード   */
                                                  /*(lmring_w_lmm_mode==2'd0)?*/`LMM_LMASK0; /* LMASK 0x00000 書き込み禁止モード?  */

  wire [`REG_DATA_BITS-1:0]     mwmux0            = (`confk_mws0==2'd1) ? exdp : tx0i;
  wire [`REG_DATA_BITS-1:0]     mwmux1            = (`confk_mws1==2'd1) ? exdp : tx1i;
  wire [`REG_DATA_BITS-1:0]     mwmux2            = (`confk_mws2==2'd1) ? exdp : tx2i;
  wire [`REG_DATA_BITS-1:0]     mwmux3            = (`confk_mws3==2'd1) ? exdp : tx3i;

  /* (NOP | EXEC) & !deq_wait & lmrangew_okの時 lmwa->ea04dr */
  /* lmring_ea0bsy                         の時,ea0d->ea04dr */
  always @(posedge ACLK or negedge RSTN) begin
    if (~RSTN|~UNIRSTN) begin
      ea0d     <= {(`EXRING_ADDR_BITS){1'b0}};
      ea0woofs <= {(`EXRING_ADDR_BITS){1'b0}};//★MEX
    end
    else begin
      if (lmring_w_ok) begin
        ea0d    <= {(lmco & ea04_umask),`LMM_UMASK_SHIFT'd0} | (lmca  & ea04_lmask);
      end
      else if (lmring_ea0bsy) begin /* EXEC & ea0d->lmm_write/read */
//      ea0d    <= {(k     & ea04_umask),`LMM_UMASK_SHIFT'd0} | (ea0di & ea04_lmask);
        ea0d    <= {(kmex0 & ea04_umask),`LMM_UMASK_SHIFT'd0} | (ea0di & ea04_lmask);//★MEX
      end
      ea0woofs <= ea0woofsi;//★MEX
    end
  end

  /* OP_TR   の場合,eag0->WRITE,eag1->READ */
  /* OP_LDDMQの場合,eag0->WRITE,eag1->READ */
  /* mws[0-3]:2; 0:lmwd1, 1:exdr, 2:ts1 */
  wire                          en0 = (lmring_w_ok || lmring_ea0bsy) ? 1'b1:1'b0;
  wire                          rw0 = (lmring_w_ok)   ? 1'b1:
                                      (lmring_ea0bsy) ? ((`confk_ea0op & 5'h10) != 0): /* read/write */
                                                        1'b0;
  wire [`EXRING_ADDR_BITS-1:0]  ma0 = (lmring_w_ok)   ? `LMM_MA_MASK&( {(lmco  & ea04_umask),`LMM_UMASK_SHIFT'd0} | (lmca  & ea04_lmask) ):
                                      (lmring_ea0bsy) ? `LMM_MA_MASK&( {(kmex0 & ea04_umask),`LMM_UMASK_SHIFT'd0} | (ea0di & ea04_lmask) )://★MEX
                                                        {(`EXRING_ADDR_BITS){1'b0}}; /* read/write */

  /* combination logic */
  reg  [`AXI_S_DATA_BYTES-1:0]  mm0;
  reg  [`LMRING_DATA_BITS-1:0]  mw0;
  always @* begin
    mm0 = {(`AXI_S_DATA_BYTES){1'b0}};
    mw0 = {(`LMRING_DATA_BITS){1'b0}};
    if (lmring_w_ok) begin
      mm0 = lmwm;
      mw0 = lmwd;
    end
    else if(lmring_ea0bsy) begin
      case (`confk_ea0op)
        `OP_STR: begin
          mm0[31:28] = (ea0di[4:3]==2'h3 && cxdi[1]) ? 4'b1111 : 4'b0000;
          mm0[27:24] = (ea0di[4:3]==2'h3 && cxdi[0]) ? 4'b1111 : 4'b0000;
	  mm0[23:20] = (ea0di[4:3]==2'h2 && cxdi[1]) ? 4'b1111 : 4'b0000;
          mm0[19:16] = (ea0di[4:3]==2'h2 && cxdi[0]) ? 4'b1111 : 4'b0000;
          mm0[15:12] = (ea0di[4:3]==2'h1 && cxdi[1]) ? 4'b1111 : 4'b0000;
          mm0[11: 8] = (ea0di[4:3]==2'h1 && cxdi[0]) ? 4'b1111 : 4'b0000;
          mm0[ 7: 4] = (ea0di[4:3]==2'h0 && cxdi[1]) ? 4'b1111 : 4'b0000;
          mm0[ 3: 0] = (ea0di[4:3]==2'h0 && cxdi[0]) ? 4'b1111 : 4'b0000;
          mw0[255:192] = mwmux3;
          mw0[191:128] = mwmux2;
          mw0[127: 64] = mwmux1;
          mw0[ 63:  0] = mwmux0;
        end
        `OP_STWR: begin
          mm0[31:28] = (ea0di[4:2]==3'h7 && cxdi[0]) ? 4'b1111 : 4'b0000;
          mm0[27:24] = (ea0di[4:2]==3'h6 && cxdi[0]) ? 4'b1111 : 4'b0000;
          mm0[23:20] = (ea0di[4:2]==3'h5 && cxdi[0]) ? 4'b1111 : 4'b0000;
          mm0[19:16] = (ea0di[4:2]==3'h4 && cxdi[0]) ? 4'b1111 : 4'b0000;
          mm0[15:12] = (ea0di[4:2]==3'h3 && cxdi[0]) ? 4'b1111 : 4'b0000;
          mm0[11: 8] = (ea0di[4:2]==3'h2 && cxdi[0]) ? 4'b1111 : 4'b0000;
          mm0[ 7: 4] = (ea0di[4:2]==3'h1 && cxdi[0]) ? 4'b1111 : 4'b0000;
          mm0[ 3: 0] = (ea0di[4:2]==3'h0 && cxdi[0]) ? 4'b1111 : 4'b0000;
	  case (ea0di[2])
	    1'h1: begin 
	      mw0[255:192] = {mwmux3[31:0], {(32){1'b0}}};
	      mw0[191:128] = {mwmux2[31:0], {(32){1'b0}}};
	      mw0[127: 64] = {mwmux1[31:0], {(32){1'b0}}};
	      mw0[ 63:  0] = {mwmux0[31:0], {(32){1'b0}}};
	    end
	    1'h0: begin 
	      mw0[255:192] = {{(32){1'b0}}, mwmux3[31:0]};
	      mw0[191:128] = {{(32){1'b0}}, mwmux2[31:0]};
	      mw0[127: 64] = {{(32){1'b0}}, mwmux1[31:0]};
	      mw0[ 63:  0] = {{(32){1'b0}}, mwmux0[31:0]};
	    end
	  endcase
        end
//      `OP_STHR: begin
//        mm0[31:30] = (ea0di[4:1]==4'hf && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[29:28] = (ea0di[4:1]==4'he && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[27:26] = (ea0di[4:1]==4'hd && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[25:24] = (ea0di[4:1]==4'hc && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[23:22] = (ea0di[4:1]==4'hb && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[21:20] = (ea0di[4:1]==4'ha && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[19:18] = (ea0di[4:1]==4'h9 && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[17:16] = (ea0di[4:1]==4'h8 && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[15:14] = (ea0di[4:1]==4'h7 && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[13:12] = (ea0di[4:1]==4'h6 && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[11:10] = (ea0di[4:1]==4'h5 && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[ 9: 8] = (ea0di[4:1]==4'h4 && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[ 7: 6] = (ea0di[4:1]==4'h3 && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[ 5: 4] = (ea0di[4:1]==4'h2 && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[ 3: 2] = (ea0di[4:1]==4'h1 && cxdi[0]) ? 2'b11 : 2'b00;
//        mm0[ 1: 0] = (ea0di[4:1]==4'h0 && cxdi[0]) ? 2'b11 : 2'b00;
//	  case (ea0di[2:1])
//	    2'h3: begin 
//            mw0[255:192] = {              mwmux3[15:0], {(48){1'b0}}};
//            mw0[191:128] = {              mwmux2[15:0], {(48){1'b0}}};
//            mw0[127: 64] = {              mwmux1[15:0], {(48){1'b0}}};
//            mw0[ 63:  0] = {              mwmux0[15:0], {(48){1'b0}}};
//          end
//	    2'h2: begin 
//            mw0[255:192] = {{(16){1'b0}}, mwmux3[15:0], {(32){1'b0}}};
//            mw0[191:128] = {{(16){1'b0}}, mwmux2[15:0], {(32){1'b0}}};
//            mw0[127: 64] = {{(16){1'b0}}, mwmux1[15:0], {(32){1'b0}}};
//            mw0[ 63:  0] = {{(16){1'b0}}, mwmux0[15:0], {(32){1'b0}}};
//          end
//	    2'h1: begin 
//            mw0[255:192] = {{(32){1'b0}}, mwmux3[15:0], {(16){1'b0}}};
//            mw0[191:128] = {{(32){1'b0}}, mwmux2[15:0], {(16){1'b0}}};
//            mw0[127: 64] = {{(32){1'b0}}, mwmux1[15:0], {(16){1'b0}}};
//            mw0[ 63:  0] = {{(32){1'b0}}, mwmux0[15:0], {(16){1'b0}}};
//          end
//	    2'h0: begin 
//            mw0[255:192] = {{(48){1'b0}}, mwmux3[15:0]};
//            mw0[191:128] = {{(48){1'b0}}, mwmux2[15:0]};
//            mw0[127: 64] = {{(48){1'b0}}, mwmux1[15:0]};
//            mw0[ 63:  0] = {{(48){1'b0}}, mwmux0[15:0]};
//          end
//        endcase
//      end
        `OP_STBR: begin
          mm0[31] = (ea0di[4:0]==5'h1f && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[30] = (ea0di[4:0]==5'h1e && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[29] = (ea0di[4:0]==5'h1d && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[28] = (ea0di[4:0]==5'h1c && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[27] = (ea0di[4:0]==5'h1b && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[26] = (ea0di[4:0]==5'h1a && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[25] = (ea0di[4:0]==5'h19 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[24] = (ea0di[4:0]==5'h18 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[23] = (ea0di[4:0]==5'h17 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[22] = (ea0di[4:0]==5'h16 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[21] = (ea0di[4:0]==5'h15 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[20] = (ea0di[4:0]==5'h14 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[19] = (ea0di[4:0]==5'h13 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[18] = (ea0di[4:0]==5'h12 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[17] = (ea0di[4:0]==5'h11 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[16] = (ea0di[4:0]==5'h10 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[15] = (ea0di[4:0]==5'h0f && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[14] = (ea0di[4:0]==5'h0e && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[13] = (ea0di[4:0]==5'h0d && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[12] = (ea0di[4:0]==5'h0c && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[11] = (ea0di[4:0]==5'h0b && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[10] = (ea0di[4:0]==5'h0a && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[ 9] = (ea0di[4:0]==5'h09 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[ 8] = (ea0di[4:0]==5'h08 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[ 7] = (ea0di[4:0]==5'h07 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[ 6] = (ea0di[4:0]==5'h06 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[ 5] = (ea0di[4:0]==5'h05 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[ 4] = (ea0di[4:0]==5'h04 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[ 3] = (ea0di[4:0]==5'h03 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[ 2] = (ea0di[4:0]==5'h02 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[ 1] = (ea0di[4:0]==5'h01 && cxdi[0]) ? 1'b1 : 1'b0;
          mm0[ 0] = (ea0di[4:0]==5'h00 && cxdi[0]) ? 1'b1 : 1'b0;
  	  case (ea0di[2:0])
  	    3'h7: begin 
	      mw0[255:192] = {              mwmux3[7:0], {(56){1'b0}}};
	      mw0[191:128] = {              mwmux2[7:0], {(56){1'b0}}};
	      mw0[127: 64] = {              mwmux1[7:0], {(56){1'b0}}};
	      mw0[ 63:  0] = {              mwmux0[7:0], {(56){1'b0}}};
	    end
  	    3'h6: begin 
	      mw0[255:192] = {{( 8){1'b0}}, mwmux3[7:0], {(48){1'b0}}};
	      mw0[191:128] = {{( 8){1'b0}}, mwmux2[7:0], {(48){1'b0}}};
	      mw0[127: 64] = {{( 8){1'b0}}, mwmux1[7:0], {(48){1'b0}}};
	      mw0[ 63:  0] = {{( 8){1'b0}}, mwmux0[7:0], {(48){1'b0}}};
	    end
  	    3'h5: begin 
	      mw0[255:192] = {{(16){1'b0}}, mwmux3[7:0], {(40){1'b0}}};
	      mw0[191:128] = {{(16){1'b0}}, mwmux2[7:0], {(40){1'b0}}};
	      mw0[127: 64] = {{(16){1'b0}}, mwmux1[7:0], {(40){1'b0}}};
	      mw0[ 63:  0] = {{(16){1'b0}}, mwmux0[7:0], {(40){1'b0}}};
	    end
  	    3'h4: begin 
	      mw0[255:192] = {{(24){1'b0}}, mwmux3[7:0], {(32){1'b0}}};
	      mw0[191:128] = {{(24){1'b0}}, mwmux2[7:0], {(32){1'b0}}};
	      mw0[127: 64] = {{(24){1'b0}}, mwmux1[7:0], {(32){1'b0}}};
	      mw0[ 63:  0] = {{(24){1'b0}}, mwmux0[7:0], {(32){1'b0}}};
	    end
  	    3'h3: begin 
	      mw0[255:192] = {{(32){1'b0}}, mwmux3[7:0], {(24){1'b0}}};
	      mw0[191:128] = {{(32){1'b0}}, mwmux2[7:0], {(24){1'b0}}};
	      mw0[127: 64] = {{(32){1'b0}}, mwmux1[7:0], {(24){1'b0}}};
	      mw0[ 63:  0] = {{(32){1'b0}}, mwmux0[7:0], {(24){1'b0}}};
	    end
  	    3'h2: begin 
	      mw0[255:192] = {{(40){1'b0}}, mwmux3[7:0], {(16){1'b0}}};
	      mw0[191:128] = {{(40){1'b0}}, mwmux2[7:0], {(16){1'b0}}};
	      mw0[127: 64] = {{(40){1'b0}}, mwmux1[7:0], {(16){1'b0}}};
	      mw0[ 63:  0] = {{(40){1'b0}}, mwmux0[7:0], {(16){1'b0}}};
	    end
  	    3'h1: begin 
	      mw0[255:192] = {{(48){1'b0}}, mwmux3[7:0], {(8){1'b0}}};
	      mw0[191:128] = {{(48){1'b0}}, mwmux2[7:0], {(8){1'b0}}};
	      mw0[127: 64] = {{(48){1'b0}}, mwmux1[7:0], {(8){1'b0}}};
	      mw0[ 63:  0] = {{(48){1'b0}}, mwmux0[7:0], {(8){1'b0}}};
	    end
  	    3'h0: begin 
	      mw0[255:192] = {{(56){1'b0}}, mwmux3[7:0]};
	      mw0[191:128] = {{(56){1'b0}}, mwmux2[7:0]};
	      mw0[127: 64] = {{(56){1'b0}}, mwmux1[7:0]};
	      mw0[ 63:  0] = {{(56){1'b0}}, mwmux0[7:0]};
	    end
	  endcase
        end
        //`OP_IM_PREF:
        `OP_IM_BUFWR: begin
          mm0            = 32'hffffffff;         /* mask */    /* ★★★暫定記述★★★ */
          mw0[255:192]   = mwmux3;
          mw0[191:128]   = mwmux2;
          mw0[127: 64]   = mwmux1;
          mw0[ 63:  0]   = mwmux0;
        end
        // OP_STRQ in target/neighbor slot
        //`OP_STRQ: begin
        default: begin
          if (lmea0strq) begin
	    mm0[31:24] = (cyclep1==2'd3) ? 8'b11111111 : 8'b00000000;
	    mm0[23:16] = (cyclep1==2'd2) ? 8'b11111111 : 8'b00000000;
	    mm0[15: 8] = (cyclep1==2'd1) ? 8'b11111111 : 8'b00000000;
	    mm0[ 7: 0] = (cyclep1==2'd0) ? 8'b11111111 : 8'b00000000;
            case (cyclep1)
	      2'd0: mw0[ 63:  0] = mwmux0; /* align不要 */
	      2'd1: mw0[127: 64] = mwmux1; /* align不要 */
	      2'd2: mw0[191:128] = mwmux2; /* align不要 */
              2'd3: mw0[255:192] = mwmux3; /* align不要 */
	    endcase
          end
        end
      endcase
    end
  end

  /*----------------------------- EA14DR -------------------------------*/
  wire                          lmring_r_ok       = ((cmd==`CMD_NOP || cmd==`CMD_EXEC) && lmring_bin_nemp && !lmring_bin_ful && lmranger_ok) ? 1'b1:1'b0;
//assign                        lmring_ea1bsy     = exec && (`conf_ea1op!=5'd0) && (`conf_ea1op<=`OP_IM_BUFRD);         /* op1 */ /* wire */  /* ea1有効 */
  assign                        lmring_ea1bsy     = (`conf_ea1op!=5'd0) && (`conf_ea1op<=`OP_IM_BUFRD) && exec;         /* op1 */ /* wire */  /* ea1有効 */
  wire [1:0]                    lmring_r_lmm_mode = (lmring_r_ok) ? ((lmco==2'd0)? `conf0_lmm_mode:  /* 0:off, 1:lmli, 2:lmwd,3:lmri */  /* for STATUS_LOAD */
                                                                     (lmco==2'd1)? `conf1_lmm_mode:
                                                                     (lmco==2'd2)? `conf2_lmm_mode:
                                                                                   `conf3_lmm_mode):
                                                    confkmex1_lmm_mode;//★MEX
  wire [1:0]                    ea14_umask        = (lmring_r_lmm_mode==2'd3) ? `LMM_UMASK3:
                                                    (lmring_r_lmm_mode==2'd2) ? `LMM_UMASK2:
                                                    (lmring_r_lmm_mode==2'd1) ? `LMM_UMASK1:
                                                  /*(lmring_r_lmm_mode==2'd0)?*/`LMM_UMASK0;
  wire [`EXRING_ADDR_BITS-1:0]  ea14_lmask        = (lmring_r_lmm_mode==2'd3) ? `LMM_LMASK3:
                                                    (lmring_r_lmm_mode==2'd2) ? `LMM_LMASK2:
                                                    (lmring_r_lmm_mode==2'd1) ? `LMM_LMASK1:
                                                  /*(lmring_r_lmm_mode==2'd0)?*/`LMM_LMASK0;

  /* (NOP | EXEC) & !deq_wait & lmranger_okの時 lmra->ea14dr */
  /* lmring_ea1bsy                         の時,ea1d->ea14dr */
  always @(posedge ACLK or negedge RSTN) begin
    if (~RSTN|~UNIRSTN) begin
      ea1d     <= {(`EXRING_ADDR_BITS){1'b0}};
      ea1woofs <= {(`EXRING_ADDR_BITS){1'b0}};//★MEX
    end
    else begin
      if (lmring_r_ok) begin
        ea1d    <= {(lmco & ea14_umask),`LMM_UMASK_SHIFT'd0} | (lmca  & ea14_lmask);
      end
      else if (lmring_ea1bsy) begin /* EXEC & ea1d->lmm_write/read */
//      ea1d    <= {(cyclep1 & ea14_umask),`LMM_UMASK_SHIFT'd0} | (ea1di & ea14_lmask);
        ea1d    <= {(kmex1   & ea14_umask),`LMM_UMASK_SHIFT'd0} | (ea1di & ea14_lmask);//★MEX
      end
      ea1woofs <= ea1woofsi;//★MEX
    end
  end

  /* OP_TR   の場合,eag0->WRITE,eag1->READ */
  /* OP_LDDMQの場合,eag0->WRITE,eag1->READ */
  /* mws[0-3]:2; 0:lmwd1, 1:exdr, 2:ts1 */
  wire                          en1 = (lmring_r_ok || lmring_ea1bsy)? 1'b1:1'b0;
  wire                          rw1 = 1'b0;
  wire [`EXRING_ADDR_BITS-1:0]  ma1 = (lmring_r_ok)   ? `LMM_MA_MASK&( {(lmco  & ea14_umask),`LMM_UMASK_SHIFT'd0} | (lmca  & ea14_lmask)):
                                      (lmring_ea1bsy) ? `LMM_MA_MASK&( {(kmex1 & ea14_umask),`LMM_UMASK_SHIFT'd0} | (ea1di & ea14_lmask))://★MEX
                                                        {(`EXRING_ADDR_BITS){1'b0}}; /* read */

  /*---------------------- 1W2R RAM ----------------------*/
  lmm lmm
  (
    .ACLK       (ACLK               ), // general clock (fpga:83mhz asic:240mhz)
    .RST        (~RSTN|~UNIRSTN     ), // 0x0000 1: rst=0->1->0
    .en0        (en0                ),
    .en1        (en1                ), // en1==1 (always read) -> rrdy
    .rw0        (rw0                ),
    .ma0        (ma0                ),
    .ma1        (ma1                ),
    .wm0        (mm0                ),
    .mw0        (mw0                ),
    .mr0        (mr0                ),
    .mr1        (mr1                )
  );

  /*------------------------- TX4DR --------------------------*/
  always @(posedge ACLK or negedge RSTN) begin
    if (~RSTN|~UNIRSTN) begin
      tx_valid    <= 1'b0;
      tx0         <= {(`REG_DATA_BITS){1'b0}};
      tx1         <= {(`REG_DATA_BITS){1'b0}};
      tx2         <= {(`REG_DATA_BITS){1'b0}};
      tx3         <= {(`REG_DATA_BITS){1'b0}};
    end
    else begin
      /* lmwd/tx3dr -> tx4dr */
      if (exec) begin
        /* 0:lmwd0, 1:exdr, 2:ts0 */    /* 0:TR外部書き込み用, 1,2:EX/TS書き込み用 */
//      if (`conf_ea1op==`OP_LDDMQ) begin
//        if (lmlddmqw_ok && lmring_bin[`LMRING_BR_COL]!=cyclep1) begin
//          tx_valid    <= 1'b1;
//          tx0         <= lmwd[64*0+63:64*0];
//          tx1         <= lmwd[64*1+63:64*1];
//          tx2         <= lmwd[64*2+63:64*2];
//          tx3         <= lmwd[64*3+63:64*3];
//        end
//        else begin
//          tx_valid    <= 1'b0; /* no data for OP_LDDMQ */
//          tx0         <= tx0;
//          tx1         <= tx1;
//          tx2         <= tx2;
//          tx3         <= tx3;
//        end
//      end
//      else
	begin /* trs==0の場合,lmwd->trだが,LDDMQ以外に使用するケースはない */
          tx_valid  <= 1'b1;
          tx0       <= (`conf_trs0==1) ? exdp : tx0i;
          tx1       <= (`conf_trs1==1) ? exdp : tx1i;
          tx2       <= (`conf_trs2==1) ? exdp : tx2i;
          tx3       <= (`conf_trs3==1) ? exdp : tx3i;
        end
      end
    end
  end
endmodule

module exe3
(
  input  wire                         ACLK,
  input  wire                         RSTN,
  input  wire [2:0]                   op,
  input  wire [`EXE_WORD_BITS-1:0]    ex3d,
  input  wire [5:0]                   ex5,
  output wire [`EXE_WORD_BITS-1:0]    ex4d
);

  function [`EXE_WORD_BITS-1:0] ex3_internal;
    input [2:0]                   op;
    input [`EXE_WORD_BITS-1:0]    s1;
    input [5:0]                   s2;
    reg   [`EXE_WORD_BITS-1:0]    d;
    begin
      case (op)
        //`OP_NOP3: begin
        default: begin
	  d = s1;
        end
        `OP_SLL: begin
          case(s2[4:0])
            5'd0:  d =  s1[31:0];
            5'd1:  d = {s1[30:0],{ 1{1'b0}}};
            5'd2:  d = {s1[29:0],{ 2{1'b0}}};
            5'd3:  d = {s1[28:0],{ 3{1'b0}}};
            5'd4:  d = {s1[27:0],{ 4{1'b0}}};
            5'd5:  d = {s1[26:0],{ 5{1'b0}}};
            5'd6:  d = {s1[25:0],{ 6{1'b0}}};
            5'd7:  d = {s1[24:0],{ 7{1'b0}}};
            5'd8:  d = {s1[23:0],{ 8{1'b0}}};
            5'd9:  d = {s1[22:0],{ 9{1'b0}}};
            5'd10: d = {s1[21:0],{10{1'b0}}};
            5'd11: d = {s1[20:0],{11{1'b0}}};
            5'd12: d = {s1[19:0],{12{1'b0}}};
            5'd13: d = {s1[18:0],{13{1'b0}}};
            5'd14: d = {s1[17:0],{14{1'b0}}};
            5'd15: d = {s1[16:0],{15{1'b0}}};
            5'd16: d = {s1[15:0],{16{1'b0}}};
            5'd17: d = {s1[14:0],{17{1'b0}}};
            5'd18: d = {s1[13:0],{18{1'b0}}};
            5'd19: d = {s1[12:0],{19{1'b0}}};
            5'd20: d = {s1[11:0],{20{1'b0}}};
            5'd21: d = {s1[10:0],{21{1'b0}}};
            5'd22: d = {s1[ 9:0],{22{1'b0}}};
            5'd23: d = {s1[ 8:0],{23{1'b0}}};
            5'd24: d = {s1[ 7:0],{24{1'b0}}};
            5'd25: d = {s1[ 6:0],{25{1'b0}}};
            5'd26: d = {s1[ 5:0],{26{1'b0}}};
            5'd27: d = {s1[ 4:0],{27{1'b0}}};
            5'd28: d = {s1[ 3:0],{28{1'b0}}};
            5'd29: d = {s1[ 2:0],{29{1'b0}}};
            5'd30: d = {s1[ 1:0],{30{1'b0}}};
            5'd31: d = {s1[   0],{31{1'b0}}};
          endcase
        end
        `OP_SRL: begin
          case(s2[4:0])
            5'd0:  d =             s1[31:0];
            5'd1:  d = {{ 1{1'b0}},s1[31: 1]};
            5'd2:  d = {{ 2{1'b0}},s1[31: 2]};
            5'd3:  d = {{ 3{1'b0}},s1[31: 3]};
            5'd4:  d = {{ 4{1'b0}},s1[31: 4]};
            5'd5:  d = {{ 5{1'b0}},s1[31: 5]};
            5'd6:  d = {{ 6{1'b0}},s1[31: 6]};
            5'd7:  d = {{ 7{1'b0}},s1[31: 7]};
            5'd8:  d = {{ 8{1'b0}},s1[31: 8]};
            5'd9:  d = {{ 9{1'b0}},s1[31: 9]};
            5'd10: d = {{10{1'b0}},s1[31:10]};
            5'd11: d = {{11{1'b0}},s1[31:11]};
            5'd12: d = {{12{1'b0}},s1[31:12]};
            5'd13: d = {{13{1'b0}},s1[31:13]};
            5'd14: d = {{14{1'b0}},s1[31:14]};
            5'd15: d = {{15{1'b0}},s1[31:15]};
            5'd16: d = {{16{1'b0}},s1[31:16]};
            5'd17: d = {{17{1'b0}},s1[31:17]};
            5'd18: d = {{18{1'b0}},s1[31:18]};
            5'd19: d = {{19{1'b0}},s1[31:19]};
            5'd20: d = {{20{1'b0}},s1[31:20]};
            5'd21: d = {{21{1'b0}},s1[31:21]};
            5'd22: d = {{22{1'b0}},s1[31:22]};
            5'd23: d = {{23{1'b0}},s1[31:23]};
            5'd24: d = {{24{1'b0}},s1[31:24]};
            5'd25: d = {{25{1'b0}},s1[31:25]};
            5'd26: d = {{26{1'b0}},s1[31:26]};
            5'd27: d = {{27{1'b0}},s1[31:27]};
            5'd28: d = {{28{1'b0}},s1[31:28]};
            5'd29: d = {{29{1'b0}},s1[31:29]};
            5'd30: d = {{30{1'b0}},s1[31:30]};
            5'd31: d = {{31{1'b0}},s1[   31]};
          endcase
        end
        `OP_SRAA: begin
          case(s2[4:0])
            5'd0:  d =               s1[31: 0];
            5'd1:  d = {{ 1{s1[31]}},s1[31: 1]};
            5'd2:  d = {{ 2{s1[31]}},s1[31: 2]};
            5'd3:  d = {{ 3{s1[31]}},s1[31: 3]};
            5'd4:  d = {{ 4{s1[31]}},s1[31: 4]};
            5'd5:  d = {{ 5{s1[31]}},s1[31: 5]};
            5'd6:  d = {{ 6{s1[31]}},s1[31: 6]};
            5'd7:  d = {{ 7{s1[31]}},s1[31: 7]};
            5'd8:  d = {{ 8{s1[31]}},s1[31: 8]};
            5'd9:  d = {{ 9{s1[31]}},s1[31: 9]};
            5'd10: d = {{10{s1[31]}},s1[31:10]};
            5'd11: d = {{11{s1[31]}},s1[31:11]};
            5'd12: d = {{12{s1[31]}},s1[31:12]};
            5'd13: d = {{13{s1[31]}},s1[31:13]};
            5'd14: d = {{14{s1[31]}},s1[31:14]};
            5'd15: d = {{15{s1[31]}},s1[31:15]};
            5'd16: d = {{16{s1[31]}},s1[31:16]};
            5'd17: d = {{17{s1[31]}},s1[31:17]};
            5'd18: d = {{18{s1[31]}},s1[31:18]};
            5'd19: d = {{19{s1[31]}},s1[31:19]};
            5'd20: d = {{20{s1[31]}},s1[31:20]};
            5'd21: d = {{21{s1[31]}},s1[31:21]};
            5'd22: d = {{22{s1[31]}},s1[31:22]};
            5'd23: d = {{23{s1[31]}},s1[31:23]};
            5'd24: d = {{24{s1[31]}},s1[31:24]};
            5'd25: d = {{25{s1[31]}},s1[31:25]};
            5'd26: d = {{26{s1[31]}},s1[31:26]};
            5'd27: d = {{27{s1[31]}},s1[31:27]};
            5'd28: d = {{28{s1[31]}},s1[31:28]};
            5'd29: d = {{29{s1[31]}},s1[31:29]};
            5'd30: d = {{30{s1[31]}},s1[31:30]};
            5'd31: d = {{31{s1[31]}},s1[   31]};
          endcase
        end

`ifdef ENABLE_MEDIA
        `OP_SRAB: begin
          case(s2[4:0])
            5'd0:   d = {{ 8{s1[23]}},s1[23: 0]};
            5'd1:   d = {{ 9{s1[23]}},s1[23: 1]};
            5'd2:   d = {{10{s1[23]}},s1[23: 2]};
            5'd3:   d = {{11{s1[23]}},s1[23: 3]};
            5'd4:   d = {{12{s1[23]}},s1[23: 4]};
            5'd5:   d = {{13{s1[23]}},s1[23: 5]};
            5'd6:   d = {{14{s1[23]}},s1[23: 6]};
            5'd7:   d = {{15{s1[23]}},s1[23: 7]};
            5'd8:   d = {{16{s1[23]}},s1[23: 8]};
            5'd9:   d = {{17{s1[23]}},s1[23: 9]};
            5'd10:  d = {{18{s1[23]}},s1[23:10]};
            5'd11:  d = {{19{s1[23]}},s1[23:11]};
            5'd12:  d = {{20{s1[23]}},s1[23:12]};
            5'd13:  d = {{21{s1[23]}},s1[23:13]};
            5'd14:  d = {{22{s1[23]}},s1[23:14]};
            5'd15:  d = {{23{s1[23]}},s1[23:15]};
            5'd16:  d = {{24{s1[23]}},s1[23:16]};
            5'd17:  d = {{25{s1[23]}},s1[23:17]};
            5'd18:  d = {{26{s1[23]}},s1[23:18]};
            5'd19:  d = {{27{s1[23]}},s1[23:19]};
            5'd20:  d = {{28{s1[23]}},s1[23:20]};
            5'd21:  d = {{29{s1[23]}},s1[23:21]};
            5'd22:  d = {{30{s1[23]}},s1[23:22]};
            5'd23:  d = {{31{s1[23]}},s1[   23]};
            default:d =  {32{s1[23]}};
          endcase
        end
//         `OP_SRAC: begin
//           case(s2[4:0])
//             5'd0:   d = {{16{s1[15]}},s1[15: 0]};
//             5'd1:   d = {{17{s1[15]}},s1[15: 1]};
//             5'd2:   d = {{18{s1[15]}},s1[15: 2]};
//             5'd3:   d = {{19{s1[15]}},s1[15: 3]};
//             5'd4:   d = {{20{s1[15]}},s1[15: 4]};
//             5'd5:   d = {{21{s1[15]}},s1[15: 5]};
//             5'd6:   d = {{22{s1[15]}},s1[15: 6]};
//             5'd7:   d = {{23{s1[15]}},s1[15: 7]};
//             5'd8:   d = {{24{s1[15]}},s1[15: 8]};
//             5'd9:   d = {{25{s1[15]}},s1[15: 9]};
//             5'd10:  d = {{26{s1[15]}},s1[15:10]};
//             5'd11:  d = {{27{s1[15]}},s1[15:11]};
//             5'd12:  d = {{28{s1[15]}},s1[15:12]};
//             5'd13:  d = {{29{s1[15]}},s1[15:13]};
//             5'd14:  d = {{30{s1[15]}},s1[15:14]};
//             5'd15:  d = {{31{s1[15]}},s1[   15]};
//             default:d =  {32{s1[15]}};
//           endcase
//         end
//         `OP_SRAD: begin
//           case(s2[4:0])
//             5'd0:   d = {{24{s1[7]}},s1[7:0]};
//             5'd1:   d = {{25{s1[7]}},s1[7:1]};
//             5'd2:   d = {{26{s1[7]}},s1[7:2]};
//             5'd3:   d = {{27{s1[7]}},s1[7:3]};
//             5'd4:   d = {{28{s1[7]}},s1[7:4]};
//             5'd5:   d = {{29{s1[7]}},s1[7:5]};
//             5'd6:   d = {{30{s1[7]}},s1[7:6]};
//             5'd7:   d = {{31{s1[7]}},s1[  7]};
//             default:d =  {32{s1[7]}};
//           endcase
//         end
        `OP_SRLM: begin
          //d = ((s1 >> s2)&0xffff0000)|((d1&0x0000ffff) >> s2);
          case(s2[3:0])
            4'd0:  d = {           s1[31:16],           s1[15: 0]};
            4'd1:  d = {{ 1{1'b0}},s1[31:17],{ 1{1'b0}},s1[15: 1]};
            4'd2:  d = {{ 2{1'b0}},s1[31:18],{ 2{1'b0}},s1[15: 2]};
            4'd3:  d = {{ 3{1'b0}},s1[31:19],{ 3{1'b0}},s1[15: 3]};
            4'd4:  d = {{ 4{1'b0}},s1[31:20],{ 4{1'b0}},s1[15: 4]};
            4'd5:  d = {{ 5{1'b0}},s1[31:21],{ 5{1'b0}},s1[15: 5]};
            4'd6:  d = {{ 6{1'b0}},s1[31:22],{ 6{1'b0}},s1[15: 6]};
            4'd7:  d = {{ 7{1'b0}},s1[31:23],{ 7{1'b0}},s1[15: 7]};
            4'd8:  d = {{ 8{1'b0}},s1[31:24],{ 8{1'b0}},s1[15: 8]};
            4'd9:  d = {{ 9{1'b0}},s1[31:25],{ 9{1'b0}},s1[15: 9]};
            4'd10: d = {{10{1'b0}},s1[31:26],{10{1'b0}},s1[15:10]};
            4'd11: d = {{11{1'b0}},s1[31:27],{11{1'b0}},s1[15:11]};
            4'd12: d = {{12{1'b0}},s1[31:28],{12{1'b0}},s1[15:12]};
            4'd13: d = {{13{1'b0}},s1[31:29],{13{1'b0}},s1[15:13]};
            4'd14: d = {{14{1'b0}},s1[31:30],{14{1'b0}},s1[15:14]};
            4'd15: d = {{15{1'b0}},s1[   31],{15{1'b0}},s1[   15]};
          endcase
        end
`endif
      endcase
      ex3_internal = d;
    end
  endfunction

  assign ex4d = ex3_internal(op, ex3d, ex5);

endmodule

`ifdef ENABLE_FPU
module fpu3
(
  input  wire                                 ex2_d_s,
  input  wire [ 8:0]                          ex2_d_exp,
  input  wire [25+`PEXT:0]                    ex2_d_frac, //■■■
  input  wire                                 ex2_d_inf,
  input  wire                                 ex2_d_nan,
  output wire [31:0]                          f
);
  function [31:0] normalizer;
    input               ex1_d_s;
    input [8:0]         ex1_d_exp;
    input [25+`PEXT:0]  ex1_d_frac; //■■■
    input               ex1_d_inf;
    input               ex1_d_nan;

    reg [5:0]           ex2_w_lzc; //■■■
    reg                 ex2_d_s;
    reg [7:0]           ex2_d_exp;
    reg [22:0]          ex2_d_frac;

    begin
      /* normalize */
      ex2_w_lzc = (ex1_d_frac[`PEXT+25]) ? 6'd62:
		  (ex1_d_frac[`PEXT+24]) ? 6'd63:
                  (ex1_d_frac[`PEXT+23]) ? 6'd0:
                  (ex1_d_frac[`PEXT+22]) ? 6'd1:
                  (ex1_d_frac[`PEXT+21]) ? 6'd2:
                  (ex1_d_frac[`PEXT+20]) ? 6'd3:
                  (ex1_d_frac[`PEXT+19]) ? 6'd4:
                  (ex1_d_frac[`PEXT+18]) ? 6'd5:
                  (ex1_d_frac[`PEXT+17]) ? 6'd6:
                  (ex1_d_frac[`PEXT+16]) ? 6'd7:
                  (ex1_d_frac[`PEXT+15]) ? 6'd8:
                  (ex1_d_frac[`PEXT+14]) ? 6'd9:
                  (ex1_d_frac[`PEXT+13]) ? 6'd10:
                  (ex1_d_frac[`PEXT+12]) ? 6'd11:
                  (ex1_d_frac[`PEXT+11]) ? 6'd12:
                  (ex1_d_frac[`PEXT+10]) ? 6'd13:
                  (ex1_d_frac[`PEXT+ 9]) ? 6'd14:
                  (ex1_d_frac[`PEXT+ 8]) ? 6'd15:
                  (ex1_d_frac[`PEXT+ 7]) ? 6'd16:
                  (ex1_d_frac[`PEXT+ 6]) ? 6'd17:
                  (ex1_d_frac[`PEXT+ 5]) ? 6'd18:
                  (ex1_d_frac[`PEXT+ 4]) ? 6'd19:
                  (ex1_d_frac[`PEXT+ 3]) ? 6'd20:
                  (ex1_d_frac[`PEXT+ 2]) ? 6'd21:
                  (ex1_d_frac[`PEXT+ 1]) ? 6'd22:
                  (ex1_d_frac[`PEXT+ 0]) ? 6'd23:
`ifdef PEXT_01
		  (ex1_d_frac[`PEXT- 1]) ?(6'd23+ 1):
`endif
`ifdef PEXT_02
		  (ex1_d_frac[`PEXT- 2]) ?(6'd23+ 2):
`endif
`ifdef PEXT_03
		  (ex1_d_frac[`PEXT- 3]) ?(6'd23+ 3):
`endif
`ifdef PEXT_04
		  (ex1_d_frac[`PEXT- 4]) ?(6'd23+ 4):
`endif
`ifdef PEXT_05
		  (ex1_d_frac[`PEXT- 5]) ?(6'd23+ 5):
`endif
`ifdef PEXT_06
		  (ex1_d_frac[`PEXT- 6]) ?(6'd23+ 6):
`endif
`ifdef PEXT_07
		  (ex1_d_frac[`PEXT- 7]) ?(6'd23+ 7):
`endif
`ifdef PEXT_08
		  (ex1_d_frac[`PEXT- 8]) ?(6'd23+ 8):
`endif
`ifdef PEXT_09
		  (ex1_d_frac[`PEXT- 9]) ?(6'd23+ 9):
`endif
`ifdef PEXT_10
		  (ex1_d_frac[`PEXT-10]) ?(6'd23+10):
`endif
`ifdef PEXT_11
		  (ex1_d_frac[`PEXT-11]) ?(6'd23+11):
`endif
`ifdef PEXT_12
		  (ex1_d_frac[`PEXT-12]) ?(6'd23+12):
`endif
`ifdef PEXT_13
		  (ex1_d_frac[`PEXT-13]) ?(6'd23+13):
`endif
`ifdef PEXT_14
		  (ex1_d_frac[`PEXT-14]) ?(6'd23+14):
`endif
`ifdef PEXT_15
		  (ex1_d_frac[`PEXT-15]) ?(6'd23+15):
`endif
`ifdef PEXT_16
		  (ex1_d_frac[`PEXT-16]) ?(6'd23+16):
`endif
`ifdef PEXT_17
		  (ex1_d_frac[`PEXT-17]) ?(6'd23+17):
`endif
`ifdef PEXT_18
		  (ex1_d_frac[`PEXT-18]) ?(6'd23+18):
`endif
`ifdef PEXT_19
		  (ex1_d_frac[`PEXT-19]) ?(6'd23+19):
`endif
`ifdef PEXT_20
		  (ex1_d_frac[`PEXT-20]) ?(6'd23+20):
`endif
`ifdef PEXT_21
		  (ex1_d_frac[`PEXT-21]) ?(6'd23+21):
`endif
`ifdef PEXT_22
		  (ex1_d_frac[`PEXT-22]) ?(6'd23+22):
`endif
`ifdef PEXT_23
		  (ex1_d_frac[`PEXT-23]) ?(6'd23+23):
`endif
                                          (6'd24+`PEXT);

      //   $display("ex1:%x %x %x\n", ex1_d_s, ex1_d_exp, ex1_d_frac);

      if (ex1_d_nan) begin
        ex2_d_s    = 1'b1;
        ex2_d_frac = 23'h400000;
        ex2_d_exp  = 8'hff;
      end
      else if (ex1_d_inf) begin
        ex2_d_s    = ex1_d_s;
        ex2_d_frac = 23'h000000;
        ex2_d_exp  = 8'hff;
      end
      else if (ex2_w_lzc == 6'd62) begin //■■■
        if (ex1_d_exp >= 253) begin
          ex2_d_s    = ex1_d_s;
          ex2_d_frac = 23'h000000;
          ex2_d_exp  = 8'hff;
        end
        else begin
          ex2_d_s    = ex1_d_s;
          ex2_d_frac = ex1_d_frac>>(2+`PEXT); //■■■
          ex2_d_exp  = ex1_d_exp[7:0] + 8'h2;
        end
      end
      else if (ex2_w_lzc == 6'd63) begin //■■■
        if (ex1_d_exp >= 254) begin
          ex2_d_s    = ex1_d_s;
          ex2_d_frac = 23'h000000;
          ex2_d_exp  = 8'hff;
        end
        else begin
          ex2_d_s    = ex1_d_s;
          ex2_d_frac = ex1_d_frac>>(1+`PEXT); //■■■
          ex2_d_exp  = ex1_d_exp[7:0] + 8'h1;
        end
      end
      else if (ex2_w_lzc <= (6'd23+`PEXT)) begin //■■■
        if (ex1_d_exp >= ex2_w_lzc + 255) begin
          ex2_d_s    = ex1_d_s;
          ex2_d_frac = 23'h000000;
          ex2_d_exp  = 8'hff;
        end
        else if (ex1_d_exp <= ex2_w_lzc) begin /* subnormal num */
          ex2_d_s    = ex1_d_s;
          ex2_d_frac = (ex1_d_frac<<ex1_d_exp)>>`PEXT; //■■■
          ex2_d_exp  = 8'h00;
        end
        else begin /* normalized num */
          ex2_d_s    = ex1_d_s;
          ex2_d_frac = (ex1_d_frac<<ex2_w_lzc)>>`PEXT; //■■■
          ex2_d_exp  = ex1_d_exp - {2'd0,ex2_w_lzc};   //■■■
        end
      end
      else begin /* zero */
        ex2_d_s    = 1'b0;
        ex2_d_frac = 23'h000000;
        ex2_d_exp  = 8'h00;
      end
      normalizer = {ex2_d_s, ex2_d_exp, ex2_d_frac};
    end
  endfunction
  assign f = normalizer( ex2_d_s, ex2_d_exp, ex2_d_frac, ex2_d_inf, ex2_d_nan);
endmodule
`endif

`ifdef ENABLE_SPU
module spu3
(
  input  wire [7:0]  s1,
  input  wire [31:0] si, /* pc=22:16, nc=6:0 are valid */
  output wire [7:0]  so
);
//  pc = *o2>>32&0xffff;
//  nc = *o2    &0xffff;
//  if (!(r1&0x80)) pc += (r1&0x7f);
//  else            nc += (r1&0x7f);
//  if (pc >= nc) {
//    os = 0x00;
//    oc = pc-nc;
//  }
//  else {
//    os = 0x80;
//    oc = nc-pc;
//  }
//  if (oc >= 128) oc = 127;
//  *o3 = os|oc;

   wire [7:0]  nc0 = {1'b0,si[`SPU_DATA_LOG2+ 2: 0]};
   wire [7:0]  pc0 = {1'b0,si[`SPU_DATA_LOG2+18:16]};
   wire [7:0]  nc1 =  s1[7] ? {1'b0,s1[6:0]}+nc0 : nc0;
   wire [7:0]  pc1 = ~s1[7] ? {1'b0,s1[6:0]}+pc0 : pc0;

   wire        os0 = (pc1 >= nc1) ? 1'b0 : 1'b1;
   wire [7:0]  oc0 = (pc1 >= nc1) ? pc1-nc1 : nc1-pc1;
   wire [6:0]  oc1 = (oc0[7]) ? 7'd127 : oc0[6:0];
	      
   assign      so = {os0,oc1};
endmodule
`endif

`ifdef REG_BRAM
module reg_bram
(
  input  wire                         CLK, // general clock (fpga:83MHz asic:240MHz)
  input  wire                         RST, // general reset
  input  wire                         en0, // 1:mem-enable
  input  wire                         en1, // 1:mem-enable
  input  wire                         rw0, // 1:write-en
  input  wire [`LMM_LENG_BITS-1:0]    ma0,
  input  wire [`LMM_LENG_BITS-1:0]    ma1,
  input  wire [`AXI_S_DATA_BYTES-1:0] wm0, // 1:write-byte-mask
  input  wire [`AXI_S_DATA_BITS-1:0]  mw0,
  output wire [`AXI_S_DATA_BITS-1:0]  mr0,
  output wire [`AXI_S_DATA_BITS-1:0]  mr1
);
  integer i;
  reg                                 en0_q;
  reg                                 en1_q;
  reg                                 rw0_q;
  reg [`EXRING_ADDR_BITS-1:0]         ma0_q;
  reg [`EXRING_ADDR_BITS-1:0]         ma1_q;
  reg [`AXI_S_DATA_BYTES-1:0]         wm0_q;
  reg [`AXI_S_DATA_BITS-1:0]          mw0_q;
  reg [`AXI_S_DATA_BITS-1:0]          ram[(1<<(`LMM_LENG_BITS))-1:0]; // 256bit->32Byte*1Kentry=32KByte  1K entry->10addrbit

  assign mr0 = (en0_q & ~rw0_q) ? ram[ma0_q]:{(`AXI_S_DATA_BITS){1'b0}};
  assign mr1 = (en1_q)          ? ram[ma1_q]:{(`AXI_S_DATA_BITS){1'b0}};

  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      en0_q     <= 1'b0;
      en1_q     <= 1'b0;
      rw0_q     <= 1'b0;
      ma0_q     <= {(`EXRING_ADDR_BITS){1'b0}};
      ma1_q     <= {(`EXRING_ADDR_BITS){1'b0}};
      wm0_q     <= {(`AXI_S_DATA_BYTES){1'b0}};
      mw0_q     <= {(`AXI_S_DATA_BITS){1'b0}};
`ifdef CLEAR_RAM
      for (i=0; i<(1<<(`LMM_LENG_BITS)); i=i+1) begin
        ram[i] <= {(`AXI_S_DATA_BITS){1'b0}};
      end
`endif
    end
    else begin
      en0_q  <= en0;
      en1_q  <= en1;
      rw0_q  <= rw0;
      ma0_q  <= ma0;
      ma1_q  <= ma1;
      wm0_q  <= wm0;
      mw0_q  <= mw0;
      if (en0_q & rw0_q & wm0_q[ 0]) ram[ma0_q][  7:  0] <= mw0_q[  7:  0];
      if (en0_q & rw0_q & wm0_q[ 1]) ram[ma0_q][ 15:  8] <= mw0_q[ 15:  8];
      if (en0_q & rw0_q & wm0_q[ 2]) ram[ma0_q][ 23: 16] <= mw0_q[ 23: 16];
      if (en0_q & rw0_q & wm0_q[ 3]) ram[ma0_q][ 31: 24] <= mw0_q[ 31: 24];
      if (en0_q & rw0_q & wm0_q[ 4]) ram[ma0_q][ 39: 32] <= mw0_q[ 39: 32];
      if (en0_q & rw0_q & wm0_q[ 5]) ram[ma0_q][ 47: 40] <= mw0_q[ 47: 40];
      if (en0_q & rw0_q & wm0_q[ 6]) ram[ma0_q][ 55: 48] <= mw0_q[ 55: 48];
      if (en0_q & rw0_q & wm0_q[ 7]) ram[ma0_q][ 63: 56] <= mw0_q[ 63: 56];

      if (en0_q & rw0_q & wm0_q[ 8]) ram[ma0_q][ 71: 64] <= mw0_q[ 71: 64];
      if (en0_q & rw0_q & wm0_q[ 9]) ram[ma0_q][ 79: 72] <= mw0_q[ 79: 72];
      if (en0_q & rw0_q & wm0_q[10]) ram[ma0_q][ 87: 80] <= mw0_q[ 87: 80];
      if (en0_q & rw0_q & wm0_q[11]) ram[ma0_q][ 95: 88] <= mw0_q[ 95: 88];
      if (en0_q & rw0_q & wm0_q[12]) ram[ma0_q][103: 96] <= mw0_q[103: 96];
      if (en0_q & rw0_q & wm0_q[13]) ram[ma0_q][111:104] <= mw0_q[111:104];
      if (en0_q & rw0_q & wm0_q[14]) ram[ma0_q][119:112] <= mw0_q[119:112];
      if (en0_q & rw0_q & wm0_q[15]) ram[ma0_q][127:120] <= mw0_q[127:120];

      if (en0_q & rw0_q & wm0_q[16]) ram[ma0_q][135:128] <= mw0_q[135:128];
      if (en0_q & rw0_q & wm0_q[17]) ram[ma0_q][143:136] <= mw0_q[143:136];
      if (en0_q & rw0_q & wm0_q[18]) ram[ma0_q][151:144] <= mw0_q[151:144];
      if (en0_q & rw0_q & wm0_q[19]) ram[ma0_q][159:152] <= mw0_q[159:152];
      if (en0_q & rw0_q & wm0_q[20]) ram[ma0_q][167:160] <= mw0_q[167:160];
      if (en0_q & rw0_q & wm0_q[21]) ram[ma0_q][175:168] <= mw0_q[175:168];
      if (en0_q & rw0_q & wm0_q[22]) ram[ma0_q][183:176] <= mw0_q[183:176];
      if (en0_q & rw0_q & wm0_q[23]) ram[ma0_q][191:184] <= mw0_q[191:184];

      if (en0_q & rw0_q & wm0_q[24]) ram[ma0_q][199:192] <= mw0_q[199:192];
      if (en0_q & rw0_q & wm0_q[25]) ram[ma0_q][207:200] <= mw0_q[207:200];
      if (en0_q & rw0_q & wm0_q[26]) ram[ma0_q][215:208] <= mw0_q[215:208];
      if (en0_q & rw0_q & wm0_q[27]) ram[ma0_q][223:216] <= mw0_q[223:216];
      if (en0_q & rw0_q & wm0_q[28]) ram[ma0_q][231:224] <= mw0_q[231:224];
      if (en0_q & rw0_q & wm0_q[29]) ram[ma0_q][239:232] <= mw0_q[239:232];
      if (en0_q & rw0_q & wm0_q[30]) ram[ma0_q][247:240] <= mw0_q[247:240];
      if (en0_q & rw0_q & wm0_q[31]) ram[ma0_q][255:248] <= mw0_q[255:248];
    end
  end
endmodule
`endif

`ifdef BBOX_BRAM
module bbox_bram
(
  input  wire                          ACLK, // general clock (fpga:83MHz asic:240MHz)
  input  wire                          RST, // general reset
  input  wire                          en0, // 1:mem-enable
  input  wire                          en1, // 1:mem-enable
  input  wire                          rw0, // 1:write-en
  input  wire [`EXRING_ADDR_BITS-1:0]  ma0,
  input  wire [`EXRING_ADDR_BITS-1:0]  ma1,
  input  wire [`AXI_S_DATA_BYTES-1:0]  wm0, // 1:write-byte-mask
  input  wire [`AXI_S_DATA_BITS-1:0]   mw0,
  output wire [`AXI_S_DATA_BITS-1:0]   mr0,
  output wire [`AXI_S_DATA_BITS-1:0]   mr1
);
endmodule
`endif

module lmm
(
  input  wire                             ACLK, // general clock (fpga:83MHz asic:240MHz)
  input  wire                             RST, // general reset
  input  wire                             en0, // 1:mem-enable
  input  wire                             en1, // 1:mem-enable
  input  wire                             rw0, // 1:write-en
  input  wire [`EXRING_ADDR_BITS-1:0]     ma0,
  input  wire [`EXRING_ADDR_BITS-1:0]     ma1,
  input  wire [`AXI_S_DATA_BYTES-1:0]     wm0, // 1:write-byte-mask
  input  wire [`AXI_S_DATA_BITS-1:0]      mw0,
  output wire [`AXI_S_DATA_BITS-1:0]      mr0,
  output wire [`AXI_S_DATA_BITS-1:0]      mr1
);

`ifdef ASIC_BRAM
  asic_ram asic_ram
  (
    .CLKA   (ACLK                                                      ),
    .CLKB   (ACLK                                                      ),
    .MEA    (en0                                                      ), // enable-A
    .MEB    (en1                                                      ), // enable-B
    .WEA    (rw0                                                      ), // write-enable
    .ADA    (ma0[`EXRING_ADDR_BITS-1:`EXRING_ADDR_BITS-`LMM_LENG_BITS]), // address A
    .ADB    (ma1[`EXRING_ADDR_BITS-1:`EXRING_ADDR_BITS-`LMM_LENG_BITS]), // address B
    .WEM    (wm0                                                      ), // write-mask
    .IA     (mw0                                                      ), // input  A
    .A      (mr0                                                      ), // output A
    .B      (mr1                                                      )  // output B
  );
`endif
`ifdef ZYNQ_BRAM
`ifdef  LMM_SIZE_IS_128K
  fpga_bram128 fpga_bram128
`endif
`ifdef  LMM_SIZE_IS_64K
  fpga_bram64 fpga_bram64
`endif
`ifdef  LMM_SIZE_IS_32K
  fpga_bram fpga_bram
`endif
  (
    .clka   (ACLK                                                     ),
    .clkb   (ACLK                                                     ),
    .ena    (en0                                                      ),
    .enb    (en1                                                      ),
    .addra  (ma0[`EXRING_ADDR_BITS-1:`EXRING_ADDR_BITS-`LMM_LENG_BITS]),
    .addrb  (ma1[`EXRING_ADDR_BITS-1:`EXRING_ADDR_BITS-`LMM_LENG_BITS]),
    .wea    (wm0                                                      ), // write-enable A
    .web    (1'b0                                                     ), // write-enable B
    .dina   (mw0                                                      ), // input  A
    .dinb   ({`AXI_S_DATA_BITS{1'b0}}                                 ), // input  B
    .douta  (mr0                                                      ), // output A
    .doutb  (mr1                                                      )  // output B
  );
`endif
`ifdef REG_BRAM
  reg_bram reg_bram
  (
    .CLK    (ACLK                                                     ),
    .RST    (RST                                                      ),
    .en0    (en0                                                      ),
    .en1    (en1                                                      ),
    .rw0    (rw0                                                      ),
    .ma0    (ma0[`EXRING_ADDR_BITS-1:`EXRING_ADDR_BITS-`LMM_LENG_BITS]),
    .ma1    (ma1[`EXRING_ADDR_BITS-1:`EXRING_ADDR_BITS-`LMM_LENG_BITS]),
    .wm0    (wm0                                                      ), // write-enable
    .mw0    (mw0                                                      ),
    .mr0    (mr0                                                      ),
    .mr1    (mr1                                                      )
  );
`endif
`ifdef BBOX_BRAM
  bbox_bram bbox_bram
  (
    .CLK    (ACLK                                                     ),
    .RST    (RST                                                      ),
    .en0    (en0                                                      ),
    .en1    (en1                                                      ),
    .rw0    (rw0                                                      ),
    .ma0    (ma0[`EXRING_ADDR_BITS-1:`EXRING_ADDR_BITS-`LMM_LENG_BITS]),
    .ma1    (ma1[`EXRING_ADDR_BITS-1:`EXRING_ADDR_BITS-`LMM_LENG_BITS]),
    .wm0    (wm0                                                      ), // write-enable
    .mw0    (mw0                                                      ),
    .mr0    (mr0                                                      ),
    .mr1    (mr1                                                      )
  );
`endif
endmodule
