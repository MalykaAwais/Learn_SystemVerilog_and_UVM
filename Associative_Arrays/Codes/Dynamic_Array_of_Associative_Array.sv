module tb_Dynamic_Array_of_Associative_Arrays();

int PG [] [string];

initial begin 
	PG = new [2];
	PG[0] = '{"Malyka":399940 , "Arooj": 400000};
	PG[1] = '{"Mariya": 3209812 ,"Sana": 399710, "Hanzala": 432311};
		$display("PG[0]: %p", PG[0]);
		$display("PG[1]: %p", PG[1]);

// iterate through each index of dynamic array

foreach(PG[i])
	foreach(PG[i][c])
		$display("PG[%d][%s]: %d",i, c, PG[i][c]);
end
endmodule