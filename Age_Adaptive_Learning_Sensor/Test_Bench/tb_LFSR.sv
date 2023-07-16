module tb_LFSR ();
  bit clk, rstn;
  bit [3:0] random_number1;
  bit [3:0] random_number2;
  bit [1:0] random_number3;

LFSR_v4_new uut (clk, rstn, random_number1, random_number2, random_number3);


initial begin clk = 1; rstn = 0; #19 rstn = 1; end

always #10 clk = ~clk;

endmodule