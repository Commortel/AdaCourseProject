generic
	NBValue : Positive;

package Generic_Ressource_Pool is
   protected type Ressource(Initial: Natural := 1) is
      entry Acquire;
      procedure Release;
   private
      Count: Natural := Initial;
   end;

   subtype Ressource_Id is Integer range 0..NBValue;
   type Request_Map is array(0..NBValue) of Ressource_Id;

end Generic_Ressource_Pool;
