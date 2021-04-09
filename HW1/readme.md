Implement a package crypto with the following :

In private:

    function Generate_key return Natural; -- generates a random Natural number between 0 to 26
    function Generate_keys(len: Positive) return keys_arr; -- generates a keys_arr type array of random Natural numbers between 0 to 26
    keys_arr type array of Natural

    keys limited private type using record with a discrminant (N -> "length of multi_keys")
    which has single_key and multi_keys components
    where single_key is Natural type initialized and multi_keys is keys_arr type
    and both initialized with random keys from the above mentioned functions


The package should contain the following operations as well:

    procedure print_key(k:keys); -- prints components of a keys record (single_key and multi_keys) 
    
    function shift_char(c: Character; n:Integer) return Character; -- shifts Character to n times within its case range 
                                                                        whether its a lower case or upper case

    function encrypt_caesar(x:String; k:keys ) return String; -- encrypts Srting by shifting each Character n times using single_key from k 
    function encrypt_vigenere_with_numbers(x:String; k:keys ) return String; -- encrypts String by shifting each Character 
                                                                                using multi_keys from k by iterating throw the keys over and over

    function encrypt_with_pos(x:String) return String; -- encrypts Srting by shifting each Character n times 
                                                            where n is the Character position relatively to its current case range
                                                            whether its a lower case or upper case

    function decrypt_caesar(x:String; k:keys ) return String; -- decrypts a previously encrypted caesar cipher (opposite of encrypt_caesar)
    function decrypt_vigenere_with_numbers(x:String; k:keys ) return String; -- decrypts a previously encrypted vigenere cipher 
                                                                                (opposite of encrypt_vigenere_with_numbers)


---------------------------------------------------------------------------------------------------------
possible output:
_________________


    generated single_key is : 4
    generated multi_keys list is : 3 10 0

    before encryption with caesar : hello
    encrypted: lipps
    decrypted : hello


    before encryption with vigenere : ADA is cool
    encrypted : DNA lc cryl
    decrypted : ADA is cool


    before encryption with position : ADA is cool
    encrypted : AGA qk eccw

---------------------------------------------------------------------------------------------------------


further explaination:
_____________________


-- caesar encryption: simply shifts each Character in the string with a single key for all the Characters
ex: HELLO (key: 5) -> MJQQT
    Hello (key: 20) -> Byffi
    Ada (key: 1) -> Beb

(in your solution::keep in mind that upper case Characters are shifted to other upper case Characters and same for lower case (Maintain case strategy with ignoring other Characters))

-- vigenere encryption: same for caesar but it uses multiple keys (originally keys are Characters as well)
ex: HELLO (key: 2,3) -> JHNOQ
    Hello (key: 1,4) -> Iimpp
    Ada (key: 123) -> Bfd

-- encrypt_with_pos: similarly to vigenere but using positions as keys
ex: HELLO -> OIWWC
    Ada -> Aga (A is 0, d is 3rd so key is 030)


(( for further trials and testing, please check this website : https://cryptii.com ))

---------------------------------------------------------------------------------------------------------

further tips: 
______________


-- check out this package : Ada.Characters.Handling
link: https://www.adaic.org/resources/add_content/standards/05rm/html/RM-A-3-2.html

-- this also helps:
link: http://www.cs.uni.edu/~mccormic/AdaEssentials/characters.htm

-- Attributes are very helpful in Ada, like it can help you to get length, position, val, ..etc 
link: https://en.wikibooks.org/wiki/Ada_Programming/Attributes

-- for random numbers generation please use Ada.Numerics.Discrete_Random
link_1: https://en.wikibooks.org/wiki/Ada_Programming/Libraries/Ada.Numerics.Discrete_Random
link_2: https://www.adaic.org/resources/add_content/standards/05rm/html/RM-A-5-2.html 

ex: 

    with Ada.Numerics.Discrete_Random, Ada.Integer_Text_IO, Ada.Text_IO;
    use Ada.Integer_Text_IO, Ada.Text_IO;

    procedure test is
    package Random_int is new Ada.Numerics.Discrete_Random (Integer);
    G : Random_int.Generator;
    begin
    Random_int.Reset(G);

        Put("random Integers between -100 and 100 ");
        new_line;
    for i in 1..10 loop
        Put("random Integer : ");
        Put(Random_int.Random(G) rem 100);
        new_line;
    end loop;
    
    end test;
