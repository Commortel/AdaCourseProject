with Path;
with Ada.Text_Io;
with Adagraph;
with Ada.Numerics.Elementary_Functions;
with Site;

use Ada.Numerics.Elementary_Functions, Ada.Text_IO;
package body Site is
   X_Max, Y_Max: Integer; X_Char, Y_Char: Integer;
   X: Integer := 400;
   Y: Integer := 300;
   H: Integer := 300;
   D: Integer := 50;
   R_Radius: Integer := 10;

   function Way_In(To: in Input_Places) return Ring_Places is
   begin
      return Place_Names'Val(Place_Names'Pos(To) + 6);
   end;
   function Next(To: in Ring_Places) return Ring_Places is
   begin
      if Place_Names'Pos(To) = Place_Names'Pos(Site.R6) then
         return Site.R1;
      else
         return Place_Names'Val(Integer(Place_Names'Pos(To)) + 1);
      end if;
   end;
   function Previous(To: in Ring_Places) return Ring_Places is
   begin
      if Place_Names'Pos(To) = Place_Names'Pos(Site.R1) then
         return Site.R6;
      else
         return Place_Names'Val(Integer(Place_Names'Pos(To)) - 1);
      end if;
   end;
   function Way_Out(To: in Output_Places) return Ring_Places is
   begin
      return Place_Names'Val(Place_Names'Pos(To) - 6);
   end;
   function Opposite(To: in Ring_Places) return Ring_Places is
   begin
      if Ring_Places'Pos(To) + 3 > 12 then
         return Ring_Places'Val(Integer(Ring_Places'Pos(To) + 3 - 12 + 6));
      end if;
      return Ring_Places'Val(Integer(Ring_Places'Pos(To) + 3));
   end;
   function Create_Path(From: in Input_Places; To: in Output_Places) return Path.Object is
      P: Path.Object;
      type Test is mod 6;
      T : Test := 0;
      JI : Integer := Input_Places'Pos(From);
      JO : Integer := Output_Places'Pos(To) - 12;
   begin
      Path.Add(P, Site.GetPointWithPlace(From));
      Path.Add(P, Site.GetPointWithPlace(Site.Way_In(From)));

      T := Test(JI) - Test(JO);

      case T is
         when 2 =>  Path.Add(P, Site.GetPointWithPlace(Site.Previous(Site.Way_In(From))));
         when 3 =>  Path.Add(P, Site.GetPointWithPlace(Site.C));
         when 4 =>  Path.Add(P, Site.GetPointWithPlace(Site.Next(Site.Way_In(From))));
         when others  => null;
      end case;

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

      P1: Path.Point := Path.Point'(Float(X + H + 50), Float(Y - 75));
      P2: Path.Point := Path.Point'(Float(X + H + 50), Float(Y - 45));
      P3: Path.Point := Path.Point'(Float(X + H + 50), Float(Y - 15));
      P4: Path.Point := Path.Point'(Float(X + H + 50), Float(Y + 15));
      P5: Path.Point := Path.Point'(Float(X + H + 50), Float(Y + 45));
      P6: Path.Point := Path.Point'(Float(X + H + 50), Float(Y + 75));
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
      when Site.P1 => P := P1;
      when Site.P2 => P := P2;
      when Site.P3 => P := P3;
      when Site.P4 => P := P4;
      when Site.P5 => P := P5;
      when Site.P6 => P := P6;
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

         P1: Path.Point := Path.Point'(Float(X + H + 50), Float(Y - 75));
         P2: Path.Point := Path.Point'(Float(X + H + 50), Float(Y - 45));
         P3: Path.Point := Path.Point'(Float(X + H + 50), Float(Y - 15));
         P4: Path.Point := Path.Point'(Float(X + H + 50), Float(Y + 15));
         P5: Path.Point := Path.Point'(Float(X + H + 50), Float(Y + 45));
         P6: Path.Point := Path.Point'(Float(X + H + 50), Float(Y + 75));

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

         Adagraph.Draw_Circle(Integer(R2.X), Integer(R2.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(R5.X), Integer(R5.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(R1.X), Integer(R1.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(R2.X), Integer(R2.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(R3.X), Integer(R3.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(R4.X), Integer(R4.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(R6.X), Integer(R6.Y),R_Radius);

         Adagraph.Draw_Circle(Integer(O2.X), Integer(O2.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(O5.X), Integer(O5.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(O1.X), Integer(O1.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(O2.X), Integer(O2.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(O3.X), Integer(O3.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(O4.X), Integer(O4.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(O6.X), Integer(O6.Y),R_Radius);

         Adagraph.Draw_Circle(Integer(I2.X), Integer(I2.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(I5.X), Integer(I5.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(I1.X), Integer(I1.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(I2.X), Integer(I2.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(I3.X), Integer(I3.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(I4.X), Integer(I4.Y),R_Radius);
         Adagraph.Draw_Circle(Integer(I6.X), Integer(I6.Y),R_Radius);

         Adagraph.Draw_Circle(Integer(P1.X), Integer(P1.Y), R_Radius, Cyan, Fill);
         Adagraph.Draw_Circle(Integer(P2.X), Integer(P2.Y), R_Radius, Blue, Fill);
         Adagraph.Draw_Circle(Integer(P3.X), Integer(P3.Y), R_Radius, Yellow, Fill);
         Adagraph.Draw_Circle(Integer(P4.X), Integer(P4.Y), R_Radius, Green, Fill);
         Adagraph.Draw_Circle(Integer(P5.X), Integer(P5.Y), R_Radius, Red, Fill);
         Adagraph.Draw_Circle(Integer(P6.X), Integer(P6.Y), R_Radius, Brown, Fill);
      end;
      procedure Draw_Path(P: in Path.Object; Color: in Color_Type := Light_Green) is
      begin
         Path.Draw(P, Color);
      end;
      procedure Draw_Robot(P: in Path.Point; Color: in Color_Type := Light_Green) is
      begin
         Adagraph.Draw_Circle(Integer(P.X), Integer(P.Y), R_Radius, Color, Fill);
      end;
      procedure Hide_Robot(P: in Path.Point) is
      begin
         Adagraph.Draw_Circle(Integer(P.X), Integer(P.Y), R_Radius, Black, Fill);
      end;
   end;
end;
