with Path, Robot, Site;
private package Robot.Trajectory is
   type Object is tagged private;

   function GetRoute return Path.Object;
   procedure Open(T: in out Object; From: in Site.Input_Places; To: in Site.Output_Places; S: in Float);
   function X(T: in Object) return Float;
   function Y(T: in Object) return Float;
   procedure Next(T: in out Object; dt: in Duration);
   function At_End(T: in Object) return Boolean;
   procedure Close(T: in out Object);

private
   type Object is tagged record
      Color:Color_Type;
      Route: Path.Object;
      Speed: Float;
      Segment: Positive;
      K: Float;
   end record;
end;
