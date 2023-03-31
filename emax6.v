/*-----------------------------------------------------------------------------
 * Title         : emax
 * Project       : EMAX
 *-----------------------------------------------------------------------------
 * File          : emax6.v
 * Author        : Nakashima
 *                <nakashim@is.naist.jp>
 *                 Yamano
 *                <yamano.ryusuke.yo7@is.naist.jp>
 *                 Kikutani
 *                <kikutani.yuma.kw3@is.naist.jp>
 *                 Iwamoto
 *                <iwamoto.jun.iz0@is.naist.jp>
 * Created       : 10.07.2017
 * Last modified : 08.08.2018
 *-----------------------------------------------------------------------------
 * Description : Includes the 16 Rows * 4 Columns
 *-----------------------------------------------------------------------------
 * Copyright (c) 2015 by NAIST This model is the confidential and
 * proprietary property of NAIST and the possession or use of this
 * file requires a written license from NAIST.
 *-----------------------------------------------------------------------------
 * Modification history :
 * 10.07.2016 : created
 * 08.08.2018 : modified
 *-----------------------------------------------------------------------------
 */
`timescale 1ns/100ps
`include "common.vh"

`define NOTYET
module emax6
(
  input  wire                         ACLK,
  input  wire                         ARESETN,

  input  wire                         axi_s_arvalid,
  output wire                         axi_s_arready,
  input  wire [`AXI_ZCU_ADDR_BITS-1:0] axi_s_araddr,
  input  wire [`AXI_S_LENG_BITS-1:0]  axi_s_arlen,
  input  wire [`AXI_S_SIZE_BITS-1:0]  axi_s_arsize,
  input  wire [`AXI_S_BURST_BITS-1:0] axi_s_arburst,  /* 00:fix 01:incr 10:wrap  So always 2'b01 !    */
  input  wire [`AXI_S_CACHE_BITS-1:0] axi_s_arcache,  /* vivado でip化するために用意するが内部で無視  */
  input  wire [`AXI_S_PROT_BITS-1:0]  axi_s_arprot,   /* vivado でip化するために用意するが内部で無視  */
  input  wire [`AXI_S_ID_BITS-1:0]    axi_s_arid,
  output wire                         axi_s_rvalid,
  input  wire                         axi_s_rready,
  output wire                         axi_s_rlast,
  output wire [`AXI_S_DATA_BITS-1:0]  axi_s_rdata,
  output wire [`AXI_S_RESP_BITS-1:0]  axi_s_rresp,    /*  00:通常アクセス成功(排他アクセス失敗)                    */
                                                      /*  01:排他アクセス成功                                      */
                                                      /*  10:スレーブで特定のエラーあるいはセキュリティ違反が発生  */
                                                      /*  11:アドレスデコード違反あるいはセキュリティ違反が発生    */
  output wire [`AXI_S_ID_BITS-1:0]    axi_s_rid,
  input  wire                         axi_s_awvalid,
  output wire                         axi_s_awready,
  input  wire [`AXI_ZCU_ADDR_BITS-1:0] axi_s_awaddr,
  input  wire [`AXI_S_LENG_BITS-1:0]  axi_s_awlen,
  input  wire [`AXI_S_SIZE_BITS-1:0]  axi_s_awsize,
  input  wire [`AXI_S_BURST_BITS-1:0] axi_s_awburst,  /* 00:fix 01:incr 10:wrap  So always 2'b01 !    */
  input  wire [`AXI_S_CACHE_BITS-1:0] axi_s_awcache,  /* vivado でip化するために用意するが内部で無視  */
  input  wire [`AXI_S_PROT_BITS-1:0]  axi_s_awprot,   /* vivado でip化するために用意するが内部で無視  */
  input  wire [`AXI_S_ID_BITS-1:0]    axi_s_awid,
  input  wire                         axi_s_wvalid,
  output wire                         axi_s_wready,
  input  wire                         axi_s_wlast,
  input  wire [`AXI_S_DATA_BITS-1:0]  axi_s_wdata,
  input  wire [`AXI_S_DATA_BYTES-1:0] axi_s_wstrb,
  output wire                         axi_s_bvalid,
  input  wire                         axi_s_bready,
  output wire [`AXI_S_RESP_BITS-1:0]  axi_s_bresp,    /*  00:通常アクセス成功(排他アクセス失敗)                    */
                                                      /*  01:排他アクセス成功                                      */
                                                      /*  10:スレーブで特定のエラーあるいはセキュリティ違反が発生  */
                                                      /*  11:アドレスデコード違反あるいはセキュリティ違反が発生    */
  output wire [`AXI_S_ID_BITS-1:0]    axi_s_bid

