module Semaphore2();
semaphore key; // Create a semaphore handle called "key"

 initial begin

    key = new (2); // Create two keys, multiple keys are also posssible
    fork
	personA(); // persona tries to get the room and puts it back when work done
	personB(); // personb also tries
       begin
	#25
        personA(); // personA tries to get again
       end
	personC();
	personD();
     join_none
 end

 task getRoom (bit [3:0] id);
	$display ("[%t] Trying to get a room for id[%h]...", $time,id);
        key.get(1);
        $display("[%t] We have GOT 1 key for room for id[%h]...", $time,id);
        #1;
        key.get(1);
	 // WE ARE GETTING THE RESOURCE
	$display ("[%t] Room Key retrieved for id[%h]", $time,id);
  endtask

 task putRoom (bit [3:0] id);
	$display ("[%t] Leaving room id[%h]...", $time,id);
	key.put (2); // WE ARE PUTTING THE RESOURCE BACK OR RELEASING THE RESOURCE
	$display ("[%t] Room Key put back id[%h]", $time,id);

  endtask


// This person tries to get the room immediately and puts
// it back 20 time units later
 task personA ();
	getRoom (4'hA);     //PERSON a GETS RESOURCE 
	#20; putRoom (4'hA);  //Puts back after 20 tu 
 endtask

// This person tries to get the room after 5 time unit
// 10 time units
 task personB ();
	#5;  getRoom (4'hB); //PERSON b GETS RESOURCE after 5 tu
	#10; putRoom (4'hB); //Puts back after 10 tu
 endtask
// This person tries to get the room after 5 time unit
// 10 time units
 task personC ();
	#5;  getRoom (4'hC); //PERSON b GETS RESOURCE after 5 tu
	#10; putRoom (4'hC); //Puts back after 10 tu
 endtask
// This person tries to get the room after 5 time unit
// 10 time units
 task personD ();
	#5;  getRoom (4'hD); //PERSON b GETS RESOURCE after 5 tu
	#10; putRoom (4'hD); //Puts back after 10 tu
 endtask
endmodule


	
