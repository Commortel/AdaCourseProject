with Remote_Adagraph, Path;
use Remote_Adagraph;
package Robot is
   task type Object(Color: Color_Type := Blue) is
      entry Follow(Pa: in Path.Object);
      entry Shutdown;
   end;

end Robot;
