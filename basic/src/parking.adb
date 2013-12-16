package body Parking is
   subtype I_Random is Integer range 0..5;
   package Random_Die is new Ada.Numerics.Discrete_Random (I_Random);
   use Random_Die;
   protected body Object is
      entry Take(E: out Robot.Robot_ID) when Count > 0 is
         G: Generator;
         I: I_Random := 0;
      begin
         Reset(G);
         Ada.Text_IO.Put_Line("Take");
         I := Random(G);
         while Content(I) = False loop
            I:= Random(G);
            Ada.Text_IO.Put_Line("Loop ");
         end loop;
         E     := Robot.Robot_ID'Val(I);
--           Content(I) := False;
--           Count := Count - 1;
         Site.Safely.Hide_Robot(GetPoint(E));
         Ada.Text_IO.Put_Line("Hide " & Robot.Robot_ID'Image(E));
      end;
      procedure Park(E: in Robot.Robot_ID) is
      begin
         Content(Robot.Robot_ID'Pos(E)) := True;
         Site.Safely.Draw_Robot(GetPoint(E),GetColor(E));
         Ada.Text_IO.Put_Line("Park " & Robot.Robot_ID'Image(E));
         Count := Count + 1;
      end;

      function GetPoint(R: in Robot.Robot_ID) return Path.Point is
      begin
         case R is
         when Robot.R1 => return Site.GetPointWithPlace(Site.P1);
         when Robot.R2 => return Site.GetPointWithPlace(Site.P2);
         when Robot.R3 => return Site.GetPointWithPlace(Site.P3);
         when Robot.R4 => return Site.GetPointWithPlace(Site.P4);
         when Robot.R5 => return Site.GetPointWithPlace(Site.P5);
         when Robot.R6 => return Site.GetPointWithPlace(Site.P6);
         end case;
      end;
      function GetColor(R: in Robot.Robot_ID) return Color_Type is
      begin
         case R is
         when Robot.R1 => return Cyan;
         when Robot.R2 => return Blue;
         when Robot.R3 => return Yellow;
         when Robot.R4 => return Green;
         when Robot.R5 => return Red;
         when Robot.R6 => return Brown;
         end case;
      end;
   end;
end Parking;
