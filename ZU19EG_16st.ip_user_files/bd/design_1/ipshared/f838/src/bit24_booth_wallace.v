/*
 *-----------------------------------------------------------------------------
 * Title         : bit24_booth_wallece
 * Project       : EMAX6
 *-----------------------------------------------------------------------------
 * File          : bit24_booth_wallece.v
 * Author        : Nakashima
 *                <nakashim@is.naist.jp>
 * Created       : 10.20.2017
 * Last modified : 10.20.2017
 *-----------------------------------------------------------------------------
 * Description : booth encoder and wallece tree
 *-----------------------------------------------------------------------------
 * Copyright (c) 2016 by NAIST This model is the confidential and
 * proprietary property of NAIST and the possession or use of this
 * file requires a written license from NAIST.
 *-----------------------------------------------------------------------------
 * Modification history :
 * 10.20.2017 : created
 *-----------------------------------------------------------------------------
 */

module bit24_booth_wallace
(
    input  wire [23:0]   ai,     /* multiplicand */
    input  wire [23:0]   bi,     /* multiplier   */
    output wire [47:0]   so,     /* Partial product */
    output wire [47:0]   co      /* Partial product */
);
// synopsys template

    wire [24:0] sign_ext_ai    = {1'b0,ai};
    wire [24:0] not_ai         = ~sign_ext_ai;
    wire [24:0] shift_ai       = {ai,1'b0};
    wire [24:0] shift_not_ai   = ~shift_ai;

    // Depth:(24+3-1)/2=13
    //      first                         | middle ~ last
    //      28 27 26 25 24 23  ~  2  1  0 |28 27 26 25 24 23 ~  2  1  0
    //WIDTH:N0 ~s  s  s 24 23  ~  2  1  0 | 1 ~s 24 23 22 21 ~  0 N0  S
    wire [28:0]     pp[0:12];
    wire [11:0]     pp_neg;

    genvar gen_idx;
    generate
        for (gen_idx=0; gen_idx < 13; gen_idx=gen_idx+1) begin: IDX
            if(gen_idx==0) begin
                assign  pp[gen_idx] =       (bi[gen_idx+1:0] == 2'b00) ? 29'h0800_0000:
                                            (bi[gen_idx+1:0] == 2'b01) ? {4'b0100,  sign_ext_ai}:
                                            (bi[gen_idx+1:0] == 2'b10) ? {4'b0011, shift_not_ai}:
                                                                         {4'b0011,       not_ai} ;

                assign  pp_neg[gen_idx] =   bi[gen_idx+1];

            end
            else if(gen_idx==12) begin
                assign  pp[gen_idx] =       (bi[gen_idx*2-1] == 1'b0) ? {2'b11, {(25){1'b0}}, 1'b0, pp_neg[gen_idx-1]}:
                                            (bi[gen_idx*2-1] == 1'b1) ? {2'b11,  sign_ext_ai, 1'b0, pp_neg[gen_idx-1]}:
                                                                        {2'b11, {(25){1'b0}}, 1'b0, pp_neg[gen_idx-1]} ;
            end
            else begin
                assign  pp[gen_idx] =       (bi[gen_idx*2+1:gen_idx*2-1] == 3'b000) ? {2'b11, {(25){1'b0}}, 1'b0,pp_neg[gen_idx-1]}:
                                            (bi[gen_idx*2+1:gen_idx*2-1] == 3'b001) ? {2'b11,  sign_ext_ai, 1'b0,pp_neg[gen_idx-1]}:
                                            (bi[gen_idx*2+1:gen_idx*2-1] == 3'b010) ? {2'b11,  sign_ext_ai, 1'b0,pp_neg[gen_idx-1]}:
                                            (bi[gen_idx*2+1:gen_idx*2-1] == 3'b011) ? {2'b11,     shift_ai, 1'b0,pp_neg[gen_idx-1]}:
                                            (bi[gen_idx*2+1:gen_idx*2-1] == 3'b100) ? {2'b10, shift_not_ai, 1'b0,pp_neg[gen_idx-1]}:
                                            (bi[gen_idx*2+1:gen_idx*2-1] == 3'b101) ? {2'b10,       not_ai, 1'b0,pp_neg[gen_idx-1]}:
                                            (bi[gen_idx*2+1:gen_idx*2-1] == 3'b110) ? {2'b10,       not_ai, 1'b0,pp_neg[gen_idx-1]}:
                                                                                      {2'b10, {(25){1'b1}}, 1'b0,pp_neg[gen_idx-1]} ;

                assign  pp_neg[gen_idx] =   bi[gen_idx*2+1];
            end
        end
    endgenerate

    /*   0st   */
    wire [30:0] s0_1st;
    wire [30:0] c0_1st;
    wire [32:0] s1_1st;
    wire [32:0] c1_1st;
    wire [32:0] s2_1st;
    wire [32:0] c2_1st;
    wire [31:0] s3_1st;
    wire [31:0] c3_1st;
    nbit_csa #(31) csa0_0st( .ai({pp[ 2],2'h0}         ), .bi ({2'h0,pp[ 1]}      ), .ci ({2'h0,pp[ 0]}          ), .so (s0_1st  ), .co (c0_1st  ));
    nbit_csa #(33) csa1_0st( .ai({pp[ 5],4'h0}         ), .bi ({2'h0,pp[ 4], 2'h0}), .ci ({4'h0,pp[ 3]}          ), .so (s1_1st  ), .co (c1_1st  ));
    nbit_csa #(33) csa2_0st( .ai({pp[ 8],4'h0}         ), .bi ({2'h0,pp[ 7], 2'h0}), .ci ({4'h0,pp[ 6]}          ), .so (s2_1st  ), .co (c2_1st  ));
    nbit_csa #(32) csa3_0st( .ai({pp[11][27:0],4'h0}   ), .bi ({1'h0,pp[10], 2'h0}), .ci ({3'h0,pp[ 9]}          ), .so (s3_1st  ), .co (c3_1st  ));

    /*   1st   */
    // pp12
    wire [35:0] s0_2st;
    wire [35:0] c0_2st;
    wire [38:0] s1_2st;
    wire [38:0] c1_2st;
    wire [31:0] s2_2st;
    wire [31:0] c2_2st;
    nbit_csa #(36) csa0_1st( .ai({s1_1st,3'h0}          ), .bi ({5'h00,c0_1st}      ),  .ci ( {6'h00,s0_1st[30:1]}  ), .so (s0_2st  ), .co (c0_2st  ));
    nbit_csa #(39) csa1_1st( .ai({c2_1st,6'h00}         ), .bi ({1'h0,s2_1st,5'h00} ),  .ci ( {6'h00,c1_1st}        ), .so (s1_2st  ), .co (c1_2st  ));
    nbit_csa #(32) csa2_1st( .ai({pp[12][25:0],6'h00}   ), .bi ({c3_1st[30:0],1'h0} ),  .ci ( s3_1st                ), .so (s2_2st  ), .co (c2_2st  ));

    /*   2st   */
    wire [41:0] s0_3st;
    wire [41:0] c0_3st;
    wire [41:0] s1_3st;
    wire [41:0] c1_3st;
    nbit_csa #(42) csa0_2st( .ai({s1_2st,3'h0}          ), .bi ({6'h00,c0_2st}      ), .ci ({7'h00,s0_2st[35:1]}    ), .so (s0_3st  ), .co (c0_3st  ));
    nbit_csa #(42) csa1_2st( .ai({c2_2st[30:0],11'h000} ), .bi ({s2_2st,10'h000}    ), .ci ({3'h0,c1_2st}           ), .so (s1_3st  ), .co (c1_3st  ));

    /*   3st   */
    wire [44:0] s0_4st;
    wire [44:0] c0_4st;
    nbit_csa #(45) csa0_3st( .ai({s1_3st,3'h0}          ), .bi ({3'h0,c0_3st}       ), .ci ({4'h0,s0_3st[41:1]}     ), .so (s0_4st  ), .co (c0_4st  ));

    /*   4st   */
    // c1_3st;
    wire [43:0] s0_5st;
    wire [43:0] c0_5st;
    nbit_csa #(44) csa0_4st( .ai({c1_3st[40:0],3'h0}    ), .bi (c0_4st[43:0]        ), .ci (s0_4st[44:1]            ), .so (s0_5st  ), .co (c0_5st  ));

    assign so = {s0_5st,s0_4st[0],s0_3st[0],s0_2st[0],s0_1st[0]};
    assign co = {c0_5st[42:0],5'h0};

endmodule
