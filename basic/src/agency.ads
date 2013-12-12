with Site, Robot, Parking, Remote_Adagraph;
use Remote_Adagraph;
package Agency is
   type V_Agency is limited private;
   procedure Init(T: in out V_Agency);
   procedure Handle_Transfer (From : in Site.Input_Places; To: in Site.Output_Places);
   procedure Shutdown;
private
   type T_Robot is array(Natural range<>) of Robot.Object;
   subtype NbOfRobots is Natural range 0..5;
   type V_Agency(Size: NbOfRobots := 5) is record
      Robots : T_Robot(0..5);
   end record;
--     Init: constant T_Robot
--       := T_Robot'(
--                   0 => (Robot.Object),
--                   1 => (Robot.Object(Color => Blue, ID => Robot.R2)),
--                   2 => (Robot.Object(Color => Yellow, ID => Robot.R3)),
--                   3 => (Robot.Object(Color => Green, ID => Robot.R4)),
--                   4 => (Robot.Object(Color => Red, ID => Robot.R5)),
--                   5 => (Robot.Object(Color => Brown, ID => Robot.R6))
--                     );

--     Singleton : constant V_Agency
--       := V_Agency'(Size => 5,
--                    Robots => T_Robot'(
--                      0 => (Robot.Object),
--                      1 => (Robot.Object(Color => Blue, ID => Robot.R2)),
--                      2 => (Robot.Object(Color => Yellow, ID => Robot.R3)),
--                      3 => (Robot.Object(Color => Green, ID => Robot.R4)),
--                      4 => (Robot.Object(Color => Red, ID => Robot.R5)),
--                      5 => (Robot.Object(Color => Brown, ID => Robot.R6))
--                     ));
end Agency;
