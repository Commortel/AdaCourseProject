with Path;
with Ada.Text_Io;
with Adagraph;
use Path,Adagraph;
procedure Test_Path is
   Pa: Path.Object;
   P1,P2,P3,P4,P5: Path.Point;
   X_Max, Y_Max: Integer; X_Char, Y_Char: Integer;
   K : Float;
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
   Path.Add(Pa,P1);
   Path.Add(Pa,P2);
   Path.Add(Pa,P3);
    for P of Path.GetValues(Pa) loop
	Ada.Text_IO.Put_Line(Float'Image(P.X));
   end loop;

   Adagraph.Create_Sized_Graph_Window(800, 600, X_max, Y_Max, X_Char, Y_Char);
   Adagraph.Set_Window_Title("Hello from Ada");
   Adagraph.Clear_Window;


   Path.Draw(Path => Pa, Color => White);

   delay 1.0;
   K := 0.0;
   Ada.Text_IO.Put_Line(Integer'Image(Path.Segment_Count(Pa)));
   for i in 1..Path.Segment_Count(Pa) loop
      for j in 1..10 loop
         Adagraph.Draw_Circle(
                              Integer(Path.X(Pa,i,K)),
                              Integer(Path.Y(Pa,i,K)),
                              10, White, Fill);
         delay 0.1;
         Adagraph.Draw_Circle(
                              Integer(Path.X(Pa,i,K)),
                              Integer(Path.Y(Pa,i,K)),
                              10, Black, Fill);
         K := K + 0.1;
      end loop;
      K := 0.0;
    end loop;

   delay 1.0;

   Adagraph.Display_Text (290, 515, "Goodbye Ada friends!" , Hue => Green);

   while not Adagraph.Key_Hit loop delay 0.1; end loop;

   Adagraph.Set_Immediate_Rendering(False);
   Adagraph.Set_Antialiasing (False);
   Adagraph.Destroy_Graph_Window;
end;
