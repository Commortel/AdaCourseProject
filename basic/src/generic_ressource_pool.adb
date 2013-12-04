with Ada.Text_IO;
package body Generic_Ressource_Pool is
   protected body Ressource is
      entry Acquire when not Count is
      begin
         Ada.Text_IO.Put_Line("Acquired");
         Count := True;
      end;
      procedure Release is
      begin
         Ada.Text_IO.Put_Line("Released");
         Count := False;
      end;
   end Ressource;

   procedure Acquire(Obj: in out Object; R: in out Request_Map) is
   begin
      Tri(R);
      for E of R loop
         --if E in Ressource_Id then
            Acquire(Obj,E);--.Ressources(Integer(Ressource_Id'Pos(E))).Acquire;
         --end if;
      end loop;
   end;
   procedure Acquire(Obj: in out Object; R: in Ressource_Id) is
   begin
      Obj.Ressources(Integer(Ressource_Id'Pos(R))).Acquire;
   end;
   procedure Release(Obj: in out Object; R: in out Request_Map) is
   begin
      Tri(R);
      for E of R loop
         Release(Obj,E);--Obj.Ressources(Integer(Ressource_Id'Pos(E))).Release;
      end loop;
   end;
   procedure Release(Obj: in out Object; R: in Ressource_Id) is
   begin
      Obj.Ressources(Integer(Ressource_Id'Pos(R))).Release;
   end;
   procedure Tri(R: in out Request_Map) is
      tmp: Ressource_Id;
   begin
      for I in 0..(R'Last - 1) loop
         for J in 0..(R'Last - i - 1) loop
            if Integer(Ressource_Id'Pos(R(J))) > Integer(Ressource_Id'Pos(R(J+1))) then
               tmp := R(J);
               R(J) := R(J + 1);
               R(J + 1) := tmp;
            end if;
         end loop;
      end loop;

   end;

end;
