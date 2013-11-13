with Adagraph, Robot.Trajectory;
use Adagraph;
package body Robot is
   task body Object is
      Needed: Boolean := True;
      dt: Duration := 0.05;
   begin
      while Needed loop
         select
            accept Follow (Pa: in Path.Object) do
               Robot.Trajectory.Open(Pa,75.0);
               while Robot.Trajectory.At_End loop
                  Robot.Trajectory.Next(dt);
               end loop;
            end Follow;
         or accept Shutdown do
               Needed := False;
            end Shutdown;
         or delay 5.0;
         end select;
      end loop;
   end;
end;
