with Adagraph;
with Site;
package body Robot.Trajectory is
   Route: Path.Object;
   Radius: Integer := 5;

   function GetRoute return Path.Object is (Route);
   procedure Open(T: in out Object; P: in Path.Object; S: in Float) is
   begin
      Site.Safely.Draw_Path(P);
      T.Route := P;
      T.Segment := 1;
      T.Speed := S;
   end;

   function X(T: in Object) return Float is (Path.X(T.Route,T.Segment,T.K));
   function Y(T: in Object) return Float is (Path.Y(T.Route,T.Segment,T.K));
   procedure Next(T: in out Object; dt: in Duration) is
      dk: Float := 0.0;
   begin
      dk := (T.Speed/Path.Segment_Length(T.Route,T.Segment))*Float(dt);
      for j in 1..Integer(1.0/dk) loop
         Site.Safely.Draw_Robot(Path.Point'(X(T),Y(T)), White);
         delay dt;
         Site.Safely.Draw_Robot(Path.Point'(X(T),Y(T)), Black);
         T.K := T.K + dk;
      end loop;
      T.K := 0.0;
      T.Segment := T.Segment + 1;
   end;
   function At_End(T: in Object) return Boolean is (Boolean(Path.Segment_Count(T.Route) >= T.Segment));
   procedure Close(T: in Object) is
   begin
      null;
   end;

end;
