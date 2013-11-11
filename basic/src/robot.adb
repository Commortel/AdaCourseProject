with Adagraph;
use Adagraph;
package body Robot is
   task body Object is
      K : Float := 0.0;
      Needed: Boolean := True;
      dt: Duration := 0.05;
      dk: Float := 0.1;
      Radius: Integer := 10;
   begin
      while Needed loop
         select
            accept Follow (Pa: in Path.Object) do
               for i in 1..Path.Segment_Count(Pa) loop
                  for j in 1..Integer(1.0/dk) loop
                     Adagraph.Draw_Circle(
                              Integer(Path.X(Pa,i,K)),
                              Integer(Path.Y(Pa,i,K)),
                                          Radius, White, Fill);
                     delay dt;
                     Adagraph.Draw_Circle(
                              Integer(Path.X(Pa,i,K)),
                              Integer(Path.Y(Pa,i,K)),
                                          Radius, Black, Fill);
                     K := K + dK;
                  end loop;
                  K := 0.0;
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