`ifdef CASCADE
,
  output wire                         axi_m_arvalid,
  input  wire                         axi_m_arready,
  output wire [`AXI_ZCU_ADDR_BITS-1:0] axi_m_araddr,
  output wire [`AXI_S_LENG_BITS-1:0]  axi_m_arlen,
  output wire [`AXI_S_SIZE_BITS-1:0]  axi_m_arsize,
  output wire [`AXI_S_BURST_BITS-1:0] axi_m_arburst,  /* 00:fix 01:incr 10:wrap  So always 2'b01 !    */
  output wire [`AXI_S_CACHE_BITS-1:0] axi_m_arcache,  /* vivado でip化するために用意するが内部で無視  */
  output wire [`AXI_S_PROT_BITS-1:0]  axi_m_arprot,   /* vivado でip化するために用意するが内部で無視  */
  output wire [`AXI_S_ID_BITS-1:0]    axi_m_arid,
  input  wire                         axi_m_rvalid,
  output wire                         axi_m_rready,
  input  wire                         axi_m_rlast,
  input  wire [`AXI_S_DATA_BITS-1:0]  axi_m_rdata,
  input  wire [`AXI_S_RESP_BITS-1:0]  axi_m_rresp,    /*  00:通常アクセス成功(排他アクセス失敗)                    */
                                                      /*  01:排他アクセス成功                                      */
                                                      /*  10:スレーブで特定のエラーあるいはセキュリティ違反が発生  */
                                                      /*  11:アドレスデコード違反あるいはセキュリティ違反が発生    */
  input  wire [`AXI_S_ID_BITS-1:0]    axi_m_rid,
  output wire                         axi_m_awvalid,
  input  wire                         axi_m_awready,
  output wire [`AXI_ZCU_ADDR_BITS-1:0] axi_m_awaddr,
  output wire [`AXI_S_LENG_BITS-1:0]  axi_m_awlen,
  output wire [`AXI_S_SIZE_BITS-1:0]  axi_m_awsize,
  output wire [`AXI_S_BURST_BITS-1:0] axi_m_awburst,  /* 00:fix 01:incr 10:wrap  So always 2'b01 !    */
  output wire [`AXI_S_CACHE_BITS-1:0] axi_m_awcache,  /* vivado でip化するために用意するが内部で無視  */
  output wire [`AXI_S_PROT_BITS-1:0]  axi_m_awprot,   /* vivado でip化するために用意するが内部で無視  */
  output wire [`AXI_S_ID_BITS-1:0]    axi_m_awid,
  output wire                         axi_m_wvalid,
  input  wire                         axi_m_wready,
  output wire                         axi_m_wlast,
  output wire [`AXI_S_DATA_BITS-1:0]  axi_m_wdata,
  output wire [`AXI_S_DATA_BYTES-1:0] axi_m_wstrb,
  input  wire                         axi_m_bvalid,
  output wire                         axi_m_bready,
  input  wire [`AXI_S_RESP_BITS-1:0]  axi_m_bresp,    /*  00:通常アクセス成功(排他アクセス失敗)                    */
                                                      /*  01:排他アクセス成功                                      */
                                                      /*  10:スレーブで特定のエラーあるいはセキュリティ違反が発生  */
                                                      /*  11:アドレスデコード違反あるいはセキュリティ違反が発生    */
  input  wire [`AXI_S_ID_BITS-1:0]    axi_m_bid,
  input  wire                         next_linkup     /*  最終IMAXのみ0 */
`endif

`ifdef DEBUG_FPGA
,
  output wire [7:0]                   lmrangew_ok_2,
  output wire [7:0]                   lmranger_ok_2,
  output wire [30:0]                  addr_top_o_2,
  output wire [30:0]                  addr_bot_o_2,
  output wire [7:0]                   lmrangew_ok_3,
  output wire [7:0]                   lmranger_ok_3,
  output wire [30:0]                  addr_top_o_3,
  output wire [30:0]                  addr_bot_o_3,
  output wire [7:0]                   lmrangew_ok_4,
  output wire [7:0]                   lmranger_ok_4,
  output wire [30:0]                  addr_top_o_4,
  output wire [30:0]                  addr_bot_o_4,
  output wire [7:0]                   lmrangew_ok_5,
  output wire [7:0]                   lmranger_ok_5,
  output wire [30:0]                  addr_top_o_5,
  output wire [30:0]                  addr_bot_o_5,

  output wire [`LMRING_BR_BITS-1:0]   lmring_b_2,
  output wire [`LMRING_BR_BITS-1:0]   lmring_b_3,
  output wire [`LMRING_BR_BITS-1:0]   lmring_b_4,
  output wire [`LMRING_BR_BITS-1:0]   lmring_b_5,
 
  output wire [`EMAX_DEPTH-1:0]       unit1_exec_o,
  output wire [`EMAX_DEPTH-1:0]       unit1_fold_o,
  output wire [`EMAX_DEPTH-1:0]       unit1_stop_o,
  output wire [`EMAX_DEPTH-1:0]       unit2_exec_o,
  output wire [`EMAX_DEPTH-1:0]       unit2_fold_o,
  output wire [1:0]                   unit2_forstat_o,
  output wire [`EMAX_DEPTH-1:0]       unit2_stop_o,

  output wire [2:0]                     axiif_dmrp_stat,  /* imax#0only 0:idle 1:start 2:busy(init top/len) 3:busy(reading-lmm) 4:dma-read get data from DMRB */
  output wire [`AXI_S_ADDR_BITS-1:0]    axiif_dmrp_top,   /* 8byte-boundary */
  output wire [`EXRING_ADDR_BITS-5-1:0] axiif_dmrp_len,   /* beats */
  output wire                           axiif_dmrb_en1_d, /* delayed pfen1 for timing adjustment */
  output wire 			      axiif_sbusy,        /* 1:axi slave controller is busy */
  output wire 			      axiif_mbusy,        /* 1:axi master controller is busy */
  output wire [`AXI_S_SIZE_BITS-1:0]  axiif_arsize,
  output wire [`AXI_S_SIZE_BITS-1:0]  axiif_awsize,
  output wire [`AXI_S_ID_BITS-1:0]    axiif_id,           /* keep axi id */
  output wire 			      axiif_srw,          /* 0:read, 1:write */
  output wire [`AXI_S_ADDR_BITS-1:0]  axiif_addr,         /* count address for narrow burst */
  output wire [`AXI_S_ADDR_BITS-1:0]  axiif_addr_d,       /* delayed addr */
  output wire [`SKP_WIDTH-1:0] 	      axiif_skp,          /* address skip distance for narrow burst */
  output wire [`AXI_S_DATA_BITS-1:0]  axiif_wdata,        /* in */
  output wire [`AXI_S_DATA_BYTES-1:0] axiif_wstrb,        /* in */
  output wire [`LEN_WIDTH-1:0] 	      axiif_bufq,         /* buf内の有効req数 */
  output wire [`LEN_WIDTH-1:0] 	      axiif_alen,         /* copy of awlen/arlen */
  output wire [`LEN_WIDTH-1:0] 	      axiif_ilen,         /* accepted r/w len (internal) */
  output wire [`LEN_WIDTH-1:0] 	      axiif_blen,         /* accepted by buffer (internal) */
  output wire [`LEN_WIDTH-1:0] 	      axiif_plen,         /* accepted by buffer (internal) */
  output wire [`LEN_WIDTH-1:0] 	      axiif_mlen,         /* accepted by master (internal) */
  output wire [`LEN_WIDTH-1:0] 	      axiif_olen,         /* accepted bottom read (internal) */
  output wire 			      axiif_wterm,        /* axi write transaction taminate */

  output wire 			      axiif_keep_busy,    /* トランザクションが同時に到着したためReadトランザクションを待機 */
  output wire [`AXI_S_SIZE_BITS-1:0]  axiif_keep_size,    /* keep axi size */
  output wire [`AXI_S_ID_BITS-1:0]    axiif_keep_id,      /* keep axi id */
  output wire [`AXI_S_ADDR_BITS-1:0]  axiif_keep_addr,    /* keep count address for narrow burst */
  output wire [`SKP_WIDTH-1:0] 	      axiif_keep_skp,     /* address skip distance for narrow burst */
  output wire [`LEN_WIDTH-1:0] 	      axiif_keep_len,     /* len (internal) */
  output wire                         next_linkup_r       /* len (internal) */
