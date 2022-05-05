module bcd(clk, rst_syn,out); 
input clk;
input rst_syn;
output[3:0] out;
reg [3:0] out;

always@ (posedge clk)
begin
    if(!rst_syn)
        out=0;
    else if(out ==9)
        out=0;
    else    
        out=out+1;
end
endmodule