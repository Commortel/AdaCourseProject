with Remote_Adagraph, Site;
use Remote_Adagraph;
package Robot is
   type Robot_ID is (R1, R2, R3, R4, R5, R6);
   task type Object(Color: Color_Type := Blue; ID: Robot_ID := R1) is
      entry Go(From: in Site.Input_Places; To: in Site.Output_Places);
      entry Shutdown;
   end;

end Robot;
