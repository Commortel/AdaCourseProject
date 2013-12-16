with Ada.Text_IO, Adagraph, Path;
package body Robot.Trajectory.Safe is

   procedure Open (T: in out T_Safe; From: in Site.Input_Places; To: in Site.Output_Places;  S: in Float; Color: in Color_Type; ID: in Robot.Robot_ID) is
      P: Path.Object := Site.Create_Path(From,To);
      RM: Ressources.Request_Map(0..(Path.GetSize(P) - 1));
      I: Integer := 0;
   begin
      T.It := Site.Place_Path.Open(T.It, From, To);
      Ada.Text_IO.Put_Line("Size RM : " & Integer'Image(RM'Last));
      while Site.Place_Path.At_End(P => T.It) loop
         Site.Place_Path.Next(T.It);
         RM(I) := Site.Place_Path.Value(T.It);
         I := I + 1;
      end loop;
      Ressources.Acquire(Pool,RM);
      Trajectory.Open(Trajectory.Object(T), From, To, S, Color, ID);
      Site.Place_Path.Reset(P => T.It);
   end;
   procedure Next(T: in out T_Safe) is
   begin
      Trajectory.Next(Trajectory.Object(T), Duration(0.05));
      Site.Place_Path.Next(P => T.It);
      Ressources.Release(Pool,Site.Place_Path.Value(T.It));
   end;
   procedure Close (T: in out T_Safe) is
   begin
      Site.Place_Path.Next(T.It);
      Ressources.Release(Pool,Site.Place_Path.Value(T.It));
      Site.Safely.Draw_Robot(GetPoint(T.ID),T.Color);
      Ada.Text_IO.Put_Line("Park " & Robot.Robot_ID'Image(T.ID));
      Site.Place_Path.Reset(T.It);
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
end;