`endif
);
// synopsys template

`ifndef CASCADE
  wire                         axi_m_arvalid;
  wire                         axi_m_arready  = 1'b0;
  wire [`AXI_ZCU_ADDR_BITS-1:0] axi_m_araddr;
  wire [`AXI_S_LENG_BITS-1:0]  axi_m_arlen;
  wire [`AXI_S_SIZE_BITS-1:0]  axi_m_arsize;
  wire [`AXI_S_BURST_BITS-1:0] axi_m_arburst;  /* 00:fix 01:incr 10:wrap  So always 2'b01 !    */
  wire [`AXI_S_CACHE_BITS-1:0] axi_m_arcache;  /* vivado でip化するために用意するが内部で無視  */
  wire [`AXI_S_PROT_BITS-1:0]  axi_m_arprot;   /* vivado でip化するために用意するが内部で無視  */
  wire [`AXI_S_ID_BITS-1:0]    axi_m_arid;
  wire                         axi_m_rvalid   = 1'b0;
  wire                         axi_m_rready   = 1'b0;
  wire                         axi_m_rlast    = 1'b0;
  wire [`AXI_S_DATA_BITS-1:0]  axi_m_rdata    = {(`AXI_S_DATA_BITS){1'b0}};
  wire [`AXI_S_RESP_BITS-1:0]  axi_m_rresp    = {(`AXI_S_RESP_BITS){1'b0}};
  wire [`AXI_S_ID_BITS-1:0]    axi_m_rid      = {(`AXI_S_ID_BITS){1'b0}};
  wire                         axi_m_awvalid;
  wire                         axi_m_awready  = 1'b0;
  wire [`AXI_ZCU_ADDR_BITS-1:0] axi_m_awaddr;
  wire [`AXI_S_LENG_BITS-1:0]  axi_m_awlen;
  wire [`AXI_S_SIZE_BITS-1:0]  axi_m_awsize;
  wire [`AXI_S_BURST_BITS-1:0] axi_m_awburst;  /* 00:fix 01:incr 10:wrap  So always 2'b01 !    */
  wire [`AXI_S_CACHE_BITS-1:0] axi_m_awcache;  /* vivado でip化するために用意するが内部で無視  */
  wire [`AXI_S_PROT_BITS-1:0]  axi_m_awprot;   /* vivado でip化するために用意するが内部で無視  */
  wire [`AXI_S_ID_BITS-1:0]    axi_m_awid;
  wire                         axi_m_wvalid;
  wire                         axi_m_wready   = 1'b0;
  wire                         axi_m_wlast;
  wire [`AXI_S_DATA_BITS-1:0]  axi_m_wdata;
  wire [`AXI_S_DATA_BYTES-1:0] axi_m_wstrb;
  wire                         axi_m_bvalid   = 1'b0;
  wire                         axi_m_bready;
  wire [`AXI_S_RESP_BITS-1:0]  axi_m_bresp    = {(`AXI_S_RESP_BITS){1'b0}};
  wire [`AXI_S_ID_BITS-1:0]    axi_m_bid      = {(`AXI_S_ID_BITS){1'b0}};
  wire                         next_linkup    = 1'b0;
`endif

  wire [`REG_CTRL_CMD_BITS-1:0]       ctrl_cmd;
  wire [`EMAX_NCHIP_BITS-1:0]         ctrl_chip;
  wire                                axi_busy;

  wire [`EMAX_DEPTH-1:0]              unit1_exec;
  wire [`EMAX_DEPTH-1:0]              unit1_fold;
  wire [`EMAX_DEPTH-1:0]              unit1_stop;
  wire [`EMAX_DEPTH-1:0]              unit2_exec;
  wire [`EMAX_DEPTH-1:0]              unit2_fold;
  wire [1:0]                          unit2_forstat[`EMAX_DEPTH-1:0];
  wire [`EMAX_DEPTH-1:0]              unit2_stop;
  wire [`EMAX_DEPTH-1:0]              exring_b_valid;
  wire [`BREG_BITS*`EMAX_WIDTH-1:0]   exring_b[`EMAX_DEPTH-1:0];
  wire                                axring_b_nemp;
  wire [`AXRING_BR_BITS-1:0]          axring_b;
  wire [`EMAX_DEPTH-1:0]              axring_b_ful; // old deq_wait
  wire                                axring_b_ful_en; // old deq_wait
  wire [`EMAX_DEPTH-1:0]              mxring_b_nemp;
  wire [`AXRING_BR_BITS-1:0]          mxring_b[`EMAX_DEPTH-1:0];
  wire [`EMAX_DEPTH-1:0]              mxring_b_ful; // old deq_wait
  wire [`EMAX_DEPTH-1:0]              lmring_b_nemp;
  wire                                lmring_b_nemp_en;
  wire [`LMRING_BR_BITS-1:0]          lmring_b[`EMAX_DEPTH-1:0];
  wire [`EMAX_DEPTH-1:0]              lmring_b_ful;       // old deq_wait
  wire                                lmring_b_buf_ful;       // old deq_wait
  wire [`LMRING_BR_BITS-1:0]          axring_bot_data;

   
`ifdef LMRING_MUX_IS_8
  wire [`LMRING_BR_BITS-1:0]          axring_bot0;
  wire [`LMRING_BR_BITS-1:0]          axring_bot1;
  wire [`LMRING_BR_BITS-1:0]          axring_bot2;
  wire [`LMRING_BR_BITS-1:0]          axring_bot3;
  wire [`LMRING_BR_BITS-1:0]          axring_bot4;
  wire [`LMRING_BR_BITS-1:0]          axring_bot5;
  wire [`LMRING_BR_BITS-1:0]          axring_bot6;
  wire [`LMRING_BR_BITS-1:0]          axring_bot7;
`endif
`ifdef LMRING_MUX_IS_16
  wire [`LMRING_BR_BITS-1:0]          axring_bot0;
  wire [`LMRING_BR_BITS-1:0]          axring_bot1;
  wire [`LMRING_BR_BITS-1:0]          axring_bot2;
  wire [`LMRING_BR_BITS-1:0]          axring_bot3;
  wire [`LMRING_BR_BITS-1:0]          axring_bot4;
  wire [`LMRING_BR_BITS-1:0]          axring_bot5;
  wire [`LMRING_BR_BITS-1:0]          axring_bot6;
  wire [`LMRING_BR_BITS-1:0]          axring_bot7;
  wire [`LMRING_BR_BITS-1:0]          axring_bot8;
  wire [`LMRING_BR_BITS-1:0]          axring_bot9;
  wire [`LMRING_BR_BITS-1:0]          axring_bot10;
  wire [`LMRING_BR_BITS-1:0]          axring_bot11;
  wire [`LMRING_BR_BITS-1:0]          axring_bot12;
  wire [`LMRING_BR_BITS-1:0]          axring_bot13;
  wire [`LMRING_BR_BITS-1:0]          axring_bot14;
  wire [`LMRING_BR_BITS-1:0]          axring_bot15;
`endif

`ifdef DEBUG_FPGA
  wire [7:0]                   lmrangew_ok_o[`EMAX_DEPTH-1:0];
  wire [7:0]                   lmranger_ok_o[`EMAX_DEPTH-1:0];
  wire [30:0]                  addr_top_o[`EMAX_DEPTH-1:0];
  wire [30:0]                  addr_bot_o[`EMAX_DEPTH-1:0];
   
  assign lmrangew_ok_2 = lmrangew_ok_o[2];
  assign lmranger_ok_2 = lmranger_ok_o[2];
  assign addr_top_o_2  = addr_top_o[2];
  assign addr_bot_o_2  = addr_bot_o[2];
  assign lmrangew_ok_3 = lmrangew_ok_o[3];
  assign lmranger_ok_3 = lmranger_ok_o[3];
  assign addr_top_o_3  = addr_top_o[3];
  assign addr_bot_o_3  = addr_bot_o[3];
  assign lmrangew_ok_4 = lmrangew_ok_o[4];
  assign lmranger_ok_4 = lmranger_ok_o[4];
  assign addr_top_o_4  = addr_top_o[4];
  assign addr_bot_o_4  = addr_bot_o[4];
  assign lmrangew_ok_5 = lmrangew_ok_o[5];
  assign lmranger_ok_5 = lmranger_ok_o[5];
  assign addr_top_o_5  = addr_top_o[5];
  assign addr_bot_o_5  = addr_bot_o[5];
   
  assign lmring_b_2    = lmring_b[2];
  assign lmring_b_3    = lmring_b[3];
  assign lmring_b_4    = lmring_b[4];
  assign lmring_b_5    = lmring_b[5];

  assign unit1_exec_o    = unit1_exec;
  assign unit1_fold_o    = unit1_fold;
  assign unit1_stop_o    = unit1_stop;
  assign unit2_exec_o    = unit2_exec;
  assign unit2_fold_o    = unit2_fold;
  assign unit2_forstat_o = unit2_forstat[0];
  assign unit2_stop_o    = unit2_stop;
`endif

`ifdef LMRING_MUX_IS_8
  assign axring_b_ful_en  =    axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*0)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*1)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*2)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*3)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*4)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*5)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*6)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*7)];
  assign lmring_b_nemp_en =    lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*1)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*2)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*3)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*4)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*5)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*6)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*7)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*8)-1];
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*1)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*2)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*3)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*4)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*5)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*6)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*7)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*8)-1] = lmring_b_buf_ful;
  assign axring_bot0 = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*1)-1];
  assign axring_bot1 = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*2)-1];
  assign axring_bot2 = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*3)-1];
  assign axring_bot3 = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*4)-1];
  assign axring_bot4 = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*5)-1];
  assign axring_bot5 = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*6)-1];
  assign axring_bot6 = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*7)-1];
  assign axring_bot7 = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*8)-1];
  assign axring_bot_data = {(({(`AXI_S_DATA_BITS){axring_bot0[`AXRING_BR_AV]}}) & axring_bot0[`AXRING_BR_D])
                           |(({(`AXI_S_DATA_BITS){axring_bot1[`AXRING_BR_AV]}}) & axring_bot1[`AXRING_BR_D])
                           |(({(`AXI_S_DATA_BITS){axring_bot2[`AXRING_BR_AV]}}) & axring_bot2[`AXRING_BR_D])
                           |(({(`AXI_S_DATA_BITS){axring_bot3[`AXRING_BR_AV]}}) & axring_bot3[`AXRING_BR_D])
                           |(({(`AXI_S_DATA_BITS){axring_bot4[`AXRING_BR_AV]}}) & axring_bot4[`AXRING_BR_D])
                           |(({(`AXI_S_DATA_BITS){axring_bot5[`AXRING_BR_AV]}}) & axring_bot5[`AXRING_BR_D])
                           |(({(`AXI_S_DATA_BITS){axring_bot6[`AXRING_BR_AV]}}) & axring_bot6[`AXRING_BR_D])
                           |(({(`AXI_S_DATA_BITS){axring_bot7[`AXRING_BR_AV]}}) & axring_bot7[`AXRING_BR_D]),
                            axring_bot0[`AXRING_BR_DM],
                            axring_bot0[`AXRING_BR_A ],
                            axring_bot0[`AXRING_BR_AV],
                            axring_bot0[`AXRING_BR_SQ],
                            axring_bot0[`AXRING_BR_COL],
                            axring_bot0[`AXRING_BR_TY],
                            axring_bot0[`AXRING_BR_RW]};
`endif
`ifdef LMRING_MUX_IS_16
  assign axring_b_ful_en  =    axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 0)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 1)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 2)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 3)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 4)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 5)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 6)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 7)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 8)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 9)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*10)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*11)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*12)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*13)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*14)]
                             | axring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*15)];
  assign lmring_b_nemp_en =    lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)* 1)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)* 2)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)* 3)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)* 4)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)* 5)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)* 6)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)* 7)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)* 8)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)* 9)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*10)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*11)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*12)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*13)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*14)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*15)-1]
                             & lmring_b_nemp[((`EMAX_DEPTH/`LMRING_MUX)*16)-1];
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 1)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 2)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 3)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 4)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 5)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 6)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 7)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 8)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)* 9)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*10)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*11)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*12)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*13)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*14)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*15)-1] = lmring_b_buf_ful;
  assign lmring_b_ful[((`EMAX_DEPTH/`LMRING_MUX)*16)-1] = lmring_b_buf_ful;
  assign axring_bot0  = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)* 1)-1];
  assign axring_bot1  = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)* 2)-1];
  assign axring_bot2  = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)* 3)-1];
  assign axring_bot3  = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)* 4)-1];
  assign axring_bot4  = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)* 5)-1];
  assign axring_bot5  = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)* 6)-1];
  assign axring_bot6  = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)* 7)-1];
  assign axring_bot7  = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)* 8)-1];
  assign axring_bot8  = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)* 9)-1];
  assign axring_bot9  = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*10)-1];
  assign axring_bot10 = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*11)-1];
  assign axring_bot11 = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*12)-1];
  assign axring_bot12 = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*13)-1];
  assign axring_bot13 = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*14)-1];
  assign axring_bot14 = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*15)-1];
  assign axring_bot15 = lmring_b[((`EMAX_DEPTH/`LMRING_MUX)*16)-1];
  assign axring_bot_data = {(({(`AXI_S_DATA_BITS){axring_bot0[`AXRING_BR_AV]}}) & axring_bot0[`AXRING_BR_D])
                           |(({(`AXI_S_DATA_BITS){axring_bot1[`AXRING_BR_AV]}}) & axring_bot1[`AXRING_BR_D])
                           |(({(`AXI_S_DATA_BITS){axring_bot2[`AXRING_BR_AV]}}) & axring_bot2[`AXRING_BR_D])
                           |(({(`AXI_S_DATA_BITS){axring_bot3[`AXRING_BR_AV]}}) & axring_bot3[`AXRING_BR_D])
                           |(({(`AXI_S_DATA_BITS){axring_bot4[`AXRING_BR_AV]}}) & axring_bot4[`AXRING_BR_D])
                           |(({(`AXI_S_DATA_BITS){axring_bot5[`AXRING_BR_AV]}}) & axring_bot5[`AXRING_BR_D])
                           |(({(`AXI_S_DATA_BITS){axring_bot6[`AXRING_BR_AV]}}) & axring_bot6[`AXRING_BR_D])
                           |(({(`AXI_S_DATA_BITS){axring_bot7[`AXRING_BR_AV]}}) & axring_bot7[`AXRING_BR_D]),
                           |(({(`AXI_S_DATA_BITS){axring_bot8[`AXRING_BR_AV]}}) & axring_bot8[`AXRING_BR_D]),
                           |(({(`AXI_S_DATA_BITS){axring_bot9[`AXRING_BR_AV]}}) & axring_bot9[`AXRING_BR_D]),
                           |(({(`AXI_S_DATA_BITS){axring_bot10[`AXRING_BR_AV]}}) & axring_bot10[`AXRING_BR_D]),
                           |(({(`AXI_S_DATA_BITS){axring_bot11[`AXRING_BR_AV]}}) & axring_bot11[`AXRING_BR_D]),
                           |(({(`AXI_S_DATA_BITS){axring_bot12[`AXRING_BR_AV]}}) & axring_bot12[`AXRING_BR_D]),
                           |(({(`AXI_S_DATA_BITS){axring_bot13[`AXRING_BR_AV]}}) & axring_bot13[`AXRING_BR_D]),
                           |(({(`AXI_S_DATA_BITS){axring_bot14[`AXRING_BR_AV]}}) & axring_bot14[`AXRING_BR_D]),
                           |(({(`AXI_S_DATA_BITS){axring_bot15[`AXRING_BR_AV]}}) & axring_bot15[`AXRING_BR_D]),
                            axring_bot0[`AXRING_BR_DM],
                            axring_bot0[`AXRING_BR_A ],
                            axring_bot0[`AXRING_BR_AV],
                            axring_bot0[`AXRING_BR_SQ],
                            axring_bot0[`AXRING_BR_COL],
                            axring_bot0[`AXRING_BR_TY],
                            axring_bot0[`AXRING_BR_RW]};
