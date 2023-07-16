module LFSR_v4_new (clk, rstn, random_number1, random_number2, random_number3);
  
  //INPUT
  input clk, rstn;
  
  //OUTPUT
  
  output reg [3:0] random_number1;
  output reg [3:0] random_number2;
  output reg [1:0] random_number3;
  
  reg [3:0] lfsr1;
  reg [3:0] lfsr2;
  reg [1:0] lfsr3;

// Feedback loop is only allowed in sequential circuit

always @(posedge clk) 
begin
if (!rstn)
begin
      lfsr1 <= 4'b0001; // Initial seed value
      lfsr2 <= 4'b0010;
      lfsr3 <= 2'b01;
	  random_number1 <= 0;
	 random_number2 <= 0;
	 random_number3 <= 0;
end
else
begin
//lfsr1 <= lfsr1<<<1;
lfsr1 <= {lfsr1, lfsr1[3] ^ lfsr1[2]};// Feedback XOR operation

lfsr2 <= {lfsr2, lfsr2[3] ^ lfsr2[2]}; // Feedback XOR operation

lfsr3 <= {lfsr3, lfsr3[1] ^ lfsr3[0]}; // Feedback XOR operation
	random_number1 <= lfsr1;
	random_number2 <= lfsr2;
	random_number3 <= lfsr3;
end
end
endmodule 
