module F_to_C(clk, rstn, temp_in_F, celsius);
input [7:0] temp_in_F;
output reg [7:0] celsius;
input clk, rstn;

reg [7:0] sub = 0;
  reg [7:0] inter = 0;
  reg [7:0] ans = 0;

always @ *
begin
sub = temp_in_F - 32;   
// TO make optimized design I used multiplierless multiplication
// to multiply "sub" with 5/9, represent 5/9 = 0.5555556 in Q1.7 format = 71.1111
// in binary 0_1000111
// 0_1001001 in CSD 
ans = (sub>>>1) + (sub>>>4) - (sub>>>7);

end
always @ (posedge clk)
begin
if(!rstn)
begin
inter <= 0;
celsius <= 0;
end

else
begin
inter <= sub;
celsius <= ans;
end
end



endmodule
