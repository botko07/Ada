with Conveyer_System;
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Text_IO;
procedure demo_conveyer is

   procedure putNTHG is
   begin
      Put(" * ");
   end putNTHG;

   type Toys is (Nothing, Car, Doll, Ball);
   package my_conveyer is new Conveyer_System(Toys,Positive, putNTHG);
   my_data : my_conveyer.Conveyor(10);


   use my_conveyer;
   AA : my_conveyer.Algorithm := (my_conveyer.Put, my_conveyer.Move_Right, my_conveyer.Move_Right, my_conveyer.Put);
   AB : my_conveyer.Algorithm := (my_conveyer.Get, my_conveyer.Move_Left, my_conveyer.Move_Left, my_conveyer.Get);
   AC : my_conveyer.Algorithm := (my_conveyer.Put, my_conveyer.Move_Left);
   AD : my_conveyer.Algorithm := (my_conveyer.Get, my_conveyer.Move_Right);

begin
   Run(my_data, AA, 1);
   Show(my_data);
   Run(my_data, AB, 1);
   Show(my_data);
   Run(my_data, AC, 5);
   Show(my_data);
   Run(my_data, AD, 5);
   Show(my_data);
   --  Move
   --  Move_Robot(1,my_data);
   --  Put(Car, my_data);
   --  Show(my_data);
   --
   --  Put_Line(Toys'Image(my_conveyer.Get(my_data)));
   --  Move_Robot(8,my_data);
   --  Move_Robot(11,my_data);
   --  Put(Ball, my_data);
   --  Move_Robot(5, my_data);
   --  Put(Doll, my_data);
   --
   --  Put_Line("Before the moving Right ");
   --  Show(my_data);
   --  move(my_data, my_conveyer.Right);
   --  Put_Line("After the moving Right ");
   --  Show(my_data);
   --  Put_Line("");
   --
   --  Put_Line("Before the moving Left with no argument");
   --  Show(my_data);
   --  move(my_data);
   --  Put_Line("After the moving Left ");
   --  Show(my_data);
   --  Put_Line("");
   --
   --
   --  Put_Line("Before the moving Left with argument");
   --  Show(my_data);
   --  move(my_data);
   --  Put_Line("After the moving left ");
   --  Show(my_data);
   --  Put_Line("");
   --
   --
   --  my_conveyer.Show(my_data);
   -- to raise a slot_is_empty exception uncomment line under this
   -- Put_Line(Toys'Image(my_conveyer.Get(my_data)));

   -- to raise slot_not_empty uncomment 2 lines under
   --  Move_Robot(10,my_data);
   --  Put(Car,my_data);
   -- btw, if you change something above, there may not be an exception as place
   -- may be free then

end demo_conveyer;