`endif

  fsm fsm
  (
    .ACLK                           (ACLK                               ), // general clock (fpga:83MHz asic:240MHz)
    .RSTN                           (ARESETN                            ), // 0x0000 1: RST=0->1->0

    .axi_s_arvalid                  (axi_s_arvalid                      ),
    .axi_s_arready                  (axi_s_arready                      ),
    .axi_s_araddr                   (axi_s_araddr                       ),
    .axi_s_arlen                    (axi_s_arlen                        ),
    .axi_s_arsize                   (axi_s_arsize                       ),
    .axi_s_arburst                  (axi_s_arburst                      ),
//  .axi_s_arcache                  (axi_s_arcache                      ),
//  .axi_s_arprot                   (axi_s_arprot                       ),
    .axi_s_arid                     (axi_s_arid                         ),
    .axi_s_rvalid                   (axi_s_rvalid                       ),
    .axi_s_rready                   (axi_s_rready                       ),
    .axi_s_rlast                    (axi_s_rlast                        ),
    .axi_s_rdata                    (axi_s_rdata                        ),
    .axi_s_rresp                    (axi_s_rresp                        ),
    .axi_s_rid                      (axi_s_rid                          ),

    .axi_s_awvalid                  (axi_s_awvalid                      ),
    .axi_s_awready                  (axi_s_awready                      ),
    .axi_s_awaddr                   (axi_s_awaddr                       ),
    .axi_s_awlen                    (axi_s_awlen                        ),
    .axi_s_awsize                   (axi_s_awsize                       ),
    .axi_s_awburst                  (axi_s_awburst                      ),
//  .axi_s_awcache                  (axi_s_awcache                      ),
//  .axi_s_awprot                   (axi_s_awprot                       ),
    .axi_s_awid                     (axi_s_awid                         ),
    .axi_s_wvalid                   (axi_s_wvalid                       ),
    .axi_s_wready                   (axi_s_wready                       ),
    .axi_s_wlast                    (axi_s_wlast                        ),
    .axi_s_wdata                    (axi_s_wdata                        ),
    .axi_s_wstrb                    (axi_s_wstrb                        ),
    .axi_s_bvalid                   (axi_s_bvalid                       ),
    .axi_s_bready                   (axi_s_bready                       ),
    .axi_s_bresp                    (axi_s_bresp                        ),
    .axi_s_bid                      (axi_s_bid                          ),

    .axi_m_arvalid                  (axi_m_arvalid                      ),
    .axi_m_arready                  (axi_m_arready                      ),
    .axi_m_araddr                   (axi_m_araddr                       ),
    .axi_m_arlen                    (axi_m_arlen                        ),
    .axi_m_arsize                   (axi_m_arsize                       ),
    .axi_m_arburst                  (axi_m_arburst                      ),
    .axi_m_arcache                  (axi_m_arcache                      ),
    .axi_m_arprot                   (axi_m_arprot                       ),
    .axi_m_arid                     (axi_m_arid                         ),
    .axi_m_rvalid                   (axi_m_rvalid                       ),
    .axi_m_rready                   (axi_m_rready                       ),
    .axi_m_rlast                    (axi_m_rlast                        ),
    .axi_m_rdata                    (axi_m_rdata                        ),
    .axi_m_rresp                    (axi_m_rresp                        ),
    .axi_m_rid                      (axi_m_rid                          ),

    .axi_m_awvalid                  (axi_m_awvalid                      ),
    .axi_m_awready                  (axi_m_awready                      ),
    .axi_m_awaddr                   (axi_m_awaddr                       ),
    .axi_m_awlen                    (axi_m_awlen                        ),
    .axi_m_awsize                   (axi_m_awsize                       ),
    .axi_m_awburst                  (axi_m_awburst                      ),
    .axi_m_awcache                  (axi_m_awcache                      ),
    .axi_m_awprot                   (axi_m_awprot                       ),
    .axi_m_awid                     (axi_m_awid                         ),
    .axi_m_wvalid                   (axi_m_wvalid                       ),
    .axi_m_wready                   (axi_m_wready                       ),
    .axi_m_wlast                    (axi_m_wlast                        ),
    .axi_m_wdata                    (axi_m_wdata                        ),
    .axi_m_wstrb                    (axi_m_wstrb                        ),
    .axi_m_bvalid                   (axi_m_bvalid                       ),
    .axi_m_bready                   (axi_m_bready                       ),
    .axi_m_bresp                    (axi_m_bresp                        ),
    .axi_m_bid                      (axi_m_bid                          ),
    .next_linkup                    (next_linkup                        ),  // 最終IMAXのみ0

    .ctrl_cmd                       (ctrl_cmd                           ),
    .ctrl_chip                      (ctrl_chip                          ),
    .axi_busy                       (axi_busy                           ),  // axiifが busyの時はリセットしてはいけない <= Master側がDeadlockする
    .unit1_exec                     (unit1_exec                         ),  // 1bit corresponds to each unit
    .unit1_fold                     (unit1_fold                         ),  // 1bit corresponds to each unit
    .unit1_stop                     (unit1_stop                         ),  // 1bit corresponds to each unit
    .unit2_exec                     (unit2_exec                         ),  // 1bit corresponds to each unit
    .unit2_fold                     (unit2_fold                         ),  // 1bit corresponds to each unit
    .unit2_stop                     (unit2_stop                         ),  // 1bit corresponds to each unit

    .axring_top_nemp                (axring_b_nemp                      ),  // 1:axring br buffer not empty
    .axring_top_ful                 (axring_b_ful_en                    ),  // 1:axring br buffer full
    .axring_top                     (axring_b                           ),
    .axring_bot_nemp                (lmring_b_nemp_en                   ),  // 1:axring br buffer not empty
    .axring_bot_ful                 (lmring_b_buf_ful                   ),  // 1:axring br buffer full
    .axring_bot                     (axring_bot_data                    )
`ifdef DEBUG_FPGA
    ,
    .axiif_dmrp_stat      (axiif_dmrp_stat),
    .axiif_dmrp_top       (axiif_dmrp_top),
    .axiif_dmrp_len       (axiif_dmrp_len),
    .axiif_dmrb_en1_d     (axiif_dmrb_en1_d),
    .axiif_sbusy          (axiif_sbusy),
    .axiif_mbusy          (axiif_mbusy),
    .axiif_arsize         (axiif_arsize),
    .axiif_awsize         (axiif_awsize),
    .axiif_id             (axiif_id),
    .axiif_srw            (axiif_srw),
    .axiif_addr           (axiif_addr),
    .axiif_addr_d         (axiif_addr_d),
    .axiif_skp            (axiif_skp),
    .axiif_wdata          (axiif_wdata),
    .axiif_wstrb          (axiif_wstrb),
    .axiif_bufq           (axiif_bufq),
    .axiif_alen           (axiif_alen),
    .axiif_ilen           (axiif_ilen),
    .axiif_blen           (axiif_blen),
    .axiif_plen           (axiif_plen),
    .axiif_mlen           (axiif_mlen),
    .axiif_olen           (axiif_olen),
    .axiif_wterm          (axiif_wterm),
    .axiif_keep_busy      (axiif_keep_busy),
    .axiif_keep_size      (axiif_keep_size),
    .axiif_keep_id        (axiif_keep_id),
    .axiif_keep_addr      (axiif_keep_addr),
    .axiif_keep_skp       (axiif_keep_skp),
    .axiif_keep_len       (axiif_keep_len),
    .next_linkup_r        (next_linkup_r)
