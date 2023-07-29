module Merge_Event();

// Create event variables
event event_a, event_b;

initial begin
fork
// Thread1: waits for event a to be triggered
begin
	$display ("[%0t] Thread1: Wait for event_a is started", $time);
	wait (event_a.triggered);
	$display ("[%0t] Thread1: Wait for event_a is over", $time);
end
// Thread2: waits for event b to be triggered
begin
	$display ("[%0t] Thread2: Wait for event_b is started", $time);
	wait (event_b.triggered);
	$display ("[%0t] Thread2: Wait for event_b is over", $time);
end

// Thread3: triggers event a at 20ns
begin
	#20 ->event_a;
	$display ("[%0t] Thread3: event_a triggered", $time);
end
// Thread4: triggers event b at 30ns
begin
	#30 ->event_b;
	$display ("[%0t] Thread4: event_b triggered", $time);
end

// Threads5 Assigns event b to event a at 10ns

begin

	#10 event_b = event_a;
	$display ("[%0t] Thread5: Assigned event b to event a", $time);
end
join
end
endmodule
