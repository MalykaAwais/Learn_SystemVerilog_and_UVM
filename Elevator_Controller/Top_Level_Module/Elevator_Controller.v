module Elevator_Controller(clk, rstn, no_of_passengers, req1, req2, req3, req4, req5, req6, next_floor, elevator_direction, door_open_signal,
door_closed_signal,
floor_reached_signal,
passengers_present);

input clk, rstn;
input [2:0] req1, req2, req3, req4, req5, req6;
input [2:0] no_of_passengers;
output reg [2:0] next_floor; 
output [1:0] elevator_direction; //0 for default when nothing, 1 for downwards, 2 for upwards
  output door_open_signal;
  output door_closed_signal;
  output floor_reached_signal;
  output passengers_present;   


reg signed [2:0] temp,d1,d2,d3,d4,d5,d6;
reg [3:0] current_floor;
wire passengers_waiting;

reg [3:0] f_req;

always @ (posedge clk)
begin 
if(!rstn)
begin
next_floor <=0;
current_floor <=0;
end
else
begin
next_floor <= f_req;
current_floor <= next_floor;
end
end

// USE ASSIGN this way: assign output = (condition) ? true_value : false_value;
 
assign passengers_waiting = (no_of_passengers >0 && no_of_passengers <7) ? 1 : 0;


always @* begin
d1 = current_floor-req1;  // Assume num1 as the initial minimum number
d1 = (d1 < 0) ? -$signed(d1) : d1;
if(d1 == 0)
temp=temp;
else
temp = d1;
//temp = (temp < 0) ? -$signed(temp) : temp;
 d2 = current_floor-req2;
d2 = (d2 < 0) ? -$signed(d2) : d2;
 d3 = current_floor-req3;
d3 = (d3 < 0) ? -$signed(d3) : d3;
 d4 = current_floor-req4;
d4 = (d4 < 0) ? -$signed(d4) : d4;
 d5 = current_floor-req5;
d5 = (d5 < 0) ? -$signed(d5) : d5;
 d6 = current_floor-req6;
d6 = (d6 < 0) ? -$signed(d6) : d6;


    if (d2 <=temp && d2!=0)  // Compare num2 with temp
      temp = req2;

    else if (d3 <=temp && d3!=0)  // Compare num3 with temp
      temp = req3;
    else if (d4 <=temp && d4!=0)  // Compare num4 with temp
      temp = req4;
    else if (d5 <=temp && d5!=0)  // Compare num5 with temp
      temp = req5;
    else if (d6 <= temp && d6!=0)  // Compare num6 with temp
      temp = req6;
	else
	f_req = temp;
f_req = temp;
//next_floor = f_req;

end

FSM_Elevator_Controller uut5(.clk(clk), .rstn(rstn),.passengers_waiting(passengers_waiting), .floor_no_request(f_req),.current_floor(current_floor), .elevator_direction(elevator_direction),
.door_open_signal(door_open_signal),
.door_closed_signal(door_closed_signal),
.floor_reached_signal(floor_reached_signal),
.passengers_present(passengers_present));

endmodule

