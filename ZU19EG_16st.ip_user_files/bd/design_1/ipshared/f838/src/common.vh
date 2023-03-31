/*-----------------------------------------------------------------------------*/
/*  Common header for emax6.v                                                  */
/*-----------------------------------------------------------------------------*/

`ifndef __COMMON_VH__
`define __COMMON_VH__

/*---- defines for rtl sim ----*/
`define CLEAR_RAM

//`define CASCADE

//`define REG_BRAM
`define ZYNQ_BRAM
//`define ASIC_BRAM
//`define BBOX_BRAM
//`define DEBUG_FPGA

//`define EMAX_DEPTH_IS_64
//`define EMAX_DEPTH_IS_32
`define EMAX_DEPTH_IS_16
//`define EMAX_DEPTH_IS_08

`define LMRING_MUX_IS_8
//`define LMRING_MUX_IS_16

`define LMM_SIZE_IS_128K
//`define LMM_SIZE_IS_64K
//`define LMM_SIZE_IS_32K

`define ENABLE_MEDIA
`define ENABLE_CRYPTO
`define ENABLE_FPU
`define ENABLE_SPU

/*---- construction ----*/
`define EMAX_NCHIP_BITS             4
`define EMAX_NCHIP                 16
`define EMAX_WIDTH                  4
`define UNIT_WIDTH                  4

/*---- intermediate precision control ----*/
`define PEXT_01

`ifdef  PEXT_01
`define PEXT                        1
`endif
`ifdef  PEXT_02
`define PEXT_01
`define PEXT                        2
`endif
`ifdef  PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                        3
`endif
`ifdef  PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                        4
`endif
`ifdef  PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                        5
`endif
`ifdef  PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                        6
`endif
`ifdef  PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                        7
`endif
`ifdef  PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                        8
`endif
`ifdef  PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                        9
`endif
`ifdef  PEXT_10
`define PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                       10
`endif
`ifdef  PEXT_11
`define PEXT_10
`define PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                       11
`endif
`ifdef  PEXT_12
`define PEXT_11
`define PEXT_10
`define PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                       12
`endif
`ifdef  PEXT_13
`define PEXT_12
`define PEXT_11
`define PEXT_10
`define PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                       13
`endif
`ifdef  PEXT_14
`define PEXT_13
`define PEXT_12
`define PEXT_11
`define PEXT_10
`define PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                       14
`endif
`ifdef  PEXT_15
`define PEXT_14
`define PEXT_13
`define PEXT_12
`define PEXT_11
`define PEXT_10
`define PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                       15
`endif
`ifdef  PEXT_16
`define PEXT_15
`define PEXT_14
`define PEXT_13
`define PEXT_12
`define PEXT_11
`define PEXT_10
`define PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                       16
`endif
`ifdef  PEXT_17
`define PEXT_16
`define PEXT_15
`define PEXT_14
`define PEXT_13
`define PEXT_12
`define PEXT_11
`define PEXT_10
`define PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                       17
`endif
`ifdef  PEXT_18
`define PEXT_17
`define PEXT_16
`define PEXT_15
`define PEXT_14
`define PEXT_13
`define PEXT_12
`define PEXT_11
`define PEXT_10
`define PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                       18
`endif
`ifdef  PEXT_19
`define PEXT_18
`define PEXT_17
`define PEXT_16
`define PEXT_15
`define PEXT_14
`define PEXT_13
`define PEXT_12
`define PEXT_11
`define PEXT_10
`define PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                       19
`endif
`ifdef  PEXT_20
`define PEXT_19
`define PEXT_18
`define PEXT_17
`define PEXT_16
`define PEXT_15
`define PEXT_14
`define PEXT_13
`define PEXT_12
`define PEXT_11
`define PEXT_10
`define PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                       20
`endif
`ifdef  PEXT_21
`define PEXT_20
`define PEXT_19
`define PEXT_18
`define PEXT_17
`define PEXT_16
`define PEXT_15
`define PEXT_14
`define PEXT_13
`define PEXT_12
`define PEXT_11
`define PEXT_10
`define PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                       21
`endif
`ifdef  PEXT_22
`define PEXT_21
`define PEXT_20
`define PEXT_19
`define PEXT_18
`define PEXT_17
`define PEXT_16
`define PEXT_15
`define PEXT_14
`define PEXT_13
`define PEXT_12
`define PEXT_11
`define PEXT_10
`define PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                       22
`endif
`ifdef  PEXT_23
`define PEXT_22
`define PEXT_21
`define PEXT_20
`define PEXT_19
`define PEXT_18
`define PEXT_17
`define PEXT_16
`define PEXT_15
`define PEXT_14
`define PEXT_13
`define PEXT_12
`define PEXT_11
`define PEXT_10
`define PEXT_09
`define PEXT_08
`define PEXT_07
`define PEXT_06
`define PEXT_05
`define PEXT_04
`define PEXT_03
`define PEXT_02
`define PEXT_01
`define PEXT                       23
`endif

/*---- exring/lmring ----*/
`ifdef  EMAX_DEPTH_IS_64
`define STAT_EMAX_DEPTH             3
`define EMAX_ROW_BITS               6
`define EMAX_DEPTH                  64
`endif
`ifdef  EMAX_DEPTH_IS_32
`define STAT_EMAX_DEPTH             2
`define EMAX_ROW_BITS               5
`define EMAX_DEPTH                  32
`endif
`ifdef  EMAX_DEPTH_IS_16
`define STAT_EMAX_DEPTH             1
`define EMAX_ROW_BITS               4
`define EMAX_DEPTH                  16
`endif
`ifdef  EMAX_DEPTH_IS_08
`define STAT_EMAX_DEPTH             0
`define EMAX_ROW_BITS               3
`define EMAX_DEPTH                  8
`endif

`ifdef LMRING_MUX_IS_8
`define LMRING_MUX                  8
`endif
`ifdef LMRING_MUX_IS_16
`define LMRING_MUX                  16
`endif

/*---- for test_bench ----*/
`define DDR_SIML_BITS               24
`define DDR_HIGH_MIN                49'h0_0000_4f00_0000
`define DDR_HIGH_MAX                49'h0_0000_4fff_ff00
`define DDR_DATA_BITS               64

/*---- lmm ----*/
    /* 18bits: 256KB                                                           */
    /* 17bits: 128KB <- LMM_LMASKの制御とCSIMの実装を参考,LMMは128KBとして実装 */
`define LMM_UMASK0                  0                           /* 書き込み禁止モードゆえに常に0でよい                                    */
`define LMM_UMASK1                  0                           /* フルアクセスモードゆえにcolでLMEM addressの上位2bitを操作する必要なし  */
`define LMM_UMASK2                  2                           /* col0,1と2,3のペアでLMMを使用                                           */
`define LMM_UMASK3                  3                           /* col0,1,2,3がそれぞれ独立したLMEM領域を使用                             */

