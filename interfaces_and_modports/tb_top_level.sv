module tb_top_level();
reg clk;
always #10 clk = ~clk;

ms_if  if0 (clk);
top_level d0 (if0);

// Let the stimulus run for 20 clocks and stop
initial begin

clk <= 0;

if0.rstn <= 0;

repeat (5) @ (posedge clk);

if0.rstn <= 1;

repeat (20) @ (posedge clk);
$finish;
end
endmodule

