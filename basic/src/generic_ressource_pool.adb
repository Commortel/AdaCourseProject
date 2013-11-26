package body Generic_Ressource_Pool is
   Ressources : array (1..NBValue) of Ressource;

   protected body Ressource is
      entry Acquire when Count > 0 is
      begin
         Count := Count - 1;
      end;
      procedure Release is
      begin
         Count := Count + 1;
      end;
   end Ressource;

end;
