with Site, Robot, Parking, Remote_Adagraph;
use Remote_Adagraph;
package Agency is
   procedure Handle_Transfer (From : in Site.Input_Places; To: in Site.Output_Places);
   procedure Shutdown;
private
   type T_Robot is array(Natural range<>) of Robot.Object;
   subtype NbOfRobots is Natural range 0..5;
   type V_Agency(Size: NbOfRobots := 5) is record
      Robots : T_Robot(0..5);
   end record;
   Singleton : constant V_Agency := V_Agency'(Size => 5,Robots => T_Robot'(
                                              0 => Robot.Object'(Color_Type => Blue, ID => Robot.R1),
                                              1 => (Robot.Object'(Color_Type => Blue, ID => Robot.R2)),
                                              2 => (Robot.Object'(Color_Type => Yellow, ID => Robot.R3)),
                                              3 => (Robot.Object'(Color_Type => Green, ID => Robot.R4)),
                                              4 => (Robot.Object'(Color_Type => Red, ID => Robot.R5)),
                                              5 => (Robot.Object'(Color_Type => Brown, ID => Robot.R6));
end Agency;
