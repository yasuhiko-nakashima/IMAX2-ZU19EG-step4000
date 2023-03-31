/*
 *-----------------------------------------------------------------------------
 * Project       : EMAX6
 *-----------------------------------------------------------------------------
 * File          : lmring.v
 * Author        : Nakashima
 *                <nakashim@is.naist.jp>
 *                 Yamano
 *                <yamano.ryusuke.yo7@is.naist.jp>
 * Created       : 10.20.2017
 * Last modified : 10.20.2017
 *-----------------------------------------------------------------------------
 * Description : lmring
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
/* lmring */
module lmring
(
  input  wire                           ACLK,
  input  wire                           RSTN,
  input  wire [`EMAX_NCHIP_BITS-1:0]    chip,
  input  wire [`EMAX_ROW_BITS-1:0]      l_row,

  input  wire [`CONF_BITS-1:0]          conf0,
  input  wire [`CONF_BITS-1:0]          conf1,
  input  wire [`CONF_BITS-1:0]          conf2,
  input  wire [`CONF_BITS-1:0]          conf3,
  input  wire [`EAR_BITS-1:0]           regv_ear0,
  input  wire [`EAR_BITS-1:0]           regv_ear1,
  input  wire [`EAR_BITS-1:0]           regv_ear2,
  input  wire [`EAR_BITS-1:0]           regv_ear3,

  input  wire                           lmring_bin_nemp,
  input  wire [`LMRING_BR_BITS-1:0]     lmring_bin,
  output wire                           lmring_bin_ful,
  input  wire                           lmring_ea0bsy,
  input  wire                           lmring_ea1bsy,
  output wire                           lmlddmqw_ok,
  output wire [7:0]                     lmrangew_ok,
  output wire [7:0]                     lmranger_ok,
  output wire [1:0]                     lmco,           /* wire */  /* -> col#   */
  output wire [`EXRING_ADDR_BITS-1:0]   lmca,           /* wire */  /* -> ea01dr */  /* col#による2bit補正前addr */
  output wire [31:0]                    lmwm,           /* wire */  /* <- axi    */
  output wire [`LMRING_DATA_BITS-1:0]   lmwd,           /* wire */  /* <- axi    */
  input  wire [`BREG_BITS-1:0]          mr1,
  output reg                            lmring_ful1,    /* 0:rw/ty/co/sq/a/di/dm無効, 1:rw/ty/co/sq/a/di/dm有効 */
  output reg  [`LMRING_TR_BITS-1:0]     tr,

  output wire                           lmring_bout_nemp,
  output wire [`LMRING_BR_BITS-1:0]     lmring_bout,
  input  wire                           lmring_bout_ful
`ifdef DEBUG_FPGA
,
  output wire [30:0]                    addr_top_o,
  output wire [30:0]                    addr_bot_o
`endif
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

  wire                                  lmring_br_nful;
  wire                                  lmring_br_nful1;
  wire [30:0]                           lmring_addr     = lmring_bin[`LMRING_BR_A] & 31'h7FFF_FFE0;
  wire [31:0]                           lmring_dm       = lmring_bin[`LMRING_BR_DM];
  wire [`LMRING_DATA_BITS-1:0]          lmring_d        = lmring_bin[`LMRING_BR_D];
  assign                                lmco            = lmring_bin[`LMRING_BR_COL]; /* wire */  /* -> col# */
  wire [`CONF_BITS-1:0]                 conf            = (lmco==0) ? conf0 :
                                                          (lmco==1) ? conf1 :
                                                          (lmco==2) ? conf2 :
                                                                      conf3;
  wire [`EAR_BITS-1:0]                  regv_ear        = (lmco==0) ? regv_ear0 :
                                                          (lmco==1) ? regv_ear1 :
                                                          (lmco==2) ? regv_ear2 :
                                                                      regv_ear3;
  wire [30:0]                           addr_top        = `addr_top;
  wire [30:0]                           addr_bot        = `addr_bot;
`ifdef DEBUG_FPGA
   assign     addr_top_o = addr_top;
   assign     addr_bot_o = addr_bot;
`endif
  wire [30:0]                           ftag            = addr_top & 31'h7FFF_FFE0;
  wire [30:0]                           ltag            = addr_bot & 31'h7FFF_FFE0;
  wire [7:0]                            fmask           = (addr_top[4:2]==3'd0) ? 8'hff:
                                                          (addr_top[4:2]==3'd1) ? 8'hfe:
                                                          (addr_top[4:2]==3'd2) ? 8'hfc:
                                                          (addr_top[4:2]==3'd3) ? 8'hf8:
                                                          (addr_top[4:2]==3'd4) ? 8'hf0:
                                                          (addr_top[4:2]==3'd5) ? 8'he0:
                                                          (addr_top[4:2]==3'd6) ? 8'hc0:
                                                                                  8'h80;
  wire [7:0]                            lmask           = (addr_bot[4:2]==3'd0) ? 8'h01:
                                                          (addr_bot[4:2]==3'd1) ? 8'h03:
                                                          (addr_bot[4:2]==3'd2) ? 8'h07:
                                                          (addr_bot[4:2]==3'd3) ? 8'h0f:
                                                          (addr_bot[4:2]==3'd4) ? 8'h1f:
                                                          (addr_bot[4:2]==3'd5) ? 8'h3f:
                                                          (addr_bot[4:2]==3'd6) ? 8'h7f:
                                                                                  8'hff;
  wire [7:0]                            aximask         = {{|(lmring_dm[31:28])},{|(lmring_dm[27:24])},{|(lmring_dm[23:20])},{|(lmring_dm[19:16])},
							   {|(lmring_dm[15:12])},{|(lmring_dm[11: 8])},{|(lmring_dm[ 7: 4])},{|(lmring_dm[ 3: 0])}};
  wire [7:0]                            ranger_ok       = (ftag< lmring_addr && lmring_addr< ltag) ? 8'hff :
                                                          (ftag==lmring_addr && lmring_addr< ltag) ? (fmask) :
                                                          (ftag< lmring_addr && lmring_addr==ltag) ? (lmask) :
                                                          (ftag==lmring_addr && lmring_addr==ltag) ? (fmask & lmask) : 8'h00;
  wire [7:0]                            rangew_ok       = (ftag< lmring_addr && lmring_addr< ltag) ? 8'hff :
                                                          (ftag==lmring_addr && lmring_addr< ltag) ? (fmask & aximask) :
                                                          (ftag< lmring_addr && lmring_addr==ltag) ? (lmask & aximask) :
                                                          (ftag==lmring_addr && lmring_addr==ltag) ? (fmask & lmask & aximask) : 8'h00;
  assign                                lmranger_ok     = (`conf_lmm_axir && lmring_bin[`LMRING_BR_RW]==0 && lmring_bin[`LMRING_BR_TY]==4) ? ranger_ok : 8'h00; /* 8bits */
  assign                                lmrangew_ok     = (`conf_lmm_axiw && lmring_bin[`LMRING_BR_RW]==1 && lmring_bin[`LMRING_BR_TY]==4) ? rangew_ok : 8'h00; /* 8bits */
//assign                                lmlddmqw_ok     = lmring_bin[`LMRING_BR_RW]==1 && lmring_bin[`LMRING_BR_TY]==3 && `conf_ea1op==`OP_LDDMQ; /* lmwd[0]->tr */  /* LDDMQは同一slotに高々1が前提 */
  assign                                lmlddmqw_ok     = 1'b0;
  wire                                  lmring_ful      = !lmring_br_nful || (lmring_ful1 && lmring_br_nful1); /* assign */    /* wire */  /* (ful2==3)|(ful1 & (ful2==2)) */
  assign                                lmring_bin_ful  = lmring_ful || (lmranger_ok && lmring_ea1bsy) /* old deq_wait */
                                                                     || (lmrangew_ok && lmring_ea0bsy)
                                                                     || (lmlddmqw_ok && lmco!=cyclep1);
  assign                                lmca            = lmring_addr[`EXRING_ADDR_BITS-1:0];       /* wire */  /* -> ea01dr */  /* col#による2bit補正前addr */
  assign                                lmwm            = lmring_dm & {{(4){rangew_ok[7]}},{(4){rangew_ok[6]}},{(4){rangew_ok[5]}},{(4){rangew_ok[4]}},
								       {(4){rangew_ok[3]}},{(4){rangew_ok[2]}},{(4){rangew_ok[1]}},{(4){rangew_ok[0]}}}; /* wire *//* <- axi */
  assign                                lmwd            = lmring_d;                                                                                      /* wire *//* <- axi */
  wire [30:0]                           bin_addr        = lmring_bin[`LMRING_BR_A];
  wire [`EMAX_NCHIP_BITS-1:0]           cdx             = bin_addr[16+`EMAX_NCHIP_BITS-1:16]; // selecting chip
  wire [5:0]                            row             = bin_addr[12:7]; // selecting logical unit

  always @(posedge ACLK or negedge RSTN) begin
    if (~RSTN) begin
      lmring_ful1             <= 1'b0;
      tr                      <= {(`LMRING_TR_BITS){1'b0}};
    end
    else begin
      if (lmring_bin_nemp && !lmring_bin_ful) begin /* for next cycle */
        lmring_ful1           <= 1'b1;
        tr                    <= {8'd0 ,lmring_bin};
        tr[`LMRING_TR_AV]     <= lmring_bin[`LMRING_BR_AV] || lmranger_ok || lmrangew_ok || ((chip == cdx || cdx == `EMAX_NCHIP_BITS'd0) && l_row == row && lmring_bin[`LMRING_BR_TY]<3'd4);
        tr[`LMRING_TR_MERGE]  <= (lmring_bin[`LMRING_BR_TY] < 4) ? 8'h00 : lmranger_ok; /* reg or read (VADDR/LDDMQ/TRANS) in range */
        //tr[`LMRING_TR_RW]     <= lmring_bin[`LMRING_BR_RW];
        //tr[`LMRING_TR_TY]     <= lmring_bin[`LMRING_BR_TY];
        //tr[`LMRING_TR_COL]    <= lmring_bin[`LMRING_BR_COL];
        //tr[`LMRING_TR_SQ]     <= lmring_bin[`LMRING_BR_SQ];
        //tr[`LMRING_TR_AV]     <= lmring_bin[`LMRING_BR_AV] || lmranger_ok || lmrangew_ok || (chip == cdx && l_row == row && lmring_bin[`LMRING_BR_TY]<3'd4);
        //tr[`LMRING_TR_A]      <= lmring_bin[`LMRING_BR_A];
        //tr[`LMRING_TR_DM]     <= lmring_bin[`LMRING_BR_DM];
        //tr[`LMRING_TR_D]      <= lmring_bin[`LMRING_BR_D];
        //tr[`LMRING_TR_MERGE]  <= (lmring_bin[`LMRING_BR_TY] < 4) ? 8'h00 : lmranger_ok; /* reg or read (VADDR/LDDMQ/TRANS) in range */
      end
      else begin
        lmring_ful1           <= 1'b0;
        tr                    <= tr;
      end
    end
  end

  wire [30:0]                           tr_addr   = tr[`LMRING_TR_A];
  wire [255:0]                          tr_d      = tr[`LMRING_TR_D];
  wire [7:0]                            tr_merge  = tr[`LMRING_TR_MERGE];
  /* combination logic */
  reg  [`LMRING_BR_BITS-1:0]            lmring_b;
  reg                                   lmring_b_en;
  always @*begin
    lmring_b                  = {(`LMRING_BR_BITS){1'b0}};
    lmring_b_en               = 1'b0;
    if (lmring_ful1) begin /* enqueue to lmring_br for next cycle */
      /* enqueue */
      lmring_b_en             = 1'b1;
      lmring_b                = tr[`LMRING_BR_BITS-1:0];
      lmring_b[`LMRING_BR_AV] = tr[`LMRING_TR_AV];
      lmring_b[`LMRING_BR_D]  = {{(tr_merge[7])? mr1[255:224]:tr_d[255:224]},{(tr_merge[6])? mr1[223:192]:tr_d[223:192]},{(tr_merge[5])? mr1[191:160]:tr_d[191:160]},{(tr_merge[4])? mr1[159:128]:tr_d[159:128]},
				 {(tr_merge[3])? mr1[127: 96]:tr_d[127: 96]},{(tr_merge[2])? mr1[ 95: 64]:tr_d[ 95: 64]},{(tr_merge[1])? mr1[ 63: 32]:tr_d[ 63: 32]},{(tr_merge[0])? mr1[ 31:  0]:tr_d[ 31:  0]}};
    end
  end

  nbit_ndepth_queue
  #(
    .REG_WIDTH  (`LMRING_BR_BITS),
    .QUEUE_DEPTH(`LMRING_BR_BUF),
    .QPTR_BITS  (`LMRING_BR_PTRBITS),
    .QNUM_BITS  (`LMRING_BR_NUMBITS)
  ) lmring_br (
    .ACLK   (ACLK                   ),
    .RSTN   (RSTN                   ),
    .i_data (lmring_b               ), // <=
    .i_val  (lmring_b_en            ), // <-
    .i_rdy  (lmring_br_nful         ), // ->
    .i_rdy1 (lmring_br_nful1        ), // ->
    .q_data (lmring_bout            ), // =>
    .q_val  (lmring_bout_nemp       ), // ->
    .q_rdy  (~lmring_bout_ful       )  // <-
  );

endmodule
