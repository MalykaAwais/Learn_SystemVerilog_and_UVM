module unique_if;
  //variables declaration
   int a,b,c;

   initial begin
     //initialization
     a=10;
     b=20;
     c=40;
// unique if executes statements in parallel
// IF MORE THAN ONE CONDITION IS TRUE, AN ERROR IS GENERATED
     unique if ( a < b ) $display("\t a is less than b");
     else   if ( a < c ) $display("\t a is less than c");
     else                $display("\t a is greater than b and c");
  end
endmodule
