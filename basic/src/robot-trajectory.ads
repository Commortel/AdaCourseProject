with Path, Robot;
private package Robot.Trajectory is
   type Object is tagged private;

   function GetRoute return Path.Object;
   procedure Open(T: in out Object; P: in Path.Object; S: in Float);
   function X(T: in Object) return Float;
   function Y(T: in Object) return Float;
   procedure Next(T: in out Object; dt: in Duration);
   function At_End(T: in Object) return Boolean;
   procedure Close(T: in Object);

private
   type Object is tagged record
      Color:Color_Type;
      Route: Path.Object;
      Speed: Float;
      Segment: Positive;
      K: Float;
      dk: Float;
   end record;
end;
