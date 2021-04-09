with Rotate;
generic
   type Item is(<>);
   type Index is(<>);
   with procedure Put_Nothing;
package conveyer_System is

   Slot_Is_Empty, Slot_Not_Empty : Exception;
   type Side is (Left, Right);
   type Command is (Move_Left, Move_Right, Put, Get);

   type TArray    is array(Index range <>) of Item;
   type Algorithm is array(Index range <>) of Command;
   type Conveyor(Max : Index) is limited private;

   procedure Move_Robot(indx : Index; conv : in out Conveyor);
   procedure Put(elem : Item; conv : in out Conveyor);
   procedure Show(conv : Conveyor);
   function Get(conv : in out Conveyor) return Item;
   procedure Move(conv : in out Conveyor; dir : Side := Left);
   procedure my_move is new Rotate(Item, Side, Index, TArray);
   procedure Run(conv : in out Conveyor; algo : Algorithm; len : Natural);


private
   type Conveyor(Max : Index) is record
      Items : TArray(Index'First..Max) := (others => Item'First);
      Robot_Position : Index := Index'First;
   end record;
end Conveyer_System ;
