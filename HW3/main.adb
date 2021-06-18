with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Ada.Numerics.Float_Random;

procedure Shops is
   G:Ada.Numerics.Float_Random.Generator;
   type String_Access is access String;
   package Random_Position_Generator is new Ada.Numerics.Discrete_Random(Positive);
   use Random_Position_Generator;
   GG: Generator;

   protected Printer is
      procedure Print( s: in STRING := "" );
   end Printer;

   protected body Printer is
      procedure Print( s: in STRING := "" ) is
      begin
         Put_Line(s);
      end Print;
   end Printer;

   task type Shop is
      entry go_in;
      entry close_shop;

   end Shop;

   task body Shop is
      open_now : Boolean := false;
      accept_customer : Boolean;
      CustomerCount : Integer :=0;


   begin
      Ada.Numerics.Float_Random.Reset(G);
      delay Duration(Ada.Numerics.Float_Random.Random(G))/10;
      open_now := true;
      accept_customer:= false;
      while open_now loop
         delay 0.2;
         select
            accept go_in do
               if CustomerCount < 5 then
                  CustomerCount := CustomerCount +1;
               end if;
            end go_in;
         or
            accept close_shop do
               open_now := false;
            end close_shop;
         end select;
         --end if;
      end loop;
      Printer.Print("In shop Number of entered customers:" & Integer'Image(CustomerCount-1));
   end Shop;


   type Shop_access is access Shop;
   ShopArray:array(1..3) of Shop_access;

   task type Customer (name : String_Access);

   task body Customer is
      FoundAPlace: Boolean := false;
      ChosenShop : Integer;
      cnt: Boolean;
      CustomerName: String_Access := name;
   begin
      reset(GG);
      ChosenShop := (random(GG) rem 3) + 1;
      Reset(GG);
      delay 0.5;
      cnt := false;

      if (not FoundAPlace) then
         select
            ShopArray(ChosenShop).go_in;
            cnt :=true;
            Printer.Print(name.all & " goes in to shop number " & ChosenShop'Image);
            FoundAPlace := True;

         or
            delay 2.0;
            Printer.Print(name.all & " will try once more");
            select
               ShopArray(ChosenShop).go_in;
               FoundAPlace := true;
            or
               delay 0.0;
               FoundAPlace:=False;
            end select;

         end select;
      end if;

      if not FoundAPlace then
         Printer.Print(name.all & " couldn't get into a shop");
      end if;

   end Customer;

   type Customer_access is access Customer;
   CustomerArray:array(1..20) of Customer_access;



begin

   for i in 1..20 loop
      CustomerArray(i) := new Customer(new String'("Customer"&Integer'Image(i)));
   end loop;

   for i in 1..3 loop
      ShopArray(i) := new Shop;
      delay 0.2;
      ShopArray(i).go_in;
   end loop;

   delay 12.0;
   for i in 1..3 loop
      ShopArray(i).close_shop;
   end loop;


end Shops;
