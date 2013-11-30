private package Robot.Trajectory.Safe is
   type Object is tagged private;

   procedure Open(S: in out Object; From: in Site.Input_Places; To: in Site.Output_Places);
   procedure Next(S: in out Object);
   procedure Close(S: in Object);

private
   type Elements is array(Natural range<>) of Site.Place_Names;
   type Object is tagged record
      Path: Elements;
   end record;
end;
