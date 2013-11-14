with Adagraph, Path;
use Adagraph;
package Site is
   type Place_Names is (I1, I2, I3, I4, I5, I6);
   type Ring_Places is (R1, R2, R3, R4, R5, R6);

   function Way_In(To: in Input_Places) return Ring_Places;
   function Next(To: in Ring_Places) return Ring_Places;
   function Previous(To: in Ring_Places) return Ring_Places;
   function Way_Out(To: in Output_Places) return Ring_Places;
   function Opposite(To: in Ring_Places) return Ring_Places;
   function Create_Path(From: in Ring_Places; To: in Ring_Places) return Path.Object;

   protected Safely is
      procedure Draw_Site();
      procedure Draw_Path(P: in Path.Object);
      procedure Draw_Robot(R: in Robot.Object);
      procedure Hide_Robot(R: in Robot.Object);
   end;

end Site;
