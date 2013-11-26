with Path;
with Ada.Text_Io;
with Adagraph;
with Robot;
with Ada.Numerics.Elementary_Functions;
with Site;
procedure Test_Site is
   R1, R2, R3 : Robot.Object;
begin
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
   R1.Follow(Site.I2, Site.O4);
   R2.Follow(Site.I6, Site.O4);
   R3.Follow(Site.I2, Site.O5);
   R1.Shutdown;
   R2.Shutdown;
   R3.Shutdown;

   delay 10.0;
   Site.Safely.EndGUI;
end;
