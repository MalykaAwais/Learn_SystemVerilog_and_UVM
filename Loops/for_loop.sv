module for_loop();

bit clk;

always #10 clk = ~clk;
bit [4:0] counter;
	
initial begin


  $display ("Counter = %d, time: [%t]", counter, $realtime);

	for(counter = 1; counter <10; counter++)
	begin
		@(posedge clk);
			$display ("Counter = %d, time: [%t]", counter, $realtime);
	end
  $display ("Counter = %d, time: [%t]", counter, $realtime);
  
  #20; $finish;

end
endmodule

