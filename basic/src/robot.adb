with Adagraph, Robot.Trajectory;
use Adagraph;
package body Robot is
   task body Object is
      Needed: Boolean := True;
      dt: Duration := 0.05;
      T: Robot.Trajectory.Object;
   begin
      while Needed loop
         select
            --accept Follow (From: in Site.Input_Places; To: in Site.Output_Places) do
            --Robot.Trajectory.Open(From,To,75.0);
            accept Follow (P: in Path.Object) do
               Robot.Trajectory.Open(T,P,75.0);
            end Follow;
            while Robot.Trajectory.At_End(T) loop
               Robot.Trajectory.Next(T,dt);
            end loop;
         or accept Shutdown do
               Needed := False;
            end Shutdown;
         or delay 5.0;
         end select;
      end loop;
   end;
end;
