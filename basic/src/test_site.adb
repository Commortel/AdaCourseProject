with Path;
with Ada.Text_Io;
with Adagraph;
with Robot;
with Ada.Numerics.Elementary_Functions;
with Ada.Numerics.Discrete_Random;
with Site;
with Generic_Ressource_Pool;
procedure Test_Site is
   type TRobots is array(0..5) of Robot.Object;
   T: TRobots;
   subtype Place is Integer range 0..5;
   package Random_Die is new Ada.Numerics.Discrete_Random (Place);
   use Random_Die;
   G : Generator;
   PR, PI, PO: Place;
begin
   Reset(G);

   Ada.Text_IO.Put_Line(Site.Place_Names'Image(Site.Way_In(Site.I2)));
   Ada.Text_IO.Put_Line(Site.Place_Names'Image(Site.Next(Site.R6)));
   Ada.Text_IO.Put_Line(Site.Place_Names'Image(Site.Opposite(Site.R6)));
   Ada.Text_IO.Put_Line(Site.Place_Names'Image(Site.Previous(Site.R1)));
   Ada.Text_IO.Put_Line(Site.Place_Names'Image(Site.Way_Out(Site.O5)));

   Ada.Text_IO.Put_Line(Site.Place_Names'Image(Site.Next(Site.Way_In(Site.I1))));

   Site.Safely.InitGUI;
   delay 1.0;
   Site.Safely.Draw_Site;
   delay 1.0;

   loop
      PR := Random(G);
      PI := Random(G);
      PO := Random(G);

      Ada.Text_IO.Put_Line("Robot");
      Ada.Text_IO.Put_Line(Place'Image(PR));
      Ada.Text_IO.Put_Line(Place'Image(PI));
      Ada.Text_IO.Put_Line(Place'Image(PO));

      while PI = PO loop
         PO := Random(G);
      end loop;

      T(PR).Follow(Site.Input_Places'Val(PI), Site.Output_Places'Val(PO + 6));
      --T(PR).Shutdown;
      delay 1.0;
   end loop;

--     delay 10.0;
--     Site.Safely.EndGUI;
end;
