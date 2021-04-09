procedure Rotate( arr : in out Item_Array; dr : Dir ) is
   first : Item  := arr(arr'First);
   last  : Item  := arr(arr'Last);
begin
   if dr = Dir'First then
      for I in arr'First..Index'Pred(arr'Last) loop
         arr(I) := arr(Index'Succ(I));
      end loop;
      arr(arr'Last) := first;
   else
      for I in reverse index'Succ(arr'First)..arr'Last loop
         arr(I) := arr(Index'Pred(I));
      end loop;
      arr(arr'First) := last;
   end if;

end Rotate;
