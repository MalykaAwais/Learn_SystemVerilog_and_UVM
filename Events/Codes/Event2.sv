module Event2();

// Create an event
event event_a;

// Thread1: Triggers the event using "->" at 20ns

initial begin
	#20 ->event_a;
	$display("[%0t] Thread1 triggered", $time);
end

// Thread2: starts waiting for the event using "@" operator at 20ns
initial begin
	$display("[%0t] Thread2: waiting for the trigger", $time);
	#20 @(event_a);
	$display("[%0t] Thread2: received event_a trigger", $time);
end

// Threads: starts waiting for the event a using .triggered
initial begin
	$display("[%0t] Thread3: waiting for the trigger", $time);
	#20 wait (event_a.triggered);
	$display("[%0t] Thread3: received event_a trigger", $time);
end

endmodule
