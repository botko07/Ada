with conveyer_System;
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Text_IO;
procedure demo_conveyer is
   type Toys is (Nothing, Car, Doll, Ball);
   package my_conveyer is new Conveyer_System(Toys,Positive);
   my_data : my_conveyer.Conveyor(10);
begin
   my_conveyer.Move_Robot(1,my_data);
   my_conveyer.Put(Car, my_data);
   my_conveyer.show(my_data);
   Put_Line(Toys'Image(my_conveyer.get(my_data)));
   my_conveyer.Move_Robot(8,my_data);
   my_conveyer.Move_Robot(11,my_data);
   my_conveyer.Put(Ball, my_data);
   my_conveyer.Move_Robot(5, my_data);
   my_conveyer.Put(Doll, my_data);
   Put("Before the moving ");
   my_conveyer.show(my_data);
   my_conveyer.move(my_data);
   Put("After the moving ");
   Put_Line(Toys'Image(my_conveyer.get(my_data)));
   my_conveyer.show(my_data);
end demo_conveyer;
