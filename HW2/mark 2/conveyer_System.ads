with Rotate;
generic
   type Item is(<>);
   type Index is(<>);
package Conveyer_System is
   type Conveyor(Max : Index) is limited private;
   procedure Move_Robot(indx : Index; conv : in out Conveyor);
   procedure Put(elem : Item; conv : in out Conveyor);
   procedure Show(conv : Conveyor);
   function Get(conv : in out Conveyor) return Item;
private
   type TArray is array(Index range <> ) of Item;
   type Conveyor(Max : Index) is record
      Items : TArray(Index'First..Max) := (others => Item'First);
      Robot_Position : Index := Index'First;
   end record;
end Conveyer_System;
