with Adagraph;
package body Robot.Trajectory is
   Route: Path.Object;
   Speed: Float;
   Segment: Positive;
   K: Float := 0.0;
   dt: Duration := 0.05;
   dk: Float := 0.0;
   Radius: Integer := 10;

   function GetRoute return Path.Object is (Route);
   procedure Open(P: Path.Object; S: Float) is
   begin
      Route := P;
      Segment := 1;
      Speed := S;
   end;

   function X return Float is (Path.X(Route,Segment,K));
   function Y return Float is (Path.Y(Route,Segment,K));
   procedure Next(dt: Duration) is
   begin
      dk := (Speed/Path.Segment_Length(Route,Segment))*Float(dt);
      for j in 1..Integer(1.0/dk) loop
         Adagraph.Draw_Circle(
                              Integer(X),
                              Integer(Y),
                              Radius, White, Fill);
         delay dt;
         Adagraph.Draw_Circle(
                              Integer(X),
                              Integer(Y),
                              Radius, Black, Fill);
         K := K + dk;
      end loop;
      K := 0.0;
      Segment := Segment + 1;
   end;
   function At_End return Boolean is (Boolean(Path.Segment_Count(Route) >= Segment));
   procedure Close is
   begin
      null;
   end;

end;
