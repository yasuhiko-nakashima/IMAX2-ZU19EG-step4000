/**
* @file     nbit_register.v
* @brief    Nbit registe. Using parameter call.
* @author   ryu.bee.mono96ck@gmail.com
* @data     03.25.2017
*
* Copyright (c) 2017 by NAIST This model is the confidential and
* proprietary property of NAIST and the possession or use of this
* file requires a written license from NAIST.
**/

`timescale 1ns/1ps

/**
 * @fn
 * nbit register
 * @brief               nbit register with enable
 * @param REG_WIDTH     generic                 register width
 * @param CLK           in  [0:0]               clock signal
 * @param RST           in  [0:0]               asynchronous reset signal
 * @param en            in  [0:0]               register write enable
 * @param d             int [REG_WIDTH-1:0]     in port clock signal
 * @param q             out [0:0]               clock signal
 */
module nbit_register
#(
    parameter                               REG_WIDTH = 32
)(
    input   wire                            ACLK,
    input   wire                            RSTN,
  //input   wire                            en,
    input   wire    [REG_WIDTH-1:0]         d,
    output  reg     [REG_WIDTH-1:0]         q
);
// synopsys template

always @(posedge ACLK or negedge RSTN) begin
    if(~RSTN)   q <= {(REG_WIDTH){1'b0}};
  //else if(en) q <= d;
  //else        q <= q;
    else        q <= d;
end
endmodule
