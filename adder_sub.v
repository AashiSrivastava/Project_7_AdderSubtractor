//Developed by: Aashi Srivastava
// TITLE:adder_subtractor combined
// Date: 12.10.23, 14:36 IST
module adder_sub (
    out,carry_out,in1,in2,carry_in,control
);
    input [3:0] in1,in2;

    output [3:0] out;
    input control;
    input carry_in;
    output carry_out;

    wire [3:1] wire1;

    adder_sub1 a1(out[0], wire1[1],in1[0],in2[0],carry_in,control);
    
    adder_sub1 a2(out[1], wire1[2],in1[1],in2[1],wire1[1],control);
    
    adder_sub1 a3(out[2], wire1[3],in1[2],in2[2],wire1[2],control);
    
    adder_sub1 a4(out[3], carry_out,in1[3],in2[3],wire1[3],control);
    
endmodule

module   adder_sub1 (out, carry_out,in1,in2, carry_in ,control);
    input in1,in2;
    output out,carry_out;
    input control, carry_in ;
    wire wire1;

    xor n1(wire1,in2,control);
    assign out=in1^wire1^carry_in;
    assign carry_out= (in1 & wire1) | (wire1 & carry_in) |(carry_in & in1);
    
endmodule