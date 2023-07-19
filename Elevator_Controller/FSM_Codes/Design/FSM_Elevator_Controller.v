module FSM_Elevator_Controller (clk, rstn,passengers_waiting, floor_no_request,current_floor, elevator_direction, door_open_signal,
door_closed_signal,
floor_reached_signal,
passengers_present
);

  // INPUTS
  input clk, rstn;
  input passengers_waiting;     //Get from the top module
  input [3:0] floor_no_request; //Get from the top module
  input [3:0] current_floor;    //Get from the top module


  // OUTPUTS
  output reg [1:0] elevator_direction; //0 for default when nothing, 1 for downwards, 2 for upwards
  output reg door_open_signal;
  output reg door_closed_signal;
  output reg floor_reached_signal;
  output reg passengers_present;   // 4 or less than 4 - after the door is closed

  // Define the states using parameters by one hot encoding
  parameter IDLE = 6'b000001;
  parameter DOOR_OPEN = 6'b000010;
  parameter MOVING_UPWARDS = 6'b000100;
  parameter MOVING_DOWNWARDS = 6'b001000;
  parameter FLOOR_REACHED = 6'b010000;
  parameter PASSENGERS_EVACUATE = 6'b100000;
  
  // REGs

  // Define the current state variable
  reg [5:0] current_state;

  // Define the next state variable
  reg [2:0] next_state;

  // Initialize the current state
 /* initial begin
    current_state = IDLE;
  end*/

  // Assign the outputs based on the current state
  always @(*) begin
    case (current_state)
      IDLE:
        begin
          elevator_direction = 0;  // In bubble diagram we consider it as "x" but here we cannot do this
          door_open_signal = 0;
          door_closed_signal = 1;
          floor_reached_signal = 0;
          passengers_present = 0;
        end
      DOOR_OPEN:
        begin
          elevator_direction = 0;
          door_open_signal = 1;
          door_closed_signal = 0;
          floor_reached_signal = 0;
          passengers_present = 0;       //Door will be opened
        end
      MOVING_UPWARDS:
        begin
          elevator_direction = 2;
          door_open_signal = 0;
          door_closed_signal = 1;
          floor_reached_signal = 0;
          passengers_present = 1;
        end
      MOVING_DOWNWARDS:
        begin
          elevator_direction = 1;
          door_open_signal = 0;
          door_closed_signal = 1;
          floor_reached_signal = 0;
          passengers_present = 1;
        end
      FLOOR_REACHED:
        begin
          elevator_direction = 0;
          door_open_signal = 0;
          door_closed_signal = 1;
          floor_reached_signal = 1;
          passengers_present = 1;
        end
      PASSENGERS_EVACUATE:
        begin
          elevator_direction = 0;
          door_open_signal = 1;
          door_closed_signal = 0;
          floor_reached_signal = 0;
          passengers_present = 1;
        end
    endcase
  end

  // Define the state transitions
  always @(*) begin
    case (current_state)
      IDLE:				// Control is at IDLE state
        if (passengers_waiting)
	begin 
	next_state = DOOR_OPEN;		// Now Control is at DOOR_OPEN state
		/*if (current_floor < floor_no_request)
          	next_state = MOVING_UPWARDS;
		else if (current_floor > floor_no_request)
		next_state = MOVING_DOWNWARDS;
		else
		next_state = IDLE;*/
        end
	else
	next_state = IDLE;
 
      DOOR_OPEN:
	if (current_floor < floor_no_request)
          	next_state = MOVING_UPWARDS;
		else if (current_floor > floor_no_request)
		next_state = MOVING_DOWNWARDS;
		else
		next_state = IDLE;

      MOVING_UPWARDS:
        if (current_floor == floor_no_request)
          next_state = FLOOR_REACHED;
        else
          next_state = MOVING_UPWARDS;
      MOVING_DOWNWARDS:
        if (current_floor == floor_no_request)
          next_state = FLOOR_REACHED;
        else
          next_state = MOVING_DOWNWARDS;
      FLOOR_REACHED:
        if (current_floor == floor_no_request)
          next_state = PASSENGERS_EVACUATE;
        else
          next_state = IDLE;
PASSENGERS_EVACUATE:
if((passengers_waiting) && (floor_no_request!=current_floor))
next_state = DOOR_OPEN;
else
next_state = IDLE;

    endcase
  end

  // Update the current state
always @(posedge clk) begin
if(!rstn)
    current_state <=IDLE;
else
    current_state <= next_state;
end

endmodule

