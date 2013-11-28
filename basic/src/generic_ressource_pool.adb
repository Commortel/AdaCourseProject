package body Generic_Ressource_Pool is
   protected body Ressource is
      entry Acquire when not Count is
      begin
         Count := True;
      end;
      procedure Release is
      begin
         Count := False;
      end;
   end Ressource;

   function S return Safe_Access is
   begin
      return new Ressource;
   end;

   procedure Acquire(Obj: in Object; R: in Request_Map) is
      S: Safe_Access;
   begin
      for E of R loop
         S.all := Obj.Ressources(Ressource_Id'Pos(E));
         S.Acquire;
      end loop;
   end;
   procedure Acquire(Obj: in Object; R: in Ressource_Id) is
   begin
      Obj.Ressources(Ressource_Id'Pos(R)).Acquire;
   end;
   procedure Release(Obj: in Object; R: in Request_Map) is
   begin
      for E of R loop
         Obj.Ressources(Ressource_Id'Pos(E)).Release;
      end loop;
   end;
   procedure Release(Obj: in Object; R: in Ressource_Id) is
   begin
      Obj.Ressources(Ressource_Id'Pos(R)).Release;
   end;

end;
