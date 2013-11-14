with Path;
with Ada.Text_Io;
with Adagraph;
with Robot;
with Ada.Numerics.Elementary_Functions;

use Ada.Numerics.Elementary_Functions;
use Path,Adagraph,Ada.Text_IO;
procedure Test_Path is
   Pa,Pb: Path.Object;
   P1,P2,P3,P4,P5,P6,P7,P8,P9,P10: Path.Point;
   X_Max, Y_Max: Integer; X_Char, Y_Char: Integer;
   R1, R2: Robot.Object;

   procedure Draw_Hexagone (X,Y,H,D: Integer) is
      R: Integer := Integer(Cos(30.0,360.0)*Float(H));
   begin
      Adagraph.Draw_Line(X, Y - H - D, X + R - D, Y - H/2 - D);

      Adagraph.Draw_Line(X - D + 3, Y + D - 3, X - D + 3, Y + H - D - 7);
      Adagraph.Draw_Line(X - D + 3, Y + H - D - 7, X - R + D, Y + H/2);
      Adagraph.Draw_Line(X - R + D, Y + H/2, X - D + 3, Y + D - 3);

      Adagraph.Draw_Line(X + R, Y - H/2 + D, X + R, Y + H/2 - D);

      Adagraph.Draw_Line(X - D, Y, X - R + D, Y + H/2 - D);
      Adagraph.Draw_Line(X - R + D, Y + H/2 - D, X - R + D, Y - H/2 + D);
      Adagraph.Draw_Line(X - R + D, Y - H/2 + D, X - D, Y);

      Adagraph.Draw_Line(X + R - D, Y + H/2 + D, X, Y + H - D);
      Adagraph.Draw_Line(X, Y + H - D, X - R + D, Y + H/2 + D);
      Adagraph.Draw_Line(X - R, Y + H/2 - D, X - R, Y - H/2 + D);
      Adagraph.Draw_Line(X - R + D, Y - H/2 - D, X, Y - H - D);
   end;
begin
   Pa :=  Path.Null_Path;
   Ada.Text_Io.Put_Line ("Start Path Test");
   Ada.Text_Io.Put_Line (Natural'Image(Path.GetSize(Pa)));

   P1.X := 50.0;
   P1.Y := 10.0;
   P2.X := 100.0;
   P2.Y := 20.0;
   P3.X := 20.0;
   P3.Y := 100.0;
   P4.X := 200.0;
   P4.Y := 200.0;
   P5.X := 10.0;
   P5.Y := 599.0;
   Path.Add(Pa,P1);
   Path.Add(Pa,P2);
   Path.Add(Pa,P3);
   Path.Add(Pa,P4);
   Path.Add(Pa,P5);

   P6.X := 450.0;
   P6.Y := 10.0;
   P7.X := 500.0;
   P7.Y := 20.0;
   P8.X := 520.0;
   P8.Y := 100.0;
   P9.X := 600.0;
   P9.Y := 200.0;
   P10.X := 510.0;
   P10.Y := 599.0;
   Path.Add(Pb,P6);
   Path.Add(Pb,P7);
   Path.Add(Pb,P8);
   Path.Add(Pb,P9);
   Path.Add(Pb,P10);

    for P of Path.GetValues(Pa) loop
      Put_Line(Float'Image(P.X));
   end loop;

   Put_Line(Float'Image(Path.Segment_Length(Pa,1)));

   Adagraph.Create_Sized_Graph_Window(800, 600, X_max, Y_Max, X_Char, Y_Char);
   Adagraph.Set_Window_Title("Hello from Ada");
   Adagraph.Clear_Window;

   Draw_Hexagone(400,300,200,15);
   Adagraph.Draw_Circle(400,300,5);

   Path.Draw(Path => Pa, Color => White);
   Path.Draw(Path => Pb, Color => Blue);

   delay 1.0;

   R2.Follow(Pb);
   R1.Follow(Pa);
   R1.Shutdown;
   R2.Shutdown;

   delay 1.0;

   Adagraph.Display_Text (290, 515, "Goodbye Ada friends!" , Hue => Green);

   while not Adagraph.Key_Hit loop delay 0.1; end loop;

   Adagraph.Set_Immediate_Rendering(False);
   Adagraph.Set_Antialiasing (False);
   Adagraph.Destroy_Graph_Window;
end;
