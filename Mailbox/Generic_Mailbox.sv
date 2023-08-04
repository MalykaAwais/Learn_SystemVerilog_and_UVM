// About the program:

// Two processes are concurrently active in the example, where 1 intial begin (i.e thread) puts 
// data in the mailbox 
// and another gets data from the mailbox

module Generic_Mailbox();
 mailbox mbx = new(2);

 // Create mailbox that can hold 2 items
 // "new" represents size of mailbox queue and return handle
// calling new allocates memory and assigns values

// The rate of items being put in the mailbox is every 1 ns
 initial begin 
     for (int i = 0; i <5; i++)
	begin 
	 #1 mbx.put(i);
	 $display("[%0t] Thread0: Put item #%d, size= %d", $time, i , mbx.num());
        end
 end 
// The rate of items received from the mailbox is 2 every ns
 initial begin 
     forever 
       begin
         int idx;    // forever variable 
         #2 mbx.get(idx);
	 $display("[%0t] Thread1: Got item #%d, size= %d", $time, idx , mbx.num());
       end
 end 
endmodule

// Generic mailbox is good but may result in type mismatching in simulation

