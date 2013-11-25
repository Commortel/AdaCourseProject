with Path;
with Ada.Text_Io;
with Adagraph;
with Robot;
with Ada.Numerics.Elementary_Functions;
with Site;

use Ada.Numerics.Elementary_Functions;
use Path,Adagraph,Ada.Text_IO;
procedure Test_Site is
   P1, P2 : Path.Object;
   R1, R2 : Robot.Object;
begin
--     Put_Line(Integer'Image(Site.Ring_Places'Pos(Site.Next(Site.R6))));
--     Put_Line(Integer'Image(Site.Ring_Places'Pos(Site.Previous(Site.R1))));
--     Put_Line(Integer'Image(Site.Ring_Places'Pos(Site.Opposite(Site.R6))));

   P1 := Site.Create_Path(Site.I1, Site.O6);
   P2 := Site.Create_Path(Site.I6, Site.O3);

   Site.Safely.InitGUI;
   delay 1.0;
   Site.Safely.Draw_Site;
   delay 1.0;
   R1.Follow(P => P1);
   R2.Follow(P => P2);
   R1.Shutdown;
   R2.Shutdown;

   delay 10.0;
   Site.Safely.EndGUI;
end;
