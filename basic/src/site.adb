with Path;
with Ada.Text_Io;
with Adagraph;
with Robot;
with Ada.Numerics.Elementary_Functions;
with Site;

use Ada.Numerics.Elementary_Functions, Ada.Text_IO;
package body Site is
   X_Max, Y_Max: Integer; X_Char, Y_Char: Integer;
   X: Integer := 400;
   Y: Integer := 300;
   H: Integer := 300;
   D: Integer := 50;

   function Way_In(To: in Input_Places) return Ring_Places is
   begin
      return Place_Names'Val(Place_Names'Pos(To) + 12);
   end;
   function Next(To: in Ring_Places) return Ring_Places is
      N: T_Place := Place_Names'Pos(To) + 1;
   begin
      return Place_Names'Val(Integer(N) + 12);
   end;
   function Previous(To: in Ring_Places) return Ring_Places is
      N: T_Place := Place_Names'Pos(To) - 1;
   begin
      return Place_Names'Val(Integer(N) + 12);
   end;
   function Way_Out(To: in Output_Places) return Ring_Places is
   begin
      return Place_Names'Val(Place_Names'Pos(To) + 6);
   end;
   function Opposite(To: in Ring_Places) return Ring_Places is
      N: T_Place := Ring_Places'Pos(To) + 3;
   begin
      return Ring_Places'Val(Integer(N));
   end;
   function Create_Path(From: in Input_Places; To: in Output_Places) return Path.Object is
      P: Path.Object;
      N: T_Place := 0;
   begin
      Path.Add(P, Site.GetPointWithPlace(From));
      Path.Add(P, Site.GetPointWithPlace(Site.Way_In(From)));

--        if Input_Places'Pos(From) > Output_Places'Pos(To) then
--           N := Input_Places'Pos(From) - Output_Places'Pos(To);
--           for i in 1..Integer(N) loop
--              Put_Line(Ring_Places'Image(Ring_Places'Val(Input_Places'Pos(From) - i)));
--              Path.Add(Path => P,P => TRi(Input_Places'Pos(From) - i));
--           end loop;
--        else
--           N := Output_Places'Pos(To) - Input_Places'Pos(From);
--           for i in 1..Integer(N) loop
--              Put_Line(Ring_Places'Image(Ring_Places'Val(Input_Places'Pos(From) + i)));
--              Path.Add(Path => P,P => TRi(Input_Places'Pos(From) + i));
--           end loop;
--        end if;

      Path.Add(P, Site.GetPointWithPlace(Site.Way_Out(To)));
      Path.Add(P, Site.GetPointWithPlace(To));

      return P;
   end;

   function GetPointWithPlace(Place: in Place_Names) return Path.Point is
      P: Path.Point;
      L: Integer := Integer(Cos(30.0,360.0)*Float(D));
      C: Integer := Integer(Float(H)-2.0*Float(D)-Float(L));
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
      case Place is
      when Site.I1 => P := I1;
      when Site.I2 => P := I2;
      when Site.I3 => P := I3;
      when Site.I4 => P := I4;
      when Site.I5 => P := I5;
      when Site.I6 => P := I6;
      when Site.O1 => P := O1;
      when Site.O2 => P := O2;
      when Site.O3 => P := O3;
      when Site.O4 => P := O4;
      when Site.O5 => P := O5;
      when Site.O6 => P := O6;
      when Site.R1 => P := R1;
      when Site.R2 => P := R2;
      when Site.R3 => P := R3;
      when Site.R4 => P := R4;
      when Site.R5 => P := R5;
      when Site.R6 => P := R6;
      when Site.C => P := Path.Point'(Float(X),Float(Y));
      end case;
   return P;
   end;

   protected body Safely is
      procedure InitGUI is
      begin
         Adagraph.Create_Sized_Graph_Window(800, 600, X_max, Y_Max, X_Char, Y_Char);
         Adagraph.Set_Window_Title("Robot Project");
         Adagraph.Clear_Window;
      end;
      procedure EndGUI is
      begin
         Adagraph.Set_Immediate_Rendering(False);
         Adagraph.Set_Antialiasing (False);
         Adagraph.Destroy_Graph_Window;
      end;
      procedure Draw_Site is
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

--           TRi(0) := R1;
--           TRi(1) := R2;
--           TRi(2) := R3;
--           TRi(3) := R4;
--           TRi(4) := R5;
--           TRi(5) := R6;
--
--           TOi(0) := O1;
--           TOi(1) := O2;
--           TOi(2) := O3;
--           TOi(3) := O4;
--           TOi(4) := O5;
--           TOi(5) := O6;
--
--           TIi(0) := I1;
--           TIi(1) := I2;
--           TIi(2) := I3;
--           TIi(3) := I4;
--           TIi(4) := I5;
--           TIi(5) := I6;
      end;
      procedure Draw_Path(P: in Path.Object; Color: in Color_Type := Light_Green) is
      begin
         Path.Draw(P, Color);
      end;
      procedure Draw_Robot(P: in Path.Point; Color: in Color_Type := Light_Green) is
      begin
         Adagraph.Draw_Circle(Integer(P.X), Integer(P.Y), 10, Color, Fill);
      end;
      procedure Hide_Robot(R: in Robot.Object) is
      begin
         null;--R.Shutdown;
      end;
   end;
end;
