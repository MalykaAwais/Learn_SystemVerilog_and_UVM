module tb_FSM_Elevator_Controller();

// Inputs
reg clk;
reg rstn;
reg passengers_waiting;
reg [3:0] floor_no_request;
reg [3:0] current_floor;

// Outputs
wire [1:0] elevator_direction;
wire door_open_signal;
wire door_closed_signal;
wire floor_reached_signal;
wire passengers_present;

// Instantiate the ElevatorController module
FSM_Elevator_Controller uut (
.clk(clk),
.rstn(rstn),
.passengers_waiting(passengers_waiting),
.floor_no_request(floor_no_request),
.current_floor(current_floor),
.elevator_direction(elevator_direction),
.door_open_signal(door_open_signal),
.door_closed_signal(door_closed_signal),
.floor_reached_signal(floor_reached_signal),
.passengers_present(passengers_present)
);
initial begin clk =1; end
// Clock generation
always #5 clk = ~clk;

// Reset generation
initial begin
rstn = 0;
#10 rstn = 1;
end

// Test scenario
initial begin
// Set initial inputs
passengers_waiting = 1;
floor_no_request = 4'b0001;
current_floor = 4'b0000;

// Wait for a few clock cycles
#20;

// Change inputs
passengers_waiting = 0;
floor_no_request = 4'b0000;
current_floor = 4'b0010;

// Wait for a few clock cycles
#20;

// Change inputs again
passengers_waiting = 1;
floor_no_request = 4'b0011;
current_floor = 4'b0010;

// Wait for a few clock cycles
#20;

// Change inputs once more
passengers_waiting = 0;
floor_no_request = 4'b0100;
current_floor = 4'b0110;

// Wait for a few clock cycles
#20;

// End simulation
$finish;
end

endmodule





