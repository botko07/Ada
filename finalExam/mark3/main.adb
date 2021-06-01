
with Ada.Calendar;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Numerics.Float_Random,ada.numerics.discrete_random;
procedure Main is

   -------- Printer -----------

   protected Printer is
      procedure Print( s: in STRING := "" );
   end Printer;

   protected body Printer is
      procedure Print( s: in STRING := "" ) is
      begin
         Put_Line(s);
      end Print;
   end Printer;
   --------------------------


   protected myRandom is
      procedure Init;
      function getValue return Float;
   private
      G : Ada.Numerics.Float_Random.Generator;
   end myRandom;

   protected body myRandom is
      procedure Init is
      begin
         Ada.Numerics.Float_Random.Reset(G);
      end Init;
      function getValue return Float is
      begin
         Ada.Numerics.Float_Random.Reset(G);
         return Ada.Numerics.Float_Random.Random(G);
      end getValue;
   end myRandom;
   ---------------
   type string_ptr is access String;

   task Hospital is
      entry vaccinate(name : string_ptr);
      entry go_in(name : string_ptr);
   end Hospital;
   task body Hospital is
      time: Ada.Calendar.Time := Ada.Calendar."+"( Ada.Calendar.Clock, 12.0 );
      opened : Boolean := True;
      counter : Integer := 0;
   begin
      myRandom.Init;
      delay Duration(myRandom.getValue);
      while opened loop
         if counter > 4 then
            raise Tasking_Error;
         end if;

         select when counter < 5 =>
            accept vaccinate(name : string_ptr)  do
               counter := counter + 1;
               delay 0.5;
               Printer.Print(name.all & " vaccinated");
            end vaccinate;
         or
            accept go_in(name : string_ptr)  do
               Printer.Print(name.all & " went in hospital");
            end go_in;
         or
            delay until time;
            opened := False;
         end select;
      end loop;
      exception
      when tasking_error =>
         Put_Line("Hospital is closed!!!");
   end Hospital;





   task type Patient(fname : string_ptr);
   task body Patient is
      name : string_ptr := fname;
      b : Boolean := False;
      b1 : Float;
      vaccinated : Boolean := False;
   begin
      delay  0.5;
      --- if b1 less than 0.5 then he patient wants vacci
      b1 := myRandom.getValue;
      if b1 < 0.5 then
         b := True;
         vaccinated := True;
      end if;




      if b then
         Printer.Print(fname.all & " Did not want to vaccinate");
      else
         Hospital.go_in(name);
         select
            Hospital.vaccinate(name);
            vaccinated := True;
         else
            Printer.Print(name.all & " Not vaccinated on 1st attempt");
         end select;
      end if;

      if not vaccinated then
         delay 0.5;
         select
            Hospital.vaccinate(name);
            vaccinated := True;
         else
            Printer.Print(name.all & " Not vaccinated on 2nd attempt too");
         end select;
      end if;



   end Patient;

   type Patient_ptr is access Patient;
   Patient_arr : array(1..10) of Patient_ptr;





begin
   for i in 1..10 loop
      Patient_arr(i) := new Patient(new String'("Patient " &Integer'Image(i)));
      delay 0.5;
   end loop;

end Main;