`endif
  );

  genvar c_unit;
  generate
    for (c_unit=0; c_unit<`EMAX_DEPTH; c_unit=c_unit+1) begin: EMAX6_UNIT
      if(c_unit % (`EMAX_DEPTH/`LMRING_MUX) == 0) begin

	nbit_ndepth_queue
	#(
	  .REG_WIDTH  (`AXRING_BR_BITS),
	  .QUEUE_DEPTH(`AXRING_BR_BUF),
	  .QPTR_BITS  (`AXRING_BR_PTRBITS),
	  .QNUM_BITS  (`AXRING_BR_NUMBITS)
	) mux_top_buf (
	  .ACLK   (ACLK                 ),
          .RSTN   (ARESETN              ),
          .i_data (axring_b             ), // <=
          .i_val  (axring_b_nemp        ), // <-
          .i_rdy  (                     ), // ->
          .i_rdy1 (axring_b_ful[c_unit] ), // ->
          .q_data (mxring_b[c_unit]     ), // =>
          .q_val  (mxring_b_nemp[c_unit]), // ->
          .q_rdy  (~mxring_b_ful[c_unit])  // <-
        );

        unit
        #(
          .UNIT_NO                    (c_unit                                                 )
        ) unit (
          .ACLK                       (ACLK                                                   ), // general clock (fpga:83MHz asic:240MHz)
          .RSTN                       (ARESETN                                                ), // 0x0000 1: RST=0->1->0
          .ctrl_cmd                   (ctrl_cmd                                               ),
          .ctrl_chip                  (ctrl_chip                                              ),
          .axi_busy                   (axi_busy                                               ),
          .pi_unit2_exec              (unit2_exec[(c_unit+`EMAX_DEPTH-1)%`EMAX_DEPTH]         ),
          .pi_unit2_forstat           (unit2_forstat[(c_unit+`EMAX_DEPTH-1)%`EMAX_DEPTH]      ),
          .pi_unit2_stop              (unit2_stop[(c_unit+`EMAX_DEPTH-1)%`EMAX_DEPTH]         ),
          .unit1_exec                 (unit1_exec[c_unit]                                     ), // 1bit corresponds to each unit
          .unit1_fold                 (unit1_fold[c_unit]                                     ), // 1bit corresponds to each unit
          .unit1_stop                 (unit1_stop[c_unit]                                     ), // 1bit corresponds to each unit
          .unit2_exec                 (unit2_exec[c_unit]                                     ), // 1bit corresponds to each unit
          .unit2_fold                 (unit2_fold[c_unit]                                     ), // 1bit corresponds to each unit
          .unit2_forstat              (unit2_forstat[c_unit]                                  ), // 1bit corresponds to each unit
          .unit2_stop                 (unit2_stop[c_unit]                                     ), // 1bit corresponds to each unit
          .exring_bin_valid           (exring_b_valid[(c_unit+`EMAX_DEPTH-1)%`EMAX_DEPTH]     ),
          .exring_bin                 (exring_b[(c_unit+`EMAX_DEPTH-1)%`EMAX_DEPTH]           ),
          .lmring_bin_nemp            (mxring_b_nemp[c_unit]                                  ),
          .lmring_bin                 (mxring_b[c_unit]                                       ),
          .lmring_bin_ful             (mxring_b_ful[c_unit]                                   ),
          .exring_bout_valid          (exring_b_valid[c_unit]                                 ),
          .exring_bout                (exring_b[c_unit]                                       ),
          .lmring_bout_nemp           (lmring_b_nemp[c_unit]                                  ),
          .lmring_bout                (lmring_b[c_unit]                                       ),
          .lmring_bout_ful            (lmring_b_ful[c_unit]                                   )
`ifdef DEBUG_FPGA
,
	  .lmrangew_ok_o              (lmrangew_ok_o[c_unit]),
	  .lmranger_ok_o              (lmranger_ok_o[c_unit]),
	  .addr_top_o                 (addr_top_o[c_unit]),
	  .addr_bot_o                 (addr_bot_o[c_unit])
`endif
        );
      end
      else begin
        unit
        #(
          .UNIT_NO                    (c_unit                                                 )
        ) unit (
          .ACLK                       (ACLK                                                   ), // general clock (fpga:83MHz asic:240MHz)
          .RSTN                       (ARESETN                                                ), // 0x0000 1: RST=0->1->0
          .ctrl_cmd                   (ctrl_cmd                                               ),
          .ctrl_chip                  (ctrl_chip                                              ),
          .axi_busy                   (axi_busy                                               ),
          .pi_unit2_exec              (unit2_exec[(c_unit+`EMAX_DEPTH-1)%`EMAX_DEPTH]         ),
          .pi_unit2_forstat           (unit2_forstat[(c_unit+`EMAX_DEPTH-1)%`EMAX_DEPTH]      ),
          .pi_unit2_stop              (unit2_stop[(c_unit+`EMAX_DEPTH-1)%`EMAX_DEPTH]         ),
          .unit1_exec                 (unit1_exec[c_unit]                                     ), // 1bit corresponds to each unit
          .unit1_fold                 (unit1_fold[c_unit]                                     ), // 1bit corresponds to each unit
          .unit1_stop                 (unit1_stop[c_unit]                                     ), // 1bit corresponds to each unit
          .unit2_exec                 (unit2_exec[c_unit]                                     ), // 1bit corresponds to each unit
          .unit2_fold                 (unit2_fold[c_unit]                                     ), // 1bit corresponds to each unit
          .unit2_forstat              (unit2_forstat[c_unit]                                  ), // 1bit corresponds to each unit
          .unit2_stop                 (unit2_stop[c_unit]                                     ), // 1bit corresponds to each unit
          .exring_bin_valid           (exring_b_valid[(c_unit+`EMAX_DEPTH-1)%`EMAX_DEPTH]     ),
          .exring_bin                 (exring_b[(c_unit+`EMAX_DEPTH-1)%`EMAX_DEPTH]           ),
          .lmring_bin_nemp            (lmring_b_nemp[(c_unit+`EMAX_DEPTH-1)%`EMAX_DEPTH]      ),
          .lmring_bin                 (lmring_b[(c_unit+`EMAX_DEPTH-1)%`EMAX_DEPTH]           ),
          .lmring_bin_ful             (lmring_b_ful[(c_unit+`EMAX_DEPTH-1)%`EMAX_DEPTH]       ),
          .exring_bout_valid          (exring_b_valid[c_unit]                                 ),
          .exring_bout                (exring_b[c_unit]                                       ),
          .lmring_bout_nemp           (lmring_b_nemp[c_unit]                                  ),
          .lmring_bout                (lmring_b[c_unit]                                       ),
          .lmring_bout_ful            (lmring_b_ful[c_unit]                                   )
`ifdef DEBUG_FPGA
,
	  .lmrangew_ok_o              (lmrangew_ok_o[c_unit]),
	  .lmranger_ok_o              (lmranger_ok_o[c_unit]),
	  .addr_top_o                 (addr_top_o[c_unit]),
	  .addr_bot_o                 (addr_bot_o[c_unit])
`endif
        );
      end
    end
  endgenerate
endmodule
