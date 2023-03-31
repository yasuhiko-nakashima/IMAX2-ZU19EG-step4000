/*
 *-----------------------------------------------------------------------------
 * Title         : stage3
 * Project       : EMAX6
 *-----------------------------------------------------------------------------
 * File          : stage3.v
 * Author        : Nakashima
 *                <nakashim@is.naist.jp>
 *                 Yamano
 *                <yamano.ryusuke.yo7@is.naist.jp>
 *                 Kikutani
 *                <kikutani.yuma.kw3@is.naist.jp>
 * Created       : 10.20.2017
 * Last modified : 10.20.2017
 *-----------------------------------------------------------------------------
 * Description : ±é»»·ë²Ì¤ÎÅÁÈÂ¤Èfadd3ÆþÎÏcsa add
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
/* stage3 */
module stage3
(
  input  wire                                 ACLK,
  input  wire                                 RSTN,
  input  wire                                 UNIRSTN,
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
  input  wire [5:0]                           opi,
  input  wire [`REG_DATA_BITS-1:0]            ex2di,
  input  wire [`REG_DATA_BITS-1:0]            ex4i,
  input  wire [5:0]                           ex5i,
  output reg                                  stage4_exec,
  output reg                                  stage4_fold,
  output reg [1:0]                            cxd,
  output reg [`REG_DATA_BITS-1:0]             tx0,
  output reg [`REG_DATA_BITS-1:0]             tx1,
  output reg [`REG_DATA_BITS-1:0]             tx2,
  output reg [`REG_DATA_BITS-1:0]             tx3,
  output reg [2:0]                            opo,
  output wire[`REG_DATA_BITS-1:0]             ex3d,
  output reg [5:0]                            ex5o,
`ifdef ENABLE_FPU
  input  wire                                 h_ex1_d_s,
  input  wire [8:0]                           h_ex1_d_exp,
  input  wire [24+`PEXT:0]                    h_ex1_d_csa_s, //¢£¢£¢£
  input  wire [24+`PEXT:0]                    h_ex1_d_csa_c, //¢£¢£¢£
  input  wire                                 h_ex1_d_zero,
  input  wire                                 h_ex1_d_inf,
  input  wire                                 h_ex1_d_nan,
  input  wire                                 h_fadd_s1_s,
  input  wire [8:0]                           h_fadd_s1_exp,
  input  wire [24+`PEXT:0]                    h_fadd_s1_frac, //¢£¢£¢£
  input  wire                                 h_fadd_s1_zero,
  input  wire                                 h_fadd_s1_inf,
  input  wire                                 h_fadd_s1_nan,
  output wire                                 h_ex2_d_s,
  output wire [ 8:0]                          h_ex2_d_exp,
  output wire [25+`PEXT:0]                    h_ex2_d_frac, //¢£¢£¢£
  output wire                                 h_ex2_d_inf,
  output wire                                 h_ex2_d_nan,
  input  wire                                 l_ex1_d_s,
  input  wire [8:0]                           l_ex1_d_exp,
  input  wire [24+`PEXT:0]                    l_ex1_d_csa_s, //¢£¢£¢£
  input  wire [24+`PEXT:0]                    l_ex1_d_csa_c, //¢£¢£¢£
  input  wire                                 l_ex1_d_zero,
  input  wire                                 l_ex1_d_inf,
  input  wire                                 l_ex1_d_nan,
  input  wire                                 l_fadd_s1_s,
  input  wire [8:0]                           l_fadd_s1_exp,
  input  wire [24+`PEXT:0]                    l_fadd_s1_frac, //¢£¢£¢£
  input  wire                                 l_fadd_s1_zero,
  input  wire                                 l_fadd_s1_inf,
  input  wire                                 l_fadd_s1_nan,
  output wire                                 l_ex2_d_s,
  output wire [ 8:0]                          l_ex2_d_exp,
  output wire [25+`PEXT:0]                    l_ex2_d_frac, //¢£¢£¢£
  output wire                                 l_ex2_d_inf,
  output wire                                 l_ex2_d_nan,
`endif
`ifdef ENABLE_SPU
  input  wire [7:0]                           ex2passi1,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmapc0,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmanc0,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmapc1,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmanc1,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmapc2,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmanc2,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmapc3,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmanc3,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmapc4,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmanc4,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmapc5,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmanc5,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmapc6,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmanc6,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmapc7,
  input  wire [`SPU_DATA_LOG2-1:0]            ex2di_sfmanc7,
  output reg  [7:0]                           ex3passr1,
  output wire [31:0]                          ex3so,
`endif
  input  wire [`EXRING_ADDR_BITS-1:0]         ea0di,
  input  wire [`EXRING_ADDR_BITS-1:0]         ea0dofsi,//¡úMEX
  input  wire [`EXRING_ADDR_BITS-1:0]         ea1di,
  input  wire [`EXRING_ADDR_BITS-1:0]         ea1dofsi,//¡úMEX
  output reg  [`EXRING_ADDR_BITS-1:0]         ea0d,
  output reg  [`EXRING_ADDR_BITS-1:0]         ea0woofs,//¡úMEX
  output reg  [`EXRING_ADDR_BITS-1:0]         ea1d,
  output reg  [`EXRING_ADDR_BITS-1:0]         ea1woofs //¡úMEX
);
// synopsys template

  reg  [1:0]                        cycle;

  always @(posedge ACLK or negedge RSTN) begin
    if (~RSTN) begin
      cycle <= 2'h0;
    end
    else begin
      cycle <= cycle + 2'h1;
    end
  end

  wire [`CONF_BITS-1:0] conf = (cycle==2'h0)?conf2:(cycle==2'h1)?conf3:(cycle==2'h2)?conf0:conf1;
  wire [`EXRING_ADDR_BITS-1:0] ea0w; //¡úMEX
  wire [`EXRING_ADDR_BITS-1:0] ea1w; //¡úMEX
   
  always @(posedge ACLK or negedge RSTN) begin
    if (~RSTN|~UNIRSTN) begin
      cxd         <= {(2){1'b0}};
      tx0         <= {(`REG_DATA_BITS){1'b0}};
      tx1         <= {(`REG_DATA_BITS){1'b0}};
      tx2         <= {(`REG_DATA_BITS){1'b0}};
      tx3         <= {(`REG_DATA_BITS){1'b0}};
      opo         <= 3'd0;
`ifdef ENABLE_SPU
      ex3passr1   <= 8'd0;
`endif
      ex5o        <= 6'd0;
      ea0d        <= {(`EXRING_ADDR_BITS){1'b0}};
      ea0woofs    <= {(`EXRING_ADDR_BITS){1'b0}};//¡úMEX 
      ea1d        <= {(`EXRING_ADDR_BITS){1'b0}};
      ea1woofs    <= {(`EXRING_ADDR_BITS){1'b0}};//¡úMEX
      stage4_exec <= 1'b0;
      stage4_fold <= 1'b0;
    end
    else begin
      opo           <= opi[5:3];
`ifdef ENABLE_SPU
      ex3passr1     <= ex2passi1;
`endif
      ex5o          <= ex5i;
      if (exec || fold) begin
	cxd         <= cxdi;
	tx0         <= tx0i;
	tx1         <= tx1i;
	tx2         <= tx2i;
	tx3         <= tx3i;
	ea0d        <= ea0w[`EXRING_ADDR_BITS-1:0]; //¡úMEX
	ea0woofs    <= ea0di[`EXRING_ADDR_BITS-1:0];//¡úMEX
	ea1d        <= ea1w[`EXRING_ADDR_BITS-1:0]; //¡úMEX
	ea1woofs    <= ea1di[`EXRING_ADDR_BITS-1:0];//¡úMEX
      end
      if (exec)
	stage4_exec <= 1'b1;
      else
	stage4_exec <= 1'b0;
      if (fold)
	stage4_fold <= 1'b1;
      else
	stage4_fold <= 1'b0;
    end
  end

  eag eag0 //¡úMEX
  (
    .eab        (ea0di          ),
    .eao        (ea0dofsi       ),
    .ead        (ea0w           )
  );

  eag eag1 //¡úMEX
  (
    .eab        (ea1di          ),
    .eao        (ea1dofsi       ),
    .ead        (ea1w           )
  );
   
  wire [2:0]                iop  = opi[2:0];

  exe2 exe2h
  (
    .ACLK               (ACLK                   ),
    .RSTN               (RSTN&UNIRSTN           ),
    .op                 (iop                    ),
    .ex2d               (ex2di[63:32]           ),
    .ex4                (ex4i [63:32]           ),
    .ex3d               (ex3d [63:32]           )
  );
   
   exe2 exe2l
  (
    .ACLK               (ACLK                   ),
    .RSTN               (RSTN&UNIRSTN           ),
    .op                 (iop                    ),
    .ex2d               (ex2di[31:0]            ),
    .ex4                (ex4i [31:0]            ),
    .ex3d               (ex3d [31:0]            )
  );

`ifdef ENABLE_FPU
  fpu2 fpu2h
  (
    .ACLK               (ACLK                   ),
    .RSTN               (RSTN&UNIRSTN           ),
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
    .fadd_s1_nan        (h_fadd_s1_nan          ),
    .ex2_d_s            (h_ex2_d_s              ),
    .ex2_d_exp          (h_ex2_d_exp            ),
    .ex2_d_frac         (h_ex2_d_frac           ),
    .ex2_d_inf          (h_ex2_d_inf            ),
    .ex2_d_nan          (h_ex2_d_nan            )
  );

  fpu2 fpu2l
  (
    .ACLK               (ACLK                   ),
    .RSTN               (RSTN&UNIRSTN           ),
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
    .fadd_s1_nan        (l_fadd_s1_nan          ),
    .ex2_d_s            (l_ex2_d_s              ),
    .ex2_d_exp          (l_ex2_d_exp            ),
    .ex2_d_frac         (l_ex2_d_frac           ),
    .ex2_d_inf          (l_ex2_d_inf            ),
    .ex2_d_nan          (l_ex2_d_nan            )
  );
`endif

`ifdef ENABLE_SPU
  /*-------------- Spiking operator ex1 <- ex1 + ex2 * ex3 */
  spu2 spu2
  (
    .ACLK               (ACLK                          ),
    .RSTN               (RSTN&UNIRSTN                  ),
    .sfmapc0            (ex2di_sfmapc0[`SPU_DATA_LOG2-1:0]),
    .sfmanc0            (ex2di_sfmanc0[`SPU_DATA_LOG2-1:0]),
    .sfmapc1            (ex2di_sfmapc1[`SPU_DATA_LOG2-1:0]),
    .sfmanc1            (ex2di_sfmanc1[`SPU_DATA_LOG2-1:0]),
    .sfmapc2            (ex2di_sfmapc2[`SPU_DATA_LOG2-1:0]),
    .sfmanc2            (ex2di_sfmanc2[`SPU_DATA_LOG2-1:0]),
    .sfmapc3            (ex2di_sfmapc3[`SPU_DATA_LOG2-1:0]),
    .sfmanc3            (ex2di_sfmanc3[`SPU_DATA_LOG2-1:0]),
    .sfmapc4            (ex2di_sfmapc4[`SPU_DATA_LOG2-1:0]),
    .sfmanc4            (ex2di_sfmanc4[`SPU_DATA_LOG2-1:0]),
    .sfmapc5            (ex2di_sfmapc5[`SPU_DATA_LOG2-1:0]),
    .sfmanc5            (ex2di_sfmanc5[`SPU_DATA_LOG2-1:0]),
    .sfmapc6            (ex2di_sfmapc6[`SPU_DATA_LOG2-1:0]),
    .sfmanc6            (ex2di_sfmanc6[`SPU_DATA_LOG2-1:0]),
    .sfmapc7            (ex2di_sfmapc7[`SPU_DATA_LOG2-1:0]),
    .sfmanc7            (ex2di_sfmanc7[`SPU_DATA_LOG2-1:0]),
    .ex4                (ex4i [2:0]                    ),
    .so                 (ex3so[31:0]                   )
  );
`endif
endmodule

module exe2
(
  input  wire                         ACLK,
  input  wire                         RSTN,
  input  wire [2:0]                   op,
  input  wire [`EXE_WORD_BITS-1:0]    ex2d,
  input  wire [`EXE_WORD_BITS-1:0]    ex4,
  output wire [`EXE_WORD_BITS-1:0]    ex3d
);

  function [`EXE_WORD_BITS-1:0] ex2_rotate;
    input [`EXE_WORD_BITS-1:0] s1;
    input [4:0]                s2;
    begin
      case(s2[4:0])
	5'd0:  ex2_rotate =            s1[31: 0];
	5'd1:  ex2_rotate = {s1[    0],s1[31: 1]};
	5'd2:  ex2_rotate = {s1[ 1: 0],s1[31: 2]};
	5'd3:  ex2_rotate = {s1[ 2: 0],s1[31: 3]};
	5'd4:  ex2_rotate = {s1[ 3: 0],s1[31: 4]};
	5'd5:  ex2_rotate = {s1[ 4: 0],s1[31: 5]};
	5'd6:  ex2_rotate = {s1[ 5: 0],s1[31: 6]};
	5'd7:  ex2_rotate = {s1[ 6: 0],s1[31: 7]};
	5'd8:  ex2_rotate = {s1[ 7: 0],s1[31: 8]};
	5'd9:  ex2_rotate = {s1[ 8: 0],s1[31: 9]};
	5'd10: ex2_rotate = {s1[ 9: 0],s1[31:10]};
	5'd11: ex2_rotate = {s1[10: 0],s1[31:11]};
	5'd12: ex2_rotate = {s1[11: 0],s1[31:12]};
	5'd13: ex2_rotate = {s1[12: 0],s1[31:13]};
	5'd14: ex2_rotate = {s1[13: 0],s1[31:14]};
	5'd15: ex2_rotate = {s1[14: 0],s1[31:15]};
	5'd16: ex2_rotate = {s1[15: 0],s1[31:16]};
	5'd17: ex2_rotate = {s1[16: 0],s1[31:17]};
	5'd18: ex2_rotate = {s1[17: 0],s1[31:18]};
	5'd19: ex2_rotate = {s1[18: 0],s1[31:19]};
	5'd20: ex2_rotate = {s1[19: 0],s1[31:20]};
	5'd21: ex2_rotate = {s1[20: 0],s1[31:21]};
	5'd22: ex2_rotate = {s1[21: 0],s1[31:22]};
	5'd23: ex2_rotate = {s1[22: 0],s1[31:23]};
	5'd24: ex2_rotate = {s1[23: 0],s1[31:24]};
	5'd25: ex2_rotate = {s1[24: 0],s1[31:25]};
	5'd26: ex2_rotate = {s1[25: 0],s1[31:26]};
	5'd27: ex2_rotate = {s1[26: 0],s1[31:27]};
	5'd28: ex2_rotate = {s1[27: 0],s1[31:28]};
	5'd29: ex2_rotate = {s1[28: 0],s1[31:29]};
	5'd30: ex2_rotate = {s1[29: 0],s1[31:30]};
	5'd31: ex2_rotate = {s1[30: 0],s1[   31]};
      endcase
    end
  endfunction

  function [`EXE_WORD_BITS-1:0] ex2_internal;
    input [2:0]                 op;
    input [`EXE_WORD_BITS-1:0]  s1;
    input [`EXE_WORD_BITS-1:0]  s2;

    reg   [`EXE_WORD_BITS-1:0]  t1;
    reg   [`EXE_WORD_BITS-1:0]  t2;
    reg   [`EXE_WORD_BITS-1:0]  t3;
    reg   [`EXE_WORD_BITS-1:0]  d;

    begin
      case (op)
      //`OP_NOP2: begin
      default: begin
	t1 = 32'd0;
	t2 = 32'd0;
	t3 = 32'd0;
        d  = s1;
      end
      `OP_AND: begin
	t1 = 32'd0;
	t2 = 32'd0;
	t3 = 32'd0;
        d  = s1 & s2;
      end
      `OP_OR: begin
	t1 = 32'd0;
	t2 = 32'd0;
	t3 = 32'd0;
        d  = s1 | s2;
      end
      `OP_XOR: begin
	t1 = 32'd0;
	t2 = 32'd0;
	t3 = 32'd0;
        d  = s1 ^ s2;
      end
`ifdef ENABLE_MEDIA
      `OP_SUMHH: begin/* SUMHH (H16bit+L16bit) -> H16bit */
	t1 = {15'd0, {1'b0,s1[31:16]}+{1'b0,s1[15:0]}};
	t2 = 32'd0;
	t3 = 32'd0;
        d  = {(t1[16:0]>17'h0FFFF)?16'hFFFF:t1[15:0],16'h0000};
      end
      `OP_SUMHL: begin/* SUMHL (H16bit+L16bit) -> L16bit */
	t1 = {15'd0, {1'b0,s1[31:16]}+{1'b0,s1[15:0]}};
	t2 = 32'd0;
	t3 = 32'd0;
        d  = {16'h0000,(t1[16:0]>17'h0FFFF)?16'hFFFF:t1[15:0]};
      end
`endif
//    `OP_WSWAP: begin
//      t1 = 32'd0;
//	t2 = 32'd0;
//	t3 = 32'd0;
//      d  = s1 & s2;
//    end
`ifdef ENABLE_CRYPTO
      `OP_ROTS: begin/* rotr(s1.w1,s4.b6),rotr(s1.w1,s4.b5),rotr(s1.w1,s4.b4) -> d.w1 */
	             /* rotr(s1.w0,s4.b2),rotr(s1.w0,s4.b1),rotr(s1.w0,s4.b0) -> d.w0 */
	t1 = ex2_rotate(s1, s2[ 4: 0]);
	t2 = ex2_rotate(s1, s2[12: 8]);
	t3 = ex2_rotate(s1, s2[20:16]);
        d  = t1 ^ t2 ^ t3;
      end
`endif
      endcase
      ex2_internal = d;
     end
  endfunction

  wire [`EXE_WORD_BITS-1:0] ex3dt;

  assign ex3dt = ex2_internal(op, ex2d, ex4);

  wire [`EXE_WORD_BITS-1:0] r_ex3d = ex3dt;

  nbit_register #(`EXE_WORD_BITS) ex3d_r(.ACLK(ACLK), .RSTN(RSTN), .d(r_ex3d), .q(ex3d)); //slice 1
endmodule

`ifdef ENABLE_FPU
module fpu2
(
    input  wire                 ACLK,
    input  wire                 RSTN,
    input  wire                 ex1_d_s,
    input  wire [8:0]           ex1_d_exp,
    input  wire [24+`PEXT:0]    ex1_d_csa_s, //¢£¢£¢£
    input  wire [24+`PEXT:0]    ex1_d_csa_c, //¢£¢£¢£
    input  wire                 ex1_d_zero,
    input  wire                 ex1_d_inf,
    input  wire                 ex1_d_nan,
    input  wire                 fadd_s1_s,
    input  wire [8:0]           fadd_s1_exp,
    input  wire [24+`PEXT:0]    fadd_s1_frac, //¢£¢£¢£
    input  wire                 fadd_s1_zero,
    input  wire                 fadd_s1_inf,
    input  wire                 fadd_s1_nan,
    output wire                 ex2_d_s,
    output wire [8:0]           ex2_d_exp,
    output wire [25+`PEXT:0]    ex2_d_frac, //¢£¢£¢£
    output wire                 ex2_d_inf,
    output wire                 ex2_d_nan
);
  wire const_one                    = 1'b1;
  wire fadd_w_exp_comp              = fadd_s1_exp>ex1_d_exp?1'b1:1'b0;
  wire [ 8:0] fadd_w_exp_diff0      = fadd_w_exp_comp?(fadd_s1_exp-ex1_d_exp):(ex1_d_exp-fadd_s1_exp);
  wire [ 8:0] fadd_w_exp_diff       = fadd_w_exp_diff0>(9'd25+`PEXT)?(9'd25+`PEXT):fadd_w_exp_diff0; //¢£¢£¢£
  wire [ 8:0] fadd_w_align_exp      = fadd_w_exp_comp?fadd_s1_exp:ex1_d_exp;
  wire [24+`PEXT:0] fadd_w_s1_align_frac  = fadd_s1_frac>>(fadd_w_exp_comp? 0:fadd_w_exp_diff); //¢£¢£¢£
  wire [24+`PEXT:0] fadd_w_s2_align_frac  = ex1_d_csa_s >>(ex1_d_zero?(9'd25+`PEXT):fadd_w_exp_comp?fadd_w_exp_diff:0); //¢£¢£¢£
  wire [24+`PEXT:0] fadd_w_s3_align_frac  = ex1_d_csa_c >>(ex1_d_zero?(9'd25+`PEXT):fadd_w_exp_comp?fadd_w_exp_diff:0); //¢£¢£¢£
/*wire [25+`PEXT:0] s6_0;*/ wire [25+`PEXT:0] s6_1;   wire [25+`PEXT:0] s6_2;
/*wire [25+`PEXT:0] c6_0;*/ wire [25+`PEXT:0] c6_1;   wire [25+`PEXT:0] c6_2;
/*wire [25+`PEXT:0] s7_0;*/ wire [25+`PEXT:0] s7_1;   wire [25+`PEXT:0] s7_2;
/*wire [25+`PEXT:0] c7_0;*/ wire [25+`PEXT:0] c7_1;   wire [25+`PEXT:0] c7_2;
  wire [25+`PEXT:0] si_x = (fadd_s1_s==ex1_d_s) ? {1'b0,fadd_w_s1_align_frac}:~{1'b0,fadd_w_s1_align_frac};
  wire 	            ci_x = (fadd_s1_s==ex1_d_s) ?  1'b0:1'b1;
  nbit_csa #(26+`PEXT) csa_s6_1 ( .ai( {1'b0,fadd_w_s1_align_frac}), .bi(~{1'b0,fadd_w_s2_align_frac}), .ci(~{1'b0,fadd_w_s3_align_frac}), .so(s6_1), .co(c6_1));
  nbit_csa #(26+`PEXT) csa_s6_2 ( .ai(                        si_x), .bi( {1'b0,fadd_w_s2_align_frac}), .ci( {1'b0,fadd_w_s3_align_frac}), .so(s6_2), .co(c6_2));
  nbit_csa #(26+`PEXT) csa_s7_1 ( .ai(     {c6_1[24+`PEXT:0],1'b1}), .bi(                        s6_1), .ci(   {{(25+`PEXT){1'b0}},1'b1}), .so(s7_1), .co(c7_1));
  nbit_csa #(26+`PEXT) csa_s7_2 ( .ai(     {c6_2[24+`PEXT:0],ci_x}), .bi(                        s6_2), .ci(   {{(25+`PEXT){1'b0}},1'b0}), .so(s7_2), .co(c7_2));
//    assign ex2_d_frac1            =  fadd_w_s1_align_frac+(fadd_w_s2_align_frac+fadd_w_s3_align_frac);
//    assign ex2_d_frac2            =  fadd_w_s1_align_frac-(fadd_w_s2_align_frac+fadd_w_s3_align_frac);
//    assign ex2_d_frac3            = -fadd_w_s1_align_frac+(fadd_w_s2_align_frac+fadd_w_s3_align_frac);
  wire [24+`PEXT:0] ex2_d_frac1     = {c7_1[24+`PEXT:0],1'b0}+s7_1; //¢£¢£¢£
  wire [25+`PEXT:0] ex2_d_frac2     = {c7_2[24+`PEXT:0],1'b0}+s7_2; //¢£¢£¢£
  wire r_ex2_d_s                    = (fadd_s1_s==ex1_d_s || ex2_d_frac2[25+`PEXT]) ? fadd_s1_s   : ex1_d_s; //¢£¢£¢£
  wire [ 8:0] r_ex2_d_exp           = fadd_w_align_exp;
  wire [25+`PEXT:0] r_ex2_d_frac    = (fadd_s1_s!=ex1_d_s && ex2_d_frac2[25+`PEXT]) ? ex2_d_frac1 : ex2_d_frac2; //¢£¢£¢£
  wire r_ex2_d_inf                  = (~fadd_s1_s & fadd_s1_inf & ~( ex1_d_s   & ex1_d_inf)   & ~ex1_d_nan)
                                    | ( fadd_s1_s & fadd_s1_inf & ~(~ex1_d_s   & ex1_d_inf)   & ~ex1_d_nan)
                                    | (~ex1_d_s   & ex1_d_inf   & ~( fadd_s1_s & fadd_s1_inf) & ~fadd_s1_nan)
                                    | ( ex1_d_s   & ex1_d_inf   & ~(~fadd_s1_s & fadd_s1_inf) & ~fadd_s1_nan) ;
  wire r_ex2_d_nan                  = fadd_s1_nan || ex1_d_nan;
  nbit_register #(1) ex2_d_s_r          ( .ACLK(ACLK), .RSTN(RSTN), .d(r_ex2_d_s   ),  .q(ex2_d_s   ));  //slice 2
  nbit_register #(9) ex2_d_exp_r        ( .ACLK(ACLK), .RSTN(RSTN), .d(r_ex2_d_exp ),  .q(ex2_d_exp ));  //slice 2
  nbit_register #(26+`PEXT)ex2_d_frac_r ( .ACLK(ACLK), .RSTN(RSTN), .d(r_ex2_d_frac),  .q(ex2_d_frac));  //slice 2 //¢£¢£¢£
  nbit_register #(1) ex2_d_inf_r        ( .ACLK(ACLK), .RSTN(RSTN), .d(r_ex2_d_inf ),  .q(ex2_d_inf ));  //slice 2
  nbit_register #(1) ex2_d_nan_r        ( .ACLK(ACLK), .RSTN(RSTN), .d(r_ex2_d_nan ),  .q(ex2_d_nan ));  //slice 2
endmodule
`endif

`ifdef ENABLE_SPU
module spu2
(
  input  wire                      ACLK,
  input  wire                      RSTN,
  input  wire [`SPU_DATA_LOG2-1:0] sfmapc0,
  input  wire [`SPU_DATA_LOG2-1:0] sfmanc0,
  input  wire [`SPU_DATA_LOG2-1:0] sfmapc1,
  input  wire [`SPU_DATA_LOG2-1:0] sfmanc1,
  input  wire [`SPU_DATA_LOG2-1:0] sfmapc2,
  input  wire [`SPU_DATA_LOG2-1:0] sfmanc2,
  input  wire [`SPU_DATA_LOG2-1:0] sfmapc3,
  input  wire [`SPU_DATA_LOG2-1:0] sfmanc3,
  input  wire [`SPU_DATA_LOG2-1:0] sfmapc4,
  input  wire [`SPU_DATA_LOG2-1:0] sfmanc4,
  input  wire [`SPU_DATA_LOG2-1:0] sfmapc5,
  input  wire [`SPU_DATA_LOG2-1:0] sfmanc5,
  input  wire [`SPU_DATA_LOG2-1:0] sfmapc6,
  input  wire [`SPU_DATA_LOG2-1:0] sfmanc6,
  input  wire [`SPU_DATA_LOG2-1:0] sfmapc7,
  input  wire [`SPU_DATA_LOG2-1:0] sfmanc7,
  input  wire [2:0]                ex4,
  output wire [31:0]               so
);
//  pc = 0;
//  nc = 0;
//  for (j=0; j<SPU_DATA_BITS; j++) {
//    for (i=0; i<8; i++) {
//	if (!(o1[i]>>63)) pc += (o1[i] & (1LL<<j))!=0;
//	else              nc += (o1[i] & (1LL<<j))!=0;
//    }
//  }
//  pc = pc>>r4;
//  nc = nc>>r4;
//  *o2 = (Ull)(pc&0xffff)<<32 | (Ull)(nc&0xffff);

// sfmax8ËÜ¤Î³Æ¡¹²¼°Ì8bit¤Î¤ß¤ÎÁíÏÂ¤Ç1¤ÎÁí¿ô¤ò¶á»÷(80bit->81bit)
// sfma0 1 1 1 1 1 1 1 1 1 1 sfma1 1 1 1 1 1 1 1 1 1 1 sfma2 1 1 1 1 1 1 1 1 1 1 ...sfma7... 1 1 1 0
//       ----- ----- ----- ----------- ----- ----- ----------- ----- ----- -----             - -----
//          11    11    11          11    11    11          11    11    11    11                  10
//          --------------          --------------          --------------    ----------  ----------
//                      11                      11                      11            11          11
//                     11                      11                      11            11          11
//                     ---ADDER                ---ADDER                ---ADDER      ---ADDER    ---ADDER
//       9groups      1001(max)               1001(max)               1001(max)     1001(max)   1001(max)
//                    ----------------------------------------------------   
//                                                                      11
//                                                                     11
//                                                                    11
//                                                                   11
//       3group                                                      11011(max)
//                                                                   -------------------------------
//

   wire [`SPU_DATA_LOG2+2:0] pc  = (sfmapc0+sfmapc1+sfmapc2+sfmapc3+sfmapc4+sfmapc5+sfmapc6+sfmapc7);
   wire [`SPU_DATA_LOG2+2:0] nc  = (sfmanc0+sfmanc1+sfmanc2+sfmanc3+sfmanc4+sfmanc5+sfmanc6+sfmanc7);

   wire [`SPU_DATA_LOG2+2:0] pcs = pc >> ex4;
   wire [`SPU_DATA_LOG2+2:0] ncs = nc >> ex4;
   
   wire [31:0] r_so  = {{(16-(`SPU_DATA_LOG2+3)){1'b0}},pcs,{(16-(`SPU_DATA_LOG2+3)){1'b0}},ncs};

   nbit_register #(32) sfma_so_r  (.ACLK(ACLK), .RSTN(RSTN), .d(r_so),  .q(so));
endmodule
`endif

module eag //¡úMEX
(
  input  wire [`EXRING_ADDR_BITS-1:0] eab,
  input  wire [`EXRING_ADDR_BITS-1:0] eao,
  output wire [`EXRING_ADDR_BITS-1:0] ead
);

  assign ead = eab + eao;
endmodule
