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

  function void display();
	$display("Header = %h, Encoder = %b, Mode = %h, stop = %b",this.header,this.encode,this.mode,this.stop);
  endfunction
endclass

class networkPacket extends myPacket;

bit parity;
bit [1:0] crc;

function new(bit [1:0] parity = 1, bit [1:0] crc = 2'h3);

super.new();

this.parity = parity;
this.crc = crc;

endfunction

function void display();

super.display();

$display("Parity = %b , CRC = %h", this.parity, this.crc);

endfunction
endclass


module top_level();

myPacket pkt0, pkt1; // Creating class handles
networkPacket np0, np1;
   initial begin 
	pkt0 = new(3'h2, 2'h3);
	pkt0.display();
	pkt1 = new();
	pkt1.display();

	np0 = new(2'h0, 2'h1);
	np0.display();
	np1 = new();
	np1.display();
   end
endmodule