`ifdef  LMM_SIZE_IS_128K
`define STAT_LMM_SIZE               2
`define LMM_SIZE                    131072
`define EXRING_ADDR_BITS            17
`define LMM_MA_MASK                 `EXRING_ADDR_BITS'h1ffe0
`define LMM_UMASK_SHIFT             15                          /* log2(131072/4)                                                         */
`define LMM_LENG_BITS               12
`define LMM_LMASK0                  `EXRING_ADDR_BITS'h00000    /* 書き込み禁止モードゆえに常に0でよい                                    */
`define LMM_LMASK1                  `EXRING_ADDR_BITS'h1ffff    /* フルアクセスモードゆえにcolでLMEM addressの上位2bitを操作する必要なし  */
`define LMM_LMASK2                  `EXRING_ADDR_BITS'h0ffff    /* col0,1と2,3のペアでLMMを使用                                           */
`define LMM_LMASK3                  `EXRING_ADDR_BITS'h07fff    /* col0,1,2,3がそれぞれ独立したLMEM領域を使用                             */
`endif
`ifdef  LMM_SIZE_IS_64K
`define STAT_LMM_SIZE               1
`define LMM_SIZE                    65536
`define EXRING_ADDR_BITS            16
`define LMM_MA_MASK                 `EXRING_ADDR_BITS'hffe0
`define LMM_UMASK_SHIFT             14                          /* log2(131072/8)                                                         */
`define LMM_LENG_BITS               11
`define LMM_LMASK0                  `EXRING_ADDR_BITS'h0000     /* 書き込み禁止モードゆえに常に0でよい                                    */
`define LMM_LMASK1                  `EXRING_ADDR_BITS'hffff     /* フルアクセスモードゆえにcolでLMEM addressの上位2bitを操作する必要なし  */
`define LMM_LMASK2                  `EXRING_ADDR_BITS'h7fff     /* col0,1と2,3のペアでLMMを使用                                           */
`define LMM_LMASK3                  `EXRING_ADDR_BITS'h3fff     /* col0,1,2,3がそれぞれ独立したLMEM領域を使用                             */
`endif
`ifdef  LMM_SIZE_IS_32K
`define STAT_LMM_SIZE               0
`define LMM_SIZE                    32768
`define EXRING_ADDR_BITS            15
`define LMM_MA_MASK                 `EXRING_ADDR_BITS'h7fe0
`define LMM_UMASK_SHIFT             13                          /* log2(131072/16)                                                        */
`define LMM_LENG_BITS               10
`define LMM_LMASK0                  `EXRING_ADDR_BITS'h0000     /* 書き込み禁止モードゆえに常に0でよい                                    */
`define LMM_LMASK1                  `EXRING_ADDR_BITS'h7fff     /* フルアクセスモードゆえにcolでLMEM addressの上位2bitを操作する必要なし  */
`define LMM_LMASK2                  `EXRING_ADDR_BITS'h3fff     /* col0,1と2,3のペアでLMMを使用                                           */
`define LMM_LMASK3                  `EXRING_ADDR_BITS'h1fff     /* col0,1,2,3がそれぞれ独立したLMEM領域を使用                             */
`endif

/*---- address map ----*/
`define REG_BASE_PHYS               32'h0000_0000
`define REG_CONF_OFFS               32'h0000_2000
`define REG_BREG_OFFS               32'h0000_4000
`define REG_ADDR_OFFS               32'h0000_6000
`define REG_LDDM_OFFS               32'h0000_8000
`define REG_AREA_MASK               32'h0000_ffff
`define LMM_BASE_PHYS               32'h8000_0000

`define REG_STAT_PHYS               32'h0000_0000
`define REG_CMD_PHYS                32'h0000_0010
`define REG_ADTR_PHYS               32'h0000_0020
`define REG_CSEL_PHYS               32'h0000_0030
`define REG_DMRP_INFO               32'h0000_0038

/*---- unit ----*/
`define REG_DATA_BITS               64
`define REG_DATA_BYTES              (`REG_DATA_BITS/8)
`ifdef ENABLE_SPU
`define SPU_DATA_BITS               15
`define SPU_DATA_LOG2               4
`define SPU_DATA_DIST               4
//`define SPU_DATA_BITS             31
//`define SPU_DATA_LOG2             5
//`define SPU_DATA_DIST             2
`endif
`define LMRING_ADDR_BITS            32
`define LMRING_DATA_BITS            (`REG_DATA_BITS*`UNIT_WIDTH)
`define LMRING_DATA_BYTES           (`REG_DATA_BITS*`UNIT_WIDTH/8)
`define ADDR_RANGE_BITS             32
`define BLKCOUNT_BITS               7
`define BRAM_ADDR_BITS              13
`define BREG_BITS                   (`REG_DATA_BITS*`UNIT_WIDTH) /* 64*4=256 */
`define AREG_BITS                   (`EXRING_ADDR_BITS*4 + `ADDR_RANGE_BITS*2)
                                    /* bot,top,ea1o,ea1b,ea0o,ea0b */

/*---- fsm/axi ----*/
`define AXI_ZCU_ADDR_BITS           40
`define AXI_ZCU_ADDR_HIGH           8'h04
`define LEN_WIDTH                   16
`define SKP_WIDTH                   11
`define AXI_S_ADDR_BITS             32  /* 4GBYTEs address space */
`define AXI_S_LENG_BITS             8
`define AXI_S_SIZE_BITS             3
`define AXI_S_BURST_BITS            2
`define AXI_S_CACHE_BITS            4
`define AXI_S_PROT_BITS             3
`define AXI_S_ID_BITS              16	/* 2 -> 16 2020/07/22 By F.T */
`define AXI_S_RESP_BITS             2
    /* 8bits: 256lines: 8KB (AXI/burst limitation) */
`define AXI_S_DATA_BITS             (`REG_DATA_BITS*`UNIT_WIDTH)
`define AXI_S_DATA_BYTES            (`REG_DATA_BITS*`UNIT_WIDTH/8) // 64*4/8=32byte

/*---- reg_ctrl ----*/
//`define REG_CTRL_BITS               512
//`define REG_CTRL_STAT_EXRING        3:0
//`define REG_CTRL_STAT_LMRING        7:4
//`define REG_CTRL_MCID               64+`EMAX_NCHIP_BITS-1:64
//`define REG_CTRL_CMD_BITS           2
//`define REG_CTRL_CMD                128+`REG_CTRL_CMD_BITS-1:128
//`define REG_CTRL_CHIP               144+`EMAX_NCHIP_BITS-1:144
//`define REG_CTRL_ADTR               256+`AXI_S_ADDR_BITS-1:256
//`define REG_CTRL_CSEL_BITS          2
//`define REG_CTRL_CSEL               384+`REG_CTRL_CSEL_BITS-1:384
//`define REG_CTRL_DMRPTOP            448+`AXI_S_ADDR_BITS-1:448
//`define REG_CTRL_DMRPTOPDWLOC       452:451
//`define REG_CTRL_DMRPTOPALIGN       448+`AXI_S_ADDR_BITS-1:453
//`define REG_CTRL_DMRPLEN            488+`EXRING_ADDR_BITS-1:488
//`define REG_CTRL_DMRPLENDWLOC       492:491
//`define REG_CTRL_DMRPLENALIGN       488+`EXRING_ADDR_BITS-1:493
//`define REG_CTRL_DMRB_ACTIVE        511

