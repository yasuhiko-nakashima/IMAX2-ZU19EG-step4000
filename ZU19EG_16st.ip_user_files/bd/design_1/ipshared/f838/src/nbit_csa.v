/**
* @file     nbit_csa.v
* @brief    Nbit carry save adder. Using parameter call.
* @author   ryu.bee.mono96ck@gmail.com
* @data     05.20.2017
*
* Copyright (c) 2017 by NAIST This model is the confidential and
* proprietary property of NAIST and the possession or use of this
* file requires a written license from NAIST.
**/

`timescale 1ns/1ps

/**
 * @fn
 * nbit csa
 * @brief               nbit csa
 * @param OP_WIDTH      generic                 operand width
 * @param ai            int [REG_WIDTH-1:0]     in arg
 * @param bi            int [REG_WIDTH-1:0]     in arg
 * @param ci            int [REG_WIDTH-1:0]     in arg
 * @param so            out [REG_WIDTH-1:0]     out solution
 * @param co            out [REG_WIDTH-1:0]     out carry out
 */
module nbit_csa
#(
    parameter                               OP_WIDTH       = 32
)(
    input   wire    [OP_WIDTH-1:0]         ai,
    input   wire    [OP_WIDTH-1:0]         bi,
    input   wire    [OP_WIDTH-1:0]         ci,
    output  wire    [OP_WIDTH-1:0]         so,
    output  wire    [OP_WIDTH-1:0]         co
);
// synopsys template

assign so = ai ^ bi ^ ci;
assign co = ((ai & bi) | (bi & ci) | (ci & ai));
endmodule
