/**
* @file     nbit_ndepth_queue.v
* @data     2019/8/12 Y.Nakashima
**/

`timescale 1ns/1ns

module nbit_ndepth_queue
#(
  parameter                               REG_WIDTH           = 64,
  parameter                               QUEUE_DEPTH         = 3,
  parameter                               QPTR_BITS           = 2,
  parameter                               QNUM_BITS           = 2
)(
  input   wire                            ACLK,
  input   wire                            RSTN,
  input   wire    [REG_WIDTH-1:0]         i_data,
  input   wire                            i_val,
  output  wire                            i_rdy,
  output  wire                            i_rdy1,
  output  wire    [REG_WIDTH-1:0]         q_data,
  output  wire                            q_val,
  input   wire                            q_rdy
  );

   reg [REG_WIDTH-1:0] queue[QUEUE_DEPTH-1:0];
   reg [QNUM_BITS-1:0] qn;   // # of valid
   integer             i;

   assign i_rdy                 = qn !=  QUEUE_DEPTH;
   assign i_rdy1                = qn == (QUEUE_DEPTH-1);
   assign q_data                = queue[0];
   assign q_val                 = |qn;

   always @(posedge ACLK or negedge RSTN) begin
     if (~RSTN) begin
       for (i=0; i<QUEUE_DEPTH; i=i+1) begin
         queue[i] <= {REG_WIDTH{1'b0}};
       end
       qn   <= {QNUM_BITS{1'b0}};
     end
     else begin
       for (i=0; i<QUEUE_DEPTH; i=i+1) begin
         if      (qn >  i+1 && q_val && q_rdy && i<QUEUE_DEPTH-1) queue[i] <= queue[i+1];
         else if (qn == i+1 && i_val && i_rdy && q_val && q_rdy)  queue[i] <= i_data;
         else if (qn == i   && i_val && i_rdy)                    queue[i] <= i_data;
       end
       if      (i_val && i_rdy && q_val && q_rdy) qn <= qn;
       else if (i_val && i_rdy)                   qn <= qn + 1;
       else if (q_val && q_rdy)                   qn <= qn - 1;
     end
   end

//   reg [REG_WIDTH-1:0] queue[QUEUE_DEPTH-1:0];
//   reg [QPTR_BITS-1:0] qtop; // enq
//   reg [QPTR_BITS-1:0] qbot; // deq
//   reg [QNUM_BITS-1:0] qn;   // # of valid
//   integer             i;

//   assign i_rdy                 = qn !=  QUEUE_DEPTH;
//   assign i_rdy1                = qn == (QUEUE_DEPTH-1);
//   assign q_data                = queue[qbot];
//   assign q_val                 = |qn;

//   always @(posedge ACLK or posedge RST) begin
//     if (RST) begin
//       for (i=0; i<QUEUE_DEPTH; i=i+1) begin
//         queue[i] <= {REG_WIDTH{1'b0}};
//       end
//       qtop <= {QPTR_BITS{1'b0}};
//       qbot <= {QPTR_BITS{1'b0}};
//       qn   <= {QNUM_BITS{1'b0}};
//     end
//     else begin
//       if      (i_val && i_rdy && q_val && q_rdy) qn <= qn;
//       else if (i_val && i_rdy)                   qn <= qn + 1;
//       else if (q_val && q_rdy)                   qn <= qn - 1;

//       if (i_val && i_rdy) begin
//         queue[qtop] <= i_data;
//         qtop <= (qtop==(QUEUE_DEPTH-1)) ? 0 : qtop + 1;
//       end
//       if (q_val && q_rdy) begin
//         qbot <= (qbot==(QUEUE_DEPTH-1)) ? 0 : qbot + 1;
//       end
//     end
//   end
endmodule
