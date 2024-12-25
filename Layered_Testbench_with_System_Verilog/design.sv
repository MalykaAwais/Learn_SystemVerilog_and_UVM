

//`include "Adder_Interface.sv"

module Adder_Design (adder_interface _if);
//input wire a , b, rstn;
//output reg sum, carry;
  always_comb
    begin 
      if(!_if.rstn) 
        begin
          _if.sum <=0;
          _if.carry <=0;
        end
      else 
        begin 
          {_if.carry, _if.sum}<= _if.a+_if.b;
        end
    end
endmodule


 	