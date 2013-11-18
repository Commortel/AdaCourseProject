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
   H: Integer := 200;
   D: Integer := 20;
   T: Path.Points := Path.Points'(0 => Path.Point'(0.0,0.0));


   function Way_In(To: in Input_Places) return Ring_Places is
   begin
      return Ring_Places'Val(Input_Places'Pos(To));
   end;
   function Next(To: in Ring_Places) return Ring_Places is
      N: T_Place := Ring_Places'Pos(To) + 1;
   begin
      return Ring_Places'Val(Integer(N));
   end;
   function Previous(To: in Ring_Places) return Ring_Places is
      N: T_Place := Ring_Places'Pos(To) - 1;
   begin
      return Ring_Places'Val(Integer(N));
   end;
   function Way_Out(To: in Output_Places) return Ring_Places is
   begin
      return Ring_Places'Val(Output_Places'Pos(To));
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
      case From is
         when Site.I1 => Put_Line("I1 && R1");
         when Site.I2 => Put_Line("I2 && R2");
         when Site.I3 => Put_Line("I3 && R3");
         when Site.I4 => Put_Line("I4 && R4");
         when Site.I5 => Put_Line("I5 && R5");
         when Site.I6 => Put_Line("I6 && R6");
      end case;
      case To is
         when Site.O1 => Put_Line("O1 && R1");
         when Site.O2 => Put_Line("O2 && R2");
         when Site.O3 => Put_Line("O3 && R3");
         when Site.O4 => Put_Line("O4 && R4");
         when Site.O5 => Put_Line("O5 && R5");
         when Site.O6 => Put_Line("O6 && R6");
      end case;

      if Input_Places'Pos(From) > Output_Places'Pos(To) then
         N := Input_Places'Pos(From) - Output_Places'Pos(To);
         for i in 1..Integer(N) loop
            Put_Line(Ring_Places'Image(Ring_Places'Val(Input_Places'Pos(From) - i)));
         end loop;
      else
         N := Output_Places'Pos(To) - Input_Places'Pos(From);
         for i in 1..Integer(N) loop
            Put_Line(Ring_Places'Image(Ring_Places'Val(Input_Places'Pos(From) + i)));
         end loop;
      end if;

      return P;
   end;

   protected body Safely is
      procedure Draw_Site is
      begin
         Adagraph.Create_Sized_Graph_Window(800, 600, X_max, Y_Max, X_Char, Y_Char);
         Adagraph.Set_Window_Title("Robot Project");
         Adagraph.Clear_Window;

         while not Adagraph.Key_Hit loop delay 0.1; end loop;

         Adagraph.Set_Immediate_Rendering(False);
         Adagraph.Set_Antialiasing (False);
         Adagraph.Destroy_Graph_Window;
      end;
      procedure Draw_Path(P: in Path.Object) is
      begin
         Path.Draw(P);
      end;
      procedure Draw_Robot(R: in Robot.Object) is
      begin
         null;
      end;
      procedure Hide_Robot(R: in Robot.Object) is
      begin
         null;--R.Shutdown;
      end;
   end;

end;
