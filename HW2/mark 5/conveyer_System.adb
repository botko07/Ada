with Ada.Text_IO;--Ada.Integer_Text_IO, Ada.Text_IO;
use  Ada.Text_IO;--Ada.Integer_Text_IO, Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
package body conveyer_System is
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
      if conv.Items(conv.Robot_Position) /= Item'First then
         raise Slot_Not_Empty;
      else
         conv.Items(conv.Robot_Position) := elem;
      end if;
   end;



   procedure Show(conv : Conveyor) is
   begin
      Put("The array represantation is : ");
      for I in conv.Items'Range loop
         if conv.Items(I) = Item'First then
            Put_Nothing;
         else
            Put(Item'Image(conv.Items(I)) & " ");
         end if;
        end loop;
      Put_Line("");
      Put_Line("The Robot is standing at position: " & Index'Image(conv.Robot_Position));
   end;

   function Get(conv : in out Conveyor) return Item is
      elem : Item;
   begin
      if conv.Items(conv.Robot_Position) /= Item'First then
         elem := conv.Items(conv.Robot_Position);
          -- uncomment line below if get takes too
        -- conv.Items(conv.Robot_Position) := Item'First;
         return elem;
      else
         raise Slot_Is_Empty;
      end if;
   end;

   procedure Move(conv : in out Conveyor; dir : Side := Left) is
   begin
      if dir = Left then
         my_move(conv.Items, Left);
      else
         my_move(conv.Items, Right);
      end if;
   end;


  procedure Run(conv : in out Conveyor; algo : Algorithm; len : Natural) is
      package Random_Item is new Ada.Numerics.Discrete_Random(Item);
      G: Random_Item.Generator;
      elem : Item;
   begin
      for I in 1..len loop
         for J in algo'Range loop
            if algo(J) = Move_Left then
               if conv.Robot_Position = conv.Items'First then
                  conv.Robot_Position := conv.Items'Last;
               else
                  conv.Robot_Position := Index'Pred(conv.Robot_Position);
               end if;
            elsif algo(J) = Move_Right then
               if conv.Robot_Position = conv.Items'Last then
                  conv.Robot_Position := conv.Items'First;
               else
                  conv.Robot_Position := Index'Succ(conv.Robot_Position);
               end if;
            elsif algo(J) = Put then
               Random_Item.Reset(G);
               elem := Random_Item.Random(G);
               Put(elem, conv);
            elsif algo(J) = Get then
               elem := Get(conv);
               Put("Robot took the element: " & Item'Image(elem));
            end if;

         end loop;
      end loop;
   end Run;

end Conveyer_System;
