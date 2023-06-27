module d_ff(clk, rstn, q, data);
  input clk, rstn, data;
  output reg q;
  
  always @ (posedge clk)
    begin
    if(!rstn)
      q<=0;
  else
    q<=data;
    end
endmodule
    