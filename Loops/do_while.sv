module do_while_loop();

bit clk;

always #10 clk = ~clk;
bit [4:0] counter;

initial begin



  $display ("Counter = %d, time: [%t]", counter, $realtime);
	do
	 begin
		@(posedge clk);
			counter++;
			$display ("Counter = %d, time: [%t]", counter, $realtime);
	end
	while (counter < 10);
	
  $display ("Counter = %d, time: [%t]", counter, $realtime);
  
  #20; $finish;

end
endmodule

