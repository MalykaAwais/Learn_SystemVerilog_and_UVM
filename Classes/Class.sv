class myPacket;

// PROPERTIES
   bit [2:0] header;
   bit encode;
   bit [2:0] mode;
   bit [7:0] data;
   bit stop;

// CONSTRUCTORS 

  function new (bit [2:0] header = 3'h1, bit [2:0] mode = 3'h5);
	this.header = header;
	this.encode = 0;
	this.mode = mode;
	this.stop = 1;
  endfunction

  function display();
	$display("Header = %h, Encoder = %b, Mode = %h, stop = %b",this.header,this.encode,this.mode,this.stop);
  endfunction
endclass