`define REG_CTRL_STAT_EXRING        0
`define REG_CTRL_STAT_EXRING_IDLE   0
`define REG_CTRL_STAT_EXRING_BUSY   1
`define REG_CTRL_STAT_LMRING        4
`define REG_CTRL_STAT_LMRING_IDLE   0
`define REG_CTRL_STAT_LMRING_BUSY   1
`define REG_CTRL_MCID               `EMAX_NCHIP_BITS-1:0
`define REG_CTRL_CMD_BITS           2
`define REG_CTRL_CMD                `REG_CTRL_CMD_BITS-1:0
`define REG_CTRL_CMD_NOP            0
`define REG_CTRL_CMD_RESET          1
`define REG_CTRL_CMD_SCON           2
`define REG_CTRL_CMD_EXEC           3
`define REG_CTRL_CHIP               `EMAX_NCHIP_BITS-1:0
`define REG_CTRL_ADTR               `AXI_S_ADDR_BITS-1:0
`define REG_CTRL_CSEL_BITS          2
`define REG_CTRL_CSEL               `REG_CTRL_CSEL_BITS-1:0
`define REG_CTRL_DMRPTOP            `AXI_S_ADDR_BITS-1:0
`define REG_CTRL_DMRPTOPDWLOC       4:3
`define REG_CTRL_DMRPTOPALIGN       `AXI_S_ADDR_BITS-1:5
`define REG_CTRL_DMRPLEN            `EXRING_ADDR_BITS-1:0
`define REG_CTRL_DMRPLENDWLOC       4:3
`define REG_CTRL_DMRPLENALIGN       `EXRING_ADDR_BITS-1:5

/*---- unit cmd ----*/
`define CMD_NOP                     0
`define CMD_RESET                   1
`define CMD_SCON                    2
`define CMD_EXEC                    3

/*---- axring-if ----*/
`define AXRING_BR_BITS              (86+256)
`define AXRING_BR_BUF               2
`define AXRING_BR_PTRBITS           1
`define AXRING_BR_NUMBITS           2
`define AXRING_BR_RW                0
`define AXRING_BR_TY                3:1
`define AXRING_BR_COL               5:4
`define AXRING_BR_SQ                21:6
`define AXRING_BR_AV                22
`define AXRING_BR_A                 53:23
`define AXRING_BR_DM                85:54
`define AXRING_BR_D                 341:86


`define LMRING_TR_BITS              (86+256+8)
`define LMRING_TR_RW                0
`define LMRING_TR_TY                3:1
`define LMRING_TR_COL               5:4
`define LMRING_TR_SQ                21:6
`define LMRING_TR_AV                22
`define LMRING_TR_A                 53:23
`define LMRING_TR_DM                85:54
`define LMRING_TR_D                 341:86
`define LMRING_TR_MERGE             349:342

`define LMRING_BR_BITS              (86+256)
`define LMRING_BR_BUF               3
`define LMRING_BR_PTRBITS           2
`define LMRING_BR_NUMBITS           2
`define LMRING_BR_RW                0
`define LMRING_BR_TY                3:1
`define LMRING_BR_COL               5:4
`define LMRING_BR_SQ                21:6
`define LMRING_BR_AV                22
`define LMRING_BR_A                 53:23
`define LMRING_BR_DM                85:54
`define LMRING_BR_D                 341:86

/*---- unit/conf ----*/
`define CONF_BITS                   256
`define conf_v                      conf[  0:  0] /* v */
`define conf_op1                    conf[  6:  1] /* alu_opcd */
`define conf_op2                    conf[  9:  7] /* logical_opcd */
`define conf_op3                    conf[ 12: 10] /* sft_opcd */
`define conf_ex1brs                 conf[ 16: 13] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf_ex1s                   conf[ 17: 17] /* 0:ex1brs, 1:exdr(self-loop) */
`define conf_ex1exp                 conf[ 20: 18] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf_ex2brs                 conf[ 24: 21] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf_ex2exp                 conf[ 27: 25] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf_ex3brs                 conf[ 31: 28] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf_ex3exp                 conf[ 34: 32] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf_e2imm                  conf[255:192]
`define conf_e2is                   conf[ 36: 35] /* 0:e2imm, 1:ex2, 2:ex3 */
`define conf_e3imm                  conf[ 42: 37]
`define conf_e3is                   conf[ 43: 43] /* 0:e3imm, 1:ex3 */
`define conf_init                   conf[ 45: 44] 
`define conf_fold                   conf[ 46: 46] 
`define conf_mex0op                 conf[ 48: 47] 
`define conf_mex0init               conf[ 49: 49] 
`define conf_mex0dist               conf[ 52: 50] 
`define conf_mex1op                 conf[ 54: 53] 
`define conf_mex1init               conf[ 55: 55] 
`define conf_mex1dist               conf[ 58: 56] 
`define conf_mexlimit               conf[ 62: 59]
`define conf_dmy00                  conf[ 63: 63]

`define conf_cs0                    conf[ 67: 64] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf_cs1                    conf[ 71: 68] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf_cs2                    conf[ 75: 72] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf_cs3                    conf[ 79: 76] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf_cex_tab                conf[ 95: 80] /* c3.c2.c1.c0の組合せ (cop=NOPの場合,ffff) */
                                             /* 1111,1110,1101,1100,....,0001,0000 の各々に0/1を割り当てた16bitを指定 */
`define conf_ea0op                  conf[100: 96] /* mem_opcd */
`define conf_ea0bs                  conf[102:101] /* 0:ea0br, 1:ea0dr(ea0br+self-loop), 2:eabbrs, 3:ea0dr(eabbrs+self-loop) */
`define conf_ea0os                  conf[103:103] /* 0:ea0or, 1:eaobrs */
`define conf_ea0msk                 conf[107:104] /* 15:64bit, 13:word1, 12:word0, 11-8:half3-0, 7-0:byte7-0 of offset */
`define conf_ea1op                  conf[112:108] /* mem_opcd */
`define conf_ea1bs                  conf[114:113] /* 0:ea1br, 1:ea1dr(ea1br+self-loop), 2:eabbrs, 3:ea1dr(self-loop) */
`define conf_ea1os                  conf[115:115] /* 0:ea1or, 1:eaobrs */
`define conf_ea1msk                 conf[119:116] /* 15:64bit, 13:word1, 12:word0, 11-8:half3-0, 7-0:byte7-0 of offset */
`define conf_eabbrs                 conf[123:120] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf_eaobrs                 conf[127:124] /* 0:br0_0, 1:br0_1, ... 15:3_3 */

