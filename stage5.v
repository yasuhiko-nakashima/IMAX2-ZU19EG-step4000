/*
 *-----------------------------------------------------------------------------
 * Title         : stage5
 * Project       : EMAX6
 *-----------------------------------------------------------------------------
 * File          : stage5.v
 * Author        : Nakashima
 *                <nakashim@is.naist.jp>
 *                 Yamano
 *                <yamano.ryusuke.yo7@is.naist.jp>
 * Created       : 10.20.2017
 * Last modified : 10.20.2017
 *-----------------------------------------------------------------------------
 * Description : lmmからデータ取り出しとdouble buffer boundary register制御
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
/* stage5 */
module stage5
  (
   input  wire                                 ACLK,
   input  wire                                 RSTN,
   input  wire                                 UNIRSTN,
   input  wire [1:0]                           cmd,
   input  wire [`EMAX_NCHIP_BITS-1:0]          chip,
   input  wire [`EMAX_ROW_BITS-1:0]            l_row,
   input  wire [`EMAX_ROW_BITS:0]              scon_count,
   input  wire                                 unit1_exec,
   input  wire [`CONF_BITS-1:0]                conf0,
   input  wire [`CONF_BITS-1:0]                conf1,
   input  wire [`CONF_BITS-1:0]                conf2,
   input  wire [`CONF_BITS-1:0]                conf3,
   input  wire                                 tr_valid,
   input  wire [`LMRING_TR_BITS-1:0]           tr,
   input  wire                                 lmring_ful1,
   /* br bit field                                                      */
   /* |1023  col3  768|767   col2  512|511   col1  256|255    col0   0| */
   /* | 3 | 2 | 1 | 0 | 3 | 2 | 1 | 0 | 3 | 2 | 1 | 0 | 3 | 2 | 1 | 0 | */
   input  wire [`REG_DATA_BITS-1:0]            tx0i,
   input  wire [`REG_DATA_BITS-1:0]            tx1i,
   input  wire [`REG_DATA_BITS-1:0]            tx2i,
   input  wire [`REG_DATA_BITS-1:0]            tx3i,
   input  wire [`REG_DATA_BITS-1:0]            exdi,
   input  wire [`EXRING_ADDR_BITS-1:0]         ea0di,
   input  wire [`EXRING_ADDR_BITS-1:0]         ea0woofsi,//★MEX
   input  wire [`EXRING_ADDR_BITS-1:0]         ea1di,
   input  wire [`EXRING_ADDR_BITS-1:0]         ea1woofsi,//★MEX
   input  wire [`BREG_BITS-1:0]                mr0,
   input  wire [`BREG_BITS-1:0]                mr1,
   output reg  [`EXE_WORD_BITS-1:0]            mexmr0d, //★MEX
   output reg  [`EXE_WORD_BITS-1:0]            mexmr1d, //★MEX
   output wire [`BREG_BITS*`EMAX_WIDTH-1:0]    bout,
   output reg                                  bout_valid
   );
   // synopsys template

   function [`REG_DATA_BITS*2-1:0] ld_ext;
      input [4:0]                   mop1;
      input [`EXRING_ADDR_BITS-1:0] adr1;
      input [`REG_DATA_BITS-1:0]    din1;
      input [4:0]                   mop0;
      input [`EXRING_ADDR_BITS-1:0] adr0;
      input [`REG_DATA_BITS-1:0]    din0;
      reg   [`REG_DATA_BITS-1:0]    dout1; // alignされている場合,通常の下位64bit unalignedの場合,low 側には完全な下位64bit
      reg   [`REG_DATA_BITS-1:0]    dout0; // alignされている場合,通常の上位64bit unalignedの場合,high側は不完全な上位64bit(不足分は0)
      begin
	case (mop1)
	  `OP_LDWR: begin
	    case (adr1[2])
	      1'b0: dout1 = {32'h00000000,         din1[31: 0]};
	      1'b1: dout1 = {32'h00000000,         din1[63:32]};
	    endcase
	  end
	  `OP_LDBR: begin
	    case (adr1[2:0])
	      3'b000: dout1 = {56'h00000000000000, din1[ 7: 0]};
	      3'b001: dout1 = {56'h00000000000000, din1[15: 8]};
	      3'b010: dout1 = {56'h00000000000000, din1[23:16]};
	      3'b011: dout1 = {56'h00000000000000, din1[31:24]};
	      3'b100: dout1 = {56'h00000000000000, din1[39:32]};
	      3'b101: dout1 = {56'h00000000000000, din1[47:40]};
	      3'b110: dout1 = {56'h00000000000000, din1[55:48]};
	      3'b111: dout1 = {56'h00000000000000, din1[63:56]};
	    endcase
	  end
	  default: begin // unaligned load `OP_LDR
	    case (adr1[2:0])
	      3'b000: dout1 = {                    din1[63: 0]};
	      3'b001: dout1 = { 8'h00,             din1[63: 8]};
	      3'b010: dout1 = {16'h0000,           din1[63:16]};
	      3'b011: dout1 = {24'h000000,         din1[63:24]};
	      3'b100: dout1 = {32'h00000000,       din1[63:32]};
	      3'b101: dout1 = {40'h0000000000,     din1[63:40]};
	      3'b110: dout1 = {48'h000000000000,   din1[63:48]};
	      3'b111: dout1 = {56'h00000000000000, din1[63:56]};
	    endcase
	  end
	endcase

	case (mop0)
	  `OP_LDWR: begin
	    case (adr0[2])
	      1'b0:   dout0 = {32'h00000000,       din0[31: 0]};
	      1'b1:   dout0 = {32'h00000000,       din0[63:32]};
	    endcase
	  end
	  `OP_LDBR: begin
	    case (adr0[2:0])
	      3'b000: dout0 = {56'h00000000000000, din0[ 7: 0]};
	      3'b001: dout0 = {56'h00000000000000, din0[15: 8]};
	      3'b010: dout0 = {56'h00000000000000, din0[23:16]};
	      3'b011: dout0 = {56'h00000000000000, din0[31:24]};
	      3'b100: dout0 = {56'h00000000000000, din0[39:32]};
	      3'b101: dout0 = {56'h00000000000000, din0[47:40]};
	      3'b110: dout0 = {56'h00000000000000, din0[55:48]};
	      3'b111: dout0 = {56'h00000000000000, din0[63:56]};
	    endcase
	  end
	  default: begin // unaligned load `OP_LDR
	    case (adr0[2:0])
	      3'b000: dout0 = {             din0[63: 0]};
	      3'b001: dout0 = {din1[ 7: 0], din0[63: 8]};
	      3'b010: dout0 = {din1[15: 0], din0[63:16]};
	      3'b011: dout0 = {din1[23: 0], din0[63:24]};
	      3'b100: dout0 = {din1[31: 0], din0[63:32]};
	      3'b101: dout0 = {din1[39: 0], din0[63:40]};
	      3'b110: dout0 = {din1[47: 0], din0[63:48]};
	      3'b111: dout0 = {din1[55: 0], din0[63:56]};
	    endcase
	  end
	endcase
	ld_ext = {dout1,dout0};
      end
   endfunction

   reg  [1:0]                        cycle;
   reg 				     bfb; /* breg 0:front 1:back */
   reg [`BREG_BITS*`EMAX_WIDTH-1:0]  fb; /* 256 * 4 */
   reg [`BREG_BITS*`EMAX_WIDTH-1:0]  bb; /* 256 * 4 */
   assign bout = (cmd==`CMD_SCON) ?  fb: /* SCONでは表面しか使わない */
                           ((bfb) ?  bb:fb);

   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN) begin
       cycle <= 2'h0;
     end
     else begin
       cycle <= cycle + 2'h1;
     end
   end

   wire [`CONF_BITS-1:0] conf = (cycle==2'h0)?conf0:(cycle==2'h1)?conf1:(cycle==2'h2)?conf2:conf3;
   
   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN) begin
       bfb <= 1'b0;
     end
     else begin
       if(cycle==2'd3) bfb <= ~bfb;
       else            bfb <=  bfb;
     end
   end

   wire [30:0]                   tr_addr = tr[`LMRING_TR_A];
   wire [31:0] 			 tr_dm   = tr[`LMRING_TR_DM];
   wire [`LMRING_DATA_BITS-1:0]  tr_d    = tr[`LMRING_TR_D];
   wire [`EMAX_NCHIP_BITS-1:0] 	 cdx     = tr_addr[16+`EMAX_NCHIP_BITS-1:16]; // selecting chip
   wire [`EMAX_ROW_BITS-1:0] 	 row     = tr_addr[12:7]; // selecting logical unit
   wire [1:0] 			 col     = tr_addr[6:5];

   wire [`EXRING_ADDR_BITS-1:0]  a0 = ea0di;
   wire [`EXRING_ADDR_BITS-1:0]  a1 = ea1di;
   wire [1:0] 			 mr0mux = a0[4:3];
   wire [1:0] 			 mr1mux = a1[4:3];
   wire [`REG_DATA_BITS-1:0] 	 mr0d = (mr0mux==2'd3)? mr0[64*3+63:64*3]:
                                        (mr0mux==2'd2)? mr0[64*2+63:64*2]:
                                        (mr0mux==2'd1)? mr0[64*1+63:64*1]:
                                                        mr0[64*0+63:64*0];
   wire [`REG_DATA_BITS-1:0] 	 mr1d = (mr1mux==2'd3)? mr1[64*3+63:64*3]:
                                        (mr1mux==2'd2)? mr1[64*2+63:64*2]:
                                        (mr1mux==2'd1)? mr1[64*1+63:64*1]:
                                                        mr1[64*0+63:64*0];

   wire [`REG_DATA_BITS*2-1:0] 	 ld_extout = ld_ext(`conf_ea1op, a1, mr1d, `conf_ea0op, a0, mr0d);

   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN|~UNIRSTN) begin
       mexmr0d <= {(`EXE_WORD_BITS){1'b0}}; //★MEX
       mexmr1d <= {(`EXE_WORD_BITS){1'b0}}; //★MEX
     end
     else begin
       mexmr0d <= mr0d[`REG_DATA_BITS-1:`EXE_WORD_BITS]; //★MEX
       mexmr1d <= mr1d[`REG_DATA_BITS-1:`EXE_WORD_BITS]; //★MEX
     end
   end
 			
   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN|~UNIRSTN) begin
       fb <= {(`BREG_BITS*`EMAX_WIDTH){1'b0}};
       bb <= {(`BREG_BITS*`EMAX_WIDTH){1'b0}};
     end
     else begin
       if (cmd==`CMD_NOP && lmring_ful1 && (chip == cdx || cdx == `EMAX_NCHIP_BITS'd0) && l_row == row && tr[`LMRING_TR_TY]==3'd1) begin /* reg setup by PIO 自rowに一致 */
	 case (col)
	   2'h3: begin /* 裏表両方に書き込んでいるが，本当は表面だけでよいかもしれない */
	     if (tr_dm[28]) begin fb[256*3+8*31+7 :256*3+8*28] <= tr_d[32*8-1:28*8]; bb[256*3+8*31+7 :256*3+8*28] <= tr_d[32*8-1:28*8]; end
	     if (tr_dm[24]) begin fb[256*3+8*27+7 :256*3+8*24] <= tr_d[28*8-1:24*8]; bb[256*3+8*27+7 :256*3+8*24] <= tr_d[28*8-1:24*8]; end
	     if (tr_dm[20]) begin fb[256*3+8*23+7 :256*3+8*20] <= tr_d[24*8-1:20*8]; bb[256*3+8*23+7 :256*3+8*20] <= tr_d[24*8-1:20*8]; end
	     if (tr_dm[16]) begin fb[256*3+8*19+7 :256*3+8*16] <= tr_d[20*8-1:16*8]; bb[256*3+8*19+7 :256*3+8*16] <= tr_d[20*8-1:16*8]; end
	     if (tr_dm[12]) begin fb[256*3+8*15+7 :256*3+8*12] <= tr_d[16*8-1:12*8]; bb[256*3+8*15+7 :256*3+8*12] <= tr_d[16*8-1:12*8]; end
	     if (tr_dm[ 8]) begin fb[256*3+8*11+7 :256*3+8* 8] <= tr_d[12*8-1: 8*8]; bb[256*3+8*11+7 :256*3+8* 8] <= tr_d[12*8-1: 8*8]; end
	     if (tr_dm[ 4]) begin fb[256*3+8* 7+7 :256*3+8* 4] <= tr_d[ 8*8-1: 4*8]; bb[256*3+8* 7+7 :256*3+8* 4] <= tr_d[ 8*8-1: 4*8]; end
	     if (tr_dm[ 0]) begin fb[256*3+8* 3+7 :256*3+8* 0] <= tr_d[ 4*8-1: 0*8]; bb[256*3+8* 3+7 :256*3+8* 0] <= tr_d[ 4*8-1: 0*8]; end
	   end
	   2'h2: begin
	     if (tr_dm[28]) begin fb[256*2+8*31+7 :256*2+8*28] <= tr_d[32*8-1:28*8]; bb[256*2+8*31+7 :256*2+8*28] <= tr_d[32*8-1:28*8]; end
	     if (tr_dm[24]) begin fb[256*2+8*27+7 :256*2+8*24] <= tr_d[28*8-1:24*8]; bb[256*2+8*27+7 :256*2+8*24] <= tr_d[28*8-1:24*8]; end
	     if (tr_dm[20]) begin fb[256*2+8*23+7 :256*2+8*20] <= tr_d[24*8-1:20*8]; bb[256*2+8*23+7 :256*2+8*20] <= tr_d[24*8-1:20*8]; end
	     if (tr_dm[16]) begin fb[256*2+8*19+7 :256*2+8*16] <= tr_d[20*8-1:16*8]; bb[256*2+8*19+7 :256*2+8*16] <= tr_d[20*8-1:16*8]; end
	     if (tr_dm[12]) begin fb[256*2+8*15+7 :256*2+8*12] <= tr_d[16*8-1:12*8]; bb[256*2+8*15+7 :256*2+8*12] <= tr_d[16*8-1:12*8]; end
	     if (tr_dm[ 8]) begin fb[256*2+8*11+7 :256*2+8* 8] <= tr_d[12*8-1: 8*8]; bb[256*2+8*11+7 :256*2+8* 8] <= tr_d[12*8-1: 8*8]; end
	     if (tr_dm[ 4]) begin fb[256*2+8* 7+7 :256*2+8* 4] <= tr_d[ 8*8-1: 4*8]; bb[256*2+8* 7+7 :256*2+8* 4] <= tr_d[ 8*8-1: 4*8]; end
	     if (tr_dm[ 0]) begin fb[256*2+8* 3+7 :256*2+8* 0] <= tr_d[ 4*8-1: 0*8]; bb[256*2+8* 3+7 :256*2+8* 0] <= tr_d[ 4*8-1: 0*8]; end
	   end
	   2'h1: begin
	     if (tr_dm[28]) begin fb[256*1+8*31+7 :256*1+8*28] <= tr_d[32*8-1:28*8]; bb[256*1+8*31+7 :256*1+8*28] <= tr_d[32*8-1:28*8]; end
	     if (tr_dm[24]) begin fb[256*1+8*27+7 :256*1+8*24] <= tr_d[28*8-1:24*8]; bb[256*1+8*27+7 :256*1+8*24] <= tr_d[28*8-1:24*8]; end
	     if (tr_dm[20]) begin fb[256*1+8*23+7 :256*1+8*20] <= tr_d[24*8-1:20*8]; bb[256*1+8*23+7 :256*1+8*20] <= tr_d[24*8-1:20*8]; end
	     if (tr_dm[16]) begin fb[256*1+8*19+7 :256*1+8*16] <= tr_d[20*8-1:16*8]; bb[256*1+8*19+7 :256*1+8*16] <= tr_d[20*8-1:16*8]; end
	     if (tr_dm[12]) begin fb[256*1+8*15+7 :256*1+8*12] <= tr_d[16*8-1:12*8]; bb[256*1+8*15+7 :256*1+8*12] <= tr_d[16*8-1:12*8]; end
	     if (tr_dm[ 8]) begin fb[256*1+8*11+7 :256*1+8* 8] <= tr_d[12*8-1: 8*8]; bb[256*1+8*11+7 :256*1+8* 8] <= tr_d[12*8-1: 8*8]; end
	     if (tr_dm[ 4]) begin fb[256*1+8* 7+7 :256*1+8* 4] <= tr_d[ 8*8-1: 4*8]; bb[256*1+8* 7+7 :256*1+8* 4] <= tr_d[ 8*8-1: 4*8]; end
	     if (tr_dm[ 0]) begin fb[256*1+8* 3+7 :256*1+8* 0] <= tr_d[ 4*8-1: 0*8]; bb[256*1+8* 3+7 :256*1+8* 0] <= tr_d[ 4*8-1: 0*8]; end
	   end
	   default: begin
	     if (tr_dm[28]) begin fb[256*0+8*31+7 :256*0+8*28] <= tr_d[32*8-1:28*8]; bb[256*0+8*31+7 :256*0+8*28] <= tr_d[32*8-1:28*8]; end
	     if (tr_dm[24]) begin fb[256*0+8*27+7 :256*0+8*24] <= tr_d[28*8-1:24*8]; bb[256*0+8*27+7 :256*0+8*24] <= tr_d[28*8-1:24*8]; end
	     if (tr_dm[20]) begin fb[256*0+8*23+7 :256*0+8*20] <= tr_d[24*8-1:20*8]; bb[256*0+8*23+7 :256*0+8*20] <= tr_d[24*8-1:20*8]; end
	     if (tr_dm[16]) begin fb[256*0+8*19+7 :256*0+8*16] <= tr_d[20*8-1:16*8]; bb[256*0+8*19+7 :256*0+8*16] <= tr_d[20*8-1:16*8]; end
	     if (tr_dm[12]) begin fb[256*0+8*15+7 :256*0+8*12] <= tr_d[16*8-1:12*8]; bb[256*0+8*15+7 :256*0+8*12] <= tr_d[16*8-1:12*8]; end
	     if (tr_dm[ 8]) begin fb[256*0+8*11+7 :256*0+8* 8] <= tr_d[12*8-1: 8*8]; bb[256*0+8*11+7 :256*0+8* 8] <= tr_d[12*8-1: 8*8]; end
	     if (tr_dm[ 4]) begin fb[256*0+8* 7+7 :256*0+8* 4] <= tr_d[ 8*8-1: 4*8]; bb[256*0+8* 7+7 :256*0+8* 4] <= tr_d[ 8*8-1: 4*8]; end
	     if (tr_dm[ 0]) begin fb[256*0+8* 3+7 :256*0+8* 0] <= tr_d[ 4*8-1: 0*8]; bb[256*0+8* 3+7 :256*0+8* 0] <= tr_d[ 4*8-1: 0*8]; end
	   end
	 endcase
       end
       else if (cmd==`CMD_SCON && unit1_exec && !(scon_count[0])) begin /* SCONでは表面しか使わない */
	 if (cycle==2'd0) fb[ 255:   0] <= conf0;
	 if (cycle==2'd1) fb[ 511: 256] <= conf1;
	 if (cycle==2'd2) fb[ 767: 512] <= conf2;
	 if (cycle==2'd3) fb[1023: 768] <= conf3;
	 bb <= bb;
       end
       else if (cmd==`CMD_EXEC && !bfb) begin /* 下のユニットにはfbが見えている bbに書き込み */
	 fb <= fb;
	 /* load mr -> br0 */  /* brs0: 0:off, 1:mr10, 2:tr0, 3:mr0 */
	 if (cycle==2'd3) begin       /* ===================================== bb cycle 3 ============================================================= */
	   case (`conf_brs0)
	     2'd1:    bb[256*3+64*0+63:256*3+64*0] <= mr1[64*0+63:64*0];            /* 1:mr10 align不要 */
	     2'd2:    bb[256*3+64*0+63:256*3+64*0] <= tx0i;                         /* 2:tr0  align不要 */
	     2'd3:    bb[256*3+64*0+63:256*3+64*0] <= ld_extout[`REG_DATA_BITS-1:0];/* 3:mr0  align必要 */
	     default: bb[256*3+64*0+63:256*3+64*0] <= bb[256*3+64*0+63:256*3+64*0];
	   endcase
	   /* load mr -> br1 */  /* brs1: 0:off, 1:mr11, 2:tr1, 3:mr1 */
	   case (`conf_brs1)
	     2'd1:    bb[256*3+64*1+63:256*3+64*1] <= mr1[64*1+63:64*1];            /* 1:mr11 align不要 */
	     2'd2:    bb[256*3+64*1+63:256*3+64*1] <= tx1i;                         /* 2:tr1  align不要 */
	     2'd3:    bb[256*3+64*1+63:256*3+64*1] <= ld_extout[`REG_DATA_BITS*2-1:`REG_DATA_BITS];/* 3:mr1  align必要 */
	     default: bb[256*3+64*1+63:256*3+64*1] <= bb[256*3+64*1+63:256*3+64*1];
	   endcase
	   /* load mr -> br2 */  /* brs2: 0:off, 1:mr12, 2:tr2, 3:exdr(brs3=3の場合,ea0woofsに接続) */
	   case (`conf_brs2)
	     2'd1:    bb[256*3+64*2+63:256*3+64*2] <= mr1[64*2+63:64*2];            /* 1:mr12 align不要 */
	     2'd2:    bb[256*3+64*2+63:256*3+64*2] <= tx2i;                         /* 2:tr2  align不要 */
	     2'd3:    bb[256*3+64*2+63:256*3+64*2] <= (`conf_brs3!=2'd3)?exdi:ea0woofsi;/* 3:exdr align不要 */
	     default: bb[256*3+64*2+63:256*3+64*2] <= bb[256*3+64*2+63:256*3+64*2];
	   endcase
	   /* load mr -> br3 */  /* brs3: 0:off, 1:mr13, 2:tr3, 3:ea1woofs */
	   case (`conf_brs3)
	     2'd1:    bb[256*3+64*3+63:256*3+64*3] <= mr1[64*3+63:64*3];            /* 1:mr13 align不要 */
	     2'd2:    bb[256*3+64*3+63:256*3+64*3] <= tx3i;                         /* 2:tr3  align不要 */
	     2'd3:    bb[256*3+64*3+63:256*3+64*3] <= ea1woofsi;                    /* 2:tr3  align不要 */
	     default: bb[256*3+64*3+63:256*3+64*3] <= bb[256*3+64*3+63:256*3+64*3];
	   endcase
	 end
	 else if (cycle==2'd2) begin        /* ===================================== bb cycle 2 ============================================================= */
	   case (`conf_brs0)
	     2'd1:    bb[256*2+64*0+63:256*2+64*0] <= mr1[64*0+63:64*0];            /* 1:mr10 align不要 */
	     2'd2:    bb[256*2+64*0+63:256*2+64*0] <= tx0i;                         /* 2:tr0  align不要 */
	     2'd3:    bb[256*2+64*0+63:256*2+64*0] <= ld_extout[`REG_DATA_BITS-1:0];/* 3:mr0  align必要 */
	     default: bb[256*2+64*0+63:256*2+64*0] <= bb[256*2+64*0+63:256*2+64*0];
	   endcase
	   /* load mr -> br1 */  /* brs1: 0:off, 1:mr11, 2:tr1, 3:mr1 */
	   case (`conf_brs1)
	     2'd1:    bb[256*2+64*1+63:256*2+64*1] <= mr1[64*1+63:64*1];            /* 1:mr11 align不要 */
	     2'd2:    bb[256*2+64*1+63:256*2+64*1] <= tx1i;                         /* 2:tr1  align不要 */
	     2'd3:    bb[256*2+64*1+63:256*2+64*1] <= ld_extout[`REG_DATA_BITS*2-1:`REG_DATA_BITS];/* 3:mr1  align必要 */
	     default: bb[256*2+64*1+63:256*2+64*1] <= bb[256*2+64*1+63:256*2+64*1];
	   endcase
	   /* load mr -> br2 */  /* brs2: 0:off, 1:mr12, 2:tr2, 3:exdr(brs3=3の場合,ea0woofsに接続) */
	   case (`conf_brs2)
	     2'd1:    bb[256*2+64*2+63:256*2+64*2] <= mr1[64*2+63:64*2];            /* 1:mr12 align不要 */
	     2'd2:    bb[256*2+64*2+63:256*2+64*2] <= tx2i;                         /* 2:tr2  align不要 */
	     2'd3:    bb[256*2+64*2+63:256*2+64*2] <= (`conf_brs3!=2'd3)?exdi:ea0woofsi;/* 3:exdr align不要 */
	     default: bb[256*2+64*2+63:256*2+64*2] <= bb[256*2+64*2+63:256*2+64*2];
	   endcase
	   /* load mr -> br3 */  /* brs3: 0:off, 1:mr13, 2:tr3, 3:ea1woofs */
	   case (`conf_brs3)
	     2'd1:    bb[256*2+64*3+63:256*2+64*3] <= mr1[64*3+63:64*3];            /* 1:mr13 align不要 */
	     2'd2:    bb[256*2+64*3+63:256*2+64*3] <= tx3i;                         /* 2:tr3  align不要 */
	     2'd3:    bb[256*2+64*3+63:256*2+64*3] <= ea1woofsi;                    /* 2:tr3  align不要 */
	     default: bb[256*2+64*3+63:256*2+64*3] <= bb[256*2+64*3+63:256*2+64*3];
	   endcase
	 end
	 else if (cycle==2'd1) begin         /* ===================================== bb cycle 1 ============================================================= */
	   case (`conf_brs0)
	     2'd1:    bb[256*1+64*0+63:256*1+64*0] <= mr1[64*0+63:64*0];            /* 1:mr10 align不要 */
	     2'd2:    bb[256*1+64*0+63:256*1+64*0] <= tx0i;                         /* 2:tr0  align不要 */
	     2'd3:    bb[256*1+64*0+63:256*1+64*0] <= ld_extout[`REG_DATA_BITS-1:0];/* 3:mr0  align必要 */
	     default: bb[256*1+64*0+63:256*1+64*0] <= bb[256*1+64*0+63:256*1+64*0];
	   endcase
	   /* load mr -> br1 */  /* brs1: 0:off, 1:mr11, 2:tr1, 3:mr1 */
	   case (`conf_brs1)
	     2'd1:    bb[256*1+64*1+63:256*1+64*1] <= mr1[64*1+63:64*1];            /* 1:mr11 align不要 */
	     2'd2:    bb[256*1+64*1+63:256*1+64*1] <= tx1i;                         /* 2:tr1  align不要 */
	     2'd3:    bb[256*1+64*1+63:256*1+64*1] <= ld_extout[`REG_DATA_BITS*2-1:`REG_DATA_BITS];/* 3:mr1  align必要 */
	     default: bb[256*1+64*1+63:256*1+64*1] <= bb[256*1+64*1+63:256*1+64*1];
	   endcase
	   /* load mr -> br2 */  /* brs2: 0:off, 1:mr12, 2:tr2, 3:exdr(brs3=3の場合,ea0woofsに接続) */
	   case (`conf_brs2)
	     2'd1:    bb[256*1+64*2+63:256*1+64*2] <= mr1[64*2+63:64*2];            /* 1:mr12 align不要 */
	     2'd2:    bb[256*1+64*2+63:256*1+64*2] <= tx2i;                         /* 2:tr2  align不要 */
	     2'd3:    bb[256*1+64*2+63:256*1+64*2] <= (`conf_brs3!=2'd3)?exdi:ea0woofsi;/* 3:exdr align不要 */
	     default: bb[256*1+64*2+63:256*1+64*2] <= bb[256*1+64*2+63:256*1+64*2];
	   endcase
	   /* load mr -> br3 */  /* brs3: 0:off, 1:mr13, 2:tr3, 3:ea1woofs */
	   case (`conf_brs3)
	     2'd1:    bb[256*1+64*3+63:256*1+64*3] <= mr1[64*3+63:64*3];            /* 1:mr13 align不要 */
	     2'd2:    bb[256*1+64*3+63:256*1+64*3] <= tx3i;                         /* 2:tr3  align不要 */
	     2'd3:    bb[256*1+64*3+63:256*1+64*3] <= ea1woofsi;                    /* 2:tr3  align不要 */
	     default: bb[256*1+64*3+63:256*1+64*3] <= bb[256*1+64*3+63:256*1+64*3];
	   endcase
	 end
	 else begin  /* (cycle==2'd0) */          /* ===================================== bb cycle 0 ============================================================= */
	   case (`conf_brs0)
	     2'd1:    bb[256*0+64*0+63:256*0+64*0] <= mr1[64*0+63:64*0];            /* 1:mr10 align不要 */
	     2'd2:    bb[256*0+64*0+63:256*0+64*0] <= tx0i;                         /* 2:tr0  align不要 */
	     2'd3:    bb[256*0+64*0+63:256*0+64*0] <= ld_extout[`REG_DATA_BITS-1:0];/* 3:mr0  align必要 */
	     default: bb[256*0+64*0+63:256*0+64*0] <= bb[256*0+64*0+63:256*0+64*0];
	   endcase
	   /* load mr -> br1 */  /* brs1: 0:off, 1:mr11, 2:tr1, 3:mr1 */
	   case (`conf_brs1)
	     2'd1:    bb[256*0+64*1+63:256*0+64*1] <= mr1[64*1+63:64*1];            /* 1:mr11 align不要 */
	     2'd2:    bb[256*0+64*1+63:256*0+64*1] <= tx1i;                         /* 2:tr1  align不要 */
	     2'd3:    bb[256*0+64*1+63:256*0+64*1] <= ld_extout[`REG_DATA_BITS*2-1:`REG_DATA_BITS];/* 3:mr1  align必要 */
	     default: bb[256*0+64*1+63:256*0+64*1] <= bb[256*0+64*1+63:256*0+64*1];
	   endcase
	   /* load mr -> br2 */  /* brs2: 0:off, 1:mr12, 2:tr2, 3:exdr(brs3=3の場合,ea0woofsに接続) */
	   case (`conf_brs2)
	     2'd1:    bb[256*0+64*2+63:256*0+64*2] <= mr1[64*2+63:64*2];            /* 1:mr12 align不要 */
	     2'd2:    bb[256*0+64*2+63:256*0+64*2] <= tx2i;                         /* 2:tr2  align不要 */
	     2'd3:    bb[256*0+64*2+63:256*0+64*2] <= (`conf_brs3!=2'd3)?exdi:ea0woofsi;/* 3:exdr align不要 */
	     default: bb[256*0+64*2+63:256*0+64*2] <= bb[256*0+64*2+63:256*0+64*2];
	   endcase
	   /* load mr -> br3 */  /* brs3: 0:off, 1:mr13, 2:tr3, 3:ea1woofs */
	   case (`conf_brs3)
	     2'd1:    bb[256*0+64*3+63:256*0+64*3] <= mr1[64*3+63:64*3];            /* 1:mr13 align不要 */
	     2'd2:    bb[256*0+64*3+63:256*0+64*3] <= tx3i;                         /* 2:tr3  align不要 */
	     2'd3:    bb[256*0+64*3+63:256*0+64*3] <= ea1woofsi;                    /* 2:tr3  align不要 */
	     default: bb[256*0+64*3+63:256*0+64*3] <= bb[256*0+64*3+63:256*0+64*3];
	   endcase
	 end
       end
       else if (cmd==`CMD_EXEC && bfb) begin /*================================== 下のユニットにはbbが見えている fbに書き込み ================================================= */
	 bb <= bb;
	 /* load mr -> br0 */  /* brs0: 0:off, 1:mr10, 2:tr0, 3:mr0 */
	 if (cycle==2'd3) begin         /* ===================================== fb cycle 3 ============================================================= */
	   case (`conf_brs0) 
	     2'd1:    fb[256*3+64*0+63:256*3+64*0] <= mr1[64*0+63:64*0];            /* 1:mr10 align不要 */
	     2'd2:    fb[256*3+64*0+63:256*3+64*0] <= tx0i;                         /* 2:tr0  align不要 */
	     2'd3:    fb[256*3+64*0+63:256*3+64*0] <= ld_extout[`REG_DATA_BITS-1:0];/* 3:mr0  align必要 */
	     default: fb[256*3+64*0+63:256*3+64*0] <= fb[256*3+64*0+63:256*3+64*0];
	   endcase
	   /* load mr -> br1 */  /* brs1: 0:off, 1:mr11, 2:tr1, 3:mr1 */
	   case (`conf_brs1)
	     2'd1:    fb[256*3+64*1+63:256*3+64*1] <= mr1[64*1+63:64*1];            /* 1:mr11 align不要 */
	     2'd2:    fb[256*3+64*1+63:256*3+64*1] <= tx1i;                         /* 2:tr1  align不要 */
	     2'd3:    fb[256*3+64*1+63:256*3+64*1] <= ld_extout[`REG_DATA_BITS*2-1:`REG_DATA_BITS];/* 3:mr1  align必要 */
	     default: fb[256*3+64*1+63:256*3+64*1] <= fb[256*3+64*1+63:256*3+64*1];
	   endcase
	   /* load mr -> br2 */  /* brs2: 0:off, 1:mr12, 2:tr2, 3:exdr(brs3=3の場合,ea0woofsに接続) */
	   case (`conf_brs2)
	     2'd1:    fb[256*3+64*2+63:256*3+64*2] <= mr1[64*2+63:64*2];            /* 1:mr12 align不要 */
	     2'd2:    fb[256*3+64*2+63:256*3+64*2] <= tx2i;                         /* 2:tr2  align不要 */
	     2'd3:    fb[256*3+64*2+63:256*3+64*2] <= (`conf_brs3!=2'd3)?exdi:ea0woofsi;/* 3:exdr align不要 */
	     default: fb[256*3+64*2+63:256*3+64*2] <= fb[256*3+64*2+63:256*3+64*2];
	   endcase
	   /* load mr -> br3 */  /* brs3: 0:off, 1:mr13, 2:tr3, 3:ea1woofs */
	   case (`conf_brs3)
	     2'd1:    fb[256*3+64*3+63:256*3+64*3] <= mr1[64*3+63:64*3];            /* 1:mr13 align不要 */
	     2'd2:    fb[256*3+64*3+63:256*3+64*3] <= tx3i;                         /* 2:tr3  align不要 */
	     2'd3:    fb[256*3+64*3+63:256*3+64*3] <= ea1woofsi;                    /* 2:tr3  align不要 */
	     default: fb[256*3+64*3+63:256*3+64*3] <= fb[256*3+64*3+63:256*3+64*3];
	   endcase
	 end
	 else if (cycle==2'd2) begin         /* ===================================== fb cycle 2 ============================================================= */
	   case (`conf_brs0)
	     2'd1:    fb[256*2+64*0+63:256*2+64*0] <= mr1[64*0+63:64*0];            /* 1:mr10 align不要 */
	     2'd2:    fb[256*2+64*0+63:256*2+64*0] <= tx0i;                         /* 2:tr0  align不要 */
	     2'd3:    fb[256*2+64*0+63:256*2+64*0] <= ld_extout[`REG_DATA_BITS-1:0];/* 3:mr0  align必要 */
	     default: fb[256*2+64*0+63:256*2+64*0] <= fb[256*2+64*0+63:256*2+64*0];
	   endcase
	   /* load mr -> br1 */  /* brs1: 0:off, 1:mr11, 2:tr1, 3:mr1 */
	   case (`conf_brs1)
	     2'd1:    fb[256*2+64*1+63:256*2+64*1] <= mr1[64*1+63:64*1];            /* 1:mr11 align不要 */
	     2'd2:    fb[256*2+64*1+63:256*2+64*1] <= tx1i;                         /* 2:tr1  align不要 */
	     2'd3:    fb[256*2+64*1+63:256*2+64*1] <= ld_extout[`REG_DATA_BITS*2-1:`REG_DATA_BITS];/* 3:mr1  align必要 */
	     default: fb[256*2+64*1+63:256*2+64*1] <= fb[256*2+64*1+63:256*2+64*1];
	   endcase
	   /* load mr -> br2 */  /* brs2: 0:off, 1:mr12, 2:tr2, 3:exdr(brs3=3の場合,ea0woofsに接続) */
	   case (`conf_brs2)
	     2'd1:    fb[256*2+64*2+63:256*2+64*2] <= mr1[64*2+63:64*2];            /* 1:mr12 align不要 */
	     2'd2:    fb[256*2+64*2+63:256*2+64*2] <= tx2i;                         /* 2:tr2  align不要 */
	     2'd3:    fb[256*2+64*2+63:256*2+64*2] <= (`conf_brs3!=2'd3)?exdi:ea0woofsi;/* 3:exdr align不要 */
	     default: fb[256*2+64*2+63:256*2+64*2] <= fb[256*2+64*2+63:256*2+64*2];
	   endcase
	   /* load mr -> br3 */  /* brs3: 0:off, 1:mr13, 2:tr3, 3:ea1woofs */
	   case (`conf_brs3)
	     2'd1:    fb[256*2+64*3+63:256*2+64*3] <= mr1[64*3+63:64*3];            /* 1:mr13 align不要 */
	     2'd2:    fb[256*2+64*3+63:256*2+64*3] <= tx3i;                         /* 2:tr3  align不要 */
	     2'd3:    fb[256*2+64*3+63:256*2+64*3] <= ea1woofsi;                    /* 2:tr3  align不要 */
	     default: fb[256*2+64*3+63:256*2+64*3] <= fb[256*2+64*3+63:256*2+64*3];
	   endcase
	 end
	 else if (cycle==2'd1) begin         /* ===================================== fb cycle 1 ============================================================= */
	   case (`conf_brs0)
	     2'd1:    fb[256*1+64*0+63:256*1+64*0] <= mr1[64*0+63:64*0];            /* 1:mr10 align不要 */
	     2'd2:    fb[256*1+64*0+63:256*1+64*0] <= tx0i;                         /* 2:tr0  align不要 */
	     2'd3:    fb[256*1+64*0+63:256*1+64*0] <= ld_extout[`REG_DATA_BITS-1:0];/* 3:mr0  align必要 */
	     default: fb[256*1+64*0+63:256*1+64*0] <= fb[256*1+64*0+63:256*1+64*0];
	   endcase
	   /* load mr -> br1 */  /* brs1: 0:off, 1:mr11, 2:tr1, 3:mr1 */
	   case (`conf_brs1)
	     2'd1:    fb[256*1+64*1+63:256*1+64*1] <= mr1[64*1+63:64*1];            /* 1:mr11 align不要 */
	     2'd2:    fb[256*1+64*1+63:256*1+64*1] <= tx1i;                         /* 2:tr1  align不要 */
	     2'd3:    fb[256*1+64*1+63:256*1+64*1] <= ld_extout[`REG_DATA_BITS*2-1:`REG_DATA_BITS];/* 3:mr1  align必要 */
	     default: fb[256*1+64*1+63:256*1+64*1] <= fb[256*1+64*1+63:256*1+64*1];
	   endcase
	   /* load mr -> br2 */  /* brs2: 0:off, 1:mr12, 2:tr2, 3:exdr(brs3=3の場合,ea0woofsに接続) */
	   case (`conf_brs2)
	     2'd1:    fb[256*1+64*2+63:256*1+64*2] <= mr1[64*2+63:64*2];            /* 1:mr12 align不要 */
	     2'd2:    fb[256*1+64*2+63:256*1+64*2] <= tx2i;                         /* 2:tr2  align不要 */
	     2'd3:    fb[256*1+64*2+63:256*1+64*2] <= (`conf_brs3!=2'd3)?exdi:ea0woofsi;/* 3:exdr align不要 */
	     default: fb[256*1+64*2+63:256*1+64*2] <= fb[256*1+64*2+63:256*1+64*2];
	   endcase
	   /* load mr -> br3 */  /* brs3: 0:off, 1:mr13, 2:tr3, 3:ea1woofs */
	   case (`conf_brs3)
	     2'd1:    fb[256*1+64*3+63:256*1+64*3] <= mr1[64*3+63:64*3];            /* 1:mr13 align不要 */
	     2'd2:    fb[256*1+64*3+63:256*1+64*3] <= tx3i;                         /* 2:tr3  align不要 */
	     2'd3:    fb[256*1+64*3+63:256*1+64*3] <= ea1woofsi;                    /* 2:tr3  align不要 */
	     default: fb[256*1+64*3+63:256*1+64*3] <= fb[256*1+64*3+63:256*1+64*3];
	   endcase
	 end
	 else begin /* (cycle==2'd0) */         /* ===================================== fb cycle 0 ============================================================= */
	   case (`conf_brs0)
	     2'd1:    fb[256*0+64*0+63:256*0+64*0] <= mr1[64*0+63:64*0];            /* 1:mr10 align不要 */
	     2'd2:    fb[256*0+64*0+63:256*0+64*0] <= tx0i;                         /* 2:tr0  align不要 */
	     2'd3:    fb[256*0+64*0+63:256*0+64*0] <= ld_extout[`REG_DATA_BITS-1:0];/* 3:mr0  align必要 */
	     default: fb[256*0+64*0+63:256*0+64*0] <= fb[256*0+64*0+63:256*0+64*0];
	   endcase
	   /* load mr -> br1 */  /* brs1: 0:off, 1:mr11, 2:tr1, 3:mr1 */
	   case (`conf_brs1)
	     2'd1:    fb[256*0+64*1+63:256*0+64*1] <= mr1[64*1+63:64*1];            /* 1:mr11 align不要 */
	     2'd2:    fb[256*0+64*1+63:256*0+64*1] <= tx1i;                         /* 2:tr1  align不要 */
	     2'd3:    fb[256*0+64*1+63:256*0+64*1] <= ld_extout[`REG_DATA_BITS*2-1:`REG_DATA_BITS];/* 3:mr1  align必要 */
	     default: fb[256*0+64*1+63:256*0+64*1] <= fb[256*0+64*1+63:256*0+64*1];
	   endcase
	   /* load mr -> br2 */  /* brs2: 0:off, 1:mr12, 2:tr2, 3:exdr (brs3=3の場合,ea0woofsに接続) */
	   case (`conf_brs2)
	     2'd1:    fb[256*0+64*2+63:256*0+64*2] <= mr1[64*2+63:64*2];            /* 1:mr12 align不要 */
	     2'd2:    fb[256*0+64*2+63:256*0+64*2] <= tx2i;                         /* 2:tr2  align不要 */
	     2'd3:    fb[256*0+64*2+63:256*0+64*2] <= (`conf_brs3!=2'd3)?exdi:ea0woofsi;/* 3:exdr align不要 */
	     default: fb[256*0+64*2+63:256*0+64*2] <= fb[256*0+64*2+63:256*0+64*2];
	   endcase
	   /* load mr -> br3 */  /* brs3: 0:off, 1:mr13, 2:tr3, 3:ea1woofs */
	   case (`conf_brs3)
	     2'd1:    fb[256*0+64*3+63:256*0+64*3] <= mr1[64*3+63:64*3];            /* 1:mr13 align不要 */
	     2'd2:    fb[256*0+64*3+63:256*0+64*3] <= tx3i;                         /* 2:tr3  align不要 */
	     2'd3:    fb[256*0+64*3+63:256*0+64*3] <= ea1woofsi;                    /* 2:tr3  align不要 */
	     default: fb[256*0+64*3+63:256*0+64*3] <= fb[256*0+64*3+63:256*0+64*3];
	   endcase
	 end
       end
       else begin
	 fb <= fb;
	 bb <= bb;
       end
     end
   end

   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN|~UNIRSTN) begin
       bout_valid <= 1'b0;
     end
     else begin
       if (cycle==2'd3) begin
	 bout_valid <= tr_valid;
       end
     end
   end
endmodule
