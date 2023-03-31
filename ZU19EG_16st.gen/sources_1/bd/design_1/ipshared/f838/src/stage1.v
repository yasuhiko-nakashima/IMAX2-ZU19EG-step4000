/*
 *-----------------------------------------------------------------------------
 * Title         : stage1
 * Project       : EMAX6
 *-----------------------------------------------------------------------------
 * File          : stage1.v
 * Author        : Nakashima
 *                <nakashim@is.naist.jp>
 *                 Yamano
 *                <yamano.ryusuke.yo7@is.naist.jp>
 *                 Kikutani
 *                <kikutani.yuma.kw3@is.naist.jp>
 * Created       : 10.20.2017
 *-----------------------------------------------------------------------------
 * Last modified : 10.20.2017
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
module stage1
(
  input  wire                                 ACLK,
  input  wire                                 RSTN,
  input  wire                                 UNIRSTN,
  input  wire                                 one_shot,
  input  wire                                 one_shot_fold,
  input  wire [1:0]                           unit1_forstat,
  input  wire [1:0]                           unit1_forstat_fold,
  input  wire [1:0]                           forstat,
  input  wire [`REG_CTRL_CMD_BITS-1:0]        cmd,
  input  wire [`CONF_BITS-1:0]                conf0,
  input  wire [`CONF_BITS-1:0]                conf1,
  input  wire [`CONF_BITS-1:0]                conf2,
  input  wire [`CONF_BITS-1:0]                conf3,
  input  wire [`EAR_BITS-1:0]                 regv_ear0,
  input  wire [`EAR_BITS-1:0]                 regv_ear1,
  input  wire [`EAR_BITS-1:0]                 regv_ear2,
  input  wire [`EAR_BITS-1:0]                 regv_ear3,
  input  wire                                 exec,
  input  wire                                 exec_old,
  input  wire                                 fold,
  input  wire [`BREG_BITS*`EMAX_WIDTH-1:0]    exring_bin,
  input  wire [`BREG_BITS*`EMAX_WIDTH-1:0]    exring_bino,
  input  wire [`REG_DATA_BITS-1:0]            exdrin,
  input  wire [`EXRING_ADDR_BITS-1:0]         ea0drin,
  input  wire [`EXRING_ADDR_BITS-1:0]         ea1drin,
  input  wire                                 lmea0sfma,
  input  wire                                 lmea0strq,
  input  wire [1:0]                           lmea0strqcol,       /* ea0.strq_col番号  4サイクルに分けて実行 */
  output reg                                  stage2_exec,
  output reg                                  stage2_fold,
  output reg  [`CEX_DATA_BITS-1:0]            cx0,
  output reg  [`CEX_DATA_BITS-1:0]            cx1,
  output reg  [`CEX_DATA_BITS-1:0]            cx2,
  output reg  [`CEX_DATA_BITS-1:0]            cx3,
  output reg  [`REG_DATA_BITS-1:0]            tx0,
  output reg  [`REG_DATA_BITS-1:0]            tx1,
  output reg  [`REG_DATA_BITS-1:0]            tx2,
  output reg  [`REG_DATA_BITS-1:0]            tx3,
  output reg  [`REG_DATA_BITS-1:0]            ex1,
  output reg  [`REG_DATA_BITS-1:0]            ex2,
  output reg  [`REG_DATA_BITS-1:0]            ex3,
  output reg  [`EXRING_ADDR_BITS-1:0]         ea0b,
  output reg  [`REG_DATA_BITS-1:0]            ea0o,
  output reg  [`EXRING_ADDR_BITS-1:0]         ea1b,
  output reg  [`REG_DATA_BITS-1:0]            ea1o
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

  wire [`CONF_BITS-1:0]     conf     = (cycle==2'h0)?conf0:(cycle==2'h1)?conf1:(cycle==2'h2)?conf2:conf3;
  wire [1:0]                k        = (lmea0sfma|lmea0strq) ? lmea0strqcol : cycle;
  wire [`REG_DATA_BITS-1:0] ofs      = (lmea0strq) ? {cycle,3'd0} : 0;
  wire [`CONF_BITS-1:0]     confk    = (k==2'd0)?conf0:(k==2'd1)?conf1:(k==2'd2)?conf2:conf3;
   
  wire [`EAR_BITS-1:0]      regv_ear = (cycle==2'h0)?regv_ear0:(cycle==2'h1)?regv_ear1:(cycle==2'h2)?regv_ear2:regv_ear3;  
   
  function [`REG_DATA_BITS-1:0] select_br;
    input [`BREG_BITS*`EMAX_WIDTH-1:0] bin;
    input [3:0]                        sel;
    begin
      case (sel[3:2])
        2'd0 :
          case (sel[1:0])
            2'd0 :      select_br = bin[`REG_DATA_BITS* 1-1:                0];
            2'd1 :      select_br = bin[`REG_DATA_BITS* 2-1:`REG_DATA_BITS* 1];
            2'd2 :      select_br = bin[`REG_DATA_BITS* 3-1:`REG_DATA_BITS* 2];
            default:    select_br = bin[`REG_DATA_BITS* 4-1:`REG_DATA_BITS* 3];
          endcase
        2'd1 :
          case (sel[1:0])
            2'd0 :      select_br = bin[`REG_DATA_BITS* 5-1:`REG_DATA_BITS* 4];
            2'd1 :      select_br = bin[`REG_DATA_BITS* 6-1:`REG_DATA_BITS* 5];
            2'd2 :      select_br = bin[`REG_DATA_BITS* 7-1:`REG_DATA_BITS* 6];
            default:    select_br = bin[`REG_DATA_BITS* 8-1:`REG_DATA_BITS* 7];
          endcase
        2'd2 :
          case (sel[1:0])
            2'd0 :      select_br = bin[`REG_DATA_BITS* 9-1:`REG_DATA_BITS* 8];
            2'd1 :      select_br = bin[`REG_DATA_BITS*10-1:`REG_DATA_BITS* 9];
            2'd2 :      select_br = bin[`REG_DATA_BITS*11-1:`REG_DATA_BITS*10];
            default:    select_br = bin[`REG_DATA_BITS*12-1:`REG_DATA_BITS*11];
          endcase
        default:
          case (sel[1:0])
            2'd0 :      select_br = bin[`REG_DATA_BITS*13-1:`REG_DATA_BITS*12];
            2'd1 :      select_br = bin[`REG_DATA_BITS*14-1:`REG_DATA_BITS*13];
            2'd2 :      select_br = bin[`REG_DATA_BITS*15-1:`REG_DATA_BITS*14];
            default:    select_br = bin[`REG_DATA_BITS*16-1:`REG_DATA_BITS*15];
          endcase
      endcase
    end
  endfunction

  /* self_loop=0の場合の初期値はaddr+offs, self_loop=1かつ初回はaddr,以降addr+offs */
  /* STRQはSTRを4サイクル分割実行 */
  /* exring[cid].unit[i].lmea0strq と exring[cid].unit[i].lmea0strqcol は siml_unit_stage4()にて先行セット */
  wire [17:0]                     addrk_ea0b  = (k==2'd0)? `addr0_ea0b:
                                                (k==2'd1)? `addr1_ea0b:
                                                (k==2'd2)? `addr2_ea0b:
                                                           `addr3_ea0b;
  wire [17:0]                     addrk_ea0o  = (k==2'd0)? `addr0_ea0o:
                                                (k==2'd1)? `addr1_ea0o:
                                                (k==2'd2)? `addr2_ea0o:
                                                           `addr3_ea0o;


//  wire [`CEX_DATA_BITS-1:0]       cx0s    = (`conf_fold) ? select_br(exring_bino, `conf_cs0) : select_br(exring_bin, `conf_cs0);
//  wire [`CEX_DATA_BITS-1:0]       cx1s    = (`conf_fold) ? select_br(exring_bino, `conf_cs1) : select_br(exring_bin, `conf_cs1);
//  wire [`CEX_DATA_BITS-1:0]       cx2s    = (`conf_fold) ? select_br(exring_bino, `conf_cs2) : select_br(exring_bin, `conf_cs2);
//  wire [`CEX_DATA_BITS-1:0]       cx3s    = (`conf_fold) ? select_br(exring_bino, `conf_cs3) : select_br(exring_bin, `conf_cs3);
//  wire [`REG_DATA_BITS-1:0]       tx0s    = select_br(exring_bin, `conf_ts0);
//  wire [`REG_DATA_BITS-1:0]       tx1s    = select_br(exring_bin, `conf_ts1);
//  wire [`REG_DATA_BITS-1:0]       tx2s    = select_br(exring_bin, `conf_ts2);
//  wire [`REG_DATA_BITS-1:0]       tx3s    = select_br(exring_bin, `conf_ts3);
//
//
//  wire [`REG_DATA_BITS-1:0]       ex1s    =   
//                                              ((`conf_fold) &&  
//                                              (((cycle == 2'd0) && (`conf_op1 == `OP_FOR) && (forstat & (1<<cycle)))
//                                           || ((cycle == 2'd1) && (`conf_op1 == `OP_FOR) && (forstat & (1<<cycle)))
//                                           || ((`conf_ex1s!=1) || (!one_shot || ((`conf_init&2'd1)&&(unit1_forstat&2'd1))))))
//                                           ? select_br(exring_bino, `conf_ex1brs)
//                                           :  ((`conf_fold) &&  
//                                              !(((cycle == 2'd0) && (`conf_op1 == `OP_FOR) && (forstat & (1<<cycle)))
//                                           || ((cycle == 2'd1) && (`conf_op1 == `OP_FOR) && (forstat & (1<<cycle)))
//                                           || ((`conf_ex1s!=1) || (!one_shot || ((`conf_init&2'd1)&&(unit1_forstat&2'd1))))))
//                                           ? select_br(exring_bin, `conf_ex1brs) : exdrin;
//
//  wire [`REG_DATA_BITS-1:0]       ex2s    = (`conf_fold) ? select_br(exring_bino, `conf_ex2brs) : select_br(exring_bin,`conf_ex2brs);
//  wire [`REG_DATA_BITS-1:0]       ex3s    = (`conf_fold) ? select_br(exring_bino, `conf_ex3brs) : select_br(exring_bin,`conf_ex3brs);
//  wire [`EXRING_ADDR_BITS-1:0]    eab     = (`conf_fold && (`conf_ea0bs & 2'd2))
//                                          ? select_br(exring_bino, `conf_eabbrs)
//                                          : (`conf_fold && !(`conf_ea0bs & 2'd2))
//                                          ? select_br(exring_bin, `conf_eabbrs) : select_br(exring_bin, `conf_eabbrs);
//  wire [`REG_DATA_BITS-1:0]       eao     = (`conf_fold && (`conf_ea0os & 1'b1))
//                                          ? select_br(exring_bino, `conf_eaobrs)
//                                          : (`conf_fold && !(`conf_ea0os & 1'b1))
//                                          ? select_br(exring_bin, `conf_eaobrs) : select_br(exring_bin, `conf_eaobrs);
//

  wire [`REG_DATA_BITS-1:0] 	  cxbr0    = select_br(exring_bin,  `conf_cs0);
  wire [`REG_DATA_BITS-1:0]       cxbr0t   = select_br(exring_bino, `conf_cs0);
  wire [`REG_DATA_BITS-1:0]       cxbr1    = select_br(exring_bin,  `conf_cs1);
  wire [`REG_DATA_BITS-1:0]       cxbr1t   = select_br(exring_bino, `conf_cs1);
  wire [`REG_DATA_BITS-1:0]       cxbr2    = select_br(exring_bin,  `conf_cs2);
  wire [`REG_DATA_BITS-1:0]       cxbr2t   = select_br(exring_bino, `conf_cs2);
  wire [`REG_DATA_BITS-1:0]       cxbr3    = select_br(exring_bin,  `conf_cs3);
  wire [`REG_DATA_BITS-1:0]       cxbr3t   = select_br(exring_bino, `conf_cs3);

  wire [`CEX_DATA_BITS-1:0] 	  cx0s     = {cxbr0 [`EXE_WORD_BITS],cxbr0 [0]};
  wire [`CEX_DATA_BITS-1:0]       cx0st    = {cxbr0t[`EXE_WORD_BITS],cxbr0t[0]};
  wire [`CEX_DATA_BITS-1:0]       cx1s     = {cxbr1 [`EXE_WORD_BITS],cxbr1 [0]};
  wire [`CEX_DATA_BITS-1:0]       cx1st    = {cxbr1t[`EXE_WORD_BITS],cxbr1t[0]};
  wire [`CEX_DATA_BITS-1:0]       cx2s     = {cxbr2 [`EXE_WORD_BITS],cxbr2 [0]};
  wire [`CEX_DATA_BITS-1:0]       cx2st    = {cxbr2t[`EXE_WORD_BITS],cxbr2t[0]};
  wire [`CEX_DATA_BITS-1:0]       cx3s     = {cxbr3 [`EXE_WORD_BITS],cxbr3 [0]};
  wire [`CEX_DATA_BITS-1:0]       cx3st    = {cxbr3t[`EXE_WORD_BITS],cxbr3t[0]};

  wire [`REG_DATA_BITS-1:0]       tx0s     = select_br(exring_bin, `conf_ts0);
  wire [`REG_DATA_BITS-1:0]       tx1s     = select_br(exring_bin, `conf_ts1);
  wire [`REG_DATA_BITS-1:0]       tx2s     = select_br(exring_bin, `conf_ts2);
  wire [`REG_DATA_BITS-1:0]       tx3s     = select_br(exring_bin, `conf_ts3);
