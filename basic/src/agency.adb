with Ada.Numerics.Discrete_Random;
package body Agency is
   Park: Parking.Object(Size => 5);
   subtype Place is Integer range 1..6;
   package Random_Die is new Ada.Numerics.Discrete_Random (Place);
   use Random_Die;

   procedure Handle_Transfer (From : in Site.Input_Places; To: in Site.Output_Places) is
      G : Generator;
   begin
      Reset(G);
      Agency.Singleton.Robots(Random(G)).Go(From,To);
   end;
   procedure Shutdown is
   begin
      null;
   end;
end Agency;
