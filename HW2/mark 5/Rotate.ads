generic
   type Item is private;
   type Dir  is (<>);
   type Index is (<>);
   type Item_Array is array ( Index range <> ) of Item;
procedure Rotate(arr : in out Item_Array; dr : Dir);
