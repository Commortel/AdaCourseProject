package body Agency is
   Park: Parking.Object(Size => 5);

   procedure Init(T: in out V_Agency) is
      R1: Robot.Object(Color => Blue, ID => Robot.R1);
      R2: Robot.Object(Color => Blue, ID => Robot.R2);
      R3: Robot.Object(Color => Yellow, ID => Robot.R3);
      R4: Robot.Object(Color => Green, ID => Robot.R4);
      R5: Robot.Object(Color => Red, ID => Robot.R5);
      R6: Robot.Object(Color => Brown, ID => Robot.R6);
      P: T_Robot(0..5);
   begin
      P(0) := R1;
      T.Robots(1) := R2;
      T.Robots(2) := R3;
      T.Robots(3) := R4;
      T.Robots(4) := R5;
      T.Robots(5) := R6;
   end;

   procedure Handle_Transfer (From : in Site.Input_Places; To: in Site.Output_Places) is
   begin
      null;--Agency.Singleton.Robots(1).Go(From,To);
   end;
   procedure Shutdown is
   begin
      null;
   end;
end Agency;
