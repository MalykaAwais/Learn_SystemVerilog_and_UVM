module shifting (
  input clk,
  input rstn,
  output reg [3:0] random_number1
);
  reg [3:0] lfsr1;

  initial begin
    lfsr1 = 4'b0001; // Initial seed value
  end

  always @(posedge clk) begin
    if (!rstn)
      random_number1 <= 0;
    else begin
      lfsr1 <= {lfsr1[2:0], lfsr1[3] ^ lfsr1[2]}; // Shift and feedback XOR operation
      random_number1 <= lfsr1;
    end
  end
endmodule
