with Path;
with Ada.Text_Io;
with Adagraph;
with Robot;
with Ada.Numerics.Elementary_Functions;

use Ada.Numerics.Elementary_Functions;
use Path,Adagraph,Ada.Text_IO;
procedure Test_Path is
   Pa,Pb, Pc: Path.Object;
   P1,P2,P3,P4,P5,P6,P7,P8,P9,P10: Path.Point;
   X_Max, Y_Max: Integer; X_Char, Y_Char: Integer;
   R1, R2, R3: Robot.Object;
   T: Path.Points := Path.Points'(0..100 => Path.Point'(0.0,0.0));

   procedure Draw_Hexagone (X,Y,H,D: in Integer; T: in out Path.Points) is

      -- valeurs remarquables
      L: Integer := Integer(Cos(30.0,360.0)*Float(D));
      C: Integer := Integer(Float(H)-2.0*Float(D)-Float(L));

      --points triangles diagonaux
      F1: Path.Point := Path.Point'(Float(X)+Float(D)/2.0,Float(Y)-Float(L));
      F2: Path.Point := Path.Point'(Float(X)-Float(D)/2.0,Float(Y)-Float(L));
      F3: Path.Point := Path.Point'(Float(X)-Float(D)/2.0,Float(Y)+Float(L));
      F4: Path.Point := Path.Point'(Float(X)+Float(D)/2.0,Float(Y)+Float(L));

      G1: Path.Point := Path.Point'(Float(X)+Float(D)/2.0,Float(Y)-Float(L)-Float(C));
      G2: Path.Point := Path.Point'(Float(X)-Float(D)/2.0,Float(Y)-Float(L)-Float(C));
      G3: Path.Point := Path.Point'(Float(X)-Float(D)/2.0,Float(Y)+Float(L)+Float(C));
      G4: Path.Point := Path.Point'(Float(X)+Float(D)/2.0,Float(Y)+Float(L)+Float(C));

      H1: Path.Point := Path.Point'(Float(X)+(Float(D)/2.0)+(Float(C)*Cos(30.0,360.0)),Float(Y)-Float(L)-(Float(C)/2.0));
      H2: Path.Point := Path.Point'(Float(X)-(Float(D)/2.0)-(Float(C)*Cos(30.0,360.0)),Float(Y)-Float(L)-(Float(C)/2.0));
      H3: Path.Point := Path.Point'(Float(X)-(Float(D)/2.0)-(Float(C)*Cos(30.0,360.0)),Float(Y)+Float(L)+(Float(C)/2.0));
      H4: Path.Point := Path.Point'(Float(X)+(Float(D)/2.0)+(Float(C)*Cos(30.0,360.0)),Float(Y)+Float(L)+(Float(C)/2.0));

      -- points triangles horizontaux
      F5: Path.Point := Path.Point'(Float(X)+Float(D),Float(Y));
      F6: Path.Point := Path.Point'(Float(X)-Float(D),Float(Y));

      G5: Path.Point := Path.Point'(Float(X)+Float(D)+(Float(C)*Cos(30.0,360.0)),Float(Y)-(Float(C)/2.0));
      G6: Path.Point := Path.Point'(Float(X)-Float(D)-(Float(C)*Cos(30.0,360.0)),Float(Y)-(Float(C)/2.0));

      H5: Path.Point := Path.Point'(Float(X)+Float(D)+(Float(C)*Cos(30.0,360.0)),Float(Y)+(Float(C)/2.0));
      H6: Path.Point := Path.Point'(Float(X)-Float(D)-(Float(C)*Cos(30.0,360.0)),Float(Y)+(Float(C)/2.0));

      -- traits exterieurs

      D1: Path.Point := Path.Point'(H1.X+Float(D)*Cos(60.0,360.0),H1.Y-Float(D)*Sin(60.0,360.0));
      E1: Path.Point := Path.Point'(G1.X+Float(D)*Cos(60.0,360.0),G1.Y-Float(D)*Sin(60.0,360.0));

      D2: Path.Point := Path.Point'(H2.X-Float(D)*Cos(60.0,360.0),H2.Y-Float(D)*Sin(60.0,360.0));
      E2: Path.Point := Path.Point'(G2.X-Float(D)*Cos(60.0,360.0),G2.Y-Float(D)*Sin(60.0,360.0));

      D3: Path.Point := Path.Point'(H3.X-Float(D)*Cos(60.0,360.0),H3.Y+Float(D)*Sin(60.0,360.0));
      E3: Path.Point := Path.Point'(G3.X-Float(D)*Cos(60.0,360.0),G3.Y+Float(D)*Sin(60.0,360.0));

      D4: Path.Point := Path.Point'(H4.X+Float(D)*Cos(60.0,360.0),H4.Y+Float(D)*Sin(60.0,360.0));
      E4: Path.Point := Path.Point'(G4.X+Float(D)*Cos(60.0,360.0),G4.Y+Float(D)*Sin(60.0,360.0));

      D5: Path.Point := Path.Point'(H5.X+Float(D),H5.Y);
      E5: Path.Point := Path.Point'(G5.X+Float(D),G5.Y);

      D6: Path.Point := Path.Point'(H6.X-Float(D),H6.Y);
      E6: Path.Point := Path.Point'(G6.X-Float(D),G6.Y);

      -- points R, O et I


      R2: Path.Point := Path.Point'(Float(X),Float(Y-L-C)- Float(D/2)*Tan(30.0,360.0) - Float(D)/(2.0*Cos(30.0,360.0)));
      R5: Path.Point := Path.Point'(Float(X),Float(Y+L+C)+ Float(D/2)*Tan(30.0,360.0) + Float(D)/(2.0*Cos(30.0,360.0)));
      R1: Path.Point := Path.Point'(Float(X)+ (Float(Y)-R2.Y)*Cos(30.0,360.0),Float(Y) - (Float(Y)-R2.Y)*Sin(30.0,360.0));
      R3: Path.Point := Path.Point'(Float(X)- (Float(Y)-R2.Y)*Cos(30.0,360.0),Float(Y) - (Float(Y)-R2.Y)*Sin(30.0,360.0));
      R4: Path.Point := Path.Point'(Float(X)- (Float(Y)-R2.Y)*Cos(30.0,360.0),Float(Y) + (Float(Y)-R2.Y)*Sin(30.0,360.0));
      R6: Path.Point := Path.Point'(Float(X)+ (Float(Y)-R2.Y)*Cos(30.0,360.0),Float(Y) + (Float(Y)-R2.Y)*Sin(30.0,360.0));

      O1: Path.Point := Path.Point'(R1.X + Float(D), R1.Y);
      O2: Path.Point := Path.Point'(R2.X + Float(D)*Cos(45.0,360.0),R2.Y - Float(D)*Cos(45.0,360.0));
      O3: Path.Point := Path.Point'(R3.X,R3.Y - Float(D));
      O4: Path.Point := Path.Point'(R4.X - Float(D),R4.Y);
      O5: Path.Point := Path.Point'(R5.X - Float(D)*Cos(45.0,360.0), R5.Y + Float(D)*Cos(45.0,360.0));
      O6: Path.Point := Path.Point'(R6.X , R6.Y + Float(D));

      I1: Path.Point := Path.Point'(R1.X, R1.Y - Float(D));
      I2: Path.Point := Path.Point'(R2.X - Float(D)*Cos(45.0,360.0), R2.Y - Float(D)*Cos(45.0,360.0));
      I3: Path.Point := Path.Point'(R3.X - Float(D), R3.Y);
      I4: Path.Point := Path.Point'(R4.X, R4.Y + Float(D));
      I5: Path.Point := Path.Point'(R5.X + Float(D)*Cos(45.0,360.0), R5.Y + Float(D)*Cos(45.0,360.0));
      I6: Path.Point := Path.Point'(R6.X + Float(D), R6.Y);

   begin
      Adagraph.Draw_Line(Integer(F1.X), Integer(F1.Y), Integer(G1.X), Integer(G1.Y));
      Adagraph.Draw_Line(Integer(F1.X), Integer(F1.Y), Integer(H1.X), Integer(H1.Y));
      Adagraph.Draw_Line(Integer(G1.X), Integer(G1.Y), Integer(H1.X), Integer(H1.Y));

      Adagraph.Draw_Line(Integer(F2.X), Integer(F2.Y), Integer(G2.X), Integer(G2.Y));
      Adagraph.Draw_Line(Integer(F2.X), Integer(F2.Y), Integer(H2.X), Integer(H2.Y));
      Adagraph.Draw_Line(Integer(G2.X), Integer(G2.Y), Integer(H2.X), Integer(H2.Y));

      Adagraph.Draw_Line(Integer(F3.X), Integer(F3.Y), Integer(G3.X), Integer(G3.Y));
      Adagraph.Draw_Line(Integer(F3.X), Integer(F3.Y), Integer(H3.X), Integer(H3.Y));
      Adagraph.Draw_Line(Integer(G3.X), Integer(G3.Y), Integer(H3.X), Integer(H3.Y));

      Adagraph.Draw_Line(Integer(F4.X), Integer(F4.Y), Integer(G4.X), Integer(G4.Y));
      Adagraph.Draw_Line(Integer(F4.X), Integer(F4.Y), Integer(H4.X), Integer(H4.Y));
      Adagraph.Draw_Line(Integer(G4.X), Integer(G4.Y), Integer(H4.X), Integer(H4.Y));

      Adagraph.Draw_Line(Integer(F5.X), Integer(F5.Y), Integer(G5.X), Integer(G5.Y));
      Adagraph.Draw_Line(Integer(F5.X), Integer(F5.Y), Integer(H5.X), Integer(H5.Y));
      Adagraph.Draw_Line(Integer(G5.X), Integer(G5.Y), Integer(H5.X), Integer(H5.Y));

      Adagraph.Draw_Line(Integer(F6.X), Integer(F6.Y), Integer(G6.X), Integer(G6.Y));
      Adagraph.Draw_Line(Integer(F6.X), Integer(F6.Y), Integer(H6.X), Integer(H6.Y));
      Adagraph.Draw_Line(Integer(G6.X), Integer(G6.Y), Integer(H6.X), Integer(H6.Y));

      Adagraph.Draw_Line(Integer(D1.X), Integer(D1.Y), Integer(E1.X), Integer(E1.Y));
      Adagraph.Draw_Line(Integer(D2.X), Integer(D2.Y), Integer(E2.X), Integer(E2.Y));
      Adagraph.Draw_Line(Integer(D3.X), Integer(D3.Y), Integer(E3.X), Integer(E3.Y));
      Adagraph.Draw_Line(Integer(D4.X), Integer(D4.Y), Integer(E4.X), Integer(E4.Y));
      Adagraph.Draw_Line(Integer(D5.X), Integer(D5.Y), Integer(E5.X), Integer(E5.Y));
      Adagraph.Draw_Line(Integer(D6.X), Integer(D6.Y), Integer(E6.X), Integer(E6.Y));

      Adagraph.Draw_Circle(Integer(R2.X), Integer(R2.Y),5);
      Adagraph.Draw_Circle(Integer(R5.X), Integer(R5.Y),5);
      Adagraph.Draw_Circle(Integer(R1.X), Integer(R1.Y),5);
      Adagraph.Draw_Circle(Integer(R2.X), Integer(R2.Y),5);
      Adagraph.Draw_Circle(Integer(R3.X), Integer(R3.Y),5);
      Adagraph.Draw_Circle(Integer(R4.X), Integer(R4.Y),5);
      Adagraph.Draw_Circle(Integer(R6.X), Integer(R6.Y),5);

      Adagraph.Draw_Circle(Integer(O2.X), Integer(O2.Y),5);
      Adagraph.Draw_Circle(Integer(O5.X), Integer(O5.Y),5);
      Adagraph.Draw_Circle(Integer(O1.X), Integer(O1.Y),5);
      Adagraph.Draw_Circle(Integer(O2.X), Integer(O2.Y),5);
      Adagraph.Draw_Circle(Integer(O3.X), Integer(O3.Y),5);
      Adagraph.Draw_Circle(Integer(O4.X), Integer(O4.Y),5);
      Adagraph.Draw_Circle(Integer(O6.X), Integer(O6.Y),5);

      Adagraph.Draw_Circle(Integer(I2.X), Integer(I2.Y),5);
      Adagraph.Draw_Circle(Integer(I5.X), Integer(I5.Y),5);
      Adagraph.Draw_Circle(Integer(I1.X), Integer(I1.Y),5);
      Adagraph.Draw_Circle(Integer(I2.X), Integer(I2.Y),5);
      Adagraph.Draw_Circle(Integer(I3.X), Integer(I3.Y),5);
      Adagraph.Draw_Circle(Integer(I4.X), Integer(I4.Y),5);
      Adagraph.Draw_Circle(Integer(I6.X), Integer(I6.Y),5);

      T(0) := R1;
      T(1) := R2;
      T(2) := R3;
      T(3) := R4;
      T(4) := R5;
      T(5) := R6;

      T(6) := O1;
      T(7) := O2;
      T(8) := O3;
      T(9) := O4;
      T(10) := O5;
      T(11) := O6;

      T(12) := I1;
      T(13) := I2;
      T(14) := I3;
      T(15) := I4;
      T(16) := I5;
      T(17) := I6;
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

   Draw_Hexagone(400,300,300,50, T);

   Path.Add(Pc,T(14));
   Path.Add(Pc,T(2));
   Path.Add(Pc,Path.Point'(400.0, 300.0));
   Path.Add(Pc,T(5));
   Path.Add(Pc,T(11));

--     Path.Draw(Path => Pa, Color => White);
--Path.Draw(Path => Pb, Color => Blue);
Path.Draw(Path => Pc, Color => Blue);

   delay 1.0;

   --R2.Follow(Pb);
   --     R1.Follow(Pa);
   --     R1.Shutdown;
--     R2.Shutdown;
   R3.Follow(Pc);
   R3.Shutdown;

   delay 1.0;

   Adagraph.Display_Text (290, 515, "Goodbye Ada friends!" , Hue => Green);

   while not Adagraph.Key_Hit loop delay 0.1; end loop;

   Adagraph.Set_Immediate_Rendering(False);
   Adagraph.Set_Antialiasing (False);
   Adagraph.Destroy_Graph_Window;
end;
