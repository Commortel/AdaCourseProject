with Remote_Adagraph, Path, Site;
use Remote_Adagraph;
package Robot is
   task type Object(Color: Color_Type := Blue) is
      entry Go(From: in Site.Input_Places; To: in Site.Output_Places);
      entry Shutdown;
   end;

end Robot;