//wire [`REG_DATA_BITS-1:0]       ex1s     = (((cycle == 2'd0) && (`conf_op1 == `OP_FOR) && (forstat & ({1'd0, cycle})))
//                                         || ((cycle == 2'd1) && (`conf_op1 == `OP_FOR) && (forstat & ({1'd0, cycle})))
//                                         || ((`conf_ex1s!=1) || (!one_shot || ((`conf_init&2'b1)&&(unit1_forstat&2'b1)))))
  wire [`REG_DATA_BITS-1:0]       ex1s     = (((cycle == 2'd0) && (`conf_op1 == `OP_FOR) && (forstat & (1<<cycle)))
                                           || ((cycle == 2'd1) && (`conf_op1 == `OP_FOR) && (forstat & (1<<cycle)))
                                           || (`conf_ex1s!=1)
                                           || (!one_shot)
                                           || ((`conf_init&2'd1)&&unit1_forstat[0]))
                                           ? select_br(exring_bin, `conf_ex1brs) : exdrin; 
//wire [`REG_DATA_BITS-1:0]       ex1st    = (((cycle == 2'd0) && (`conf_op1 == `OP_FOR) && (forstat & ({1'd0, cycle})))
//                                         || ((cycle == 2'd1) && (`conf_op1 == `OP_FOR) && (forstat & ({1'd0, cycle})))
//                                         || ((`conf_ex1s!=1) || (!one_shot || ((`conf_init&2'b1)&&(unit1_forstat&2'b1)))))
  wire [`REG_DATA_BITS-1:0]       ex1st    = (((cycle == 2'd0) && (`conf_op1 == `OP_FOR) && (forstat & (1<<cycle)))
                                           || ((cycle == 2'd1) && (`conf_op1 == `OP_FOR) && (forstat & (1<<cycle)))
                                           || (`conf_ex1s!=1)
                                           || (!one_shot_fold)
                                           || ((`conf_init&2'd1)&&unit1_forstat_fold[0]))
                                           ? select_br(exring_bino, `conf_ex1brs) : exdrin; 
    
  wire [`REG_DATA_BITS-1:0]       ex2s     = select_br(exring_bin, `conf_ex2brs);
  wire [`REG_DATA_BITS-1:0]       ex2st    = select_br(exring_bino, `conf_ex2brs);
  wire [`REG_DATA_BITS-1:0]       ex3s     = select_br(exring_bin, `conf_ex3brs);
  wire [`REG_DATA_BITS-1:0]       ex3st    = select_br(exring_bino, `conf_ex3brs);

//if (`conf_fold) begin
//  wire [`EXRING_ADDR_BITS-1:0]    ea0bs   = (!ea0loop||first) ? (kea0bfromBR ? eabout               : regvk_ea0b)|ofs : ea0out;
//  wire [`REG_DATA_BITS-1:0]       ea0os   = (!ea0loop||second)? (kea0ofromBR ? eaoout               : regvk_ea0o) : 0;
//  wire [`EXRING_ADDR_BITS-1:0]    ea1bs   = (!ea1loop||first) ? ( ea1bfromBR ? (eab0BR?eabout:eabin):  regv_ea1b) : ea1out;
//  wire [`REG_DATA_BITS-1:0]       ea1os   = (!ea1loop||second)? ( ea1ofromBR ? (eao0BR?eaoout:eaoin):  regv_ea1o) : 0;
//end
//else begin
//  wire [`EXRING_ADDR_BITS-1:0]    ea0bs   = (!ea0loop||first) ? (kea0bfromBR ? eabin                : regvk_ea0b)|ofs : ea0out;
//  wire [`REG_DATA_BITS-1:0]       ea0os   = (!ea0loop||second)? (kea0ofromBR ? eaoin                : regvk_ea0o) : 0;
//  wire [`EXRING_ADDR_BITS-1:0]    ea1bs   = (!ea1loop||first) ? ( ea1bfromBR ? eabin                :  regv_ea1b) : ea1out;
//  wire [`REG_DATA_BITS-1:0]       ea1os   = (!ea1loop||second)? ( ea1ofromBR ? eaoin                :  regv_ea1o) : 0;
//end
//以上は，以下の実装の要約

  wire [`EXRING_ADDR_BITS-1:0]    eab      = select_br(exring_bin, `confk_eabbrs);
  wire [`EXRING_ADDR_BITS-1:0]    eabt     = ( `confk_ea0bs&2'd2) ? select_br(exring_bino, `confk_eabbrs) : select_br(exring_bin, `confk_eabbrs);
  wire [`REG_DATA_BITS-1:0]       eao      = select_br(exring_bin, `conf_eaobrs);
  wire [`REG_DATA_BITS-1:0]       eaot     = (  `conf_ea0os&1'b1) ? select_br(exring_bino,  `conf_eaobrs) : select_br(exring_bin,  `conf_eaobrs);

  wire [`EXRING_ADDR_BITS-1:0]    ea0bs    = (!(`confk_ea0bs&1'b1)||(!one_shot||(`conf_mex0init && unit1_forstat[0])))?(((`confk_ea0bs&2'd2)? eab : addrk_ea0b)|ofs) : ea0drin; //★MEX
  wire [`REG_DATA_BITS-1:0]       ea0os    = (  `confk_ea0os                                                         )?                       eao : addrk_ea0o                ; //★MEX
  wire [`EXRING_ADDR_BITS-1:0]    ea1bs    = (!( `conf_ea1bs&1'b1)||(!one_shot||(`conf_mex1init && unit1_forstat[0])))? (( `conf_ea1bs&2'd2)? eab : `addr_ea1b     ) : ea1drin; //★MEX
  wire [`REG_DATA_BITS-1:0]       ea1os    = (   `conf_ea1os                                                         )?                       eao : `addr_ea1o                ; //★MEX

  wire [`EXRING_ADDR_BITS-1:0]    ea0bst   = (!(`confk_ea0bs&1'b1)||(!one_shot||(`conf_mex0init && unit1_forstat[0])))?(((`confk_ea0bs&2'd2)? eabt: addrk_ea0b)|ofs) : ea0drin; //★MEX
  wire [`REG_DATA_BITS-1:0]       ea0ost   = (  `confk_ea0os                                                         )?                       eaot: addrk_ea0o                ; //★MEX
  wire [`EXRING_ADDR_BITS-1:0]    ea1bst   = (!( `conf_ea1bs&1'b1)||(!one_shot||(`conf_mex1init && unit1_forstat[0])))? (( `conf_ea1bs&2'd2)? eabt: `addr_ea1b     ) : ea1drin; //★MEX
  wire [`REG_DATA_BITS-1:0]       ea1ost   = (   `conf_ea1os                                                         )?                       eaot: `addr_ea1o                ; //★MEX

  always @(posedge ACLK or negedge RSTN) begin
    if (~RSTN|~UNIRSTN) begin
      cx0         <= {(`CEX_DATA_BITS){1'b0}};
      cx1         <= {(`CEX_DATA_BITS){1'b0}};
      cx2         <= {(`CEX_DATA_BITS){1'b0}};
      cx3         <= {(`CEX_DATA_BITS){1'b0}};
      tx0         <= {(`REG_DATA_BITS){1'b0}};
      tx1         <= {(`REG_DATA_BITS){1'b0}};
      tx2         <= {(`REG_DATA_BITS){1'b0}};
      tx3         <= {(`REG_DATA_BITS){1'b0}};
      ex1         <= {(`REG_DATA_BITS){1'b0}};
      ex2         <= {(`REG_DATA_BITS){1'b0}};
      ex3         <= {(`REG_DATA_BITS){1'b0}};
      ea0b        <= {(`EXRING_ADDR_BITS){1'b0}};
      ea0o        <= {(`REG_DATA_BITS){1'b0}};
      ea1b        <= {(`EXRING_ADDR_BITS){1'b0}};
      ea1o        <= {(`REG_DATA_BITS ){1'b0}};
      stage2_exec <= 1'b0;
      stage2_fold <= 1'b0;
    end
    else begin
      if (exec || fold) begin
	if (`conf_fold) begin
	  cx0         <= cx0st;
	  cx1         <= cx1st;
	  cx2         <= cx2st;
	  cx3         <= cx3st;
	  tx0         <= tx0s;
	  tx1         <= tx1s;
	  tx2         <= tx2s;
	  tx3         <= tx3s;
	  ex1         <= ex1st;
	  ex2         <= ex2st;
	  ex3         <= ex3st;
	  ea0b        <= ea0bst;
	  ea0o        <= ea0ost;
	  ea1b        <= ea1bst;
	  ea1o        <= ea1ost;
	end
	else begin
	  cx0         <= cx0s;
	  cx1         <= cx1s;
	  cx2         <= cx2s;
	  cx3         <= cx3s;
	  tx0         <= tx0s;
	  tx1         <= tx1s;
	  tx2         <= tx2s;
	  tx3         <= tx3s;
	  ex1         <= ex1s;
	  ex2         <= ex2s;
	  ex3         <= ex3s;
	  ea0b        <= ea0bs;
	  ea0o        <= ea0os;
	  ea1b        <= ea1bs;
	  ea1o        <= ea1os;
	end
      end
      if (exec_old)
	stage2_exec <= 1'b1;
      else
	stage2_exec <= 1'b0;
      if (fold)
	stage2_fold <= 1'b1;
      else
	stage2_fold <= 1'b0;
    end
  end
endmodule
