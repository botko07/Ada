package crypto is
   type keys (N : Positive) is limited private;

   procedure print_key(k : keys);
   function shift_char(ch : Character; n:Integer) return Character;
   function encrypt_caesar(str : String; k : keys ) return String;
   function encrypt_vigenere_with_numbers(str:String; k:keys ) return String;
   function encrypt_with_pos(str : String) return String;
   function decrypt_caesar(str : String; k:keys ) return String;
   function decrypt_vigenere_with_numbers(str :String; k:keys ) return String;


   private
   type keys_arr is array ( Integer range <> ) of Natural;

   function Generate_key return Natural;
   function Generate_keys(len: Positive) return keys_arr;

   type keys (N : Positive) is record
      single_key: Natural := Generate_key;
      multi_keys: keys_arr (1..N) := Generate_keys (N);
     -- multi_keys : keys_arr(1..3) := (3,10,0);
   end record;

end crypto;
