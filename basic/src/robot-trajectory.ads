with Path, Robot;
private package Robot.Trajectory is
   type Object is private;
   Route: Path.Object;
   Speed: Float;
   Segment: Positive;
   K: Float;

   function GetRoute return Path.Object;
   procedure Open(P: Path.Object; S: Speed);
   function X return Float;
   function Y return Float;
   procedure Next(dt: Float);
   function At_End return Boolean;
   procedure Close;

   private
end;
