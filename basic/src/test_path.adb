with Path;
with Ada.Text_Io;
with Adagraph;
with Robot;
use Path,Adagraph;
procedure Test_Path is
   Pa: Path.Object;
   P1,P2,P3,P4,P5: Path.Point;
   X_Max, Y_Max: Integer; X_Char, Y_Char: Integer;
   R: Robot.Object;
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

    for P of Path.GetValues(Pa) loop
	Ada.Text_IO.Put_Line(Float'Image(P.X));
   end loop;

   Adagraph.Create_Sized_Graph_Window(800, 600, X_max, Y_Max, X_Char, Y_Char);
   Adagraph.Set_Window_Title("Hello from Ada");
   Adagraph.Clear_Window;

   Path.Draw(Path => Pa, Color => White);

   delay 1.0;

   R.Follow(Pa);
   R.Shutdown;

   delay 1.0;

   Adagraph.Display_Text (290, 515, "Goodbye Ada friends!" , Hue => Green);

   while not Adagraph.Key_Hit loop delay 0.1; end loop;

   Adagraph.Set_Immediate_Rendering(False);
   Adagraph.Set_Antialiasing (False);
   Adagraph.Destroy_Graph_Window;
end;
