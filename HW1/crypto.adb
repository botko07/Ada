with Ada.Numerics.Discrete_Random;
with Ada.Integer_Text_IO, Ada.Text_IO;
use  Ada.Integer_Text_IO, Ada.Text_IO;
package body crypto is

   package Random_int is new Ada.Numerics.Discrete_Random (Integer);
   G : Random_int.Generator;

   procedure print_key(k : keys) is

   begin
      Put_Line("Generated single_key : " & Integer'Image(k.single_key));
      Put("Generated multi_keys list is : ");
      for i in k.multi_keys'Range loop
         Put(Integer'Image(k.multi_keys(i)));
      end loop;
      Put_Line("");

   end;

   function shift_char(ch : Character; n:Integer) return Character is
      shift : Integer := n mod 26;
      tmp   : Integer := Character'Pos(ch);
      diff  : Integer := 0;
      val   : Integer := Character'Pos(ch);
   begin
      if val >= 65 and then val <= 90 then
         tmp := tmp + shift;
         if tmp > 90 then
            diff := tmp - 90 - 1;
            tmp := 65 + diff;
         end if;
      elsif val >= 97 and then val <= 122 then
         tmp := tmp + shift;
         if tmp > 122 then
            diff := tmp - 122 - 1;
            tmp := 97 + diff;
         end if;
      end if;
      return Character'Val(tmp);

   end;


   function encrypt_caesar(str : String; k : keys ) return String is
      answer : String := str;
   begin
      for i in answer'Range loop
         answer(i) := shift_char(answer(i), k.single_key);
      end loop;
      return answer;

   end;


   function encrypt_vigenere_with_numbers(str : String; k : keys ) return String is
      answer : String  := str;
      tmp    : Integer := 1;
      val    : Integer := 0;
   begin
      for i in answer'Range loop
         val := Character'Pos(answer(i));
         if (val >= 65 and val <= 90) or (val >= 97 and val <= 122) then
            answer(i) := shift_char(answer(i), k.multi_keys(tmp));
            tmp := tmp + 1;
            if tmp > k.multi_keys'Length then
               tmp := 1;
            end if;
         end if;

      end loop;
      return answer;

   end;


   function encrypt_with_pos(str : String) return String is
      pos : Integer := 0;
      answer : String := str;
   begin
      for i in str'Range loop
         pos := Character'Pos(str(i));
         if pos >= 65 and then pos <= 90 then
            pos := pos - 65;
            answer(i) := shift_char(str(i), pos);
         elsif pos >= 97 and then pos <= 122 then
            pos := pos - 97;
            answer(i) := shift_char(str(i), pos);
         end if;
      end loop;
      return answer;
   end;

   function decrypt_caesar(str :String; k : keys ) return String is
      tmp    : keys := k;
      shift  : Integer  := k.single_key mod 26;
   begin
      shift := 26 - shift;
      tmp.single_key := shift;
      return encrypt_caesar(str, tmp);
   end;

   function decrypt_vigenere_with_numbers(str : String; k:keys ) return String is
      tmp : keys := k;
      val : Integer := 0;
   begin
      for i in k.multi_keys'Range loop
         val := k.multi_keys(i) mod 26;
         tmp.multi_keys(i) := 26 - val;
      end loop;
      return encrypt_vigenere_with_numbers(str, tmp);
   end;

   function Generate_key return Natural is
   begin
      Random_int.Reset(G);
      return abs(Random_int.Random(G) rem 27);
   end;


   function Generate_keys(len : Positive) return keys_arr is
      arr : keys_arr (1..len) := (others => 0);
   begin
      for i in 1..len loop
         arr(i) := Generate_key;
      end loop;
      return arr;
   end;
end crypto;
