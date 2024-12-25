interface adder_interface(input bit tb_clk);
  
  logic rstn;
  logic [7:0] a;
  logic [7:0] b;
  logic [7:0] sum;
  logic carry;
  
  modport Adder_Design (input rstn, a, b,
		      output sum, carry);
  modport tb_Adder_Design (output rstn, a, b,
		      input sum, carry); 
endinterface


