/*-----------------------------------------------------------------------------
 * Title         : emax
 * Project       : EMAX
 *-----------------------------------------------------------------------------
 * File          : fsm.v
 * Author        : Nakashima
 *                <nakashim@is.naist.jp>
 *                 Yamano
 *                <yamano.ryusuke.yo7@is.naist.jp>
 * Created       : 10.07.2017
 * Last modified : 10.07.2017
 *-----------------------------------------------------------------------------
 * Description : transform AXI interface to emax6
 *-----------------------------------------------------------------------------
 * Copyright (c) 2015 by NAIST This model is the confidential and
 * proprietary property of NAIST and the possession or use of this
 * file requires a written license from NAIST.
 *-----------------------------------------------------------------------------
 * Modification history :
 * 10.07.2016 : created
 *-----------------------------------------------------------------------------
 */
`timescale 1ns/100ps
`include "common.vh"

/*¨£¨¡¨¤  ¨£¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¤¨£¨¡¨¤¨£¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¤   */
/*¨¢ A¨¢  ¨¢awaddr        $1 WR/RD-req      awaddr¨¢¨¢ A¨¢¨¢awaddr        $1 WR/RD-req      awaddr¨¢   */
/*¨¢ R¨¢  ¨¢awdata  ¨£¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¤awdata¨¢¨¢ R¨¢¨¢awdata  ¨£¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¤awdata¨¢   */
/*¨¢ M¨¢  ¨¢araddr  ¨¢  ¨£exring¨¡¢«¨¡¨¤  ¨¢araddr¨¢¨¢ M¨¢¨¢araddr  ¨¢  ¨£exring¨¡¢«¨¡¨¤  ¨¢araddr¨¢   */
/*¨¢¨¡¨©$1¨§¨¡¨¤  $3¨¢$3¨¢¨£¨¤¨£¨¤¨£¨¤¨¢  ¨¢  ¨£¨¡¨©¨¢  ¨¢¨§¨¡¨¤  $3¨¢$3¨¢¨£¨¤¨£¨¤¨£¨¤¨¢  ¨¢  ¨£¨¡¨©   */
/*¨¢ I¨§¨¡¨©PD¨§¢ª¨¡¢¡¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨¤¨¦¢ª¨©PD¨§¨¡¢ª¨¡¨©PD¨§¢ª¨¡¢¡¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨¤¨¦¢ª¨©PD¨§¢ª */
/*¨¢ /¨¢  ¨¢IM¨¢SL l¨§¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨©  MA¨¢IM¨¢¨¢  ¨¢¨¢IM¨¢SL l¨§¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨©  MA¨¢IM¨¢   */
/*¨¢ O¨§¨¡¨©OA¨§¨¤ m¨§¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨©  ¨£¨©OA¨§¨¡¢«¨¡¨©OA¨§¨¤ m¨§¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨©  ¨£¨©OA¨§¢« */
/*¨¢¨¡¨©$2¨§¨¡¨¥¨¢ r¨§¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨©  ¨¢¨¦¨¡¨©¨¢  ¨¢¨§¨¡¨¥¨¢ r¨§¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨©  ¨¢¨¦¨¡¨©   */
/*¨¢#0¨¢  ¨¢¡¡  ¨¢ i¨§¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨©  ¨¢    ¨¢¨¢#1¨¢¨¢    ¨¢ i¨§¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨©  ¨¢    ¨¢   */
/*¨¢¡¡¨¢  ¨¢  ¡¡¨¢ n¨§¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨©  ¨¢¡¡  ¨¢¨¢  ¨¢¨¢  ¡¡¨¢ n¨§¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨©  ¨¢¡¡  ¨¢   */
/*¨¢¡¡¨¢  ¨¢    ¨¢ g¨§¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨©  ¨¢    ¨¢¨¢  ¨¢¨¢    ¨¢ g¨§¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨©  ¨¢    ¨¢   */
/*¨¢¡¡¨¢  ¨¢    ¨¢  ¨¦¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨©  ¨¢    ¨¢¨¢  ¨¢¨¢    ¨¢  ¨¦¨¡¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¢¨©  ¨¢    ¨¢   */
/*¨¢ L¨¢  ¨¢ ¡¡ ¨¢      ¨¦¨¥¨¦¨¥¨¦¨¥¨¦¨¥¢­$4¨¢ ¡¡ ¨¢¨¢ L¨¢¨¢ ¡¡ ¨¢      ¨¦¨¥¨¦¨¥¨¦¨¥¨¦¨¥¢­$4¨¢ ¡¡ ¨¢   */
/*¨¢ 1¨¢  ¨¢ ¡¡ ¨¦¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¢«¨¡¨¡¢¡¨¡¨¥ ¡¡ ¨¢¨¢ 1¨¢¨¢ ¡¡ ¨¦¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¢«¨¡¨¡¢¡¨¡¨¥ ¡¡ ¨¢   */
/*¨¢ $¨¢  ¨¢ardata               $4 RD-wait ardata¨¢¨¢ $¨¢¨¢ardata               $4 RD-wait ardata¨¢   */
/*¨¦¨¡¨¥  ¨¦¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¥¨¦¨¡¨¥¨¦¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¡¨¥   */
//--------------------------------------------------------------------------------------------------------------------------------------------------------------
//   clk                _/~~~\___/~~~\___/~~~\___/~~~\___/~~~\___/~~~\___/~~~\___/~~~\___/~~~\___/~~~\___/~~~\___/~~~\___/~~~\___/~~~\___/~~~\___/~~~\___/~~~\__
//                       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |      
// ->axi_s_awaddr[0]    ----------<=adr/len===========================================
// ->axi_s_awvalid[0]   __________/~~~~~~a\___________________________________________
// <-axi_s_awready[0]   ~~~~~~~~~~~~~~~~~a\_______________/~~~~~~~~~~~~~~~~~~~~~~~~~~~ ~axiif_sbusy
//   axiif_adr/len      ------------------<=ADR===X=ADR+1=========================X===
//   axiif_adr_d        ------------------<=ADR===X=ADR===========================X===
//   axiif_sbusy        __________________/~~~~~~~~~~~~~~~\___________________________
// ->axi_s_wvalid[0]    __________________/~~~~~~d\_______/~~~~~~~~~~~~~~~~~~~~~~d\___
// <-axi_s_wready[0]    __________________/~~~~~~d\_______________________/~~~~~~d\___
//   axiif_alen         ------------------<1>-----------------------------------------
//   axiif_ilen         ------------------<0>-----<1>-----------------------------<2>-
// <-axi_s_bvalid[0]    __________________________/~~~~~~~\_______________A___________ (=wterm)
// ->axi_s_bready[0]    __________________/~~~~~~~~~~~~~~~\_______________|___________
//   axiif_wterm        __________________________/~~~~~~~\_______________|___________
//                                                                        |
// R axi_m_awaddr[0]                     -<=adr/len=======================|===========
// R axi_m_awvalid[0]-> __________________/~~~~~~~~~~~~~~a\_______________|___________ axiif_sbusy¤Ç¥«¥Ð¡¼
//   axi_m_awready[0]<- __________________________/~~~~~~a\_______________|___________ (axiif_sbusy|axiif_sbusy)=0¤Î»þ¤Ë¼¡trans¼õÉÕ
//                                                                        |
//   addr==REG_BASE_PHYS(CMD) --------------------------------------------|-----------
//   addr< REG_CONF_OFFS      --------------------------------------------|-----------
//   axiif_blen         ------------------<0>------*----------------------<1>---------
//   axring_top_axi2buf_en->fifo _________________________/~~~~~~~~~~~~~ad\___________________ /* input valid ¤¬Àè              m_wvalid */
//   axring_top_buf_nful  <-fifo _________________________________/~~~~~ad\___________________ /* input ready ¤¬¸å(can enqueue) m_wready */
//                                                                        |
//   axiif_mlen         ------------------<0>------*--------------<1>-----*-------------------
//   axi_m_wvalid[0]->  __________________________________/~~~~~~d\___________________________
//   axi_m_wlast[0]->   __________________________________/~~~~~~d\___________________________
//   axi_m_wdata/strb-> ----------------------------------<=data==============================
//   axi_m_wready[0]<-  __________________________________/~~~~~~d\___________________________ (!next_linkup ? 1'b1 : axi_m_wready)
//   axi_m_bvalid[0]<-  __________________________________________/~~~~~~~\___________________ (!next_linkup ? 1'b1 : axi_m_bvalid)
//   axi_m_bready[0]->  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ (=1)
//   axiif_mbusy        __________________________________/~~~~~~~~~~~~~~~\___________________
//                       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |       |      
// ->axi_s_araddr       ----------<=adr/len===========================================
// ->axi_s_arvalid      __________/~~~~~~a\___________________________________________
// <-axi_s_arready      ~~~~~~~~~~~~~~~~~a\_______________/~~~~~~~~~~~~~~~~~~~~~~~~~~~ ~axiif_sbusy
//   axiif_adr/len      ------------------<=ADR/LEN===================================
//   axiif_sbusy        __________________/~~~~~~~~~~~~~~~\___________________________
//   axiif_alen         ------------------<1>-----------------------------------------
//   axiif_ilen         ------------------<1>-----------------------------------------

// R axi_m_araddr[0]->                   -<=adr/len===================================
// R axi_m_arvalid[0]-> __________________/~~~~~~~~~~~~~~a\___________________________ axiif_sbusy¤Ç¥«¥Ð¡¼
//   axi_m_arready[0]<- __________________________/~~~~~~a\___________________________ (axiif_sbusy|axiif_sbusy)=0¤Î»þ¤Ë¼¡trans¼õÉÕ

//   axiif_olen         ------------------<0>-----------------------------<1>-
//   axring_bot_buf_nemp  <-fifo _________________________/~~~~~~*~~~~~~~d\___________________ /* output valid¤¬Àè               m_rvalid */
//   axring_bot_buf2axi_en->fifo ________________________________>/~~~~~~d\___________________ /* output ready¤¬¸å (can dequeue) m_rready */

