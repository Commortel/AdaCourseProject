with Remote_Adagraph, Path;
use Remote_Adagraph;
package Robot is
   task type Object(Color: Color_Type := Blue) is
      --entry Follow(From: in Site.Input_Places; To: in Site.Output_Places);
      entry Follow(P: in Path.Object);
      entry Shutdown;
   end;

end Robot;
