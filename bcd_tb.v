`timescale 1ns/1ps
module  bcd_tb;
reg clk;
reg rst_n;
wire [3:0] out;

parameter  PERIOD=20 ;
parameter  real DUTY_CUCLE =0.5;
parameter  OFFSET =0;
initial begin
    #OFFSET;
    forever 
        begin
        clk=1'b1;
        #(PERIOD-(PERIOD*DUTY_CUCLE))   clk=1'b0;
        #(PERIOD*DUTY_CUCLE);
        end
end

initial begin
    rst_n = 1'b0;
    #5 rst_n = 1'b1;
    #195 rst_n =1'b0;
    #5 rst_n = 1'b1;
    #55 $finish;
end
initial begin
    $dumpfile("bcd.vcd");
    $dumpvars(0, bcd_1);
end
bcd bcd_1(.clk(clk),
          .rst_syn(rst_n),
          .out(out));
endmodule