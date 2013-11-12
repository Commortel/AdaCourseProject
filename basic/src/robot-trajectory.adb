with Adagraph;
package body Robot.Trajectory is
   Route: Path.Object;
   Speed: Float := 75.0;
   Segment: Positive;
   K: Float := 0.0;
   dt: Duration := 0.05;
   dk: Float := 0.0;
   Radius: Integer := 10;

   function GetRoute return Path.Object is (Route);
   procedure Open(P: Path.Object; S: Float) is
   begin
      Route := P;
      for i in 1..Path.Segment_Count(P) loop
         Segment := i;
         dk := (Speed/Path.Segment_Length(P,i))*Float(dt);
         for j in 1..Integer(1.0/dk) loop
            Adagraph.Draw_Circle(
                                 Integer(Path.X(P,i,K)),
                                 Integer(Path.Y(P,i,K)),
                                 Radius, White, Fill);
            delay dt;
            Adagraph.Draw_Circle(
                                 Integer(Path.X(P,i,K)),
                                 Integer(Path.Y(P,i,K)),
                                 Radius, Black, Fill);
            K := K + dk;
         end loop;
         K := 0.0;
      end loop;
   end;

   function X return Float is (Path.X(Route,Segment,K));
   function Y return Float is (Path.Y(Route,Segment,K));
   procedure Next(dt: Duration) is
   begin
      delay dt;
   end;
   function At_End return Boolean is (Boolean(Path.Segment_Count(Route) > Segment));
   procedure Close is
   begin
      null;
   end;

end;
