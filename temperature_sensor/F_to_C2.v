
module F_to_C2(
  input clk,
  input rstn,
  input [7:0] temp_in_F,
  output reg [7:0] celsius
);

  reg [7:0] sub = 0;
  reg [7:0] inter = 0;
  reg [7:0] ans = 0;

  always @(posedge clk) begin
    if (!rstn) begin
      inter <= 0;
      celsius <= 0;
    end else begin
      inter <= sub;
      celsius <= ans;
    end
  end

  always @* begin
    sub = temp_in_F - 32;
    ans = (sub * 5) / 9;
  end

endmodule
