module Nested_Fork_Join_Any();

initial begin
    $display ("[%0t] Main Thread: Fork join going to start", $time);
    fork
	fork
	print (20, "Thread1 0");
	print (30, "Thread 1");

	join_any
     print (10, "Thread2");
     join_any
 $display ("[%et] Main Thread: Fork join has finished", $time);
end

// Note that this task has to be automatic
 task automatic print (int _time, string t_name);
     #(_time) $display ("[%0t] %s", $time, t_name);
 endtask

endmodule

