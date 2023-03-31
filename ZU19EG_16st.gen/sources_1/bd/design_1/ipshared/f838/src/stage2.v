/*
 *-----------------------------------------------------------------------------
 * Title         : stage2
 * Project       : EMAX6
 *-----------------------------------------------------------------------------
 * File          : stage2.v
 * Author        : Nakashima
 *                <nakashim@is.naist.jp>
 *                 Yamano
 *                <yamano.ryusuke.yo7@is.naist.jp>
 *                 Kikutani
 *                <kikutani.yuma.kw3@is.naist.jp>
 * Created       : 10.20.2017
 * Last modified : 10.20.2017
 *-----------------------------------------------------------------------------
 * Description : exe及梢遙質咥午fpu及booth encoder & wallace tree
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
/* stage2 */
module stage2
(
  input  wire                                 ACLK,
  input  wire                                 RSTN,
  input  wire                                 UNIRSTN,
  input  wire [`CONF_BITS-1:0]                conf0,
  input  wire [`CONF_BITS-1:0]                conf1,
  input  wire [`CONF_BITS-1:0]                conf2,
  input  wire [`CONF_BITS-1:0]                conf3,
  input  wire                                 lmea0sfma,
  input  wire                                 lmea0strq,
  input  wire [1:0]                           lmea0strqcol,       /* ea0.strq_col�砦�  4扔奶弁伙卞坌仃化撢墊 */
  input  wire                                 exec,
  input  wire                                 fold,
  input  wire                                 one_shot2,
  input  wire [1:0]                           forstat2,
  input  wire [`CEX_DATA_BITS-1:0]            cx0,
  input  wire [`CEX_DATA_BITS-1:0]            cx1,
  input  wire [`CEX_DATA_BITS-1:0]            cx2,
  input  wire [`CEX_DATA_BITS-1:0]            cx3,
  input  wire [`REG_DATA_BITS-1:0]            tx0i,
  input  wire [`REG_DATA_BITS-1:0]            tx1i,
  input  wire [`REG_DATA_BITS-1:0]            tx2i,
  input  wire [`REG_DATA_BITS-1:0]            tx3i,
  input  wire [`REG_DATA_BITS-1:0]            ex1,
  input  wire [`REG_DATA_BITS-1:0]            ex2t,
  input  wire [`REG_DATA_BITS-1:0]            ex3,
  input  wire [`EXE_WORD_BITS-1:0]            mexmr0d,//↙MEX
  input  wire [`EXE_WORD_BITS-1:0]            mexmr1d,//↙MEX
  output reg                                  stage3_exec,
  output reg                                  stage3_fold,
  output reg  [1:0]                           stage_forstat,
  output reg  [1:0]                           cxd,
  output reg  [`REG_DATA_BITS-1:0]            tx0,
  output reg  [`REG_DATA_BITS-1:0]            tx1,
  output reg  [`REG_DATA_BITS-1:0]            tx2,
  output reg  [`REG_DATA_BITS-1:0]            tx3,
  output reg  [5:0]                           opo,
  output wire [`REG_DATA_BITS-1:0]            ex2d,
  output reg  [`REG_DATA_BITS-1:0]            ex4o,
  output reg  [5:0]                           ex5o,
  output reg                                  unit1_arbrk,
`ifdef ENABLE_FPU
  output wire                                 h_ex1_d_s,
  output wire [8:0]                           h_ex1_d_exp,
  output wire [24+`PEXT:0]                    h_ex1_d_csa_s, //╯╯╯
  output wire [24+`PEXT:0]                    h_ex1_d_csa_c, //╯╯╯
  output wire                                 h_ex1_d_zero,
  output wire                                 h_ex1_d_inf,
  output wire                                 h_ex1_d_nan,
  output wire                                 h_fadd_s1_s,
  output wire [8:0]                           h_fadd_s1_exp,
  output wire [24+`PEXT:0]                    h_fadd_s1_frac, //╯╯╯
  output wire                                 h_fadd_s1_zero,
  output wire                                 h_fadd_s1_inf,
  output wire                                 h_fadd_s1_nan,
  output wire                                 l_ex1_d_s,
  output wire [8:0]                           l_ex1_d_exp,
  output wire [24+`PEXT:0]                    l_ex1_d_csa_s, //╯╯╯
  output wire [24+`PEXT:0]                    l_ex1_d_csa_c, //╯╯╯
  output wire                                 l_ex1_d_zero,
  output wire                                 l_ex1_d_inf,
  output wire                                 l_ex1_d_nan,
  output wire                                 l_fadd_s1_s,
  output wire [8:0]                           l_fadd_s1_exp,
  output wire [24+`PEXT:0]                    l_fadd_s1_frac, //╯╯╯
  output wire                                 l_fadd_s1_zero,
  output wire                                 l_fadd_s1_inf,
  output wire                                 l_fadd_s1_nan,
`endif
`ifdef ENABLE_SPU
  output reg  [7:0]                           ex2passr1,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmapc0,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmanc0,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmapc1,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmanc1,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmapc2,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmanc2,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmapc3,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmanc3,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmapc4,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmanc4,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmapc5,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmanc5,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmapc6,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmanc6,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmapc7,
  output wire [`SPU_DATA_LOG2-1:0]            ex2d_sfmanc7,
`endif
  input  wire [`EXRING_ADDR_BITS-1:0]         ea0b,
  input  wire [`REG_DATA_BITS-1:0]            ea0o,
  input  wire [`EXRING_ADDR_BITS-1:0]         ea1b,
  input  wire [`REG_DATA_BITS-1:0]            ea1o,
  output reg  [`EXRING_ADDR_BITS-1:0]         ea0d,
  output reg  [`EXRING_ADDR_BITS-1:0]         ea0dofs,//↙MEX
  output reg  [`EXRING_ADDR_BITS-1:0]         ea1d,
  output reg  [`EXRING_ADDR_BITS-1:0]         ea1dofs //↙MEX
);
// synopsys template

  reg  [1:0]                        cycle;
  wire [1:0]                        cyclep3;
  assign cyclep3 = cycle + 2'h3;

  always @(posedge ACLK or negedge RSTN) begin
    if (~RSTN) begin
      cycle <= 2'h0;
    end
    else begin
      cycle <= cycle + 2'h1;
    end
  end

  wire [`CONF_BITS-1:0]     conf   = (cycle==2'h0)?conf3:(cycle==2'h1)?conf0:(cycle==2'h2)?conf1:conf2;
  wire [1:0]                k      = (lmea0sfma|lmea0strq) ? lmea0strqcol : cyclep3;
  wire [`CONF_BITS-1:0]     confk  = (k==2'd0)?conf0:(k==2'd1)?conf1:(k==2'd2)?conf2:conf3;
  wire [1:0]                j      = cyclep3;
  wire                      op_nf1 = (`conf1_op1 != `OP_FOR);
  wire [`CEX_DATA_BITS-1:0] cexs;
  wire [`REG_DATA_BITS-1:0] ex2 = ((`conf_op1 == `OP_FOR && (j == 2'd1) && !stage_forstat[0])||((`conf_init & 2'd2) && one_shot2 && !(forstat2 & 2'd1))) ? {(`REG_DATA_BITS){1'b0}} : ex2t;
  wire [`REG_DATA_BITS-1:0] ex4 = (`conf_e2is==0) ? `conf_e2imm :
                                  (`conf_e2is==1) ? ex2t :  ex3;
  wire [5:0] ex5                = (`conf_e3is==0) ? `conf_e3imm : ex3[5:0];
  wire [1:0]                brk;
  wire [`EXRING_ADDR_BITS-1:0] ea0mexd;//↙MEX
  wire [`EXRING_ADDR_BITS-1:0] ea0md;  //↙MEX
  wire [`EXRING_ADDR_BITS-1:0] ea1mexd;//↙MEX
  wire [`EXRING_ADDR_BITS-1:0] ea1md;  //↙MEX

  always @(posedge ACLK or negedge RSTN) begin
    if (~RSTN|~UNIRSTN) begin
      cxd           <= {(2){1'b0}};
      tx0           <= {(`REG_DATA_BITS){1'b0}};
      tx1           <= {(`REG_DATA_BITS){1'b0}};
      tx2           <= {(`REG_DATA_BITS){1'b0}};
      tx3           <= {(`REG_DATA_BITS){1'b0}};
      opo           <= 6'd0;
`ifdef ENABLE_SPU
      ex2passr1     <= 8'd0;
`endif
      ex4o          <= {(`REG_DATA_BITS){1'b0}};
      ex5o          <= 6'd0;
      unit1_arbrk   <= 1'b0;
      stage_forstat <= {(2){1'b0}};
      ea0d          <= {(`EXRING_ADDR_BITS){1'b0}};
      ea0dofs       <= {(`EXRING_ADDR_BITS){1'b0}};//↙MEX
      ea1d          <= {(`EXRING_ADDR_BITS){1'b0}};
      ea1dofs       <= {(`EXRING_ADDR_BITS){1'b0}};//↙MEX
      stage3_exec   <= 1'b0;
      stage3_fold   <= 1'b0;
    end
    else begin
      opo           <= conf[12:7];
`ifdef ENABLE_SPU
      ex2passr1     <= ex1[7:0];
`endif
      ex4o          <= ex4;
      ex5o          <= ex5;
      if (exec || fold) begin
	cxd         <= cexs;
	tx0         <= tx0i;
	tx1         <= tx1i;
	tx2         <= tx2i;
	tx3         <= tx3i;
	ea0d        <= ea0mexd;//↙MEX
	ea0dofs     <= ea0md;  //↙MEX
	ea1d        <= ea1mexd;//↙MEX
	ea1dofs     <= ea1md;  //↙MEX
	if ((cycle&2'd3) == 2'd0) begin 
	  unit1_arbrk <= 1'b0;
	end
	else if (`conf_op1 == `OP_WHILE) begin
	  unit1_arbrk <= brk[0];
	end
	else if (`conf_op1 == `OP_FOR) begin
	  if (j == 2'd0) begin
	    unit1_arbrk   <=  {op_nf1,brk[0]} == 2'd3;
	    stage_forstat <=  {op_nf1,brk[0]};
	  end
	  else if (j == 2'd1) begin
	    unit1_arbrk   <= {brk[0],stage_forstat[0]} == 2'd3;
	    stage_forstat <= {brk[0],stage_forstat[0]};
	  end
	end
      end
      if (exec)
	stage3_exec <= 1'b1;
      else
	stage3_exec <= 1'b0;
      if (fold)
	stage3_fold <= 1'b1;
      else
	stage3_fold <= 1'b0;
    end
  end

  cex cex
  (
    .c0         (cx0            ),
    .c1         (cx1            ),
    .c2         (cx2            ),
    .c3         (cx3            ),
    .patt       (`conf_cex_tab  ),
    .cexd       (cexs           )
  );

  wire mex0_enable = (!one_shot2 || (`conf_mex0init && (forstat2 & 2'd1))) ? 1'b0 : 1'b1; //↙MEX
  wire mex1_enable = (!one_shot2 || (`conf_mex1init && (forstat2 & 2'd1))) ? 1'b0 : 1'b1; //↙MEX
       
  mex mex //↙MEX
  (
    .mex1op     (`conf_mex1op   ),
    .mex1en     (mex1_enable    ),
    .ea1b       (ea1b           ),
    .mex1dist   (`conf_mex1dist ),
    .mex0op     (`conf_mex0op   ),
    .mex0en     (mex0_enable    ),
    .ea0b       (ea0b           ),
    .mex0dist   (`conf_mex0dist ),
    .mexlimit   (`conf_mexlimit ),
    .mexmr1     (mexmr1d        ),
    .mexmr0     (mexmr0d        ),
    .mex1d      (ea1mexd        ),
    .mex0d      (ea0mexd        )
  );

  eam eam0 //↙MEX
  (
    .eao        (ea0o           ),
    .eamsk      (`confk_ea0msk  ),
    .eamd       (ea0md          )
  );

  eam eam1 //↙MEX
  (
    .eao        (ea1o           ),
    .eamsk      (`conf_ea1msk   ),
    .eamd       (ea1md          )
  );

  function [`REG_DATA_BITS-1:0] ex_exp;
    input [`REG_DATA_BITS-1:0] ex;
    input [2:0] exp;
    begin
    case (exp)
        //`EXP_H3210: begin
        default: begin
            ex_exp = ex;
        end
        `EXP_H1010: begin
            ex_exp = {ex[31:0], ex[31:0]};
        end
        `EXP_H3232: begin
            ex_exp = {ex[63:32], ex[63:32]};
        end
        `EXP_B7632: begin
            // s1 = (s1t>>8&64'h00FF0000_00FF0000) | (s1t>>16&64'h000000FF_000000FF);
            ex_exp = {8'h00, ex[63:56], 8'h00, ex[55:48], 8'h00, ex[31:24], 8'h00, ex[23:16]};
        end
        `EXP_B5410: begin
            // s1 = (s1t<<8&64'h00FF0000_00FF0000) | (s1t    &64'h000000FF_000000FF); 
            ex_exp = {8'h00, ex[47:40], 8'h00, ex[39:32], 8'h00, ex[15:8], 8'h00, ex[7:0]};
        end
    endcase
    end
  endfunction

  wire [5:0]                iop  = `conf_op1;

  wire [`REG_DATA_BITS-1:0] iex1 = ex_exp(ex1, `conf_ex1exp);

  wire [`REG_DATA_BITS-1:0] iex2 = ex_exp(ex2, `conf_ex2exp);

  wire [`REG_DATA_BITS-1:0] iex3 = ex_exp(ex3, `conf_ex3exp);
			    
  // pipelined exe
  exe1 exe1h
  (
    .ACLK       (ACLK           ),
    .RSTN       (RSTN&UNIRSTN   ),
    .hi_lo      (1'b1           ),
    .op         (iop            ),
    .ex1        (iex1[63:32]    ),
    .ex2        (iex2[63:32]    ),
    .ex3        (iex3[63:32]    ),
    .ex2d       (ex2d[63:32]    ),
    .brk        (brk[1]         )
  );

  exe1 exe1l
  (
    .ACLK       (ACLK           ),
    .RSTN       (RSTN&UNIRSTN   ),
    .hi_lo      (1'b0           ),
    .op         (iop            ),
    .ex1        (iex1[31: 0]    ),
    .ex2        (iex2[31: 0]    ),
    .ex3        (iex3[31: 0]    ),
    .ex2d       (ex2d[31: 0]    ),
    .brk        (brk[0]         )
  );

`ifdef ENABLE_FPU
  /*-------------- 32bit floating point operator ----------------------------------*/
  /* op=3->0:fma3 (ex1 + ex2 *  ex3)  */
  /* op=3->1:fms3 (ex1 - ex2 *  ex3)  */
  /* op=2->2:fadd (ex1 + ex2 *  1.0)  */
  /* op=1->3:fmul (0.0 + ex2 *  ex3)  */
  wire [1:0]                fop  = (`conf_op1==`OP_FMA || `conf_op1==`OP_CFMA)  ? 2'h0: //↙MEX
				   (`conf_op1==`OP_FMS)  ? 2'h1:
                                   (`conf_op1==`OP_FAD)  ? 2'h2:
                                            /* `OP_FML */  2'h3;

  wire [`REG_DATA_BITS-1:0] fex1 = (`conf_op1==`OP_FML)  ? 0:iex1;

  wire [`REG_DATA_BITS-1:0] fex2 = (`conf_op1==`OP_FML)  ? iex1:iex2;

  wire [`REG_DATA_BITS-1:0] fex3 = (`conf_op1==`OP_FMA || `conf_op1==`OP_CFMA)  ? iex3: //↙MEX
			           (`conf_op1==`OP_FMS)  ? iex3:
                                   (`conf_op1==`OP_FML)  ? iex2:
                                            /* `OP_FAD */  64'h3F8000003F800000;

  wire 	                    cfma_force0 = `conf_op1==`OP_CFMA &&                                                             //↙MEX
                                         ((fex2[`REG_DATA_BITS-1:`EXE_WORD_BITS] == {(`EXE_WORD_BITS){1'b1}})                //↙MEX
			                ||(fex2[`REG_DATA_BITS-1:`EXE_WORD_BITS] != fex3[`REG_DATA_BITS-1:`EXE_WORD_BITS])); //↙MEX

  fpu1 fpu1h
  (
    .ACLK               (ACLK                   ),
    .RSTN               (RSTN&UNIRSTN           ),
    .op                 (fop                    ),
    .ex1                (fex1[63:32]            ),
    .ex2                (fex2[63:32]            ),
    .ex3                (fex3[63:32]            ),
    .force0             (1'b0                   ),
    .ex1_d_s            (h_ex1_d_s              ),
    .ex1_d_exp          (h_ex1_d_exp            ),
    .ex1_d_csa_s        (h_ex1_d_csa_s          ),
    .ex1_d_csa_c        (h_ex1_d_csa_c          ),
    .ex1_d_zero         (h_ex1_d_zero           ),
    .ex1_d_inf          (h_ex1_d_inf            ),
    .ex1_d_nan          (h_ex1_d_nan            ),
    .fadd_s1_s          (h_fadd_s1_s            ),
    .fadd_s1_exp        (h_fadd_s1_exp          ),
    .fadd_s1_frac       (h_fadd_s1_frac         ),
    .fadd_s1_zero       (h_fadd_s1_zero         ),
    .fadd_s1_inf        (h_fadd_s1_inf          ),
    .fadd_s1_nan        (h_fadd_s1_nan          )
  );

  fpu1 fpu1l
  (
    .ACLK               (ACLK                   ),
    .RSTN               (RSTN&UNIRSTN           ),
    .op                 (fop                    ),
    .ex1                (fex1[31: 0]            ),
    .ex2                (fex2[31: 0]            ),
    .ex3                (fex3[31: 0]            ),
    .force0             (cfma_force0            ),
    .ex1_d_s            (l_ex1_d_s              ),
    .ex1_d_exp          (l_ex1_d_exp            ),
    .ex1_d_csa_s        (l_ex1_d_csa_s          ),
    .ex1_d_csa_c        (l_ex1_d_csa_c          ),
    .ex1_d_zero         (l_ex1_d_zero           ),
    .ex1_d_inf          (l_ex1_d_inf            ),
    .ex1_d_nan          (l_ex1_d_nan            ),
    .fadd_s1_s          (l_fadd_s1_s            ),
    .fadd_s1_exp        (l_fadd_s1_exp          ),
    .fadd_s1_frac       (l_fadd_s1_frac         ),
    .fadd_s1_zero       (l_fadd_s1_zero         ),
    .fadd_s1_inf        (l_fadd_s1_inf          ),
    .fadd_s1_nan        (l_fadd_s1_nan          )
  );
`endif

`ifdef ENABLE_SPU
  /*-------------- Spiking operator ex1 <- ex1 + ex2 * ex3 */
  spu1 spu1
  (
    .ACLK               (ACLK                         ),
    .RSTN               (RSTN&UNIRSTN                 ),
    .exec               (exec                         ),
    .fold               (fold                         ),
    .ex2                (ex2[`REG_DATA_BITS-1:0]      ),
    .ex3                (ex3[`REG_DATA_BITS-1:0]      ),
    .sfmapc0            (ex2d_sfmapc0[`SPU_DATA_LOG2-1:0]),
    .sfmanc0            (ex2d_sfmanc0[`SPU_DATA_LOG2-1:0]),
    .sfmapc1            (ex2d_sfmapc1[`SPU_DATA_LOG2-1:0]),
    .sfmanc1            (ex2d_sfmanc1[`SPU_DATA_LOG2-1:0]),
    .sfmapc2            (ex2d_sfmapc2[`SPU_DATA_LOG2-1:0]),
    .sfmanc2            (ex2d_sfmanc2[`SPU_DATA_LOG2-1:0]),
    .sfmapc3            (ex2d_sfmapc3[`SPU_DATA_LOG2-1:0]),
    .sfmanc3            (ex2d_sfmanc3[`SPU_DATA_LOG2-1:0]),
    .sfmapc4            (ex2d_sfmapc4[`SPU_DATA_LOG2-1:0]),
    .sfmanc4            (ex2d_sfmanc4[`SPU_DATA_LOG2-1:0]),
    .sfmapc5            (ex2d_sfmapc5[`SPU_DATA_LOG2-1:0]),
    .sfmanc5            (ex2d_sfmanc5[`SPU_DATA_LOG2-1:0]),
    .sfmapc6            (ex2d_sfmapc6[`SPU_DATA_LOG2-1:0]),
    .sfmanc6            (ex2d_sfmanc6[`SPU_DATA_LOG2-1:0]),
    .sfmapc7            (ex2d_sfmapc7[`SPU_DATA_LOG2-1:0]),
    .sfmanc7            (ex2d_sfmanc7[`SPU_DATA_LOG2-1:0])
  );
`endif
endmodule

module exe1
(
  input  wire                         ACLK,
  input  wire                         RSTN,
  input  wire                         hi_lo,
  input  wire [5:0]                   op,
  input  wire [`EXE_WORD_BITS-1:0]    ex1,
  input  wire [`EXE_WORD_BITS-1:0]    ex2,
  input  wire [`EXE_WORD_BITS-1:0]    ex3,
  output wire [`EXE_WORD_BITS-1:0]    ex2d,
  output wire                         brk
);

  function [7:0] func_ad;
    input [7:0] a;
    input [7:0] b;
    begin
      if (a>b) begin
        func_ad = a-b;
      end
      else begin
        func_ad = b-a;
      end
    end
  endfunction

  function [`EXE_WORD_BITS-1:0] addsub3;
    input                      op;
    input [`EXE_WORD_BITS-1:0] s1;
    input [`EXE_WORD_BITS-1:0] s2;
    input [`EXE_WORD_BITS-1:0] s3;
    reg   [`EXE_WORD_BITS-1:0] m0;
    reg   [`EXE_WORD_BITS-1:0] d0;
    begin
      m0 = s2 + s3;
      case (op)
	0: begin
          d0   = s1 + m0;
	end
	default:begin
          d0   = s1 - m0;
	end
      endcase
      addsub3 = {d0};
    end
  endfunction

  function [15:0] saturate00;
    input [19:0] s;
    begin
      saturate00 = (s>20'h0FFFF)?16'h0000:s[15:0];
    end
  endfunction

  function [15:0] saturateff;
    input [19:0] s;
    begin
      saturateff = (s>20'h0FFFF)?16'hFFFF:s[15:0];
    end
  endfunction

  function [`EXE_WORD_BITS-1:0] func_mmin2;
    input [`EXE_WORD_BITS-1:0] s1;
    input [`EXE_WORD_BITS-1:0] s2;
    reg [7:0] mmin2_drv_byte3, mmin2_drv_byte2, mmin2_drv_byte1, mmin2_drv_byte0;
    begin
      mmin2_drv_byte3 = (s1[31:24]<s2[31:24]) ? s1[31:24] : s2[31:24];
      mmin2_drv_byte2 = (s1[23:16]<s2[23:16]) ? s1[23:16] : s2[23:16];
      mmin2_drv_byte1 = (s1[15: 8]<s2[15: 8]) ? s1[15: 8] : s2[15: 8];
      mmin2_drv_byte0 = (s1[ 7: 0]<s2[ 7: 0]) ? s1[ 7: 0] : s2[ 7: 0];
      func_mmin2 = {mmin2_drv_byte3, mmin2_drv_byte2, mmin2_drv_byte1, mmin2_drv_byte0};
    end
  endfunction

  function [`EXE_WORD_BITS-1:0] func_mmax2;
    input [`EXE_WORD_BITS-1:0] s1;
    input [`EXE_WORD_BITS-1:0] s2;
    reg [7:0] mmax2_drv_byte3, mmax2_drv_byte2, mmax2_drv_byte1, mmax2_drv_byte0;
    begin
      mmax2_drv_byte3 = (s1[31:24]>s2[31:24]) ? s1[31:24] : s2[31:24];
      mmax2_drv_byte2 = (s1[23:16]>s2[23:16]) ? s1[23:16] : s2[23:16];
      mmax2_drv_byte1 = (s1[15: 8]>s2[15: 8]) ? s1[15: 8] : s2[15: 8];
      mmax2_drv_byte0 = (s1[ 7: 0]>s2[ 7: 0]) ? s1[ 7: 0] : s2[ 7: 0];
      func_mmax2 = {mmax2_drv_byte3, mmax2_drv_byte2, mmax2_drv_byte1, mmax2_drv_byte0};
    end
  endfunction

  function [`EXE_WORD_BITS-1:0] func_mmid3;
    input [`EXE_WORD_BITS-1:0] s1; // s1 < s2
    input [`EXE_WORD_BITS-1:0] s2; // s1 < s2
    input [`EXE_WORD_BITS-1:0] s3; // unknown
    reg [7:0] mmid3_drv_byte3, mmid3_drv_byte2, mmid3_drv_byte1, mmid3_drv_byte0;
    begin
      mmid3_drv_byte3 = (s3[31:24]<s1[31:24]) ? s1[31:24] : (s3[31:24]<s2[31:24]) ? s3[31:24] : s2[31:24];
      mmid3_drv_byte2 = (s3[23:16]<s1[23:16]) ? s1[23:16] : (s3[23:16]<s2[23:16]) ? s3[23:16] : s2[23:16];
      mmid3_drv_byte1 = (s3[15: 8]<s1[15: 8]) ? s1[15: 8] : (s3[15: 8]<s2[15: 8]) ? s3[15: 8] : s2[15: 8];
      mmid3_drv_byte0 = (s3[ 7: 0]<s1[ 7: 0]) ? s1[ 7: 0] : (s3[ 7: 0]<s2[ 7: 0]) ? s3[ 7: 0] : s2[ 7: 0];
      func_mmid3 = {mmid3_drv_byte3, mmid3_drv_byte2, mmid3_drv_byte1, mmid3_drv_byte0};
    end
  endfunction

  function [`EXE_WORD_BITS-1+1:0] ex1_internal;
    input                       hi_lo;
    input [5:0]                 op;
    input [`EXE_WORD_BITS-1:0]  s1;
    input [`EXE_WORD_BITS-1:0]  s2;
    input [`EXE_WORD_BITS-1:0]  s3;
    reg   [`EXE_WORD_BITS-1:0]  t1;
    reg   [`EXE_WORD_BITS-1:0]  t2;
    reg   [`EXE_WORD_BITS-1:0]  d;
    reg                         brk;
    begin
      case (op)
        //`OP_NOP1: begin
        default: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = s1;
          brk = 1'b0;
        end
        `OP_WHILE, `OP_FOR: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = s1 + s2; //addsub3(0, s1, s2, {(`EXE_WORD_BITS){1'b0}});
          brk = (d=={(`EXE_WORD_BITS){1'b0}}) ? 1'b1 : 1'b0;
        end
        `OP_ADD3: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = s1 + s2 + s3; //addsub3(0, s1, s2, s3);
          brk = 1'b0;
        end
        `OP_SUB3: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = s1 - (s2 + s3); //addsub3(1, s1, s2, s3);
          brk = 1'b0;
        end
        `OP_ADD: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = s1 + s2; //addsub3(0, s1, s2, {(`EXE_WORD_BITS){1'b0}});
          brk = 1'b0;
        end
        `OP_SUB: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = s1 - s2; //addsub3(1, s1, s2, {(`EXE_WORD_BITS){1'b0}});
          brk = 1'b0;
        end
        `OP_CMP_EQ: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = {{(`EXE_WORD_BITS-1){1'b0}},(s1 == s2)};
          brk = 1'b0;
        end
        `OP_CMP_NE: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = {{(`EXE_WORD_BITS-1){1'b0}},(s1 != s2)};
          brk = 1'b0;
        end
        `OP_CMP_LT: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = {{(`EXE_WORD_BITS-1){1'b0}},(s1 <  s2)};
          brk = 1'b0;
        end
        `OP_CMP_LE: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = {{(`EXE_WORD_BITS-1){1'b0}},(s1 <= s2)};
          brk = 1'b0;
        end
        `OP_CMP_GT: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = {{(`EXE_WORD_BITS-1){1'b0}},(s1 >  s2)};
          brk = 1'b0;
        end
        `OP_CMP_GE: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = {{(`EXE_WORD_BITS-1){1'b0}},(s1 >= s2)};
          brk = 1'b0;
        end
        `OP_CMOV: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = (s1[0]) ? s2 : s3;
          brk = 1'b0;
        end
//      `OP_CCAT: begin
//        t1  = 32'd0;
//        t2  = 32'd0;
//        d   = s2;
//        brk = 1'b0;
//      end
`ifdef ENABLE_MEDIA
        `OP_MAUH3: begin
          t1[31:18] = 14'd0;
          t2[31:18] = 14'd0;
          t1[17: 0] = {2'b00,s1[31:16]}+{2'b00,s2[31:16]}+{2'b00,s3[31:16]};
          t2[17: 0] = {2'b00,s1[15: 0]}+{2'b00,s2[15: 0]}+{2'b00,s3[15: 0]};
          d   = {saturateff(t1[19:0]),saturateff(t2[19:0])};
          brk = 1'b0;
        end
        `OP_MAUH: begin
          t1[31:17] = 15'd0;
          t2[31:17] = 15'd0;
          t1[16: 0] = {1'b0,s1[31:16]}+{1'b0,s2[31:16]};
          t2[16: 0] = {1'b0,s1[15: 0]}+{1'b0,s2[15: 0]};
          d   = {saturateff(t1[19:0]),saturateff(t2[19:0])};
          brk = 1'b0;
        end
        `OP_MSUH3: begin
          t1[31:18] = 14'd0;
          t2[31:18] = 14'd0;
          t1[17: 0] = {2'b00,s1[31:16]}-({2'b00,s2[31:16]}+{2'b00,s3[31:16]});
          t2[17: 0] = {2'b00,s1[15: 0]}-({2'b00,s2[15: 0]}+{2'b00,s3[15: 0]});
          d   = {saturate00(t1[19:0]),saturate00(t2[19:0])};
          brk = 1'b0;
        end
        `OP_MSUH: begin
          t1[31:17] = 15'd0;
          t2[31:17] = 15'd0;
          t1[16: 0] = {1'b0,s1[31:16]}-{1'b0,s2[31:16]};
          t2[16: 0] = {1'b0,s1[15: 0]}-{1'b0,s2[15: 0]};
          d   = {saturate00(t1[19:0]),saturate00(t2[19:0])};
          brk = 1'b0;
        end
        `OP_MLUH: begin
          t1[31:20] = 12'd0;
          t2[31:20] = 12'd0;
          t1[19: 0] = s1[26:16]*s2[8:0];
          t2[19: 0] = s1[10: 0]*s2[8:0];
          d   = {saturateff(t1[19:0]),saturateff(t2[19:0])};
          brk = 1'b0;
        end
        `OP_MMRG: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = {s1[7:0],s2[7:0],s3[7:0],8'd0};
          brk = 1'b0;
        end
        `OP_MSSAD: begin
          t1[31:17] = 15'd0;
          t2[31:17] = 15'd0;
          t1[16: 0] = {1'b0,s1[31:16]}+({9'h000,func_ad(s2[31:24],s3[31:24])}+{9'h000,func_ad(s2[23:16],s3[23:16])});
          t2[16: 0] = {1'b0,s1[15: 0]}+({9'h000,func_ad(s2[15: 8],s3[15: 8])}+{9'h000,func_ad(s2[ 7: 0],s3[ 7: 0])});
          d   = {saturateff(t1[19:0]),saturateff(t2[19:0])};
          brk = 1'b0;
        end
        `OP_MSAD: begin
          t1[31:9] = 23'd0;
          t2[31:9] = 23'd0;
          t1[8:0] = {1'b0,func_ad(s1[31:24],s2[31:24])}+{1'b0,func_ad(s1[23:16],s2[23:16])};
          t2[8:0] = {1'b0,func_ad(s1[15: 8],s2[15: 8])}+{1'b0,func_ad(s1[ 7: 0],s2[ 7: 0])};
          d   = {t1[15:0],t2[15:0]};
          brk = 1'b0;
        end
        `OP_MINL3: begin
          t1  = 32'd0;
          t2  = 32'd0;
          if (s3[31:16]<s3[15:0]) d = {s1[31:16],s3[31:16]};
          else                    d = {s2[31:16],s3[15: 0]};
          brk = 1'b0;
        end
        `OP_MINL: begin
          t1  = 32'd0;
          t2  = 32'd0;
          if (s1[15:0]<s2[15:0]) d = s1;
          else                   d = s2;
          brk = 1'b0;
        end
        `OP_MH2BW: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = {((s1[31:16]<16'h100)?s1[23:16]:8'hFF),((s1[15:0]<16'h100)?s1[7:0]:8'hFF),
                 ((s2[31:16]<16'h100)?s2[23:16]:8'hFF),((s2[15:0]<16'h100)?s2[7:0]:8'hFF)};
          brk = 1'b0;
        end
        `OP_MCAS: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = (s1[15:0]<s2[15:0])?32'd0:32'h000000ff;
          brk = 1'b0;
        end
        `OP_MMID3: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = func_mmid3(func_mmin2(s1,s2),func_mmax2(s1,s2),s3);
          brk = 1'b0;
        end
        `OP_MMAX3: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = func_mmax2(func_mmax2(s1,s2),s3);
          brk = 1'b0;
        end
        `OP_MMAX: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = func_mmax2(s1,s2);
          brk = 1'b0;
        end
        `OP_MMIN3: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = func_mmin2(func_mmin2(s1,s2),s3);
          brk = 1'b0;
        end
        `OP_MMIN: begin
          t1  = 32'd0;
          t2  = 32'd0;
          d   = func_mmin2(s1,s2);
          brk = 1'b0;
        end
`endif
`ifdef ENABLE_CRYPTO
        `OP_MAJ: begin /* (((x) & (y))^((x) & (z))^((y) & (z))) */
	               /* ex1_outd = (r1&0xffffffff00000000LL) | (((r1 & r2)^(r1 & r3)^(r2 & r3))&0xffffffffLL) */
          t1  = 32'd0;
          t2  = 32'd0;
          if (hi_lo) d   = s1;
          else       d   = (s1 & s2)^(s1 & s3)^(s2 & s3);
          brk = 1'b0;
        end
        `OP_CH: begin /* (((x) & (y))^(~(x) & (z))) */
	              /* ex1_outd = (r1&0xffffffff00000000LL) | (((r1 & r2)^(~r1 & r3))&0xffffffffLL) */
          t1  = 32'd0;
          t2  = 32'd0;
          if (hi_lo) d   = s1;
          else       d   = (s1 & s2)^(~s1 & s3);
          brk = 1'b0;
        end
`endif
      endcase
      ex1_internal = {d, brk};
    end
  endfunction

  wire [`EXE_WORD_BITS-1:0] ex2dt;

  assign {ex2dt, brk} = ex1_internal(hi_lo, op, ex1, ex2, ex3);

  wire [`EXE_WORD_BITS-1:0] r_ex2d = ex2dt;

  nbit_register #(`EXE_WORD_BITS) ex2d_r(.ACLK(ACLK), .RSTN(RSTN), .d(r_ex2d), .q(ex2d)); //slice 1
endmodule

`ifdef ENABLE_FPU
module fpu1
(
  input  wire                 ACLK,
  input  wire                 RSTN,
  input  wire [1:0]           op,
  input  wire [31:0]          ex1,
  input  wire [31:0]          ex2,
  input  wire [31:0]          ex3,
  input  wire                 force0,
  output wire                 ex1_d_s,
  output wire [8:0]           ex1_d_exp,
  output wire [24+`PEXT:0]    ex1_d_csa_s, //╯╯╯
  output wire [24+`PEXT:0]    ex1_d_csa_c, //╯╯╯
  output wire                 ex1_d_zero,
  output wire                 ex1_d_inf,
  output wire                 ex1_d_nan,
  output wire                 fadd_s1_s,
  output wire [8:0]           fadd_s1_exp,
  output wire [24+`PEXT:0]    fadd_s1_frac, //╯╯╯
  output wire                 fadd_s1_zero,
  output wire                 fadd_s1_inf,
  output wire                 fadd_s1_nan
);
  wire                const_one       = 1'b1;
  wire                s1_s            = (op==2'd3)? 1'b0:ex1[31];
  wire [7:0]          s1_exp          = (op==2'd3)? 8'd0:ex1[30:23];
  wire [23:0]         s1_frac         = (op==2'd3)? 24'd0:(~(|s1_exp))?{1'b0,ex1[22:0]}:{1'b1,ex1[22:0]};
  wire                s1_zero         = (op==2'd3)? 1'b1: (~(|s1_exp)) & (~(|ex1[22:0]));
  wire                s1_inf          = (op==2'd3)? 1'b0: (  &s1_exp ) & (~(|ex1[22:0]));
  wire                s1_nan          = (op==2'd3)? 1'b0: (  &s1_exp ) & (  |ex1[22:0] );
  wire 	      	      s2_s            = (op==2'd1)?~ex2[31]:ex2[31];
  wire [7:0]          s2_exp          = ex2[30:23];
  wire [23:0]         s2_frac         = (~(|s2_exp))?{1'b0,ex2[22:0]}:{1'b1,ex2[22:0]};
  wire                s2_zero         = (~(|s2_exp)) & (~(|ex2[22:0]));
  wire                s2_inf          = (  &s2_exp ) & (~(|ex2[22:0]));
  wire                s2_nan          = (  &s2_exp ) & (  |ex2[22:0] );
  wire                s3_s            = (op==2'd2)? 1'b0   :ex3[31];
  wire [7:0]          s3_exp          = (op==2'd2)? 8'd127 :ex3[30:23];
  wire [23:0]         s3_frac         = (op==2'd2)? 24'h80_0000:(~(|s3_exp))?{1'b0,ex3[22:0]}:{1'b1,ex3[22:0]};
  wire                s3_zero         = (op==2'd2)? 1'b0       :(~(|s3_exp)) & (~(|ex3[22:0]));
  wire                s3_inf          = (op==2'd2)? 1'b0       :(  &s3_exp ) & (~(|ex3[22:0]));
  wire                s3_nan          = (op==2'd2)? 1'b0       :(  &s3_exp ) & (  |ex3[22:0] );
  wire [47:0]         booth_s;
  wire [47:0]         booth_c;
  bit24_booth_wallace bw_impl         (.ai(s2_frac), .bi(s3_frac), .so(booth_s), .co(booth_c));
  wire                r_ex1_d_s       = force0 ? 1'b0                 : (s2_s ^ s3_s);                                                              //↙WEX
  wire [8:0]          r_ex1_d_exp     = force0 ? 9'd0                 : ({1'b0,s2_exp} + {1'b0,s3_exp} < 9'd127 ? 9'd0 :                            //↙WEX
                                                                         {1'b0,s2_exp} + {1'b0,s3_exp} - 9'd127);                                   //↙WEX
  wire [24+`PEXT:0]   r_ex1_d_csa_s   = force0 ? {(24+`PEXT+1){1'b0}} : booth_s[47:23-`PEXT]; /* sum   仇仇匹殘戶貲犒互請月 (FMA及蜃釵) */ //╯╯╯ //↙WEX
  wire [24+`PEXT:0]   r_ex1_d_csa_c   = force0 ? {(24+`PEXT+1){1'b0}} : booth_c[47:23-`PEXT]; /* carry 仇仇匹殘戶貲犒互請月 (FMA及蜃釵) */ //╯╯╯ //↙WEX
  wire                r_ex1_d_zero    = force0 ? 1'b1                 : ((s2_zero && !s3_inf && !s3_nan) || (s3_zero && !s2_inf && !s2_nan));       //↙WEX
  wire                r_ex1_d_inf     = force0 ? 1'b0                 : ((s2_inf && !s3_zero && !s3_nan) || (s3_inf && !s2_zero && !s2_nan));       //↙WEX
  wire                r_ex1_d_nan     = force0 ? 1'b0                 : (s2_nan || s3_nan || (s2_inf && s3_zero) || (s3_inf && s2_zero));           //↙WEX
  nbit_register #(1)  ex1_d_s_r           (.ACLK(ACLK), .RSTN(RSTN), .d(r_ex1_d_s    ),  .q(ex1_d_s     ));  //slice 1
  nbit_register #(9)  ex1_d_exp_r         (.ACLK(ACLK), .RSTN(RSTN), .d(r_ex1_d_exp  ),  .q(ex1_d_exp   ));  //slice 1
  nbit_register #(25+`PEXT) ex1_d_csa_s_r (.ACLK(ACLK), .RSTN(RSTN), .d(r_ex1_d_csa_s),  .q(ex1_d_csa_s ));  //slice 1 //╯╯╯
  nbit_register #(25+`PEXT) ex1_d_csa_c_r (.ACLK(ACLK), .RSTN(RSTN), .d(r_ex1_d_csa_c),  .q(ex1_d_csa_c ));  //slice 1 //╯╯╯
  nbit_register #(1)  ex1_d_zero_r        (.ACLK(ACLK), .RSTN(RSTN), .d(r_ex1_d_zero ),  .q(ex1_d_zero  ));  //slice 1
  nbit_register #(1)  ex1_d_inf_r         (.ACLK(ACLK), .RSTN(RSTN), .d(r_ex1_d_inf  ),  .q(ex1_d_inf   ));  //slice 1
  nbit_register #(1)  ex1_d_nan_r         (.ACLK(ACLK), .RSTN(RSTN), .d(r_ex1_d_nan  ),  .q(ex1_d_nan   ));  //slice 1
  wire                r_fadd_s1_s     = s1_s;
  wire [8:0] 	      r_fadd_s1_exp   = (8'd0<s1_exp&&s1_exp<8'd255)?{1'b0,(s1_exp-8'd1)}:{1'b0,s1_exp};
  wire [24+`PEXT:0]   r_fadd_s1_frac  = (8'd0<s1_exp&&s1_exp<8'd255)?{s1_frac,{(`PEXT+1){1'b0}}}:{1'b0,s1_frac,{(`PEXT){1'b0}}}; //╯╯╯
  wire                r_fadd_s1_zero  = s1_zero;
  wire                r_fadd_s1_inf   = s1_inf;
  wire                r_fadd_s1_nan   = s1_nan;
  nbit_register #(1)  fadd_s1_s_r         (.ACLK(ACLK), .RSTN(RSTN), .d(r_fadd_s1_s   ),  .q(fadd_s1_s   ));  //slice 1
  nbit_register #(9)  fadd_s1_exp_r       (.ACLK(ACLK), .RSTN(RSTN), .d(r_fadd_s1_exp ),  .q(fadd_s1_exp ));  //slice 1
  nbit_register #(25+`PEXT) fadd_s1_frac_r(.ACLK(ACLK), .RSTN(RSTN), .d(r_fadd_s1_frac),  .q(fadd_s1_frac));  //slice 1 //╯╯╯
  nbit_register #(1)  fadd_s1_zero_r      (.ACLK(ACLK), .RSTN(RSTN), .d(r_fadd_s1_zero),  .q(fadd_s1_zero));  //slice 1
  nbit_register #(1)  fadd_s1_inf_r       (.ACLK(ACLK), .RSTN(RSTN), .d(r_fadd_s1_inf ),  .q(fadd_s1_inf ));  //slice 1
  nbit_register #(1)  fadd_s1_nan_r       (.ACLK(ACLK), .RSTN(RSTN), .d(r_fadd_s1_nan ),  .q(fadd_s1_nan ));  //slice 1
endmodule
`endif

`ifdef ENABLE_SPU
module spu1
(
  input  wire                      ACLK,
  input  wire                      RSTN,
  input  wire                      exec,
  input  wire                      fold,
  input  wire [`REG_DATA_BITS-1:0] ex2,
  input  wire [`REG_DATA_BITS-1:0] ex3,
  output wire [`SPU_DATA_LOG2-1:0] sfmapc0,
  output wire [`SPU_DATA_LOG2-1:0] sfmanc0,
  output wire [`SPU_DATA_LOG2-1:0] sfmapc1,
  output wire [`SPU_DATA_LOG2-1:0] sfmanc1,
  output wire [`SPU_DATA_LOG2-1:0] sfmapc2,
  output wire [`SPU_DATA_LOG2-1:0] sfmanc2,
  output wire [`SPU_DATA_LOG2-1:0] sfmapc3,
  output wire [`SPU_DATA_LOG2-1:0] sfmanc3,
  output wire [`SPU_DATA_LOG2-1:0] sfmapc4,
  output wire [`SPU_DATA_LOG2-1:0] sfmanc4,
  output wire [`SPU_DATA_LOG2-1:0] sfmapc5,
  output wire [`SPU_DATA_LOG2-1:0] sfmanc5,
  output wire [`SPU_DATA_LOG2-1:0] sfmapc6,
  output wire [`SPU_DATA_LOG2-1:0] sfmanc6,
  output wire [`SPU_DATA_LOG2-1:0] sfmapc7,
  output wire [`SPU_DATA_LOG2-1:0] sfmanc7
);
//Ull urand(int no)
//  static Ull urand_seed[8]
//    = {0xc3c3c3c3a5a5a5a5LL, 0x123456789abcdef0LL, 0xe1e1e1e1d4d4d4d4LL, 0x8888777766665555LL,
//       0x8787878796969696LL, 0xfedcba9876543210LL, 0x5a5a5a5a3c3c3c3cLL, 0xbbbbccccddddeeeeLL};
//  Ull retval = urand_seed[no];
//  urand_seed[no] ^= (urand_seed[no]<<29);
//  urand_seed[no] ^= (urand_seed[no]>>27);
//  urand_seed[no] ^= (urand_seed[no]<<37);
//  return (retval);

//  for (i=0; i<8; i++) /* s2 * s3 -> ad2 */
//    u[i] = urand(i);
//  for (i=0; i<8; i++) { /* s2 * s3 -> ad2 */
//    ss[i] = (r2>>(i*8+7))&1 ^ (r3>>(i*8+7))&1;
//int s2e   = (r2>>(i*8))&0x7f; s2e = s2e<SPU_DATA_BITS?s2e:SPU_DATA_BITS;
//int s3e   = (r3>>(i*8))&0x7f; s3e = s3e<SPU_DATA_BITS?s3e:SPU_DATA_BITS;
//    s2[i] = 0LL;
//    s3[i] = 0LL;
//    for (j=0; j<SPU_COUT_BITS; j++) {
//      int k = j * SPU_DATA_DIST; /* SPU_DATA_BITS=15卅日4bit咍 */
//      s2[i] |= ((u[(i+0)%8]>>k&SPU_DATA_BITS)<=s2e)<<j;
//      s3[i] |= ((u[(i+1)%8]>>k&SPU_DATA_BITS)<=s3e)<<j;
//    }
//    o1[i] = s2[i] & s3[i];                         
//    o1[i] = ss[i]<<63|(o1[i]&0x7fffffffffffffffLL);
//  }

   function [63:0] urand;
      input [63:0] us;
      reg   [63:0] u1;
      reg   [63:0] u2;
      reg   [63:0] u3;
      begin
	u1 = us[63:0] ^ {us[34:0],29'd0};
	u2 = u1[63:0] ^ {27'd0,u1[63:27]};
	u3 = u2[63:0] ^ {u2[26:0],37'd0};
	urand = u3;
      end
   endfunction

   reg  [63:0] ur0;
   reg  [63:0] ur1;
   reg  [63:0] ur2;
   reg  [63:0] ur3;
   reg  [63:0] ur4;
   reg  [63:0] ur5;
   reg  [63:0] ur6;
   reg  [63:0] ur7;

   wire [63:0] ur0n = urand(ur0);
   wire [63:0] ur1n = urand(ur1);
   wire [63:0] ur2n = urand(ur2);
   wire [63:0] ur3n = urand(ur3);
   wire [63:0] ur4n = urand(ur4);
   wire [63:0] ur5n = urand(ur5);
   wire [63:0] ur6n = urand(ur6);
   wire [63:0] ur7n = urand(ur7);
   
   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN) begin
       ur0 <= 64'hc3c3c3c3a5a5a5a5;
       ur1 <= 64'h123456789abcdef0;
       ur2 <= 64'he1e1e1e1d4d4d4d4;
       ur3 <= 64'h8888777766665555;
       ur4 <= 64'h8787878796969696;
       ur5 <= 64'hfedcba9876543210;
       ur6 <= 64'h5a5a5a5a3c3c3c3c;
       ur7 <= 64'hbbbbccccddddeeee;
     end
     else if (exec || fold) begin
       ur0 <= ur0n;
       ur1 <= ur1n;
       ur2 <= ur2n;
       ur3 <= ur3n;
       ur4 <= ur4n;
       ur5 <= ur5n;
       ur6 <= ur6n;
       ur7 <= ur7n;
     end
   end

   wire [`SPU_DATA_BITS:0] r_sfma0;
   wire [`SPU_DATA_BITS:0] r_sfma1;
   wire [`SPU_DATA_BITS:0] r_sfma2;
   wire [`SPU_DATA_BITS:0] r_sfma3;
   wire [`SPU_DATA_BITS:0] r_sfma4;
   wire [`SPU_DATA_BITS:0] r_sfma5;
   wire [`SPU_DATA_BITS:0] r_sfma6;
   wire [`SPU_DATA_BITS:0] r_sfma7;

   assign r_sfma0[`SPU_DATA_BITS] = ex2[ 7] ^ ex3[ 7];
   assign r_sfma1[`SPU_DATA_BITS] = ex2[15] ^ ex3[15];
   assign r_sfma2[`SPU_DATA_BITS] = ex2[23] ^ ex3[23];
   assign r_sfma3[`SPU_DATA_BITS] = ex2[31] ^ ex3[31];
   assign r_sfma4[`SPU_DATA_BITS] = ex2[39] ^ ex3[39];
   assign r_sfma5[`SPU_DATA_BITS] = ex2[47] ^ ex3[47];
   assign r_sfma6[`SPU_DATA_BITS] = ex2[55] ^ ex3[55];
   assign r_sfma7[`SPU_DATA_BITS] = ex2[63] ^ ex3[63];

   wire [`SPU_DATA_LOG2-1:0] s2e0 = (ex2[ 6: 0]<`SPU_DATA_BITS)?ex2[ 6: 0]:`SPU_DATA_BITS;
   wire [`SPU_DATA_LOG2-1:0] s2e1 = (ex2[14: 8]<`SPU_DATA_BITS)?ex2[14: 8]:`SPU_DATA_BITS;
   wire [`SPU_DATA_LOG2-1:0] s2e2 = (ex2[22:16]<`SPU_DATA_BITS)?ex2[22:16]:`SPU_DATA_BITS;
   wire [`SPU_DATA_LOG2-1:0] s2e3 = (ex2[30:24]<`SPU_DATA_BITS)?ex2[30:24]:`SPU_DATA_BITS;
   wire [`SPU_DATA_LOG2-1:0] s2e4 = (ex2[38:32]<`SPU_DATA_BITS)?ex2[38:32]:`SPU_DATA_BITS;
   wire [`SPU_DATA_LOG2-1:0] s2e5 = (ex2[46:40]<`SPU_DATA_BITS)?ex2[46:40]:`SPU_DATA_BITS;
   wire [`SPU_DATA_LOG2-1:0] s2e6 = (ex2[54:48]<`SPU_DATA_BITS)?ex2[54:48]:`SPU_DATA_BITS;
   wire [`SPU_DATA_LOG2-1:0] s2e7 = (ex2[62:56]<`SPU_DATA_BITS)?ex2[62:56]:`SPU_DATA_BITS;

   wire [`SPU_DATA_LOG2-1:0] s3e0 = (ex3[ 6: 0]<`SPU_DATA_BITS)?ex3[ 6: 0]:`SPU_DATA_BITS;
   wire [`SPU_DATA_LOG2-1:0] s3e1 = (ex3[14: 8]<`SPU_DATA_BITS)?ex3[14: 8]:`SPU_DATA_BITS;
   wire [`SPU_DATA_LOG2-1:0] s3e2 = (ex3[22:16]<`SPU_DATA_BITS)?ex3[22:16]:`SPU_DATA_BITS;
   wire [`SPU_DATA_LOG2-1:0] s3e3 = (ex3[30:24]<`SPU_DATA_BITS)?ex3[30:24]:`SPU_DATA_BITS;
   wire [`SPU_DATA_LOG2-1:0] s3e4 = (ex3[38:32]<`SPU_DATA_BITS)?ex3[38:32]:`SPU_DATA_BITS;
   wire [`SPU_DATA_LOG2-1:0] s3e5 = (ex3[46:40]<`SPU_DATA_BITS)?ex3[46:40]:`SPU_DATA_BITS;
   wire [`SPU_DATA_LOG2-1:0] s3e6 = (ex3[54:48]<`SPU_DATA_BITS)?ex3[54:48]:`SPU_DATA_BITS;
   wire [`SPU_DATA_LOG2-1:0] s3e7 = (ex3[62:56]<`SPU_DATA_BITS)?ex3[62:56]:`SPU_DATA_BITS;

   wire [`SPU_DATA_BITS-1:0] s20;
   wire [`SPU_DATA_BITS-1:0] s21;
   wire [`SPU_DATA_BITS-1:0] s22;
   wire [`SPU_DATA_BITS-1:0] s23;
   wire [`SPU_DATA_BITS-1:0] s24;
   wire [`SPU_DATA_BITS-1:0] s25;
   wire [`SPU_DATA_BITS-1:0] s26;
   wire [`SPU_DATA_BITS-1:0] s27;
   wire [`SPU_DATA_BITS-1:0] s30;
   wire [`SPU_DATA_BITS-1:0] s31;
   wire [`SPU_DATA_BITS-1:0] s32;
   wire [`SPU_DATA_BITS-1:0] s33;
   wire [`SPU_DATA_BITS-1:0] s34;
   wire [`SPU_DATA_BITS-1:0] s35;
   wire [`SPU_DATA_BITS-1:0] s36;
   wire [`SPU_DATA_BITS-1:0] s37;

   genvar gen_j;
   for (gen_j=0; gen_j<`SPU_DATA_BITS; gen_j=gen_j+1) begin: J
     assign s20[gen_j] = (ur0[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s2e0)?1'b1: 1'b0;
     assign s21[gen_j] = (ur1[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s2e1)?1'b1: 1'b0;
     assign s22[gen_j] = (ur2[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s2e2)?1'b1: 1'b0;
     assign s23[gen_j] = (ur3[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s2e3)?1'b1: 1'b0;
     assign s24[gen_j] = (ur4[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s2e4)?1'b1: 1'b0;
     assign s25[gen_j] = (ur5[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s2e5)?1'b1: 1'b0;
     assign s26[gen_j] = (ur6[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s2e6)?1'b1: 1'b0;
     assign s27[gen_j] = (ur7[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s2e7)?1'b1: 1'b0;
     assign s30[gen_j] = (ur1[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s3e0)?1'b1: 1'b0;
     assign s31[gen_j] = (ur2[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s3e1)?1'b1: 1'b0;
     assign s32[gen_j] = (ur3[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s3e2)?1'b1: 1'b0;
     assign s33[gen_j] = (ur4[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s3e3)?1'b1: 1'b0;
     assign s34[gen_j] = (ur5[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s3e4)?1'b1: 1'b0;
     assign s35[gen_j] = (ur6[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s3e5)?1'b1: 1'b0;
     assign s36[gen_j] = (ur7[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s3e6)?1'b1: 1'b0;
     assign s37[gen_j] = (ur0[gen_j*`SPU_DATA_DIST+`SPU_DATA_LOG2-1:gen_j*`SPU_DATA_DIST]<=s3e7)?1'b1: 1'b0;
   end

   assign r_sfma0[`SPU_DATA_BITS-1:0] = s20 & s30;
   assign r_sfma1[`SPU_DATA_BITS-1:0] = s21 & s31;
   assign r_sfma2[`SPU_DATA_BITS-1:0] = s22 & s32;
   assign r_sfma3[`SPU_DATA_BITS-1:0] = s23 & s33;
   assign r_sfma4[`SPU_DATA_BITS-1:0] = s24 & s34;
   assign r_sfma5[`SPU_DATA_BITS-1:0] = s25 & s35;
   assign r_sfma6[`SPU_DATA_BITS-1:0] = s26 & s36;
   assign r_sfma7[`SPU_DATA_BITS-1:0] = s27 & s37;

   wire [`SPU_DATA_LOG2-1:0] r_sfmapc0;
   wire [`SPU_DATA_LOG2-1:0] r_sfmanc0;
   wire [`SPU_DATA_LOG2-1:0] r_sfmapc1;
   wire [`SPU_DATA_LOG2-1:0] r_sfmanc1;
   wire [`SPU_DATA_LOG2-1:0] r_sfmapc2;
   wire [`SPU_DATA_LOG2-1:0] r_sfmanc2;
   wire [`SPU_DATA_LOG2-1:0] r_sfmapc3;
   wire [`SPU_DATA_LOG2-1:0] r_sfmanc3;
   wire [`SPU_DATA_LOG2-1:0] r_sfmapc4;
   wire [`SPU_DATA_LOG2-1:0] r_sfmanc4;
   wire [`SPU_DATA_LOG2-1:0] r_sfmapc5;
   wire [`SPU_DATA_LOG2-1:0] r_sfmanc5;
   wire [`SPU_DATA_LOG2-1:0] r_sfmapc6;
   wire [`SPU_DATA_LOG2-1:0] r_sfmanc6;
   wire [`SPU_DATA_LOG2-1:0] r_sfmapc7;
   wire [`SPU_DATA_LOG2-1:0] r_sfmanc7;

   popcount12 spupop0 (.s (r_sfma0), .pc (r_sfmapc0), .nc (r_sfmanc0));
   popcount12 spupop1 (.s (r_sfma1), .pc (r_sfmapc1), .nc (r_sfmanc1));
   popcount12 spupop2 (.s (r_sfma2), .pc (r_sfmapc2), .nc (r_sfmanc2));
   popcount12 spupop3 (.s (r_sfma3), .pc (r_sfmapc3), .nc (r_sfmanc3));
   popcount12 spupop4 (.s (r_sfma4), .pc (r_sfmapc4), .nc (r_sfmanc4));
   popcount12 spupop5 (.s (r_sfma5), .pc (r_sfmapc5), .nc (r_sfmanc5));
   popcount12 spupop6 (.s (r_sfma6), .pc (r_sfmapc6), .nc (r_sfmanc6));
   popcount12 spupop7 (.s (r_sfma7), .pc (r_sfmapc7), .nc (r_sfmanc7));
   
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmapc0_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmapc0),  .q(sfmapc0));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmanc0_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmanc0),  .q(sfmanc0));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmapc1_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmapc1),  .q(sfmapc1));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmanc1_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmanc1),  .q(sfmanc1));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmapc2_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmapc2),  .q(sfmapc2));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmanc2_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmanc2),  .q(sfmanc2));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmapc3_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmapc3),  .q(sfmapc3));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmanc3_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmanc3),  .q(sfmanc3));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmapc4_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmapc4),  .q(sfmapc4));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmanc4_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmanc4),  .q(sfmanc4));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmapc5_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmapc5),  .q(sfmapc5));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmanc5_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmanc5),  .q(sfmanc5));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmapc6_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmapc6),  .q(sfmapc6));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmanc6_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmanc6),  .q(sfmanc6));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmapc7_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmapc7),  .q(sfmapc7));  //slice 1
   nbit_register #(`SPU_DATA_LOG2)  sfma_sfmanc7_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_sfmanc7),  .q(sfmanc7));  //slice 1
endmodule

module popcount12
(
  input  wire [`SPU_DATA_BITS:0]   s, /* population count */
  output wire [`SPU_DATA_LOG2-1:0] pc,
  output wire [`SPU_DATA_LOG2-1:0] nc
);
   function [2:0] popcount12_internal;
      input [5:0]  s; /* population count */
      reg   [2:0]  d; /* 0..6 */
      begin
	case(s[5:0])
	  6'd0  :  d = 3'd0; /* 000000 */
	  6'd1  :  d = 3'd1; /* 000001 */
	  6'd2  :  d = 3'd1; /* 000010 */
	  6'd4  :  d = 3'd1; /* 000100 */
	  6'd8  :  d = 3'd1; /* 001000 */
	  6'd16 :  d = 3'd1; /* 010000 */
	  6'd32 :  d = 3'd1; /* 100000 */
	  6'd3  :  d = 3'd2; /* 000011 */
	  6'd5  :  d = 3'd2; /* 000101 */
	  6'd6  :  d = 3'd2; /* 000110 */
	  6'd9  :  d = 3'd2; /* 001001 */
	  6'd10 :  d = 3'd2; /* 001010 */
	  6'd12 :  d = 3'd2; /* 001100 */
	  6'd17 :  d = 3'd2; /* 010001 */
	  6'd18 :  d = 3'd2; /* 010010 */
	  6'd20 :  d = 3'd2; /* 010100 */
	  6'd24 :  d = 3'd2; /* 011000 */
	  6'd33 :  d = 3'd2; /* 100001 */
	  6'd34 :  d = 3'd2; /* 100010 */
	  6'd36 :  d = 3'd2; /* 100100 */
	  6'd40 :  d = 3'd2; /* 101000 */
	  6'd48 :  d = 3'd2; /* 110000 */
	  6'd7  :  d = 3'd3; /* 000111 */
	  6'd11 :  d = 3'd3; /* 001011 */
	  6'd13 :  d = 3'd3; /* 001101 */
	  6'd14 :  d = 3'd3; /* 001110 */
	  6'd19 :  d = 3'd3; /* 010011 */
	  6'd21 :  d = 3'd3; /* 010101 */
	  6'd22 :  d = 3'd3; /* 010110 */
	  6'd25 :  d = 3'd3; /* 011001 */
	  6'd26 :  d = 3'd3; /* 011010 */
	  6'd28 :  d = 3'd3; /* 011100 */
	  6'd35 :  d = 3'd3; /* 100011 */
	  6'd37 :  d = 3'd3; /* 100101 */
	  6'd38 :  d = 3'd3; /* 100110 */
	  6'd41 :  d = 3'd3; /* 101001 */
	  6'd42 :  d = 3'd3; /* 101010 */
	  6'd44 :  d = 3'd3; /* 101100 */
	  6'd49 :  d = 3'd3; /* 110001 */
	  6'd50 :  d = 3'd3; /* 110010 */
	  6'd52 :  d = 3'd3; /* 110100 */
	  6'd56 :  d = 3'd3; /* 111000 */
	  6'd15 :  d = 3'd4; /* 001111 */
	  6'd23 :  d = 3'd4; /* 010111 */
	  6'd27 :  d = 3'd4; /* 011011 */
	  6'd29 :  d = 3'd4; /* 011101 */
	  6'd30 :  d = 3'd4; /* 011110 */
	  6'd39 :  d = 3'd4; /* 100111 */
	  6'd43 :  d = 3'd4; /* 101011 */
	  6'd45 :  d = 3'd4; /* 101101 */
	  6'd46 :  d = 3'd4; /* 101110 */
	  6'd51 :  d = 3'd4; /* 110011 */
	  6'd53 :  d = 3'd4; /* 110101 */
	  6'd54 :  d = 3'd4; /* 110110 */
	  6'd57 :  d = 3'd4; /* 111001 */
	  6'd58 :  d = 3'd4; /* 111010 */
	  6'd60 :  d = 3'd4; /* 111100 */
	  6'd31 :  d = 3'd5; /* 011111 */
	  6'd47 :  d = 3'd5; /* 101111 */
	  6'd55 :  d = 3'd5; /* 110111 */
	  6'd59 :  d = 3'd5; /* 111011 */
	  6'd61 :  d = 3'd5; /* 111101 */
	  6'd62 :  d = 3'd5; /* 111110 */
	  default: d = 3'd6; /* 111111 */
	endcase
	popcount12_internal = d;
      end
   endfunction

   assign pc[`SPU_DATA_LOG2-1:0] = ~s[`SPU_DATA_BITS] ? (popcount12_internal(s[11:6]) + popcount12_internal(s[5:0])) : {(`SPU_DATA_LOG2){1'b0}};
   assign nc[`SPU_DATA_LOG2-1:0] =  s[`SPU_DATA_BITS] ? (popcount12_internal(s[11:6]) + popcount12_internal(s[5:0])) : {(`SPU_DATA_LOG2){1'b0}};

endmodule
`endif

module cex
(
  input  wire [`CEX_DATA_BITS-1:0]     c0,
  input  wire [`CEX_DATA_BITS-1:0]     c1,
  input  wire [`CEX_DATA_BITS-1:0]     c2,
  input  wire [`CEX_DATA_BITS-1:0]     c3,
  input  wire [`CEX_PATT_BITS-1:0]     patt,
  output wire [`CEX_DATA_BITS-1:0]     cexd
);
  assign cexd[0] = patt[{c3[0],c2[0],c1[0],c0[0]}];
  assign cexd[1] = patt[{c3[1],c2[1],c1[1],c0[1]}];
endmodule

module mex //↙MEX
(
  input  wire [1:0]                   mex1op,
  input  wire                         mex1en,
  input  wire [`EXRING_ADDR_BITS-1:0] ea1b,
  input  wire [2:0]                   mex1dist,
  input  wire [1:0]                   mex0op,
  input  wire                         mex0en,
  input  wire [`EXRING_ADDR_BITS-1:0] ea0b,
  input  wire [2:0]                   mex0dist,
  input  wire [3:0]                   mexlimit,
  input  wire [`EXE_WORD_BITS-1:0]    mexmr1,
  input  wire [`EXE_WORD_BITS-1:0]    mexmr0,
  output wire [`EXRING_ADDR_BITS-1:0] mex1d,
  output wire [`EXRING_ADDR_BITS-1:0] mex0d
);

  wire [`EXRING_ADDR_BITS*2-1:0] mexd;

  function [6:0] mex_dist2ofs;
    input [2:0] dist;
    begin
      mex_dist2ofs[0] = dist==3'd1; /* ofs= 1 */
      mex_dist2ofs[1] = dist==3'd2; /* ofs= 2 */
      mex_dist2ofs[2] = dist==3'd3; /* ofs= 4 */
      mex_dist2ofs[3] = dist==3'd4; /* ofs= 8 */
      mex_dist2ofs[4] = dist==3'd5; /* ofs=16 */
      mex_dist2ofs[5] = dist==3'd6; /* ofs=32 */
      mex_dist2ofs[6] = dist==3'd7; /* ofs=64 */
    end
  endfunction
      
  function [`EXRING_ADDR_BITS-1:0] mex_limit2block;
    input [3:0] limit;
    begin
      mex_limit2block[ 0] = 1'b0;
      mex_limit2block[ 1] = 1'b0;
      mex_limit2block[ 2] = 1'b0;
      mex_limit2block[ 3] = limit==4'd1;  /* block=    8 */
      mex_limit2block[ 4] = limit==4'd2;  /* block=   16 */
      mex_limit2block[ 5] = limit==4'd3;  /* block=   32 */
      mex_limit2block[ 6] = limit==4'd4;  /* block=   64 */
      mex_limit2block[ 7] = limit==4'd5;  /* block=  128 */
      mex_limit2block[ 8] = limit==4'd6;  /* block=  256 */
      mex_limit2block[ 9] = limit==4'd7;  /* block=  512 */
      mex_limit2block[10] = limit==4'd8;  /* block= 1024 */
      mex_limit2block[11] = limit==4'd9;  /* block= 2048 */
      mex_limit2block[12] = limit==4'd10; /* block= 4096 */
      mex_limit2block[13] = limit==4'd11; /* block= 8192 */
      mex_limit2block[14] = limit==4'd12; /* block=16384 */
`ifdef  LMM_SIZE_IS_64K
      mex_limit2block[15:15] = limit==1'd0;
`endif			    
`ifdef  LMM_SIZE_IS_128K
      mex_limit2block[16:15] = limit==2'd0;
`endif			    
    end
  endfunction
      
  function [`EXRING_ADDR_BITS*2-1:0] mex_internal;
    input  [1:0]                   mex1op;
    input                          mex1en;
    input  [`EXRING_ADDR_BITS-1:0] ea1b;
    input  [2:0]                   mex1dist;
    input  [1:0]                   mex0op;
    input                          mex0en;
    input  [`EXRING_ADDR_BITS-1:0] ea0b;
    input  [2:0]                   mex0dist;
    input  [3:0]                   mexlimit;
    input  [`EXE_WORD_BITS-1:0]    mexmr1;
    input  [`EXE_WORD_BITS-1:0]    mexmr0;
    reg    [6:0]                   ofs1;
    reg    [6:0]                   ofs0;
    reg    [`EXRING_ADDR_BITS-1:0] block1;//elem=4096及樺寧,16384(15bit及0x4000)引匹卅及匹,16bit卞璋引月
    reg    [`EXRING_ADDR_BITS-1:0] block2;//block1*2        32768(16bit及0x8000)引匹卅及匹,16bit卞璋引月
    reg    [`EXRING_ADDR_BITS-1:0] ea1bp1;
    reg    [`EXRING_ADDR_BITS-1:0] ea0bp1;
    reg                            ea1bend;
    reg                            ea0bend;
    reg                            ea1bp1end;
    reg                            ea0bp1end;
    reg                            mr1lemr0;
    reg                            mr1gemr0;
    reg    [`EXRING_ADDR_BITS-1:0] mex1d;
    reg    [`EXRING_ADDR_BITS-1:0] mex0d;
    begin
      ofs1   = (mex1op==2'd0 || !mex1en) ? 7'd0 : mex_dist2ofs(mex1dist);
      ofs0   = (mex0op==2'd0 || !mex0en) ? 7'd0 : mex_dist2ofs(mex0dist);
      block1 = mex_limit2block(mexlimit);
      block2 = {block1[`EXRING_ADDR_BITS-2:0],1'b0};//elem=4096及樺寧,16384(15bit及0x4000)引匹卅及匹,MSB反樁化化方中
      ea1bend   = ea1b==block1;
      ea0bend   = ea0b==block2;
      ea1bp1    = ea1b+ofs1;
      ea0bp1    = ea0b+ofs0;
      ea1bp1end = ea1bp1==block1;
      ea0bp1end = ea0bp1==block2;
      mr1lemr0  = mexmr1<=mexmr0;
      mr1gemr0  = mexmr1>=mexmr0;
      
      case (mex1op)
	default: begin //`OP_ALWAYS
	  mex1d = ea1b + ofs1;
	end
	`OP_CMPA_LE: begin
	  if (mexlimit == 4'd0) begin //sparse matrix
	    mex1d = ea1b + ((mexmr1!={(`EXE_WORD_BITS){1'b1}} && mr1lemr0) ? ofs1 : 7'd0); /* sparse matrix */
          end
	  else if ((ea1bend & ea0bp1end)|(ea1bp1end & ea0bend)) begin //merge sort
	    mex1d = {(`EXRING_ADDR_BITS){1'b0}};
	    end
	  else begin
	    mex1d = ea1b + (~ea1bend & ((~ea0bend & mr1lemr0)|ea0bend) ? ofs1:0);
	  end
	end
      endcase
      case (mex0op)
	default: begin //`OP_ALWAYS
	  mex0d = ea0b + ofs0;
	end
	`OP_CMPA_GE: begin
	  if (mexlimit == 4'd0) begin //sparse matrix
	    mex0d = ea0b + ((mexmr0!={(`EXE_WORD_BITS){1'b1}} && mr1gemr0) ? ofs0 : 7'd0); /* sparse matrix */
	  end
	  else if ((ea1bend & ea0bp1end)|(ea1bp1end & ea0bend)) begin //merge sort
	    mex0d = block1;
	  end
	  else begin
	    mex0d = ea0b + (~ea0bend & ((~ea1bend & mr1gemr0)|ea1bend) ? ofs0:0);
	  end
	end
      endcase
      mex_internal = {mex1d,mex0d};
    end
  endfunction
  assign mexd = mex_internal(mex1op, mex1en, ea1b, mex1dist, mex0op, mex0en, ea0b, mex0dist, mexlimit, mexmr1, mexmr0);
  assign mex1d = mexd[`EXRING_ADDR_BITS*2-1:`EXRING_ADDR_BITS];
  assign mex0d = mexd[`EXRING_ADDR_BITS  -1:                0];
endmodule

module eam //↙MEX
(
  input  wire [`REG_DATA_BITS-1:0]    eao,
  input  wire [3:0]                   eamsk,
  output wire [`EXRING_ADDR_BITS-1:0] eamd
);

  function [`EXRING_ADDR_BITS-1:0]  eam_internal;
    input [`REG_DATA_BITS-1:0]      eao;
    input [3:0]                     eamsk;
    reg   [`EXRING_ADDR_BITS-1:0]   eamd;
    begin
      case (eamsk)
        `MSK_B0: eamd = {56'h00000000_000000,eao[ 7: 0]};
        `MSK_B1: eamd = {56'h00000000_000000,eao[15: 8]};
        `MSK_B2: eamd = {56'h00000000_000000,eao[23:16]};
        `MSK_B3: eamd = {56'h00000000_000000,eao[31:24]};
        `MSK_B4: eamd = {56'h00000000_000000,eao[39:32]};
        `MSK_B5: eamd = {56'h00000000_000000,eao[47:40]};
        `MSK_B6: eamd = {56'h00000000_000000,eao[55:48]};
        `MSK_B7: eamd = {56'h00000000_000000,eao[63:56]};
        `MSK_H0: eamd = {48'h00000000_0000,  eao[15: 0]};
        `MSK_H1: eamd = {48'h00000000_0000,  eao[31:16]};
        `MSK_H2: eamd = {48'h00000000_0000,  eao[47:32]};
        `MSK_H3: eamd = {48'h00000000_0000,  eao[63:48]};
        `MSK_W0: eamd = {32'h00000000,       eao[31: 0]};
        `MSK_W1: eamd = {32'h00000000,       eao[63:32]};
        default: eamd = eao;
      endcase
      eam_internal = eamd;
    end
  endfunction
  assign eamd = eam_internal(eao, eamsk);
endmodule
