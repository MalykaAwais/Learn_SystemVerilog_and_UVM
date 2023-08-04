module while_loop();

bit clk;
bit [4:0] counter;

always #10 clk = ~clk;
	
initial begin

 

  $display ("Counter = %d, time: [%t]", counter, $realtime);

	while (counter < 10) begin
		@(posedge clk);
			counter++;
			$display ("Counter = %d, time: [%t]", counter, $realtime);
	end
  $display ("Counter = %d, time: [%t]", counter, $realtime);
  
 // #20; $finish;

end
endmodule

