with Robot.Trajectory.Safe, Site, Mail_Box;
package body Robot is
   task body Object is
      T: Robot.Trajectory.Safe.T_Safe;
      Speed: Float := 75.0;
      package RobotMail is new Mail_Box(Message => Robot_ID);
      Mission_Done: RobotMail.Object(Size => 6);
   begin
      loop
         select
            accept Go(From: in Site.Input_Places; To: in Site.Output_Places) do
               Robot.Trajectory.Safe.Open(T, From, To, Speed, Object.Color, Object.ID);
            end Go;
            while Robot.Trajectory.Safe.At_End(T) loop
               Robot.Trajectory.Safe.Next(T);
            end loop;
            Robot.Trajectory.Safe.Close(T);
            Mission_Done.Put(M => Robot.Object.ID);
         or accept Shutdown do
		null;
            end Shutdown;
         or delay 5.0;
         end select;
      end loop;
   end;
end;
