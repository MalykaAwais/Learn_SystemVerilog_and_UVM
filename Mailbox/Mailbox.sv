// DATA PACKET IN THIS ENVIRONMENT IS CALLED AS TRANSACTION

// (1) class TRANSACTION THAT contains DATA (RANDOM NUMBERS)
class transaction;
 rand bit [7:0] data; 
  
 function void display();
	$display("[%0t] Data = %h", $time, data);
 endfunction

endclass
 // GENERATOR CLASS :: Generate a transaction object and put into mailbox class
class generator;

// COMMENt" I WAS HERE

mailbox mbx; // mbx is class handle (instance) of mailbox built in class
             // and it is class property of class transaction because it is declared inside this class scope

// --------------CONSTRUCTOR-----------

        function new (mailbox mbx); // constructor getting mailbox handle
          this.mbx = mbx;           // this mbx is getting value of mbx from top module
        endfunction

task genData ();
transaction t_pkt; // object of class transaction is created

t_pkt = new ();

t_pkt.randomize ();  // directed tests take a lot of time to develop 
// hence apply random values to signals we are interested to check

t_pkt.display (); // calling the member function of the class transaction

  $display ("[%0t] [Generator] Going to put data put data packet into mailbox", $time);

mbx.put(t_pkt); // means putting the trns object into the mbx mailbox.

  $display ("[%0t] [Generator] Data put into mailbox", $time);
endtask
endclass

// Driver class - Get the transaction object from Generator class
class driver;
mailbox mbx;

function new (mailbox mbx);
this.mbx = mbx;
endfunction

task drvData ();
	transaction drvTrns;    // class handles of transaction
        drvTrns = new ();        // constructs
	$display ("[%0t] [Driver] Waiting for available data", $time);

	mbx.get (drvTrns); // means getting the trns object from the mbx mailbox.

	$display ("[%0t] [Driver] Data received from Mailbox", $time);
 	drvTrns.display ();
endtask
endclass

// Top Level environment that will connect Gen
module Mail_box;

	mailbox  mbx; // create original mailbox named mbx

	generator Gen;  // declare class handles or objects names as Gen of class generator

	driver Drv; // declare class handles or objects names as Drv of class Driver

 initial begin
	mbx = new (); // construct the object
	Gen = new (mbx);
	Drv = new (mbx);

 fork

	#10 Gen.genData ();
	Drv.drvData ();
 join_none
 end
endmodule