//   axi_m_rvalid[0]<-  __________________________________________/~~~~~~d\___________________
//   axi_m_rlast<-      __________________________________________/~~~~~~d\___________________
//   axi_m_rready[0]->  _________________________________________>/~~~~~~d\___________________
//   axi_m_rdata<-      __________________________________________<=data======================

// <-axi_s_rvalid[0]    __________________________________________________________/~~~~~~~\___________________
// <-axi_s_rlast        __________________________________________________________/~~~~~~~\___________________
// ->axi_s_rready[0]    __________________________________________________/~~~~~~~~~~~~~~~\___________________
// <-axi_s_rdata        __________________________________________________________<=data======================
//--------------------------------------------------------------------------------------------------------------------------------------------------------------

module fsm
  (
   input  wire                             ACLK,       // general clock (fpga:83MHz asic:240MHz)
   input  wire                             RSTN,       // general reset

   input  wire                             axi_s_arvalid,    // *in
   output wire                             axi_s_arready,    // *out
   input  wire [`AXI_ZCU_ADDR_BITS-1:0]    axi_s_araddr,     // *in
   input  wire [`AXI_S_LENG_BITS-1:0]      axi_s_arlen,      // *in
   input  wire [`AXI_S_SIZE_BITS-1:0]      axi_s_arsize,     //  in->...
   input  wire [`AXI_S_BURST_BITS-1:0]     axi_s_arburst,    //  in->n.c.ignored
// input  wire [`AXI_S_CACHE_BITS-1:0]     axi_s_arcache,    //      n.c.
// input  wire [`AXI_S_PROT_BITS-1:0]      axi_s_arprot,     //      n.c.
   input  wire [`AXI_S_ID_BITS-1:0]        axi_s_arid,       //  in->axiif_id->axi_s_rid/axi_s_bid
   output wire                             axi_s_rvalid,     // *out
   input  wire                             axi_s_rready,     // *in
   output wire                             axi_s_rlast,      //  (read-last)?1->out
   output wire [`AXI_S_DATA_BITS-1:0]      axi_s_rdata,      // *out
   output wire [`AXI_S_RESP_BITS-1:0]      axi_s_rresp,      //  out(always 0)
   output wire [`AXI_S_ID_BITS-1:0]        axi_s_rid,        //  axi_s_arid/axi_s_awid->axiif_id->out

   input  wire                             axi_s_awvalid,    // *in
   output wire                             axi_s_awready,    // *out
   input  wire [`AXI_ZCU_ADDR_BITS-1:0]    axi_s_awaddr,     // *in
   input  wire [`AXI_S_LENG_BITS-1:0]      axi_s_awlen,      // *in
   input  wire [`AXI_S_SIZE_BITS-1:0]      axi_s_awsize,     //  in->...
   input  wire [`AXI_S_BURST_BITS-1:0]     axi_s_awburst,    //  in->n.c.ignored
// input  wire [`AXI_S_CACHE_BITS-1:0]     axi_s_awcache,    //      n.c.
// input  wire [`AXI_S_PROT_BITS-1:0]      axi_s_awprot,     //      n.c.
   input  wire [`AXI_S_ID_BITS-1:0]        axi_s_awid,       //  in->axiif_id->axi_s_rid/axi_s_bid
   input  wire                             axi_s_wvalid,     // *in
   output wire                             axi_s_wready,     // *out
   input  wire                             axi_s_wlast,      //  in->n.c.ignored
   input  wire [`AXI_S_DATA_BITS-1:0]      axi_s_wdata,      // *in
   input  wire [`AXI_S_DATA_BYTES-1:0]     axi_s_wstrb,      // *in
   output wire                             axi_s_bvalid,     //  =axiif_wterm
   input  wire                             axi_s_bready,     //  axiif_wterm(write-last)&axi_s_bready->wterm=0
   output wire [`AXI_S_RESP_BITS-1:0]      axi_s_bresp,      //  out(always 0)
   output wire [`AXI_S_ID_BITS-1:0]        axi_s_bid,        //  axi_s_arid/axi_s_awid->axiif_id->out

   output reg                              axi_m_arvalid,    // *out
   input  wire                             axi_m_arready,    // *in
   output reg  [`AXI_ZCU_ADDR_BITS-1:0]    axi_m_araddr,     // *out
   output reg  [`AXI_S_LENG_BITS-1:0]      axi_m_arlen,      // *out
   output wire [`AXI_S_SIZE_BITS-1:0]      axi_m_arsize,     //  out const.5 (assign axi_s_arsize)
   output wire [`AXI_S_BURST_BITS-1:0]     axi_m_arburst,    //  out->n.c.ignored
   output wire [`AXI_S_CACHE_BITS-1:0]     axi_m_arcache,    //       n.c.
   output wire [`AXI_S_PROT_BITS-1:0]      axi_m_arprot,     //       n.c.
   output wire [`AXI_S_ID_BITS-1:0]        axi_m_arid,       //  assign axiif_id
   input  wire                             axi_m_rvalid,     // *in
   output wire                             axi_m_rready,     // *out
   input  wire                             axi_m_rlast,      //  in->n.c.ignored
   input  wire [`AXI_S_DATA_BITS-1:0]      axi_m_rdata,      // *in
   input  wire [`AXI_S_RESP_BITS-1:0]      axi_m_rresp,      //  in->n.c.ignored
   input  wire [`AXI_S_ID_BITS-1:0]        axi_m_rid,        //  in->n.c.ignored

   output reg                              axi_m_awvalid,    // *out
   input  wire                             axi_m_awready,    // *in
   output reg  [`AXI_ZCU_ADDR_BITS-1:0]    axi_m_awaddr,     // *out
   output reg  [`AXI_S_LENG_BITS-1:0]      axi_m_awlen,      // *out
   output wire [`AXI_S_SIZE_BITS-1:0]      axi_m_awsize,     //  out const.5 (assign axi_s_awsize)
   output wire [`AXI_S_BURST_BITS-1:0]     axi_m_awburst,    //  out->n.c.ignored
   output wire [`AXI_S_CACHE_BITS-1:0]     axi_m_awcache,    //       n.c.
   output wire [`AXI_S_PROT_BITS-1:0]      axi_m_awprot,     //       n.c.
   output wire [`AXI_S_ID_BITS-1:0]        axi_m_awid,       //  assign axiif_id
   output wire                             axi_m_wvalid,     // *out
   input  wire                             axi_m_wready,     // *in
   output wire                             axi_m_wlast,      //  out const.0
   output wire [`AXI_S_DATA_BITS-1:0]      axi_m_wdata,      // *out
   output wire [`AXI_S_DATA_BYTES-1:0]     axi_m_wstrb,      // *out
   input  wire                             axi_m_bvalid,     //  in->n.c.ignored
   output wire                             axi_m_bready,     //  out const.1
   input  wire [`AXI_S_RESP_BITS-1:0]      axi_m_bresp,      //  in->n.c.ignored
   input  wire [`AXI_S_ID_BITS-1:0]        axi_m_bid,        //  in->n.c.ignored
   input  wire                             next_linkup,      // for EMAX_NCHIP ºÇ½ªIMAX¤Î¤ß0

   output wire [`REG_CTRL_CMD]             ctrl_cmd,
   output wire [`REG_CTRL_CHIP]            ctrl_chip,
   output wire                             axi_busy,
   input  wire [`EMAX_DEPTH-1:0]           unit1_exec,       // 1bit corresponds to each unit
   input  wire [`EMAX_DEPTH-1:0]           unit1_fold,       // 1bit corresponds to each unit
   input  wire [`EMAX_DEPTH-1:0]           unit1_stop,       // 1bit corresponds to each unit
   input  wire [`EMAX_DEPTH-1:0]           unit2_exec,       // 1bit corresponds to each unit
   input  wire [`EMAX_DEPTH-1:0]           unit2_fold,       // 1bit corresponds to each unit
   input  wire [`EMAX_DEPTH-1:0]           unit2_stop,       // 1bit corresponds to each unit

   output wire                             axring_top_nemp,
   input  wire                             axring_top_ful,
   output wire [`AXRING_BR_BITS-1:0]       axring_top,
   input  wire                             axring_bot_nemp,    //    1:axring br buffer not empty
   output wire                             axring_bot_ful,     // <- 1:axring br buffer full
   input  wire [`LMRING_BR_BITS-1:0]       axring_bot
`ifdef DEBUG_FPGA
   ,
   output reg [2:0]                        axiif_dmrp_stat,    // imax#0only 0:idle 1:start 2:busy(init top/len) 3:busy(reading-lmm) 4:dma-read get data from DMRB
   output reg [`AXI_S_ADDR_BITS-1:0]       axiif_dmrp_top,     // 8byte-boundary
   output reg [`EXRING_ADDR_BITS-5-1:0]    axiif_dmrp_len,     // beats
   output reg                              axiif_dmrb_en1_d,   // delayed pfen1 for timing adjustment
   output reg                              axiif_sbusy,        /* 1:axi slave controller is busy */
   output reg                              axiif_mbusy,        /* 1:axi master controller is busy */
   output reg [`AXI_S_SIZE_BITS-1:0]       axiif_arsize,
   output reg [`AXI_S_SIZE_BITS-1:0]       axiif_awsize,
   output reg [`AXI_S_ID_BITS-1:0]         axiif_id,           /* keep axi id */
   output reg                              axiif_srw,          /* 0:read, 1:write */
   output reg [`AXI_S_ADDR_BITS-1:0]       axiif_addr,         /* count address for narrow burst */
   output reg [`AXI_S_ADDR_BITS-1:0]       axiif_addr_d,       /* delayed addr */
   output reg [`SKP_WIDTH-1:0]             axiif_skp,          /* address skip distance for narrow burst */
   output reg [`AXI_S_DATA_BITS-1:0]       axiif_wdata,        /* in */
   output reg [`AXI_S_DATA_BYTES-1:0]      axiif_wstrb,        /* in */
   output reg [`LEN_WIDTH-1:0]             axiif_bufq,         /* bufÆâ¤ÎÍ­¸úreq¿ô */
   output reg [`LEN_WIDTH-1:0]             axiif_alen,         /* copy of awlen/arlen */
   output reg [`LEN_WIDTH-1:0]             axiif_ilen,         /* accepted r/w len (internal) */
   output reg [`LEN_WIDTH-1:0]             axiif_blen,         /* accepted by buffer (internal) */
   output reg [`LEN_WIDTH-1:0]             axiif_plen,         /* accepted by dmabuf (internal) */
   output reg [`LEN_WIDTH-1:0]             axiif_mlen,         /* accepted by master (internal) */
   output reg [`LEN_WIDTH-1:0]             axiif_olen,         /* accepted bottom read (internal) */
   output reg                              axiif_wterm,        /* axi write transaction taminate */
   output reg                              axiif_keep_busy,    /* ¥È¥é¥ó¥¶¥¯¥·¥ç¥ó¤¬Æ±»þ¤ËÅþÃå¤·¤¿¤¿¤áRead¥È¥é¥ó¥¶¥¯¥·¥ç¥ó¤òÂÔµ¡ */
   output reg [`AXI_S_SIZE_BITS-1:0]       axiif_keep_size,    /* keep axi size */
   output reg [`AXI_S_ID_BITS-1:0]         axiif_keep_id,      /* keep axi id */
   output reg [`AXI_S_ADDR_BITS-1:0]       axiif_keep_addr,    /* keep count address for narrow burst */
   output reg [`SKP_WIDTH-1:0]             axiif_keep_skp,     /* address skip distance for narrow burst */
   output reg [`LEN_WIDTH-1:0]             axiif_keep_len,     /* len (internal) */
   output reg                              next_linkup_r
`endif
);

   /* axi control parameter */
