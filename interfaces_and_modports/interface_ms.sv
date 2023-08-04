interface ms_if (input clk);
logic sready; // Indicates if slave is ready to
logic rstn; // Active low reset
logic [1:0] addr; // Address
logic [1:0] data; // Data


modport slave ( input addr, data, rstn, clk,
output sready) ;

modport master ( output addr, data,
input clk, sready, rstn);
endinterface

