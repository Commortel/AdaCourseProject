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
            accept Follow (Pa: in Path.Object) do
               Robot.Trajectory.Open(T,Pa,75.0);
               Robot.Trajectory.Open(T,Pa,75.0);
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
