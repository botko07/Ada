-- -- Ada Programming & endterm, 2021. May. 14.
-- This solution was submitted and prepared by <Giorgi Botkoveli, DJSEF1> for the endterm assignment of the Ada Programming course.
-- I declare that this solution is my own work.
--  - I have not copied or used third-party solutions.
-- I have not passed my solution to my classmates, neither made it public.
-- Students’ regulation of Eotvos Lorand University (ELTE Regulations Vol. II. 74/C.) states that as long as
-- a student presents another student’s work - or at least the significant part of it - as his/her own performance,
-- it will count as a disciplinary fault.
--- The most serious consequence of a disciplinary fault can be dismissal of the student from the University.

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


   task Hospital is
      entry vaccinate;
      entry go_in;
   end Hospital;
   task body Hospital is
   begin
      myRandom.Init;
      delay Duration(myRandom.getValue);
      loop
         select
            accept vaccinate  do
               Printer.Print("The patient vaccinated");
            end vaccinate;
         or
            accept go_in  do
               Printer.Print("The patient went in hospital");
            end go_in;
         or
            terminate;

         end select;
      end loop;
   end Hospital;

   task Patient;
   task body Patient is
   begin
      delay  0.5;
      Hospital.go_in;
      select
         Hospital.vaccinate;
      else
         Printer.Print("No vaccinated");
      end select;


   end Patient;





begin
   null;
end Main;
