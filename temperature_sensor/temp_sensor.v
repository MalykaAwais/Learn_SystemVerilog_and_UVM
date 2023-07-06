module temp_sensor(clk,rstn, sensorID, temp, output_state);
input [15:0] sensorID;
input clk, rstn;
input [7:0] temp;
output reg output_state;

wire [7:0] c_temp;

F_to_C F_to_C1(.clk(clk), .rstn(rstn), .temp_in_F(temp), .celsius(c_temp));

always @ (posedge clk)

if(!rstn)
output_state <=0;

else
begin
if (c_temp > 57)
output_state <=1;
else
output_state <=0;
end

endmodule




