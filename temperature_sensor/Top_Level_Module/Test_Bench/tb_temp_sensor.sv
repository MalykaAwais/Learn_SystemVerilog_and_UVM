typedef struct packed{

bit [15:0] sensorID;
bit [7:0] temp;
logic output_state;} packet;


module tb_temp_sensor();

reg clk, rstn;


packet sensor1, sensor2;
initial 
  begin 
  $dumpfile("dump.vcd");
  $dumpvars(1);
    clk =1;
    rstn = 0; 
end 
always #10 clk = ~clk;
initial #100 rstn = 1;
//always  #100 rstn = 1; //Why use always block for this?
  
always @ *    //Why have you used always@* here?
begin 
#100 rstn = 1; //why are you waiting for 100 secs before updation everytime? 


sensor1.sensorID = "2A";
    sensor1.temp = 8'd139;
sensor2.sensorID = "3B";
    sensor2.temp = 8'd150;
assert(sensor1.output_state ==1)
else
$error("Assertion Failed!, Expected: 1");
end 

temp_sensor uut1(.clk(clk), .rstn(rstn), .sensorID(sensor1.sensorID), .temp(sensor1.temp), .output_state(sensor1.output_state));
temp_sensor uut2(.clk(clk), .rstn(rstn), .sensorID(sensor2.sensorID), .temp(sensor2.temp), .output_state(sensor2.output_state));

endmodule
