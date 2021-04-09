generic
   type Item is private;
   type Index is (<>);
   type TArray is array ( Index range <> ) of Item;
procedure Rotate(arr : in out TArray);