`define conf_ts0                    conf[131:128] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf_ts1                    conf[135:132] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf_ts2                    conf[139:136] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf_ts3                    conf[143:140] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */

`define conf_trs0                   conf[145:144] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf_trs1                   conf[147:146] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf_trs2                   conf[149:148] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf_trs3                   conf[151:150] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf_mwsa                   conf[152:152] /* 0:off, 1:lmlia,2:lmwa,3:lmria  */    /* for STATUS_EXEC+lmp */
`define conf_mws0                   conf[154:153] /* 0:exdr,1:exdr0,2:ts0, 3:lmli0, 4:lmwd0, 5:lmri0 */
`define conf_mws1                   conf[156:155] /* 0:exdr,1:exdr1,2:ts1, 3:lmli1, 4:lmwd1, 5:lmri1 */
`define conf_mws2                   conf[158:157] /* 0:exdr,1:exdr2,2:ts2, 3:lmli2, 4:lmwd2, 5:lmri2 */
`define conf_mws3                   conf[160:159] /* 0:exdr,1:exdr3,2:ts3, 3:lmli3, 4:lmwd3, 5:lmri3 */
`define conf_brs0                   conf[162:161] /* 0:off, 1:mr10, 2:tr0, 3:mr0  */
`define conf_brs1                   conf[164:163] /* 0:off, 1:mr11, 2:tr1, 3:mr1  */
`define conf_brs2                   conf[166:165] /* 0:off, 1:mr12, 2:tr2, 3:exdr(brs3=3の場合,ea0woofsに接続) */
`define conf_brs3                   conf[168:167] /* 0:off, 1:mr13, 2:tr3, 3:ea1woofs) */
`define MAPDIST_INFO                174:169
`define conf_mapdist                conf[`MAPDIST_INFO]
`define conf_lmm_mode               conf[176:175] /* 論理LMM毎にセット 0:無効, 1:分割無, 2:2分割, 3:4分割 */
`define conf_lmm_axiw               conf[177:177] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define conf_lmm_axir               conf[178:178] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define conf_dmy20                  conf[191:179]

/* unitのthread 0用 */
`define conf0_v                     conf0[  0:  0] /* v */
`define conf0_op1                   conf0[  6:  1] /* alu_opcd */
`define conf0_op2                   conf0[  9:  7] /* logical_opcd */
`define conf0_op3                   conf0[ 12: 10] /* sft_opcd */
`define conf0_ex1brs                conf0[ 16: 13] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf0_ex1s                  conf0[ 17: 17] /* 0:ex1brs, 1:exdr(self-loop) */
`define conf0_ex1exp                conf0[ 20: 18] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf0_ex2brs                conf0[ 24: 21] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf0_ex2exp                conf0[ 27: 25] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf0_ex3brs                conf0[ 31: 28] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf0_ex3exp                conf0[ 34: 32] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf0_e2imm                 conf0[255:192]
`define conf0_e2is                  conf0[ 36: 35] /* 0:e2imm, 1:ex2, 2:ex3 */
`define conf0_e3imm                 conf0[ 42: 37]
`define conf0_e3is                  conf0[ 43: 43] /* 0:e3imm, 1:ex3 */
`define conf0_init                  conf0[ 45: 44] /* 0:e3imm, 1:ex3 */
`define conf0_fold                  conf0[ 46: 46] /* 0:e3imm, 1:ex3 */
`define conf0_mex0op                conf0[ 48: 47] 
`define conf0_mex0init              conf0[ 49: 49] 
`define conf0_mex0dist              conf0[ 52: 50] 
`define conf0_mex1op                conf0[ 54: 53] 
`define conf0_mex1init              conf0[ 55: 55] 
`define conf0_mex1dist              conf0[ 58: 56] 
`define conf0_mexlimit              conf0[ 62: 59]
`define conf0_dmy00                 conf0[ 63: 63]

`define conf0_cs0                   conf0[ 67: 64] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf0_cs1                   conf0[ 71: 68] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf0_cs2                   conf0[ 75: 72] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf0_cs3                   conf0[ 79: 76] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf0_cex_tab               conf0[ 95: 80] /* c3.c2.c1.c0の組合せ (cop=NOPの場合,ffff) */
                                             /* 1111,1110,1101,1100,....,0001,0000 の各々に0/1を割り当てた16bitを指定 */
`define conf0_ea0op                 conf0[100: 96] /* mem_opcd */
`define conf0_ea0bs                 conf0[102:101] /* 0:ea0br, 1:ea0dr(ea0br+self-loop), 2:eabbrs, 3:ea0dr(eabbrs+self-loop) */
`define conf0_ea0os                 conf0[103:103] /* 0:ea0or, 1:eaobrs */
`define conf0_ea0msk                conf0[107:104] /* 15:64bit, 13:word1, 12:word0, 11-8:half3-0, 7-0:byte7-0 of offset */
`define conf0_ea1op                 conf0[112:108] /* mem_opcd */
`define conf0_ea1bs                 conf0[114:113] /* 0:ea1br, 1:ea1dr(ea1br+self-loop), 2:eabbrs, 3:ea1dr(self-loop) */
`define conf0_ea1os                 conf0[115:115] /* 0:ea1or, 1:eaobrs */
`define conf0_ea1msk                conf0[119:116] /* 15:64bit, 13:word1, 12:word0, 11-8:half3-0, 7-0:byte7-0 of offset */
`define conf0_eabbrs                conf0[123:120] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf0_eaobrs                conf0[127:124] /* 0:br0_0, 1:br0_1, ... 15:3_3 */

`define conf0_ts0                   conf0[131:128] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf0_ts1                   conf0[135:132] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf0_ts2                   conf0[139:136] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf0_ts3                   conf0[143:140] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf0_trs0                  conf0[145:144] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf0_trs1                  conf0[147:146] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf0_trs2                  conf0[149:148] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf0_trs3                  conf0[151:150] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf0_mwsa                  conf0[152:152] /* 0:off, 1:lmlia,2:lmwa,3:lmria  */    /* for STATUS_EXEC+lmp */
`define conf0_mws0                  conf0[154:153] /* 0:exdr,1:exdr0,2:ts0, 3:lmli0, 4:lmwd0, 5:lmri0 */
`define conf0_mws1                  conf0[156:155] /* 0:exdr,1:exdr1,2:ts1, 3:lmli1, 4:lmwd1, 5:lmri1 */
`define conf0_mws2                  conf0[158:157] /* 0:exdr,1:exdr2,2:ts2, 3:lmli2, 4:lmwd2, 5:lmri2 */
`define conf0_mws3                  conf0[160:159] /* 0:exdr,1:exdr3,2:ts3, 3:lmli3, 4:lmwd3, 5:lmri3 */
`define conf0_brs0                  conf0[162:161] /* 0:off, 1:mr10, 2:tr0, 3:mr0  */
`define conf0_brs1                  conf0[164:163] /* 0:off, 1:mr11, 2:tr1, 3:mr1  */
`define conf0_brs2                  conf0[166:165] /* 0:off, 1:mr12, 2:tr2, 3:exdr(brs3=3の場合,ea0woofsに接続) */
`define conf0_brs3                  conf0[168:167] /* 0:off, 1:mr13, 2:tr3, 3:ea1woofs */

`define conf0_mapdist               conf0[`MAPDIST_INFO]
`define conf0_lmm_mode              conf0[176:175] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define conf0_lmm_axiw              conf0[177:177] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define conf0_lmm_axir              conf0[178:178] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define conf0_dmy20                 conf0[191:179]

/* unitthread 1 */
`define conf1_v                     conf1[  0:  0] /* v */
`define conf1_op1                   conf1[  6:  1] /* alu_opcd */
`define conf1_op2                   conf1[  9:  7] /* logical_opcd */
`define conf1_op3                   conf1[ 12: 10] /* sft_opcd */
`define conf1_ex1brs                conf1[ 16: 13] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf1_ex1s                  conf1[ 17: 17] /* 0:ex1brs, 1:exdr(self-loop) */
`define conf1_ex1exp                conf1[ 20: 18] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf1_ex2brs                conf1[ 24: 21] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf1_ex2exp                conf1[ 27: 25] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf1_ex3brs                conf1[ 31: 28] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf1_ex3exp                conf1[ 34: 32] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf1_e2imm                 conf1[255:192]
`define conf1_e2is                  conf1[ 36: 35] /* 0:e2imm, 1:ex2, 2:ex3 */
`define conf1_e3imm                 conf1[ 42: 37]
`define conf1_e3is                  conf1[ 43: 43] /* 0:e3imm, 1:ex3 */
`define conf1_init                  conf1[ 45: 44] /* 0:e3imm, 1:ex3 */
`define conf1_fold                  conf1[ 46: 46] /* 0:e3imm, 1:ex3 */
`define conf1_mex0op                conf1[ 48: 47] 
`define conf1_mex0init              conf1[ 49: 49] 
`define conf1_mex0dist              conf1[ 52: 50] 
`define conf1_mex1op                conf1[ 54: 53] 
`define conf1_mex1init              conf1[ 55: 55] 
`define conf1_mex1dist              conf1[ 58: 56] 
`define conf1_mexlimit              conf1[ 62: 59]
`define conf1_dmy00                 conf1[ 63: 63]

`define conf1_cs0                   conf1[ 67: 64] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf1_cs1                   conf1[ 71: 68] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf1_cs2                   conf1[ 75: 72] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf1_cs3                   conf1[ 79: 76] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf1_cex_tab               conf1[ 95: 80] /* c3.c2.c1.c0 (cop=NOPξ,ffff) */
                                             /* 1111,1110,1101,1100,....,0001,0000 γ0/116bit */
`define conf1_ea0op                 conf1[100: 96] /* mem_opcd */
`define conf1_ea0bs                 conf1[102:101] /* 0:ea0br, 1:ea0dr(ea0br+self-loop), 2:eabbrs, 3:ea0dr(eabbrs+self-loop) */
`define conf1_ea0os                 conf1[103:103] /* 0:ea0or, 1:eaobrs */
`define conf1_ea0msk                conf1[107:104] /* 15:64bit, 13:word1, 12:word0, 11-8:half3-0, 7-0:byte7-0 of offset */
`define conf1_ea1op                 conf1[112:108] /* mem_opcd */
`define conf1_ea1bs                 conf1[114:113] /* 0:ea1br, 1:ea1dr(ea1br+self-loop), 2:eabbrs, 3:ea1dr(self-loop) */
`define conf1_ea1os                 conf1[115:115] /* 0:ea1or, 1:eaobrs */
`define conf1_ea1msk                conf1[119:116] /* 15:64bit, 13:word1, 12:word0, 11-8:half3-0, 7-0:byte7-0 of offset */
`define conf1_eabbrs                conf1[123:120] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf1_eaobrs                conf1[127:124] /* 0:br0_0, 1:br0_1, ... 15:3_3 */

`define conf1_ts0                   conf1[131:128] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf1_ts1                   conf1[135:132] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf1_ts2                   conf1[139:136] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf1_ts3                   conf1[143:140] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf1_trs0                  conf1[145:144] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf1_trs1                  conf1[147:146] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf1_trs2                  conf1[149:148] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf1_trs3                  conf1[151:150] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf1_mwsa                  conf1[152:152] /* 0:off, 1:lmlia,2:lmwa,3:lmria  */    /* for STATUS_EXEC+lmp */
`define conf1_mws0                  conf1[154:153] /* 0:exdr,1:exdr0,2:ts0, 3:lmli0, 4:lmwd0, 5:lmri0 */
`define conf1_mws1                  conf1[156:155] /* 0:exdr,1:exdr1,2:ts1, 3:lmli1, 4:lmwd1, 5:lmri1 */
`define conf1_mws2                  conf1[158:157] /* 0:exdr,1:exdr2,2:ts2, 3:lmli2, 4:lmwd2, 5:lmri2 */
`define conf1_mws3                  conf1[160:159] /* 0:exdr,1:exdr3,2:ts3, 3:lmli3, 4:lmwd3, 5:lmri3 */
`define conf1_brs0                  conf1[162:161] /* 0:off, 1:mr10, 2:tr0, 3:mr0  */
`define conf1_brs1                  conf1[164:163] /* 0:off, 1:mr11, 2:tr1, 3:mr1  */
`define conf1_brs2                  conf1[166:165] /* 0:off, 1:mr12, 2:tr2, 3:exdr(brs3=3の場合,ea0woofsに接続) */
`define conf1_brs3                  conf1[168:167] /* 0:off, 1:mr13, 2:tr3, 3:ea1woofs */

`define conf1_mapdist               conf1[`MAPDIST_INFO]
`define conf1_lmm_mode              conf1[176:175] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define conf1_lmm_axiw              conf1[177:177] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define conf1_lmm_axir              conf1[178:178] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define conf1_dmy20                 conf1[191:179]

/* unitthread 2 */
`define conf2_v                     conf2[  0:  0] /* v */
`define conf2_op1                   conf2[  6:  1] /* alu_opcd */
`define conf2_op2                   conf2[  9:  7] /* logical_opcd */
`define conf2_op3                   conf2[ 12: 10] /* sft_opcd */
`define conf2_ex1brs                conf2[ 16: 13] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf2_ex1s                  conf2[ 17: 17] /* 0:ex1brs, 1:exdr(self-loop) */
`define conf2_ex1exp                conf2[ 20: 18] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf2_ex2brs                conf2[ 24: 21] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf2_ex2exp                conf2[ 27: 25] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf2_ex3brs                conf2[ 31: 28] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf2_ex3exp                conf2[ 34: 32] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf2_e2imm                 conf2[255:192]
`define conf2_e2is                  conf2[ 36: 35] /* 0:e2imm, 1:ex2, 2:ex3 */
`define conf2_e3imm                 conf2[ 42: 37]
`define conf2_e3is                  conf2[ 43: 43] /* 0:e3imm, 1:ex3 */
`define conf2_init                  conf2[ 45: 44] /* 0:e3imm, 1:ex3 */
`define conf2_fold                  conf2[ 46: 46] /* 0:e3imm, 1:ex3 */
`define conf2_mex0op                conf2[ 48: 47] 
`define conf2_mex0op_1              conf2[ 48] 
`define conf2_mex0init              conf2[ 49: 49] 
`define conf2_mex0dist              conf2[ 52: 50] 
`define conf2_mex1op                conf2[ 54: 53] 
`define conf2_mex1init              conf2[ 55: 55] 
`define conf2_mex1dist              conf2[ 58: 56] 
`define conf2_mexlimit              conf2[ 62: 59]
`define conf2_dmy00                 conf2[ 63: 63]

`define conf2_cs0                   conf2[ 67: 64] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf2_cs1                   conf2[ 71: 68] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf2_cs2                   conf2[ 75: 72] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf2_cs3                   conf2[ 79: 76] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf2_cex_tab               conf2[ 95: 80] /* c3.c2.c1.c0 (cop=NOPξ,ffff) */
                                             /* 1111,1110,1101,1100,....,0001,0000 γ0/116bit */
`define conf2_ea0op                 conf2[100: 96] /* mem_opcd */
`define conf2_ea0bs                 conf2[102:101] /* 0:ea0br, 1:ea0dr(ea0br+self-loop), 2:eabbrs, 3:ea0dr(eabbrs+self-loop) */
`define conf2_ea0os                 conf2[103:103] /* 0:ea0or, 1:eaobrs */
`define conf2_ea0msk                conf2[107:104] /* 15:64bit, 13:word1, 12:word0, 11-8:half3-0, 7-0:byte7-0 of offset */
`define conf2_ea1op                 conf2[112:108] /* mem_opcd */
`define conf2_ea1bs                 conf2[114:113] /* 0:ea1br, 1:ea1dr(ea1br+self-loop), 2:eabbrs, 3:ea1dr(self-loop) */
`define conf2_ea1os                 conf2[115:115] /* 0:ea1or, 1:eaobrs */
`define conf2_ea1msk                conf2[119:116] /* 15:64bit, 13:word1, 12:word0, 11-8:half3-0, 7-0:byte7-0 of offset */
`define conf2_eabbrs                conf2[123:120] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf2_eaobrs                conf2[127:124] /* 0:br0_0, 1:br0_1, ... 15:3_3 */

`define conf2_ts0                   conf2[131:128] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf2_ts1                   conf2[135:132] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf2_ts2                   conf2[139:136] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf2_ts3                   conf2[143:140] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf2_trs0                  conf2[145:144] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf2_trs1                  conf2[147:146] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf2_trs2                  conf2[149:148] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf2_trs3                  conf2[151:150] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf2_mwsa                  conf2[152:152] /* 0:off, 1:lmlia,2:lmwa,3:lmria  */    /* for STATUS_EXEC+lmp */
`define conf2_mws0                  conf2[154:153] /* 0:exdr,1:exdr0,2:ts0, 3:lmli0, 4:lmwd0, 5:lmri0 */
`define conf2_mws1                  conf2[156:155] /* 0:exdr,1:exdr1,2:ts1, 3:lmli1, 4:lmwd1, 5:lmri1 */
`define conf2_mws2                  conf2[158:157] /* 0:exdr,1:exdr2,2:ts2, 3:lmli2, 4:lmwd2, 5:lmri2 */
`define conf2_mws3                  conf2[160:159] /* 0:exdr,1:exdr3,2:ts3, 3:lmli3, 4:lmwd3, 5:lmri3 */
`define conf2_brs0                  conf2[162:161] /* 0:off, 1:mr10, 2:tr0, 3:mr0  */
`define conf2_brs1                  conf2[164:163] /* 0:off, 1:mr11, 2:tr1, 3:mr1  */
`define conf2_brs2                  conf2[166:165] /* 0:off, 1:mr12, 2:tr2, 3:exdr(brs3=3の場合,ea0woofsに接続) */
`define conf2_brs3                  conf2[168:167] /* 0:off, 1:mr13, 2:tr3, 3:ea1woofs */

`define conf2_mapdist               conf2[`MAPDIST_INFO]
`define conf2_lmm_mode              conf2[176:175] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define conf2_lmm_axiw              conf2[177:177] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define conf2_lmm_axir              conf2[178:178] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define conf2_dmy20                 conf2[191:179]

/* unitthread 3 */
`define conf3_v                     conf3[  0:  0] /* v */
`define conf3_op1                   conf3[  6:  1] /* alu_opcd */
`define conf3_op2                   conf3[  9:  7] /* logical_opcd */
`define conf3_op3                   conf3[ 12: 10] /* sft_opcd */
`define conf3_ex1brs                conf3[ 16: 13] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf3_ex1s                  conf3[ 17: 17] /* 0:ex1brs, 1:exdr(self-loop) */
`define conf3_ex1exp                conf3[ 20: 18] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf3_ex2brs                conf3[ 24: 21] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf3_ex2exp                conf3[ 27: 25] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf3_ex3brs                conf3[ 31: 28] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf3_ex3exp                conf3[ 34: 32] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define conf3_e2imm                 conf3[255:192]
`define conf3_e2is                  conf3[ 36: 35] /* 0:e2imm, 1:ex2, 2:ex3 */
`define conf3_e3imm                 conf3[ 42: 37]
`define conf3_e3is                  conf3[ 43: 43] /* 0:e3imm, 1:ex3 */
`define conf3_init                  conf3[ 45: 44] /* 0:e3imm, 1:ex3 */
`define conf3_fold                  conf3[ 46: 46] /* 0:e3imm, 1:ex3 */
`define conf3_mex0op                conf3[ 48: 47] 
`define conf3_mex0init              conf3[ 49: 49] 
`define conf3_mex0dist              conf3[ 52: 50] 
`define conf3_mex1op                conf3[ 54: 53] 
`define conf3_mex1init              conf3[ 55: 55] 
`define conf3_mex1dist              conf3[ 58: 56] 
`define conf3_mexlimit              conf3[ 62: 59]
`define conf3_dmy00                 conf3[ 63: 63]

