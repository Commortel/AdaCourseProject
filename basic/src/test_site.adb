with Path;
with Ada.Text_Io;
with Adagraph;
with Robot;
with Ada.Numerics.Elementary_Functions;
with Site;

use Ada.Numerics.Elementary_Functions;
use Path,Adagraph,Ada.Text_IO;
procedure Test_Site is
   P : Path.Object;
begin
   Put_Line(Integer'Image(Site.Ring_Places'Pos(Site.Next(Site.R6))));
   Put_Line(Integer'Image(Site.Ring_Places'Pos(Site.Previous(Site.R1))));
   Put_Line(Integer'Image(Site.Ring_Places'Pos(Site.Opposite(Site.R6))));

   P := Site.Create_Path(Site.I2, Site.O4);

   Site.Safely.Draw_Site;
end;
