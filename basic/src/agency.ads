with Site, Robot, Parking, Remote_Adagraph;
use Remote_Adagraph;
package Agency is
   procedure Handle_Transfer (From : in Site.Input_Places; To: in Site.Output_Places);
   procedure Shutdown;
private
   R1: aliased Robot.Object(Color => Cyan, ID => Robot.R1);
   R2: aliased Robot.Object(Color => Blue, ID => Robot.R2);
   R3: aliased Robot.Object(Color => Yellow, ID => Robot.R3);
   R4: aliased Robot.Object(Color => Green, ID => Robot.R4);
   R5: aliased Robot.Object(Color => Red, ID => Robot.R5);
   R6: aliased Robot.Object(Color => Brown, ID => Robot.R6);

   type P_Robot is access all Robot.Object;
   type T_Robot is array(Positive range<>) of P_Robot;
   type V_Agency is record
      Robots : T_Robot(1..6)
              := (
                  1 => R1'access,
                  2 => R2'Access,
                  3 => R3'Access,
                  4 => R4'Access,
                  5 => R5'Access,
                  6 => R6'Access
                 );
   end record;
   Singleton : V_Agency := V_Agency'(Robots => <>);
end Agency;
