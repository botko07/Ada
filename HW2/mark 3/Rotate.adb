procedure Rotate( arr : in out TArray ) is
   first : Item  := arr(arr'First);
begin
   for I in arr'First..Index'Pred(arr'Last) loop
      arr(I) := arr(Index'Succ(I));
   end loop;
   arr(arr'Last) := first;
end Rotate;
