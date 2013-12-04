with Adagraph, Robot.Trajectory, Robot.Trajectory.Safe, Site;
use Adagraph;
package body Robot is
   task body Object is
      Needed: Boolean := True;
      dt: Duration := 0.05;
      T:  Robot.Trajectory.Safe.T_Safe;
      Speed: Float := 75.0;
   begin
      while Needed loop
         select
            accept Go(From: in Site.Input_Places; To: in Site.Output_Places) do
               Robot.Trajectory.Safe.Open(T, From, To, Speed);
            end Go;
            while Robot.Trajectory.Safe.At_End(T) loop
               Robot.Trajectory.Safe.Next(T);
            end loop;
         or accept Shutdown do
               Needed := False;
            end Shutdown;
         or delay 5.0;
         end select;
      end loop;
   end;
end;
