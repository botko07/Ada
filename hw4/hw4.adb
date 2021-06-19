with Ada.Calendar;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Numerics.Float_Random,ada.numerics.discrete_random;
procedure hw4 is



   package Random_Positive_Generator is new Ada.Numerics.Discrete_Random(Positive);
   use Random_Positive_Generator;
   G : Generator;
   GG : Ada.Numerics.Float_Random.Generator;


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
   ------------------------


   -------- Station ----------

   type bools_array is array (1..3) of Boolean;

   protected station is
      entry pump1;
      entry pump2;
      entry pump3;
      entry freeUpPump1;
      entry freeUpPump2;
      entry freeUpPump3;
      function getAt(indx : Integer) return Boolean;
      function getFreePumps return Integer;

   private
      -- False means its empty
      pump_arr :bools_array := (others => False);
      empties : Integer := 3;
   end station;


   protected body station is


      function getAt(indx : Integer) return Boolean is
      begin
         return pump_arr(indx);
      end getAt;

      function getFreePumps return Integer is
      begin
         return empties;
      end getFreePumps;

      entry freeUpPump1 when pump_arr(1) is
      begin
         empties := empties + 1;
         pump_arr(1) := False;
      end freeUpPump1;

      entry freeUpPump2 when pump_arr(2) is
      begin
         empties := empties + 1;
         pump_arr(2) := False;
      end freeUpPump2;


      entry freeUpPump3 when pump_arr(3) is
      begin
         empties := empties + 1;
         pump_arr(3) := False;
      end freeUpPump3;


      entry pump1 when not pump_arr(1) is
      begin
         empties := empties - 1;
         pump_arr(1) := True;
      end pump1;

      entry pump2 when not pump_arr(2) is
      begin
         empties := empties - 1;
         pump_arr(2) := True;
      end pump2;

      entry pump3 when not pump_arr(3) is
      begin
        empties := empties - 1;
         pump_arr(3) := True;
      end pump3;

   end station;


   ----------------------------

    ------------ Car --------------
   type duration_ptr is access Duration;
   task type car(number : Integer; Dtime : duration_ptr);
   task body car is
      car_number : Integer := number;
      filled : Boolean := False;
      frees  : Integer;
      pump_num : Integer := 0;
      time : Duration := Dtime.all;
   begin
      for i in 1..3 loop
        -- Ada.Numerics.Float_Random.Reset(GG);
         frees := station.getFreePumps;
         if frees = 0 then
            Printer.Print("attempt number:" & Integer'Image(i) & " unable to fill tank, car number: " & Integer'Image(car_number));
         elsif frees = 1 then
            if not station.getAt(1) then
               filled := True;
               station.pump1;
               Printer.Print("++++++Car number: " & Integer'Image(car_number) & " Filled successfully in pump 1");
               --  delay Duration(2.0 + Ada.Numerics.Float_Random.Random(GG));
               delay time;
               station.freeUpPump1;
               Printer.Print("----- Car number: " & Integer'Image(car_number) & " left pump 1");
            elsif not station.getAt(2) then
               filled := True;
               station.pump2;
               Printer.Print("++++++Car number: " & Integer'Image(car_number) & " Filled successfully in pump 2");
               --delay Duration(2.0 + Ada.Numerics.Float_Random.Random(GG));
               delay time;
               station.freeUpPump2;
               Printer.Print("----- Car number: " & Integer'Image(car_number) & " left pump 2");
            elsif not station.getAt(3) then
               filled := True;
               station.pump3;
               Printer.Print("++++++Car number: " & Integer'Image(car_number) & " Filled successfully in pump 3");
               --delay Duration(2.0 + Ada.Numerics.Float_Random.Random(GG));
               delay time;
               station.freeUpPump3;
               Printer.Print("----- Car number: " & Integer'Image(car_number) & " left pump 3");
            end if;
         else
            while not filled loop
               reset(G);
               pump_num := Random(G) rem 3 + 1;
               if not station.getAt(pump_num) then
                  if pump_num = 1 then
                     filled := True;
                     station.pump1;
                     Printer.Print("++++++Car number: " & Integer'Image(car_number) & " Filled successfully in pump 1");
                     --delay Duration(2.0 + Ada.Numerics.Float_Random.Random(GG));
                     delay time;
                     station.freeUpPump1;
                     Printer.Print("----- Car number: " & Integer'Image(car_number) & " left pump 1");
                  elsif pump_num = 2 then
                     filled := True;
                     station.pump2;
                     Printer.Pr	int("++++++Car number: " & Integer'Image(car_number) & " Filled successfully in pump 2");
                     --delay Duration(2.0 + Ada.Numerics.Float_Random.Random(GG));
                     delay time;
                     station.freeUpPump2;
                     Printer.Print("----- Car number: " & Integer'Image(car_number) & " left pump 2");
                  else
                     filled := True;
                     station.pump3;
                     Printer.Print("++++++Car number: " & Integer'Image(car_number) & " Filled successfully in pump 3");
                     --delay Duration(2.0 + Ada.Numerics.Float_Random.Random(GG));
                     delay time;
                     station.freeUpPump3;
                     Printer.Print("----- Car number: " & Integer'Image(car_number) & " left pump 3");
                  end if;
               end if;
            end loop;
         end if;
         delay 1.0;
         if filled then
            exit;
         end if;
      end loop;
      if not filled then
         Printer.Print("***** car number: " & Integer'Image(car_number) & " Didn't manage to fill up at all");
      end if;

   end car;
   ------------------- car ------------

   type car_ptr is access car;
   car_arr : array(1..20) of car_ptr;

   tm : duration_ptr;
begin
   reset(G);

   for i in 1..20 loop
      Ada.Numerics.Float_Random.Reset(GG);
      tm := new Duration;
      tm.all := Duration(2.0 + Ada.Numerics.Float_Random.Random(GG));
      car_arr(i) := new car(i, tm);
      Ada.Numerics.Float_Random.Reset(GG);
     -- delay 1.0;
      delay Duration(0.1 + Ada.Numerics.Float_Random.Random(GG));
   end loop;

end hw4;