`define conf3_cs0                   conf3[ 67: 64] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf3_cs1                   conf3[ 71: 68] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf3_cs2                   conf3[ 75: 72] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf3_cs3                   conf3[ 79: 76] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf3_cex_tab               conf3[ 95: 80] /* c3.c2.c1.c0 (cop=NOPξ,ffff) */
                                             /* 1111,1110,1101,1100,....,0001,0000 γ0/116bit */
`define conf3_ea0op                 conf3[100: 96] /* mem_opcd */
`define conf3_ea0bs                 conf3[102:101] /* 0:ea0br, 1:ea0dr(ea0br+self-loop), 2:eabbrs, 3:ea0dr(eabbrs+self-loop) */
`define conf3_ea0os                 conf3[103:103] /* 0:ea0or, 1:eaobrs */
`define conf3_ea0msk                conf3[107:104] /* 15:64bit, 13:word1, 12:word0, 11-8:half3-0, 7-0:byte7-0 of offset */
`define conf3_ea1op                 conf3[112:108] /* mem_opcd */
`define conf3_ea1bs                 conf3[114:113] /* 0:ea1br, 1:ea1dr(ea1br+self-loop), 2:eabbrs, 3:ea1dr(self-loop) */
`define conf3_ea1os                 conf3[115:115] /* 0:ea1or, 1:eaobrs */
`define conf3_ea1msk                conf3[119:116] /* 15:64bit, 13:word1, 12:word0, 11-8:half3-0, 7-0:byte7-0 of offset */
`define conf3_eabbrs                conf3[123:120] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define conf3_eaobrs                conf3[127:124] /* 0:br0_0, 1:br0_1, ... 15:3_3 */

