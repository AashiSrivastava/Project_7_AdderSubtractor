//Developed by: Aashi Srivastava
// TITLE:adder_subtractor combined test bench
// Date: 12.10.23, 14:36 IST
module adder_sub_tb (
    
);
    reg [3:0] in1,in2;

    wire [3:0] out;
    reg control;
    reg carry_in;
    wire carry_out;

    adder_sub A(out,carry_out,in1,in2,carry_in,control);

    initial begin
        $dumpfile ("adder_sub.vcd");
        $dumpvars(0,adder_sub_tb);
         $monitor($time, "out=%b carry_out=%b in1=%b in2=%b carry_in=%b control=%b",out,carry_out,in1,in2, carry_in, control);
         carry_in= 1'b1; control=1'b1;
         in1=4'b0111; in2=4'b0011;
        #20 $finish;
        
    end

endmodule