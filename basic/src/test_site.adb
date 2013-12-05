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
   package Pool is new Generic_Ressource_Pool(Ressource_Id => Site.Place_Names);
   P: Pool.Object(18);
   G : Generator;
   PR, PI, PO: Place;
--     RM : Pool.Request_Map(0..3);
--     RM2 : Pool.Request_Map(0..4);
begin
   Reset(G);

--     Ada.Text_IO.Put_Line(Site.Place_Names'Image(Site.Way_In(Site.I2)));
--     Ada.Text_IO.Put_Line(Site.Place_Names'Image(Site.Next(Site.R6)));
--     Ada.Text_IO.Put_Line(Site.Place_Names'Image(Site.Opposite(Site.R6)));
--     Ada.Text_IO.Put_Line(Site.Place_Names'Image(Site.Previous(Site.R1)));
--     Ada.Text_IO.Put_Line(Site.Place_Names'Image(Site.Way_Out(Site.O5)));
--
--     Ada.Text_IO.Put_Line(Site.Place_Names'Image(Site.Next(Site.Way_In(Site.I1))));

--     RM(0) := Site.I2;
--     RM(1) := Site.R2;
--     RM(2) := Site.R1;
--     RM(3) := Site.O1;
--
--     RM2(0) := Site.I6;
--     RM2(1) := Site.R6;
--     RM2(2) := Site.R5;
--     RM2(3) := Site.R4;
--     RM2(4) := Site.O4;

--     Ada.Text_IO.Put_Line("Before Tri" & Integer'Image(RM2'Last));
--     for I in RM2'Range loop
--        Ada.Text_IO.Put_Line(Site.Place_Names'Image(RM2(I)));
--     end loop;
--
--     Pool.Tri(R => RM2);
--
--     Ada.Text_IO.Put_Line("After Tri");
--     for I in RM2'Range loop
--        Ada.Text_IO.Put_Line(Site.Place_Names'Image(RM2(I)));
--     end loop;

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

      while PI = PO loop
         PO := Random(G);
      end loop;
      Ada.Text_IO.Put_Line(Place'Image(PO));

      T(PR).Go(Site.Input_Places'Val(PI), Site.Output_Places'Val(PO + 12));
      delay 1.0;
   end loop;

--     delay 10.0;
--     Site.Safely.EndGUI;
end;