`define conf3_ts0                   conf3[131:128] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf3_ts1                   conf3[135:132] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf3_ts2                   conf3[139:136] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf3_ts3                   conf3[143:140] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf3_trs0                  conf3[145:144] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf3_trs1                  conf3[147:146] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf3_trs2                  conf3[149:148] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf3_trs3                  conf3[151:150] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define conf3_mwsa                  conf3[152:152] /* 0:off, 1:lmlia,2:lmwa,3:lmria  */    /* for STATUS_EXEC+lmp */
`define conf3_mws0                  conf3[154:153] /* 0:exdr,1:exdr0,2:ts0, 3:lmli0, 4:lmwd0, 5:lmri0 */
`define conf3_mws1                  conf3[156:155] /* 0:exdr,1:exdr1,2:ts1, 3:lmli1, 4:lmwd1, 5:lmri1 */
`define conf3_mws2                  conf3[158:157] /* 0:exdr,1:exdr2,2:ts2, 3:lmli2, 4:lmwd2, 5:lmri2 */
`define conf3_mws3                  conf3[160:159] /* 0:exdr,1:exdr3,2:ts3, 3:lmli3, 4:lmwd3, 5:lmri3 */
`define conf3_brs0                  conf3[162:161] /* 0:off, 1:mr10, 2:tr0, 3:mr0  */
`define conf3_brs1                  conf3[164:163] /* 0:off, 1:mr11, 2:tr1, 3:mr1  */
`define conf3_brs2                  conf3[166:165] /* 0:off, 1:mr12, 2:tr2, 3:exdr(brs3=3の場合,ea0woofsに接続) */
`define conf3_brs3                  conf3[168:167] /* 0:off, 1:mr13, 2:tr3, 3:ea1woofs */

`define conf3_mapdist               conf3[`MAPDIST_INFO]
`define conf3_lmm_mode              conf3[176:175] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define conf3_lmm_axiw              conf3[177:177] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define conf3_lmm_axir              conf3[178:178] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define conf3_dmy20                 conf3[191:179]

`define confk_v                     confk[  0:  0] /* v */
`define confk_op1                   confk[  6:  1] /* alu_opcd */
`define confk_op2                   confk[  9:  7] /* logical_opcd */
`define confk_op3                   confk[ 12: 10] /* sft_opcd */
`define confk_ex1brs                confk[ 16: 13] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define confk_ex1s                  confk[ 17: 17] /* 0:ex1brs, 1:exdr(self-loop) */
`define confk_ex1exp                confk[ 20: 18] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define confk_ex2brs                confk[ 24: 21] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define confk_ex2exp                confk[ 27: 25] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define confk_ex3brs                confk[ 31: 28] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define confk_ex3exp                confk[ 34: 32] /* 0:H3210, 1:H1010, 2:H3232, 3:B5410, 4:B7632 */
`define confk_e2imm                 confk[255:192]
`define confk_e2is                  confk[ 36: 35] /* 0:e2imm, 1:ex2, 2:ex3 */
`define confk_e3imm                 confk[ 42: 37]
`define confk_e3is                  confk[ 43: 43] /* 0:e3imm, 1:ex3 */
`define confk_init                  confk[ 45: 44] /* 0:e3imm, 1:ex3 */
`define confk_fold                  confk[ 46: 46] /* 0:e3imm, 1:ex3 */
`define confk_mex0op                confk[ 48: 47] 
`define confk_mex0init              confk[ 49: 49] 
`define confk_mex0dist              confk[ 52: 50] 
`define confk_mex1op                confk[ 54: 53] 
`define confk_mex1init              confk[ 55: 55] 
`define confk_mex1dist              confk[ 58: 56] 
`define confk_mexlimit              confk[ 62: 59]
`define confk_dmy00                 confk[ 63: 63]

`define confk_cs0                   confk[ 67: 64] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define confk_cs1                   confk[ 71: 68] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define confk_cs2                   confk[ 75: 72] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define confk_cs3                   confk[ 79: 76] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define confk_cex_tab               confk[ 95: 80] /* c3.c2.c1.c0 (cop=NOPξ,ffff) */
                                             /* 1111,1110,1101,1100,....,0001,0000 γ0/116bit */
`define confk_ea0op                 confk[100: 96] /* mem_opcd */
`define confk_ea0bs                 confk[102:101] /* 0:ea0br, 1:ea0dr(ea0br+self-loop), 2:eabbrs, 3:ea0dr(eabbrs+self-loop) */
`define confk_ea0os                 confk[103:103] /* 0:ea0or, 1:eaobrs */
`define confk_ea0msk                confk[107:104] /* 15:64bit, 13:word1, 12:word0, 11-8:half3-0, 7-0:byte7-0 of offset */
`define confk_ea1op                 confk[112:108] /* mem_opcd */
`define confk_ea1bs                 confk[114:113] /* 0:ea1br, 1:ea1dr(ea1br+self-loop), 2:eabbrs, 3:ea1dr(self-loop) */
`define confk_ea1os                 confk[115:115] /* 0:ea1or, 1:eaobrs */
`define confk_ea1msk                confk[119:116] /* 15:64bit, 13:word1, 12:word0, 11-8:half3-0, 7-0:byte7-0 of offset */
`define confk_eabbrs                confk[123:120] /* 0:br0_0, 1:br0_1, ... 15:3_3 */
`define confk_eaobrs                confk[127:124] /* 0:br0_0, 1:br0_1, ... 15:3_3 */

`define confk_ts0                   confk[131:128] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define confk_ts1                   confk[135:132] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define confk_ts2                   confk[139:136] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define confk_ts3                   confk[143:140] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define confk_trs0                  confk[145:144] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define confk_trs1                  confk[147:146] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define confk_trs2                  confk[149:148] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define confk_trs3                  confk[151:150] /* 0:br0_0, 1:br0_1, ... 15:br3_3 */
`define confk_mwsa                  confk[152:152] /* 0:off, 1:lmlia,2:lmwa,3:lmria  */    /* for STATUS_EXEC+lmp */
`define confk_mws0                  confk[154:153] /* 0:exdr,1:exdr0,2:ts0, 3:lmli0, 4:lmwd0, 5:lmri0 */
`define confk_mws1                  confk[156:155] /* 0:exdr,1:exdr1,2:ts1, 3:lmli1, 4:lmwd1, 5:lmri1 */
`define confk_mws2                  confk[158:157] /* 0:exdr,1:exdr2,2:ts2, 3:lmli2, 4:lmwd2, 5:lmri2 */
`define confk_mws3                  confk[160:159] /* 0:exdr,1:exdr3,2:ts3, 3:lmli3, 4:lmwd3, 5:lmri3 */
`define confk_brs0                  confk[162:161] /* 0:off, 1:mr10, 2:tr0, 3:mr0  */
`define confk_brs1                  confk[164:163] /* 0:off, 1:mr11, 2:tr1, 3:mr1  */
`define confk_brs2                  confk[166:165] /* 0:off, 1:mr12, 2:tr2, 3:exdr(brs3=3の場合,ea0woofsに接続) */
`define confk_brs3                  confk[168:167] /* 0:off, 1:mr13, 2:tr3, 3:ea1woofs */

`define confk_mapdist               confk[`MAPDIST_INFO]
`define confk_lmm_mode              confk[176:175] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define confk_lmm_axiw              confk[177:177] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define confk_lmm_axir              confk[178:178] /* 0:off, 1:lmli, 2:lmwd,3:lmri */    /* for STATUS_LOAD */
`define confk_dmy20                 confk[191:179]

/*---- unit/regv-ear vaddr-range ----*/
`define EAR_BITS                    192
`define addr_ea0b                   regv_ear[ 17:  0]
`define addr_ea0o                   regv_ear[ 49: 32]
`define addr_ea1b                   regv_ear[ 81: 64]
`define addr_ea1o                   regv_ear[113: 96]
`define addr_top                    regv_ear[158:128]
`define addr_bot                    regv_ear[190:160]

`define addr0_ea0b                  regv_ear0[ 17:  0]
`define addr0_ea0o                  regv_ear0[ 49: 32]
`define addr0_ea1b                  regv_ear0[ 81: 64]
`define addr0_ea1o                  regv_ear0[113: 96]
`define addr0_top                   regv_ear0[158:128]
`define addr0_bot                   regv_ear0[190:160]

`define addr1_ea0b                  regv_ear1[ 17:  0]
`define addr1_ea0o                  regv_ear1[ 49: 32]
`define addr1_ea1b                  regv_ear1[ 81: 64]
`define addr1_ea1o                  regv_ear1[113: 96]
`define addr1_top                   regv_ear1[158:128]
`define addr1_bot                   regv_ear1[190:160]

`define addr2_ea0b                  regv_ear2[ 17:  0]
`define addr2_ea0o                  regv_ear2[ 49: 32]
`define addr2_ea1b                  regv_ear2[ 81: 64]
`define addr2_ea1o                  regv_ear2[113: 96]
`define addr2_top                   regv_ear2[158:128]
`define addr2_bot                   regv_ear2[190:160]

`define addr3_ea0b                  regv_ear3[ 17:  0]
`define addr3_ea0o                  regv_ear3[ 49: 32]
`define addr3_ea1b                  regv_ear3[ 81: 64]
`define addr3_ea1o                  regv_ear3[113: 96]
`define addr3_top                   regv_ear3[158:128]
`define addr3_bot                   regv_ear3[190:160]
/*---- lddmrw ----*/
`define LDDMRW_BITS                 256

/*---- cex/exe ----*/
`define CEX_DATA_BITS               2
`define CEX_PATT_BITS               16
`define EXE_WORD_BITS               32

`define OP_CNOP                     1'h0
`define OP_CEXE                     1'h1
`define OP_NOP1                     6'h00
`define OP_WHILE                    6'h01
`define OP_FOR                      6'h02

`define OP_SFMA                     6'h08
`define OP_CFMA                     6'h0a

`define OP_FMA                      6'h10
`define OP_FMS                      6'h11
`define OP_FAD                      6'h12
`define OP_FML                      6'h13
`define OP_ADD3                     6'h14
`define OP_SUB3                     6'h15
`define OP_ADD                      6'h16
`define OP_SUB                      6'h17
`define OP_CMP_EQ                   6'h18
`define OP_CMP_NE                   6'h19
`define OP_CMP_LT                   6'h1a
`define OP_CMP_LE                   6'h1b
`define OP_CMP_GT                   6'h1c
`define OP_CMP_GE                   6'h1d
`define OP_CMOV                     6'h1e
//`define OP_CCAT                   6'h1f
`define OP_MAUH3                    6'h20
`define OP_MAUH                     6'h21
`define OP_MSUH3                    6'h22
`define OP_MSUH                     6'h23
`define OP_MLUH                     6'h24
`define OP_MMRG                     6'h25
`define OP_MSSAD                    6'h26
`define OP_MSAD                     6'h27
`define OP_MINL3                    6'h28
`define OP_MINL                     6'h29
`define OP_MH2BW                    6'h2a
`define OP_MCAS                     6'h2b
`define OP_MMID3                    6'h2c
`define OP_MMAX3                    6'h2d
`define OP_MMIN3                    6'h2e
`define OP_MMAX                     6'h2f
`define OP_MMIN                     6'h30
`define OP_MAJ                      6'h31
`define OP_CH                       6'h32

`define OP_NOP2                     3'h0
`define OP_AND                      3'h1
`define OP_OR                       3'h2
`define OP_XOR                      3'h3
`define OP_SUMHH                    3'h4
`define OP_SUMHL                    3'h5
//`define OP_WSWAP                  3'h6
`define OP_ROTS                     3'h7

`define OP_NOP3                     3'h0
`define OP_SLL                      3'h1
`define OP_SRL                      3'h2
`define OP_SRAA                     3'h3
`define OP_SRAB                     3'h4
//`define OP_SRAC                   3'h5
//`define OP_SRAD                   3'h6
`define OP_SRLM                     3'h7

`define EXP_H3210                   3'h0
`define EXP_H1010                   3'h1
`define EXP_H3232                   3'h2
`define EXP_B5410                   3'h3
`define EXP_B7632                   3'h4

`define OP_ALWAYS                   2'h1
`define OP_CMPA_LE                  2'h2
`define OP_CMPA_GE                  2'h3

/*---- ld/st ----*/
`define OP_NOP                      5'h00
`define OP_LDR                      5'h01
`define OP_LDWR                     5'h02
//`define OP_LDHR                   5'h03
`define OP_LDBR                     5'h04
`define OP_LDRQ                     5'h08
`define OP_IM_BUFRD                 5'h0e
`define OP_IM_DRAIN                 5'h0f

`define OP_STR                      5'h11
`define OP_STWR                     5'h12
//`define OP_STHR                   5'h13
`define OP_STBR                     5'h14
`define OP_STRQ                     5'h18
`define OP_LDDMQ                    5'h19
`define OP_TR                       5'h1a
`define OP_IM_BUFWR                 5'h1e
`define OP_IM_PREF                  5'h1f

`define MSK_B0                      4'h0
`define MSK_B1                      4'h1
`define MSK_B2                      4'h2
`define MSK_B3                      4'h3
`define MSK_B4                      4'h4
`define MSK_B5                      4'h5
`define MSK_B6                      4'h6
`define MSK_B7                      4'h7
`define MSK_H0                      4'h8
`define MSK_H1                      4'h9
`define MSK_H2                      4'ha
`define MSK_H3                      4'hb
`define MSK_W0                      4'hc
`define MSK_W1                      4'hd
`define MSK_D0                      4'he

`endif
