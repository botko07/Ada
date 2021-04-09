with crypto, Ada.Integer_Text_IO, Ada.Text_IO;
use crypto, Ada.Integer_Text_IO, Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Ada.Characters.Conversions;


procedure demo_crypto is
   package Random_int is new Ada.Numerics.Discrete_Random (Integer);
   Z : Random_int.Generator;
   my_keys : keys(3);
   --c : Character := 'A';
   str  : String := "hello";
   str1 : String := "ADA is cool";
   str2 : String := "HELLO";
   str3 : String := "Ada ";

begin
   --Put(Character'Pos('z'));
   --Put(shift_char('Z', 10));
   print_key(my_keys);
   Put_Line("");
   Put_Line("before encryption: with caesar : " & str);
   Put_Line("encrypted : " & encrypt_caesar(str, my_keys));
   Put_Line("decrypted : " & decrypt_caesar(encrypt_caesar(str,my_keys), my_keys));
   Put_Line("");
   -- Put_Line(str);

   Put_Line("before encryption with vigenere : " & str1);
   Put_Line("encrypted : " & encrypt_vigenere_with_numbers(str1,my_keys));
   Put_Line("decrypted : " & decrypt_vigenere_with_numbers(encrypt_vigenere_with_numbers(str1,my_keys), my_keys));
   Put_Line("");
   -- Put_Line(encrypt_with_pos(str2));
   Put_Line("before encryption with position : " & str3);
   Put_Line("encrypted : " & encrypt_with_pos(str3));
   end demo_crypto;