`ifndef DEBUG_FPGA
   reg [2:0]                     axiif_dmrp_stat;    // imax#0only 0:idle 1:start 2:busy(init top/len) 3:busy(reading-lmm) 4:dma-read get data from DMRB
   reg [`AXI_S_ADDR_BITS-1:0] 	 axiif_dmrp_top;     // 8byte-boundary
   reg [`EXRING_ADDR_BITS-5-1:0] axiif_dmrp_len;     // beats
   reg 				 axiif_dmrb_en1_d;   // delayed pfen1 for timing adjustment
   reg 				 axiif_sbusy;        /* 1:axi slave controller is busy */
   reg 				 axiif_mbusy;        /* 1:axi master controller is busy */
   reg [`AXI_S_SIZE_BITS-1:0] 	 axiif_arsize;
   reg [`AXI_S_SIZE_BITS-1:0] 	 axiif_awsize;
   reg [`AXI_S_ID_BITS-1:0] 	 axiif_id;           /* keep axi id */
   reg 				 axiif_srw;          /* 0:read, 1:write */
   reg [`AXI_S_ADDR_BITS-1:0] 	 axiif_addr;         /* count address for narrow burst */
   reg [`AXI_S_ADDR_BITS-1:0] 	 axiif_addr_d;       /* delayed addr */
   reg [`SKP_WIDTH-1:0] 	 axiif_skp;          /* address skip distance for narrow burst */
   reg [`AXI_S_DATA_BITS-1:0] 	 axiif_wdata;        /* in */
   reg [`AXI_S_DATA_BYTES-1:0] 	 axiif_wstrb;        /* in */
   reg [`LEN_WIDTH-1:0] 	 axiif_bufq;         /* bufÆâ¤ÎÍ­¸úreq¿ô */
   reg [`LEN_WIDTH-1:0] 	 axiif_alen;         /* copy of awlen/arlen */
   reg [`LEN_WIDTH-1:0] 	 axiif_ilen;         /* accepted r/w len (internal) */
   reg [`LEN_WIDTH-1:0] 	 axiif_blen;         /* accepted by buffer (internal) */
   reg [`LEN_WIDTH-1:0] 	 axiif_plen;         /* accepted by dmabuf (internal) */
   reg [`LEN_WIDTH-1:0] 	 axiif_mlen;         /* accepted by master (internal) */
   reg [`LEN_WIDTH-1:0] 	 axiif_olen;         /* accepted bottom read (internal) */
   reg 				 axiif_wterm;        /* axi write transaction taminate */

   reg 				 axiif_keep_busy;    /* ¥È¥é¥ó¥¶¥¯¥·¥ç¥ó¤¬Æ±»þ¤ËÅþÃå¤·¤¿¤¿¤áRead¥È¥é¥ó¥¶¥¯¥·¥ç¥ó¤òÂÔµ¡ */
   reg [`AXI_S_SIZE_BITS-1:0] 	 axiif_keep_size;    /* keep axi size */
   reg [`AXI_S_ID_BITS-1:0] 	 axiif_keep_id;      /* keep axi id */
   reg [`AXI_S_ADDR_BITS-1:0] 	 axiif_keep_addr;    /* keep count address for narrow burst */
   reg [`SKP_WIDTH-1:0] 	 axiif_keep_skp;     /* address skip distance for narrow burst */
   reg [`LEN_WIDTH-1:0] 	 axiif_keep_len;     /* len (internal) */
   reg 				 next_linkup_r;
`endif

// define REG_CTRL_BITS              512
// define REG_CTRL_STAT_EXRING       0                         /* +0000 */ Ull stat_exring;
// define REG_CTRL_STAT_EXRING_IDLE  0
// define REG_CTRL_STAT_EXRING_BUSY  1
// define REG_CTRL_STAT_LMRING       4                         /* +0000 */ Ull stat_lmring;
// define REG_CTRL_STAT_LMRING_IDLE  0
// define REG_CTRL_STAT_LMRING_BUSY  1
// define REG_CTRL_MCID              64+`EMAX_NCHIP_BITS-1:64
// define REG_CTRL_CMD_BITS          2
// define REG_CTRL_CMD               128+`REG_CTRL_CMD_BITS-1:128/* +0010 */ Ull cmd;
// define REG_CTRL_CMD_NOP           0
// define REG_CTRL_CMD_RESET         1
// define REG_CTRL_CMD_SCON          2
// define REG_CTRL_CMD_EXEC          3
// define REG_CTRL_CHIP              144+`EMAX_NCHIP_BITS-1:144  /* +0012 */ Ull chip;
// define REG_CTRL_ADTR              256+`AXI_S_ADDR_BITS-1:256  /* +0020 */ Ull adtr;
//`define REG_CTRL_CSEL_BITS         2
//`define REG_CTRL_CSEL              384+`REG_CTRL_CSEL_BITS-1:384/* +0030 */ Ull csel;
// define REG_CTRL_DMRPTOP           448+`AXI_S_ADDR_BITS-1:448
// define REG_CTRL_DMRPTOPDWLOC      452:451
// define REG_CTRL_DMRPTOPALIGN      448+`AXI_S_ADDR_BITS-1:453
// define REG_CTRL_DMRPLEN           488+`EXRING_ADDR_BITS-1:488
// define REG_CTRL_DMRPLENDWLOC      492:491
// define REG_CTRL_DMRPLENALIGN      488+`EXRING_ADDR_BITS-1:493
// define REG_CTRL_DMRB_ACTIVE       511

   reg        			 reg_ctrl_stat_exring;
   reg 				 reg_ctrl_stat_lmring;
   reg [`REG_CTRL_MCID] 	 reg_ctrl_mcid;
   reg [`REG_CTRL_CMD] 		 reg_ctrl_cmd;
   reg [`REG_CTRL_CHIP] 	 reg_ctrl_chip;
   reg [`REG_CTRL_ADTR] 	 reg_ctrl_adtr;
   reg [`REG_CTRL_CSEL] 	 reg_ctrl_csel;
   reg [`REG_CTRL_DMRPTOP] 	 reg_ctrl_dmrptop;
   wire [`REG_CTRL_DMRPTOPDWLOC] reg_ctrl_dmrptopdwloc = reg_ctrl_dmrptop[`REG_CTRL_DMRPTOPDWLOC];
   wire [`REG_CTRL_DMRPTOPALIGN] reg_ctrl_dmrptopalign = reg_ctrl_dmrptop[`REG_CTRL_DMRPTOPALIGN];
   reg [`REG_CTRL_DMRPLEN] 	 reg_ctrl_dmrplen;
   wire [`REG_CTRL_DMRPLENDWLOC] reg_ctrl_dmrplendwloc = reg_ctrl_dmrplen[`REG_CTRL_DMRPLENDWLOC];
   wire [`REG_CTRL_DMRPLENALIGN] reg_ctrl_dmrplenalign = reg_ctrl_dmrplen[`REG_CTRL_DMRPLENALIGN];
   reg 				 reg_ctrl_dmrb_active;
   reg [1:0] 			 cycle;
   /* physical interface (pipelined) to EMAX6-body */
   wire [2:0] 			 axring_top_ty;
   wire [`AXI_S_DATA_BITS-1:0] 	 axring_top_data;
   wire [`AXI_S_DATA_BYTES-1:0]  axring_top_strb;
   wire [30:0] 			 axring_top_addr;
   wire [`AXRING_BR_BITS-1:0] 	 axring_top_bin;
   wire 			 axring_top_axi2buf_en;  /* fsmÆâ¤ÇÍÑ°Õ¤¹¤ë wvalid¤Èaddr¤Î¹çÀ®*/
   wire 			 axring_top_buf_nful;    /* nbit_ndepth_queue ÏÀÍýÈ¿Å¾ÍÑ */
   wire 			 axring_top_nful;

   wire [`AXRING_BR_BITS-1:0] 	 axring_bot_bout;
   wire 			 axring_bot_buf2axi_en;  /* fsmÆâ¤ÇÍÑ°Õ¤¹¤ë rready¤Èbout.rw¤Î¹çÀ®*/
   wire 			 axring_bot_buf_nemp;    /* axi rdata valid */
   wire 			 axring_bot_nful;        /* nbit_ndepth_queue ÏÀÍýÈ¿Å¾ÍÑ */

   wire 			 axi_s_rvalid_i;         /* internal s_rvalid for DMRB_PREF */
   wire 			 axi_s_rlast_i;          /* internal s_rlast for DMRB_PREF */
   wire 			 dmrb_top_buf_nful;
   wire 			 dmrb_top_buf_nful1;
   wire [`AXI_S_DATA_BITS-1:0] 	 dmrb_dout;
   wire 			 dmrb_top_s_rvalid;

   wire 			 pfen0;
   wire 			 pfen1;
   wire [`EXRING_ADDR_BITS-1:0]  pfma0;
   wire [`EXRING_ADDR_BITS-1:0]  pfma1;
   wire [`AXI_S_DATA_BYTES-1:0]  pfwm0;
   wire [`AXI_S_DATA_BITS-1:0] 	 pfmw0;
   wire [`AXI_S_DATA_BITS-1:0] 	 pfmr1;

//// FT 2020/09/28 BEGIN
//// reg [1:0] 			 reg_ctrl_dmrb_active_mask;
//// reg 			 axiif_mbusy_mask;
//// reg 			 axiif_keep_busy_f;
//// FT 2020/09/28 END

   assign                        ctrl_chip = reg_ctrl_chip;
   wire [`REG_CTRL_MCID] 	 ctrl_mcid = reg_ctrl_mcid;
   assign                        ctrl_cmd  = (ctrl_chip<=ctrl_mcid||~(reg_ctrl_cmd&2'b10))?reg_ctrl_cmd:`REG_CTRL_CMD_NOP; //`REG_CTRL_CMD_NOP||`REG_CTRL_CMD_RESET
   
   wire [`AXI_S_ADDR_BITS-1:0] aligned_awaddr;
   assign aligned_awaddr = (axi_s_awsize==3'h7) ?  {axi_s_awaddr[`AXI_S_ADDR_BITS-1:7],7'h00}:
                           (axi_s_awsize==3'h6) ?  {axi_s_awaddr[`AXI_S_ADDR_BITS-1:6],6'h00}:
                           (axi_s_awsize==3'h5) ?  {axi_s_awaddr[`AXI_S_ADDR_BITS-1:5],5'h00}:
                           (axi_s_awsize==3'h4) ?  {axi_s_awaddr[`AXI_S_ADDR_BITS-1:4],4'h0}:
                           (axi_s_awsize==3'h3) ?  {axi_s_awaddr[`AXI_S_ADDR_BITS-1:3],3'h0}:
                           (axi_s_awsize==3'h2) ?  {axi_s_awaddr[`AXI_S_ADDR_BITS-1:2],2'h0}:
                           (axi_s_awsize==3'h1) ?  {axi_s_awaddr[`AXI_S_ADDR_BITS-1:1],1'h0}:
                                                    axi_s_awaddr;
   wire [`AXI_S_ADDR_BITS-1:0] aligned_araddr;
   assign aligned_araddr = (axi_s_arsize==3'h7)?   {axi_s_araddr[`AXI_S_ADDR_BITS-1:7],7'h00}:
                           (axi_s_arsize==3'h6)?   {axi_s_araddr[`AXI_S_ADDR_BITS-1:6],6'h00}:
                           (axi_s_arsize==3'h5)?   {axi_s_araddr[`AXI_S_ADDR_BITS-1:5],5'h00}:
                           (axi_s_arsize==3'h4)?   {axi_s_araddr[`AXI_S_ADDR_BITS-1:4],4'h0}:
                           (axi_s_arsize==3'h3)?   {axi_s_araddr[`AXI_S_ADDR_BITS-1:3],3'h0}:
                           (axi_s_arsize==3'h2)?   {axi_s_araddr[`AXI_S_ADDR_BITS-1:2],2'h0}:
                           (axi_s_arsize==3'h1)?   {axi_s_araddr[`AXI_S_ADDR_BITS-1:1],1'h0}:
                                                    axi_s_araddr;
   wire [`AXI_S_ADDR_BITS-1:0] axiif_aligned_addr;
   wire [`AXI_S_LENG_BITS-1:0] axiif_dmrp_beat = (axiif_dmrp_len < 10'd128) ? axiif_dmrp_len : 10'd127;
   generate
     if(`AXI_S_DATA_BITS == 256)
       assign axiif_aligned_addr = {axiif_addr_d[`AXI_S_ADDR_BITS-1:5],5'h00};
     else if(`AXI_S_DATA_BITS == 128)
       assign axiif_aligned_addr = {axiif_addr_d[`AXI_S_ADDR_BITS-1:4],4'h0};
   endgenerate

  function addr_ge_regconf;
    input [`AXI_S_ADDR_BITS-1:0] a;
      // REG_CONF_OFFS  32'h000x_2000  a[19:13]
      // LMM_BASE_PHYS  32'h8000_0000  a[`AXI_S_ADDR_BITS-1]
    begin
      addr_ge_regconf = |{a[`AXI_S_ADDR_BITS-1],a[19:13]};
    end
  endfunction

   wire [`AXI_S_ADDR_BITS-1:0] vadr = axiif_aligned_addr + reg_ctrl_adtr;
   wire 		       c2c_drive_m_rd =                                    ctrl_chip<ctrl_mcid  && next_linkup_r; //axiif_m_rd*
   wire 		       c2c_drive_m_wr = (~addr_ge_regconf(aligned_awaddr)||ctrl_chip<ctrl_mcid) && next_linkup_r; //axiif_m_wr*
     
   assign axi_busy      = axiif_sbusy|axiif_mbusy;

//// FT 2020/09/28 BEGIN
     assign axi_s_awready = !axiif_sbusy && !axiif_mbusy && ctrl_cmd!=`REG_CTRL_CMD_RESET && axiif_dmrp_stat[1:0] == 2'b00;
//// assign axi_s_awready = !axiif_sbusy && !axiif_mbusy && ctrl_cmd!=`REG_CTRL_CMD_RESET && axiif_dmrp_stat[1:0] == 2'b00 && reg_ctrl_dmrb_active_mask[1:0] != 2'b01 && !axiif_mbusy_mask;
//// FT 2020/09/28 END

   assign axi_s_wready  = axiif_sbusy && axiif_srw && (axiif_aligned_addr == `REG_BASE_PHYS ? !axiif_bufq : (axiif_blen == axiif_ilen && (c2c_drive_m_wr?axiif_mlen==axiif_ilen:1'b1)));
   assign axi_s_bvalid  = axiif_wterm;
   assign axi_s_bresp   = 2'b00; // OKAY
   assign axi_s_bid     = axiif_id;


//// FT 2020/09/28 BEGIN
     assign axi_s_arready = !axiif_sbusy && !axiif_mbusy && ctrl_cmd!=`REG_CTRL_CMD_RESET && axiif_dmrp_stat[1:0] == 2'b00;
//// assign axi_s_arready = !axiif_sbusy && !axiif_mbusy && ctrl_cmd!=`REG_CTRL_CMD_RESET && axiif_dmrp_stat[1:0] == 2'b00 && reg_ctrl_dmrb_active_mask[1:0] != 2'b01 && !axiif_mbusy_mask;
//// FT 2020/09/28 END

   assign axi_s_rvalid_i= axiif_sbusy && !axiif_srw && (~addr_ge_regconf(axiif_aligned_addr) || (dmrb_top_s_rvalid&&axiif_olen<=axiif_alen) || (!axring_bot_bout[`AXRING_BR_RW]&&axring_bot_buf_nemp&&axiif_olen<=axiif_alen&&(c2c_drive_m_rd?axi_m_rvalid:1'b1))); //¡ú¡ú¡úAXI=READBUF
   assign axi_s_rvalid  = axiif_dmrp_stat[1:0] == 2'b00 && axi_s_rvalid_i;
   assign axi_s_rlast_i = axiif_sbusy && !axiif_srw && (~addr_ge_regconf(axiif_aligned_addr) || (dmrb_top_s_rvalid&&axiif_olen==axiif_alen) || (!axring_bot_bout[`AXRING_BR_RW]&&axring_bot_buf_nemp&&axiif_olen==axiif_alen&&(c2c_drive_m_rd?axi_m_rvalid:1'b1))); //¡ú¡ú¡úAXI=READBUF
   assign axi_s_rlast   = axiif_dmrp_stat[1:0] == 2'b00 && axi_s_rlast_i;
   assign axi_s_rresp   = 2'b00; // OKAY
   assign axi_s_rid     = axiif_id;

   assign axi_m_arburst = 2'b01;
   assign axi_m_awburst = 2'b01;
   assign axi_m_arsize  = axiif_arsize;
   assign axi_m_awsize  = axiif_awsize;
   assign axi_m_arcache = `AXI_S_CACHE_BITS'd0;
   assign axi_m_awcache = `AXI_S_CACHE_BITS'd0;
   assign axi_m_arprot  = `AXI_S_PROT_BITS'd0;
   assign axi_m_awprot  = `AXI_S_PROT_BITS'd0;
   assign axi_m_arid    = axiif_id;
   assign axi_m_awid    = axiif_id;
   assign axi_m_bready  = 1'b1;

   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN) begin
       cycle <= 2'h0;
     end
     else begin
       cycle <= cycle + 2'h1;
     end
   end

   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN) begin
       next_linkup_r <= 1'b0;
     end
     else begin
       next_linkup_r <= next_linkup;
     end
   end

   reg                                     cmd_busy;           /* reg_ctrl.stat¤ËÄ¾ÀÜÈ¿±Ç */
   wire                                    unit_busy;          /* reg_ctrl.stat¤ËÄ¾ÀÜÈ¿±Ç */
   assign unit_busy = |unit1_exec || |unit1_fold || |unit1_stop || |unit2_exec || |unit2_fold || |unit2_stop;

   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN) begin
       cmd_busy <= 1'b0;
     end
     else begin
       if (ctrl_cmd == `REG_CTRL_CMD_EXEC) cmd_busy <= 1'b1;
       else if (cycle == 2'h3)             cmd_busy <= 1'b0;
     end
   end

   assign axring_top_axi2buf_en = addr_ge_regconf(axiif_aligned_addr) && ~axiif_dmrp_stat[2] && axiif_blen <  axiif_ilen;
   assign axi_m_wvalid          = c2c_drive_m_wr       && axiif_mbusy && axiif_srw           && axiif_mlen <  axiif_ilen;
   assign axi_m_wlast           = c2c_drive_m_wr       && axiif_mbusy && axiif_srw           && axiif_mlen == axiif_alen;
   wire tmp_axring_top_nemp;
   assign axring_top_nemp    = tmp_axring_top_nemp & ~axring_top_ful; // <- |(ready[unit0,8,16,..])
   nbit_ndepth_queue
     #(
       .REG_WIDTH  (`AXRING_BR_BITS),
       .QUEUE_DEPTH(`AXRING_BR_BUF),
       .QPTR_BITS  (`AXRING_BR_PTRBITS),
       .QNUM_BITS  (`AXRING_BR_NUMBITS)
       ) axring_top_buf (
                         .ACLK   (ACLK                   ),
                         .RSTN   (RSTN                   ),
                         .i_data (axring_top_bin         ), // <- in
                         .i_val  (axring_top_axi2buf_en  ), // <- input axidata valid
                         .i_rdy  (axring_top_buf_nful    ), // -> output ready (can enqueue)
                         .i_rdy1 (                       ), //
                         .q_data (axring_top             ), // -> out
                         .q_val  (tmp_axring_top_nemp    ), // -> output data valid
                         .q_rdy  (~axring_top_ful        )  // <- input |(ready[*unit]) (can dequeue)
                         );
   
   assign axring_bot_buf2axi_en =  axring_bot_bout[`AXRING_BR_RW] /* write¤Ï¾ï¤Ëdeq */   || (axiif_olen <= axiif_alen && (axiif_dmrp_stat==3'b011||axi_s_rready) && (c2c_drive_m_rd?axi_m_rvalid:1'b1));
   assign axi_m_rready          = !axring_bot_bout[`AXRING_BR_RW] && axring_bot_buf_nemp && (axiif_olen <= axiif_alen && (axiif_dmrp_stat==3'b011||axi_s_rready) && (c2c_drive_m_rd?axi_m_rvalid:1'b1));
   wire tmp_axring_bot_nful;
   assign axring_bot_ful     = ~(tmp_axring_bot_nful & axring_bot_nemp); // -> ready[unit7,15,23,..]
   nbit_ndepth_queue
     #(
       .REG_WIDTH  (`LMRING_BR_BITS),
       .QUEUE_DEPTH(`LMRING_BR_BUF),
       .QPTR_BITS  (`LMRING_BR_PTRBITS),
       .QNUM_BITS  (`LMRING_BR_NUMBITS)
       ) axring_bot_buf (
                         .ACLK   (ACLK                   ),
                         .RSTN   (RSTN                   ),
                         .i_data (axring_bot             ), // <- in
                         .i_val  (axring_bot_nemp        ), // <- input &(valid[*unit])
                         .i_rdy  (tmp_axring_bot_nful    ), // -> output ready (can enqueue)
                         .i_rdy1 (                       ), //
                         .q_data (axring_bot_bout        ), // -> out
                         .q_val  (axring_bot_buf_nemp    ), // -> output axidata valid
                         .q_rdy  (axring_bot_buf2axi_en  )  // <- input ready (can dequeue)
                         );

   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN) begin
       axiif_bufq      <= {`LEN_WIDTH{1'b0}};
     end
     else begin
       if      (axring_top_axi2buf_en && axring_top_buf_nful && axring_bot_buf_nemp && axring_bot_buf2axi_en) axiif_bufq <= axiif_bufq;
       else if (axring_top_axi2buf_en && axring_top_buf_nful)                                                 axiif_bufq <= axiif_bufq + 1'b1;
       else if (axring_bot_buf_nemp && axring_bot_buf2axi_en)                                                 axiif_bufq <= axiif_bufq - 1'b1;
     end
   end
   /*************/
   /* axi slave */
   /*************/
   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN) begin /* RESET¥³¥Þ¥ó¥É¤¬È¯¹Ô¤µ¤ì¤Æ¤âAXI¤Î¥¹¥Æ¡¼¥È¤ÏÇË²õ¤·¤Æ¤Ï¤¤¤±¤Ê¤¤ <= MasterÂ¦¤¬±Ê±ó¤Ë±þÅúÂÔ¤Á¾õÂÖ¤Ë¤Ê¤ë²ÄÇ½À­¤¬¤¢¤ë¤¿¤á */
       axiif_dmrp_stat <= 3'b000; // imax#0only 0:idle 1:start 2:busy(init top/len) 3:busy(reading-lmm)
       axiif_dmrp_top  <= {(`AXI_S_ADDR_BITS){1'b0}};
       axiif_dmrp_len  <= {(`EXRING_ADDR_BITS-5){1'b0}};
       axiif_sbusy     <= 1'b0;
       axiif_arsize    <= {(`AXI_S_SIZE_BITS){1'b0}};
       axiif_awsize    <= {(`AXI_S_SIZE_BITS){1'b0}};
       axiif_id        <= {(`AXI_S_ID_BITS){1'b0}};
       axiif_srw       <= 1'b0;
       axiif_addr      <= {(`AXI_S_ADDR_BITS){1'b0}};
       axiif_addr_d    <= {(`AXI_S_ADDR_BITS){1'b0}};
       axiif_skp       <= {(`SKP_WIDTH){1'b0}};
       axiif_wdata     <= {(`AXI_S_DATA_BITS){1'b0}};
       axiif_wstrb     <= {(`AXI_S_DATA_BYTES){1'b0}};
       axiif_alen      <= {(`LEN_WIDTH){1'b0}};
       axiif_ilen      <= {(`LEN_WIDTH){1'b0}};
       axiif_plen      <= {(`LEN_WIDTH){1'b0}};
       axiif_olen      <= {(`LEN_WIDTH){1'b0}};
       axiif_wterm     <= 1'b0;

       axiif_keep_busy <= 1'b0;
       axiif_keep_size <= {(`AXI_S_SIZE_BITS){1'b0}};
       axiif_keep_id   <= {(`AXI_S_ID_BITS){1'b0}};
       axiif_keep_addr <= {(`AXI_S_ADDR_BITS){1'b0}};
       axiif_keep_skp  <= {(`SKP_WIDTH){1'b0}};
       axiif_keep_len  <= {(`LEN_WIDTH){1'b0}};

//// FT 2020/09/28 BEGIN
////   axiif_keep_busy_f <= 1'b0;
//// FT 2020/09/28 END

     end
     else begin
       if (!axiif_sbusy && ctrl_cmd != `REG_CTRL_CMD_RESET) begin /* axi controller is free ¤«¤Ä RESET¥³¥Þ¥ó¥É¼Â¹ÔÃæ¤Ç¤Ê¤¤¤È¤­ */
	 if (axiif_dmrp_stat == 3'b100 && |ctrl_chip==1'b0 && reg_ctrl_dmrb_active == 1'b0) axiif_dmrp_stat <= 3'b000; /* reset dmrp */
//// FT 2020/09/28 BEGIN
	 if (axiif_dmrp_stat == 3'b000 && |ctrl_chip==1'b0 && reg_ctrl_dmrb_active == 1'b1) axiif_dmrp_stat <= 3'b001; /* dmrp on */
////	 if (axiif_dmrp_stat == 3'b000 && |ctrl_chip==1'b0 && reg_ctrl_dmrb_active == 1'b1 && !axiif_mbusy && !axiif_mbusy_mask ) axiif_dmrp_stat <= 3'b001; /* dmrp on */
//// FT 2020/09/28 END

	 else if (axiif_dmrp_stat == 3'b001) begin // dmrp start
	   axiif_dmrp_stat <= 3'b010; // imax#0only 0:idle 1:start 2:busy(init top/len) 3:busy(reading-lmm)
	   axiif_dmrp_top  <= {reg_ctrl_dmrptopalign,5'h00};
	   case (reg_ctrl_dmrptopdwloc)
	     2'b00: begin
	       case (reg_ctrl_dmrplendwloc)
		 2'b00:  axiif_dmrp_len <= reg_ctrl_dmrplenalign-1;
		 2'b01:  axiif_dmrp_len <= reg_ctrl_dmrplenalign;
		 2'b10:  axiif_dmrp_len <= reg_ctrl_dmrplenalign;
		 default:axiif_dmrp_len <= reg_ctrl_dmrplenalign;
	       endcase
	     end
	     2'b01: begin
	       case (reg_ctrl_dmrplendwloc)
		 2'b00:  axiif_dmrp_len <= reg_ctrl_dmrplenalign;
		 2'b01:  axiif_dmrp_len <= reg_ctrl_dmrplenalign;
		 2'b10:  axiif_dmrp_len <= reg_ctrl_dmrplenalign;
		 default:axiif_dmrp_len <= reg_ctrl_dmrplenalign;
	       endcase
	     end
	     2'b10: begin
	       case (reg_ctrl_dmrplendwloc)
		 2'b00:  axiif_dmrp_len <= reg_ctrl_dmrplenalign;
		 2'b01:  axiif_dmrp_len <= reg_ctrl_dmrplenalign;
		 2'b10:  axiif_dmrp_len <= reg_ctrl_dmrplenalign;
		 default:axiif_dmrp_len <= reg_ctrl_dmrplenalign+1;
	       endcase
	     end
	     default: begin
	       case (reg_ctrl_dmrplendwloc)
		 2'b00:  axiif_dmrp_len <= reg_ctrl_dmrplenalign;
		 2'b01:  axiif_dmrp_len <= reg_ctrl_dmrplenalign;
		 2'b10:  axiif_dmrp_len <= reg_ctrl_dmrplenalign+1;
		 default:axiif_dmrp_len <= reg_ctrl_dmrplenalign+1;
	       endcase
	     end
	   endcase
	 end
	 else if (axiif_dmrp_stat == 3'b010) begin // busy(init top/len)
	   axiif_dmrp_stat <= 3'b011; // 0:idle 1:start 2:busy(init top/len) 3:busy(reading-lmm)
	   axiif_sbusy     <= 1'b1;
	   axiif_arsize    <= 3'b101;
	   axiif_id        <= {(`AXI_S_ID_BITS){1'b0}};
	   axiif_srw       <= 1'b0;
	   axiif_addr      <= axiif_dmrp_top;
	   axiif_addr_d    <= axiif_dmrp_top;
	   axiif_skp       <= 1'b1<<3'b101;
	   axiif_alen      <= {{(`LEN_WIDTH - `AXI_S_LENG_BITS){1'b0}},axiif_dmrp_beat};
	   axiif_ilen      <= {`LEN_WIDTH'd1}; /* ½é´üÃÍ0¤Ç¤Ïstart¤·¤Ê¤¤ */
	   axiif_plen      <= {`LEN_WIDTH{1'b0}};
	   axiif_olen      <= {`LEN_WIDTH{1'b0}};
	 end
	 else if (axi_s_awvalid && axi_s_awready) begin /* Æ±»þ¤Ë¥È¥é¥ó¥¶¥¯¥·¥ç¥ó¤¬ÅþÃå¤·¤¿»þ¤ÎÂÐ±þ¡¤ ¤È¤ê¤¢¤¨¤º READ¤Î¾ðÊó¤ò keep¤·¤È¤¤¤Æ WRITE¤ËÆ¨¤²¤ë*/
	   axiif_sbusy     <= 1'b1;
	   axiif_awsize    <= axi_s_awsize;
	   axiif_id        <= axi_s_awid;
	   axiif_srw       <= 1'b1;
	   axiif_addr      <= aligned_awaddr;
	   axiif_addr_d    <= aligned_awaddr;
	   axiif_skp       <= 1'b1<<axi_s_awsize;
	   axiif_alen      <= {{(`LEN_WIDTH - `AXI_S_LENG_BITS){1'b0}},axi_s_awlen};
	   axiif_ilen      <= {`LEN_WIDTH{1'b0}};
	   if (axi_s_arvalid && axi_s_arready) begin
	     axiif_keep_busy <= 1'b1;
	     axiif_keep_size <= axi_s_arsize;
	     axiif_keep_id   <= axi_s_arid;
	     axiif_keep_addr <= aligned_araddr;
	     axiif_keep_skp  <= 1'b1<<axi_s_arsize;
	     axiif_keep_len  <= {{(`LEN_WIDTH - `AXI_S_LENG_BITS){1'b0}},axi_s_arlen};
	   end
	 end
	 else if (axi_s_arvalid && axi_s_arready) begin // READ È¯¹Ô
	   axiif_sbusy     <= 1'b1;
	   axiif_arsize    <= axi_s_arsize;
	   axiif_id        <= axi_s_arid;
	   axiif_srw       <= 1'b0;
	   axiif_addr      <= aligned_araddr;
	   axiif_addr_d    <= aligned_araddr;
	   axiif_skp       <= 1'b1<<axi_s_arsize;
	   axiif_alen      <= {{(`LEN_WIDTH - `AXI_S_LENG_BITS){1'b0}},axi_s_arlen};
	   axiif_ilen      <= {`LEN_WIDTH'd1}; /* ½é´üÃÍ0¤Ç¤Ïstart¤·¤Ê¤¤ */
	   axiif_plen      <= {`LEN_WIDTH{1'b0}};
	   axiif_olen      <= {`LEN_WIDTH{1'b0}};
	 end
       end
       else begin // axi controller is busy
	 if (axiif_srw) begin /* WRITE transaction is busy */
	   if (axi_s_wvalid & axi_s_wready) begin
	     axiif_wdata    <= axi_s_wdata;
	     axiif_wstrb    <= axi_s_wstrb;
	     axiif_addr     <= axiif_addr + axiif_skp;
	     axiif_addr_d   <= axiif_addr;
	     axiif_ilen     <= axiif_ilen + 1'b1;
	     if (axiif_ilen == axiif_alen) axiif_wterm <= 1'b1;
	   end
	   else if (axiif_wterm && axi_s_bready) begin
	     axiif_wterm    <= 1'b0;
	     if (axiif_keep_busy) begin /* Æ±»þ¤Ë¥È¥é¥ó¥¶¥¯¥·¥ç¥ó¤¬ÅþÃå¤·¤Æ¤¤¤¿¾ì¹ç¤Î½èÍý¡¤ busy¤ò²ò½ü¤»¤º¤Ë READ¤ËÆ¨¤²¤ë */
//// FT 2020/09/28 BEGIN
////	       if ( !axiif_mbusy && !axiif_mbusy_mask ) begin
		 axiif_arsize <= axiif_keep_size;
		 axiif_id     <= axiif_keep_id;
		 axiif_srw    <= 1'b0;
		 axiif_addr   <= axiif_keep_addr;
		 axiif_addr_d <= axiif_keep_addr;
		 axiif_skp    <= axiif_keep_skp;
		 axiif_alen   <= axiif_keep_len;
		 axiif_olen   <= {`LEN_WIDTH{1'b0}};
		 axiif_keep_busy <= 1'b0;
////	       end
////	       else begin
////		 axiif_keep_busy_f <= 1'b1;
////	       end
//// FT 2020/09/28 END
	     end
	     else begin
	       axiif_sbusy  <= 1'b0;
	     end
	   end
//// FT 2020/09/28 BEGIN
////	   else if( axiif_keep_busy && axiif_keep_busy_f && !axiif_mbusy && !axiif_mbusy_mask )begin
////	     axiif_arsize <= axiif_keep_size;
////	     axiif_id     <= axiif_keep_id;
////	     axiif_srw    <= 1'b0;
////	     axiif_addr   <= axiif_keep_addr;
////	     axiif_addr_d <= axiif_keep_addr;
////	     axiif_skp    <= axiif_keep_skp;
////	     axiif_alen   <= axiif_keep_len;
////	     axiif_olen   <= {`LEN_WIDTH{1'b0}};
////	     axiif_keep_busy <= 1'b0;
////	     axiif_keep_busy_f <= 1'b0;
////	   end
//// FT 2020/09/28 END
	 end
	 else begin          /* READ transaction is busy */ //¡úAXI=READBUF
	   //   clk                _/~~~\___/~~~\___/~~~\___/~~~\___/~~~\___/~~~\___/
	   //                       |       |       |       |       |       |       |       
	   //   axiif_addr_d       -<=A0====X=A1====X=A2====X=A3============
	   //   pfma1              -<=A0====X=A1====X=A2====X=A3============
	   //   pfen1              _/~~~~~~~~~~~~~~~~~~~~~~~\______A________ dmrb_top_buf_nful && ~dmrb_top_buf_nful1
	   //   pfmr1              ---------<=D0====X=D1====X=D2====>--

	   //   i_data             ---------<=D0====X=D1====X=D2====>--
           //   dmrb_top_axi2buf_en_________/~~~~~~~*~~~~~~~*~~~~~~~*_______ pfen1_delay
           //   dmrb_top_buf_nful  _/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|\_______
           //   dmrb_top_buf_nful1 _________________________/~~~~~~~\_______ nful1=1¤ò¤â¤Ã¤Æaddr_d¹¹¿·Ää»ß

	   //   dmrb_dout          -----------------<=D0====X=D1============X=D2====>
	   //   dmrb_top_s_rvalid  _________________/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	   //   axi_s_rvalid       _________________/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	   //   axi_s_rready       __________/~~~~~~~~~~~~~~\______|/~~~~~~~~~~~~~~~\
	   if (axiif_ilen <= axiif_alen && (pfen1 || (axring_top_axi2buf_en && axring_top_buf_nful))) begin
	     axiif_addr   <= axiif_addr   + axiif_skp;
	     axiif_addr_d <= axiif_addr_d + axiif_skp;
	     axiif_ilen   <= axiif_ilen + 1'b1; //¡úAXI=READBUF
	   end
	   if (pfen1) begin
	     axiif_plen   <= axiif_plen + 1'b1; //¡úAXI=READBUF
	   end
	   if (axi_s_rvalid_i && (axiif_dmrp_stat==3'b011||axi_s_rready)) begin
	     axiif_olen    <= axiif_olen + 1'b1;
	     if (axi_s_rlast_i) begin
	       axiif_sbusy <= 1'b0;
	       if (axiif_dmrp_stat == 3'b011) begin
		 if (axiif_dmrp_len < 10'd128) begin
		   axiif_dmrp_stat <= 3'b100; /* dmrp end */
		 end
		 else begin
		   axiif_dmrp_stat <= 3'b010; /* dmrp cont.*/
		   axiif_dmrp_top  <= axiif_dmrp_top + {(axiif_dmrp_beat+1),5'd0};
		   axiif_dmrp_len  <= axiif_dmrp_len -  (axiif_dmrp_beat+1);
		 end
	       end
	     end
	   end
	 end
       end
     end
   end // always
   /**************/
   /* axi master */
   /**************/
   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN) begin /* RESET¥³¥Þ¥ó¥É¤¬È¯¹Ô¤µ¤ì¤Æ¤âAXI¤Î¥¹¥Æ¡¼¥È¤ÏÇË²õ¤·¤Æ¤Ï¤¤¤±¤Ê¤¤ <= MasterÂ¦¤¬±Ê±ó¤Ë±þÅúÂÔ¤Á¾õÂÖ¤Ë¤Ê¤ë²ÄÇ½À­¤¬¤¢¤ë¤¿¤á */
       axiif_blen      <= {(`LEN_WIDTH){1'b0}};
       axiif_mlen      <= {(`LEN_WIDTH){1'b0}};

       axi_m_arvalid   <= 1'b0;
       axi_m_araddr    <= {`AXI_ZCU_ADDR_HIGH,{(`AXI_S_ADDR_BITS){1'b0}}};
       axi_m_arlen     <= {(`AXI_S_LENG_BITS){1'b0}};
       axi_m_awvalid   <= 1'b0;
       axi_m_awaddr    <= {`AXI_ZCU_ADDR_HIGH,{(`AXI_S_ADDR_BITS){1'b0}}};
       axi_m_awlen     <= {(`AXI_S_LENG_BITS){1'b0}};
     end
     else begin
       if (!axiif_sbusy && ctrl_cmd != `REG_CTRL_CMD_RESET && axiif_dmrp_stat == 3'b010) begin
	 if (c2c_drive_m_rd) begin
	   axi_m_araddr    <= {`AXI_ZCU_ADDR_HIGH,axiif_dmrp_top};
	   axi_m_arlen     <= axiif_dmrp_beat;
	   axi_m_arvalid   <= 1'b1;
	 end
	 axiif_blen      <= {`LEN_WIDTH{1'b0}};
       end
       else if (!axiif_sbusy && ctrl_cmd != `REG_CTRL_CMD_RESET && axi_s_awvalid && axi_s_awready) begin
	 if (c2c_drive_m_wr) begin
	   axi_m_awaddr    <= {`AXI_ZCU_ADDR_HIGH,aligned_awaddr};
	   axi_m_awlen     <= axi_s_awlen;    
	   axi_m_awvalid   <= 1'b1;
	   axiif_mlen      <= {`LEN_WIDTH{1'b0}};
	 end
	 axiif_blen      <= {`LEN_WIDTH{1'b0}};
       end
       else if (!axiif_sbusy && ctrl_cmd != `REG_CTRL_CMD_RESET && axi_s_arvalid && axi_s_arready && addr_ge_regconf(aligned_araddr) && ~axiif_dmrp_stat[2]) begin //¡úAXI=READBUF
	 if (c2c_drive_m_rd) begin
	   axi_m_araddr    <= {`AXI_ZCU_ADDR_HIGH,aligned_araddr};
	   axi_m_arlen     <= axi_s_arlen;    
	   axi_m_arvalid   <= 1'b1;
	 end
	 axiif_blen      <= {`LEN_WIDTH{1'b0}};

//// FT 2020/09/28 BEGIN
////   end
////   else if( axiif_sbusy && !axiif_mbusy && !axiif_mbusy_mask
////		&& ctrl_cmd != `REG_CTRL_CMD_RESET
////		&& axiif_wterm && axi_s_bready && axiif_keep_busy
////		&& addr_ge_regconf(axiif_keep_addr)
////		&& ~axiif_dmrp_stat[2] )begin
////	 if (c2c_drive_m_rd) begin
////	   axi_m_araddr    <= {`AXI_ZCU_ADDR_HIGH,axiif_keep_addr};
////	   axi_m_arlen     <= axiif_keep_len[`AXI_S_LENG_BITS-1:0];    
////	   axi_m_arvalid   <= 1'b1;
////	 end
////	 axiif_blen      <= {`LEN_WIDTH{1'b0}};
////       end
////   else if( axiif_sbusy && !axiif_mbusy && !axiif_mbusy_mask
////		&& ctrl_cmd != `REG_CTRL_CMD_RESET
////		&& axiif_srw && axiif_keep_busy && axiif_keep_busy_f
////		&& addr_ge_regconf(axiif_keep_addr)
////		&& ~axiif_dmrp_stat[2] )begin
////	 if (c2c_drive_m_rd) begin
////	   axi_m_araddr    <= {`AXI_ZCU_ADDR_HIGH,axiif_keep_addr};
////	   axi_m_arlen     <= axiif_keep_len[`AXI_S_LENG_BITS-1:0];    
////	   axi_m_arvalid   <= 1'b1;
////	 end
////	 axiif_blen      <= {`LEN_WIDTH{1'b0}};
//// FT 2020/09/28 END

       end
       else begin // axi controller is busy
	 if (axiif_srw) begin /* WRITE transaction is busy */
	   if (axi_m_awvalid && axi_m_awready) begin
	     axi_m_awvalid <= 1'b0;
	   end
	   if (c2c_drive_m_wr&&axi_m_wvalid&&axi_m_wready) begin
	     axiif_mlen    <= axiif_mlen + 1'b1;
	   end
	   if (axring_top_axi2buf_en && axring_top_buf_nful) begin
	     axiif_blen    <= axiif_blen + 1'b1;
	   end
	 end
	 else begin          /* READ transaction is busy */ //¡úAXI=READBUF
	   if (axi_m_arvalid && axi_m_arready) begin
	     axi_m_arvalid <= 1'b0;
	   end
	   if (axring_top_axi2buf_en && axring_top_buf_nful) begin
	     axiif_blen    <= axiif_blen + 1'b1;
	   end
	 end
       end
     end
   end // always

   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN) begin /* RESET¥³¥Þ¥ó¥É¤¬È¯¹Ô¤µ¤ì¤Æ¤âAXI¤Î¥¹¥Æ¡¼¥È¤ÏÇË²õ¤·¤Æ¤Ï¤¤¤±¤Ê¤¤ <= MasterÂ¦¤¬±Ê±ó¤Ë±þÅúÂÔ¤Á¾õÂÖ¤Ë¤Ê¤ë²ÄÇ½À­¤¬¤¢¤ë¤¿¤á */
       axiif_mbusy     <= 1'b0;
     end
     else begin
       if (axiif_srw) begin /* WRITE transaction is busy */
	 if (axi_m_awvalid && axi_m_awready) begin
	   axiif_mbusy   <= 1'b1;
	 end
//       else if (!next_linkup_r ? (axiif_mlen > axiif_alen) : axi_m_bvalid) begin
	 else if (c2c_drive_m_wr ? (axi_m_wlast & axi_m_wvalid & axi_m_wready) : (axiif_mlen > axiif_alen)) begin
	   axiif_mbusy   <= 1'b0; //next_linkup_r=0¤Î¾ì¹ç¤Ï,bvalid¤¬Íè¤Ê¤¤
	 end
       end
       else begin          /* READ transaction is busy */ //¡úAXI=READBUF
	 if (axi_m_arvalid && axi_m_arready) begin
	   axiif_mbusy   <= 1'b1;
	 end
	 else if (c2c_drive_m_rd ? (axi_m_rlast & axi_m_rvalid & axi_m_rready) : (axiif_olen > axiif_alen)) begin
	   axiif_mbusy   <= 1'b0;
	 end
       end
     end
   end


//// FT 2020/09/28 BEGIN
////   always@( posedge ACLK or negedge RSTN )begin
////     if( ~RSTN )begin
////       axiif_mbusy_mask	<=	1'b0;
////     end else if( axiif_srw && axi_m_awvalid && axi_m_awready )begin
////       axiif_mbusy_mask	<=	1'b0;
////     end else if( !axiif_srw && axi_m_arvalid && axi_m_arready )begin
////       axiif_mbusy_mask	<=	1'b0;
////     end else if( !axiif_sbusy && ctrl_cmd != `REG_CTRL_CMD_RESET
////		  && axiif_dmrp_stat == 3'b010 && c2c_drive_m_rd )begin
////       axiif_mbusy_mask	<=	1'b1;
////     end else if( !axiif_sbusy && ctrl_cmd != `REG_CTRL_CMD_RESET
////		  && axi_s_awvalid && axi_s_awready && c2c_drive_m_wr )begin
////       axiif_mbusy_mask	<=	1'b1;
////     end else if( !axiif_sbusy && !axiif_mbusy && !axiif_mbusy_mask
////		  && ctrl_cmd != `REG_CTRL_CMD_RESET
////		  && axi_s_arvalid && axi_s_arready && addr_ge_regconf(aligned_araddr)
////		  && ~axiif_dmrp_stat[2] && c2c_drive_m_rd)begin
////       axiif_mbusy_mask	<=	1'b1;
////     end else if( axiif_sbusy && !axiif_mbusy && !axiif_mbusy_mask
////		  && ctrl_cmd != `REG_CTRL_CMD_RESET
////		  && axiif_wterm && axi_s_bready && axiif_keep_busy
////		  && addr_ge_regconf(axiif_keep_addr)
////		  && ~axiif_dmrp_stat[2] && c2c_drive_m_rd )begin
////       axiif_mbusy_mask	<=	1'b1;
////     end else if( axiif_sbusy && !axiif_mbusy && !axiif_mbusy_mask
////		  && ctrl_cmd != `REG_CTRL_CMD_RESET
////		  && axiif_srw && axiif_keep_busy && axiif_keep_busy_f
////		  && addr_ge_regconf(axiif_keep_addr)
////		  && ~axiif_dmrp_stat[2] && c2c_drive_m_rd )begin
////       axiif_mbusy_mask	<=	1'b1;
////     end
////   end
//// FT 2020/09/28 END

   assign axring_top_ty = ( axiif_aligned_addr[`AXI_S_ADDR_BITS-1]            ) ? 3'h4 : /* >=LMM_BASE_PHYS */
                          ((axiif_aligned_addr&`REG_AREA_MASK)>=`REG_LDDM_OFFS) ? 3'h3 : /* lddm */
                          ((axiif_aligned_addr&`REG_AREA_MASK)>=`REG_ADDR_OFFS) ? 3'h2 : /* addr */
                          ((axiif_aligned_addr&`REG_AREA_MASK)>=`REG_BREG_OFFS) ? 3'h1 : /* breg */
                                                                                  3'h0 ; /* conf */

   assign axring_top_addr = (axring_top_ty == 3'd4) ? vadr[30:0]:axiif_aligned_addr[30:0];
   assign axring_top_data = (axiif_srw) ? axiif_wdata:{`AXI_S_DATA_BITS{1'b0}}; 
   assign axring_top_strb = (axiif_srw) ? axiif_wstrb:{`AXI_S_DATA_BYTES{1'b0}};

   /* Write Data channel */
   /* | 341: 86|  85: 54|  53: 23|  22|  21:  6|   5   4|   3:  1|   0| */
   /* |       D|      DM|       A|  AV|      SQ|     COL|      TY|  RW| */
   assign axring_top_bin = {axring_top_data, axring_top_strb, axring_top_addr, 1'b0, axiif_ilen, reg_ctrl_csel, axring_top_ty, axiif_srw};

   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN) begin
       reg_ctrl_stat_exring  <= 1'b0;
       reg_ctrl_stat_lmring  <= 1'b0;
       reg_ctrl_mcid         <= `EMAX_NCHIP_BITS'd0;
       reg_ctrl_cmd          <= `REG_CTRL_CMD_BITS'd0;
       reg_ctrl_chip         <= `EMAX_NCHIP_BITS'd0;
       reg_ctrl_adtr         <= `AXI_S_ADDR_BITS'd0;
       reg_ctrl_csel         <= `REG_CTRL_CSEL_BITS'd0;
       reg_ctrl_dmrptop      <= `AXI_S_ADDR_BITS'd0;
       reg_ctrl_dmrplen      <= `EXRING_ADDR_BITS'd0;
       reg_ctrl_dmrb_active  <= 1'b0;
     end
     else begin
       if (axiif_sbusy && axiif_srw && axi_s_wvalid && axi_s_wready) begin // axi controller is busy and write mode
         case (axiif_aligned_addr)
           `REG_STAT_PHYS: begin
             if(axi_s_wstrb[ 0]) reg_ctrl_stat_exring <= axi_s_wdata[`REG_CTRL_STAT_EXRING];         /* stat */
             if(axi_s_wstrb[ 0]) reg_ctrl_stat_lmring <= axi_s_wdata[`REG_CTRL_STAT_LMRING];         /* stat */
             if(axi_s_wstrb[ 8]) reg_ctrl_mcid        <= axi_s_wdata[ 64+`EMAX_NCHIP_BITS-1   : 64]; /* mcid */
             if(axi_s_wstrb[16]) reg_ctrl_cmd         <= axi_s_wdata[128+`REG_CTRL_CMD_BITS-1 :128]; /* cmd */
             if(axi_s_wstrb[18]) reg_ctrl_chip        <= axi_s_wdata[144+`EMAX_NCHIP_BITS-1   :144]; /* ccid */
           end
           `REG_ADTR_PHYS: begin
             if(axi_s_wstrb[ 0]) reg_ctrl_adtr        <= axi_s_wdata[`AXI_S_ADDR_BITS-1       :  0]; /* adtr */
             if(axi_s_wstrb[16]) reg_ctrl_csel        <= axi_s_wdata[128+`REG_CTRL_CSEL_BITS-1:128]; /* csel */
             if(axi_s_wstrb[24]) reg_ctrl_dmrptop     <= axi_s_wdata[192+`AXI_S_ADDR_BITS-1   :192]; /* dmrp adr */
             if(axi_s_wstrb[29]) reg_ctrl_dmrplen     <= axi_s_wdata[232+`EXRING_ADDR_BITS-1  :232]; /* dmrp len(max 17bits) */
             if(axi_s_wstrb[31]) reg_ctrl_dmrb_active <= axi_s_wdata[                          255]; /* dmrp active(bit511) */
           end
         endcase
       end
       else if(!axiif_sbusy && cycle == 2'h3) begin
         if(ctrl_cmd == `REG_CTRL_CMD_RESET) begin
	   reg_ctrl_stat_exring  <= 1'b0;
	   reg_ctrl_stat_lmring  <= 1'b0;
	   reg_ctrl_mcid         <= `EMAX_NCHIP_BITS'd0;
	   reg_ctrl_cmd          <= `REG_CTRL_CMD_BITS'd0;
	   reg_ctrl_adtr         <= `AXI_S_ADDR_BITS'd0;
	   reg_ctrl_csel         <= `REG_CTRL_CSEL_BITS'd0;
	   reg_ctrl_dmrptop      <= `AXI_S_ADDR_BITS'd0;
	   reg_ctrl_dmrplen      <= `EXRING_ADDR_BITS'd0;
	   reg_ctrl_dmrb_active  <= 1'b0;
         end
         else
           reg_ctrl_cmd          <= `REG_CTRL_CMD_NOP;
       end

       if (!axiif_bufq && !axiif_dmrp_stat[2:0]) reg_ctrl_stat_lmring <= 1'b`REG_CTRL_STAT_LMRING_IDLE;
       else                                      reg_ctrl_stat_lmring <= 1'b`REG_CTRL_STAT_LMRING_BUSY;
       if (!cmd_busy && !unit_busy)              reg_ctrl_stat_exring <= 1'b`REG_CTRL_STAT_EXRING_IDLE;
       else                                      reg_ctrl_stat_exring <= 1'b`REG_CTRL_STAT_EXRING_BUSY;
//     reg_ctrl[127:64] <= 64'hBADDCAFEBABEFACE;
     end
   end // always

//// FT 2020/09/28 BEGIN
////   always@( posedge ACLK or negedge RSTN )begin
////     if( ~RSTN )begin
////       reg_ctrl_dmrb_active_mask[1:0]	<=	2'b00;
////     end else if( !axiif_sbusy && cycle == 2'h3 && ctrl_cmd == `REG_CTRL_CMD_RESET )begin
////       reg_ctrl_dmrb_active_mask[1:0]	<=	2'b00;
////     end else begin
////       reg_ctrl_dmrb_active_mask[0]	<=	reg_ctrl_dmrb_active;
////       if( reg_ctrl_dmrb_active == 1'b0 )begin
////	 reg_ctrl_dmrb_active_mask[1]	<=	1'b0;
////       end else if( !axiif_sbusy && !axiif_mbusy && !axiif_mbusy_mask
////		    && reg_ctrl_dmrb_active_mask[0]
////		    && ctrl_cmd != `REG_CTRL_CMD_RESET )begin
////	 reg_ctrl_dmrb_active_mask[1]	<=	1'b1;
////       end
////     end
////   end
//// FT 2020/09/28 END

   wire [`EMAX_NCHIP_BITS-1:0] axring_ncid;
   assign  axring_ncid[`EMAX_NCHIP_BITS-1:0] = axiif_wdata[144+`EMAX_NCHIP_BITS-1:144]+`EMAX_NCHIP_BITS'h1;
   assign  pfen0 = axi_s_rvalid_i && axiif_dmrp_stat==3'b011; // 1:mem-enable
   assign  pfen1 = axiif_sbusy && axiif_plen <= axiif_alen && axiif_dmrp_stat[2] && axi_s_rready && dmrb_top_buf_nful && ~dmrb_top_buf_nful1; // 1:mem-enable //¡ú¡ú¡úAXI=READBUF
   assign  pfma0 = axring_bot_bout[`AXRING_BR_A];// vadr[]
   assign  pfma1 = axring_top_bin[`AXRING_BR_A]; // vadr[]
   assign  pfwm0 = {(`AXI_S_DATA_BYTES){1'b1}};  // 1:write-byte-mask
   assign  pfmw0 = axi_s_rdata;

   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN) begin
       axiif_dmrb_en1_d <= 1'b0;
     end
     else begin
       axiif_dmrb_en1_d <= pfen1; // delayed for axi_s_rvalid
     end
   end // always

   /* Write Data channel */
   assign axi_m_wdata  = c2c_drive_m_wr ? {axiif_wdata[255:144+`EMAX_NCHIP_BITS],
			                  {(axiif_aligned_addr==`REG_STAT_PHYS)?axring_ncid:axiif_wdata[144+`EMAX_NCHIP_BITS-1:144]}, /* set cid=0,1,2,3 */
			                  axiif_wdata[143:0]} : {`AXI_S_DATA_BITS{1'b0}};
   assign axi_m_wstrb  = c2c_drive_m_wr ? axiif_wstrb : {`AXI_S_DATA_BYTES{1'b0}}; /* set cid=0,1,2,3 */
   /* Read Data channel */
   assign axi_s_rdata  = (axiif_aligned_addr == `REG_STAT_PHYS) ? {{(`AXI_S_DATA_BITS-16){1'b0}}, 4'd`STAT_LMM_SIZE, 4'd`STAT_EMAX_DEPTH, 3'h0, reg_ctrl_stat_lmring, 3'h0, reg_ctrl_stat_exring} :
                       //(axiif_aligned_addr == `REG_ADTR_PHYS) ? reg_ctrl[`AXI_S_DATA_BITS*2-1:`AXI_S_DATA_BITS] :
                         (axiif_dmrp_stat[2])                   ? dmrb_dout : //¡úAXI=READBUF
                         (c2c_drive_m_rd)                       ? axring_bot_bout[`AXRING_BR_D] | axi_m_rdata : 
                                                                  axring_bot_bout[`AXRING_BR_D] ;               
   lmm dmabuf //  32KB 256bit depth=10bit adr=15bit(current)
              // 128KB 256bit depth=12bit adr=17bit(MAX)
     (
      .ACLK       (ACLK               ), // general clock (fpga:83mhz asic:240mhz)
      .RST        (~RSTN              ), // 0x0000 1: rst=0->1->0
      .en0        (pfen0              ), // write-en
      .en1        (pfen1              ), // read-en
      .rw0        (1'b1               ), // rw0=1 (always write)
      .ma0        (pfma0              ), // write-addr
      .ma1        (pfma1              ), // read-addr
      .wm0        (pfwm0              ), // write-mask
      .mw0        (pfmw0              ), // write-data
      .mr0        (                   ), // NC
      .mr1        (pfmr1              )  // read-data
      );

   nbit_ndepth_queue
     #(
       .REG_WIDTH  (`AXI_S_DATA_BITS),
       .QUEUE_DEPTH(`LMRING_BR_BUF),
       .QPTR_BITS  (`LMRING_BR_PTRBITS),
       .QNUM_BITS  (`LMRING_BR_NUMBITS)
       ) dmrb_top_buf (
                         .ACLK   (ACLK                   ),
                         .RSTN   (RSTN                   ),
                         .i_data (pfmr1                  ), // <- in
                         .i_val  (axiif_dmrb_en1_d       ), // <- input axidata valid
                         .i_rdy  (dmrb_top_buf_nful      ), // -> output ready (can enqueue)
                         .i_rdy1 (dmrb_top_buf_nful1     ), //
                         .q_data (dmrb_dout              ), // -> out
                         .q_val  (dmrb_top_s_rvalid      ), // -> output data valid
                         .q_rdy  (axi_s_rready           )  // <- input |(ready[*unit]) (can dequeue)
                         );
endmodule
