// TRANSACTION FRAME
class Packet;

   rand bit rstn;      // because answer also depends upon the value of reset pin so it is also part of packet to see
// if it works well
   rand bit [7:0] a;
   rand bit [7:0] b;
   bit [7:0] sum;
   bit carry;
  
  constraint c1{ a > 10;
                a < 13;}

// Now we are making functions for future use in other components of testbench
  function void print (string tag = "");
    $display (" [%0t], '%s', rstn = %d, a = %d, b = %d, sum = %d, carry = %d", $time,tag,rstn,a,b,sum,carry);
  endfunction

// arguments can be this class handle
  function void copy (Packet tmp);
    this.a = tmp.a;        // assign the values of passed packet to the newly declared packet 
    this.b = tmp.b;
    this.rstn = tmp.rstn;
    this.sum = tmp.sum;
    this.carry = tmp.carry;
  endfunction 
endclass