with Ada.Text_IO;--Ada.Integer_Text_IO, Ada.Text_IO;
use  Ada.Text_IO;--Ada.Integer_Text_IO, Ada.Text_IO;
package body Conveyer_System is
   procedure Move_Robot(indx : Index; conv : in out Conveyor) is
   begin
      if (indx <= conv.Items'Last and then indx >= conv.Items'First) then
         Put_Line("Robot is moved to the position: " & Index'Image(indx));
        conv.Robot_Position := indx;
      else
         Put_Line("Unable to move robot here cause position is out of belt's bounds");
      end if;
   end;

   procedure Put(elem : Item; conv : in out Conveyor) is
   begin
      conv.Items(conv.Robot_Position) := elem;
   end;

   procedure Show(conv : Conveyor) is
   begin
      Put("The array represantation is : ");
        for I in conv.Items'Range loop
           Put(Item'Image(conv.Items(I)) & " ");
        end loop;
      Put_Line("");
      Put_Line("The Robot is standing at position: " & Index'Image(conv.Robot_Position));
   end;

   function Get(conv : in out Conveyor) return Item is
      elem : Item;
   begin
      elem := conv.Items(conv.Robot_Position);
      -- uncomment line below if get takes too
        -- conv.Items(conv.Robot_Position) := Item'First;
      return elem;
   end;

   procedure Move(conv : in out Conveyor) is
   begin
      my_move(conv.Items);
   end;

end Conveyer_System;
