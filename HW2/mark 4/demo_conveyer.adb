with conveyer_System;
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Text_IO;
procedure demo_conveyer is
   type Toys is (Nothing, Car, Doll, Ball);
   package my_conveyer is new Conveyer_System(Toys,Positive);
   my_data : my_conveyer.Conveyor(10);
begin
   --my_data.Move
   my_conveyer.Move_Robot(1,my_data);
   my_conveyer.Put(Car, my_data);
   my_conveyer.Show(my_data);
   Put_Line(Toys'Image(my_conveyer.Get(my_data)));
   my_conveyer.Move_Robot(8,my_data);
   my_conveyer.Move_Robot(11,my_data);
   my_conveyer.Put(Ball, my_data);
   my_conveyer.Move_Robot(5, my_data);
   my_conveyer.Put(Doll, my_data);

   Put_Line("Before the moving Right ");
   my_conveyer.Show(my_data);
   my_conveyer.move(my_data, my_conveyer.Right);
   Put_Line("After the moving Right ");
   my_conveyer.Show(my_data);
   Put_Line("");

   Put_Line("Before the moving Left with no argument");
   my_conveyer.Show(my_data);
   my_conveyer.move(my_data);
   Put_Line("After the moving Left ");
   my_conveyer.Show(my_data);
   Put_Line("");


   Put_Line("Before the moving Left with argument");
   my_conveyer.Show(my_data);
   my_conveyer.move(my_data);
   Put_Line("After the moving left ");
   my_conveyer.Show(my_data);
   Put_Line("");


   my_conveyer.Show(my_data);
   -- to raise a slot_is_empty exception uncomment line under this
   --Put_Line(Toys'Image(my_conveyer.Get(my_data)));

   -- to raise slot_not_empty uncomment 2 lines under
    -- my_conveyer.Move_Robot(4,my_data);
    -- my_conveyer.Put(Car,my_data);
   -- btw, if you change something above, there may not be an exception as place
   -- may be free then

end demo_conveyer;
