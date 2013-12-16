with Adagraph, Path;
use Adagraph;
package Site is
   type Place_Names is (I1, I2, I3, I4, I5, I6, R1, R2, R3, R4, R5, R6, O1, O2, O3, O4, O5, O6, C, P1, P2, P3, P4, P5, P6);
   subtype Ring_Places is Place_Names range R1..R6;
   subtype Input_Places is Place_Names range I1..I6;
   subtype Output_Places is Place_Names range O1..O6;
   subtype Center_Place is Place_Names range C..C;
   subtype Parking_Place is Place_Names range P1..P6;
   type T_Place is mod 18;

   function Way_In(To: in Input_Places) return Ring_Places;
   function Next(To: in Ring_Places) return Ring_Places;
   function Previous(To: in Ring_Places) return Ring_Places;
   function Way_Out(To: in Output_Places) return Ring_Places;
   function Opposite(To: in Ring_Places) return Ring_Places;
   function Create_Path(From: in Input_Places; To: in Output_Places) return Path.Object;
   function GetPointWithPlace(Place: in Place_Names) return Path.Point;

   protected Safely is
      procedure InitGUI;
      procedure EndGUI;
      procedure Draw_Site;
      procedure Draw_Path(P: in Path.Object; Color: in Color_Type := Light_Green);
      procedure Draw_Robot(P: in Path.Point; Color: in Color_Type := Light_Green);
      procedure Hide_Robot(P: in Path.Point);
   end;

end Site;
