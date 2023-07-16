module tb_shifting();
reg clk, rstn;
bit [3:0] random_number1;

shifting uut(clk,rstn,random_number1);

initial begin clk = 1; rstn = 0; #19 rstn = 1; end

always #10 clk = ~clk;
endmodule

