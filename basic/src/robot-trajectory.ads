with Path, Robot;
private package Robot.Trajectory is
   type Object is tagged private;

   function GetRoute return Path.Object;
   procedure Open(P: Path.Object; S: Float);
   function X return Float;
   function Y return Float;
   procedure Next(dt: Duration);
   function At_End return Boolean;
   procedure Close;

private
   type Object is new Robot.Object;
end;
