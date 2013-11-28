generic
	type Ressource_Id is (<>);
package Generic_Ressource_Pool is
   type Object(Size: Positive) is limited private;
   protected type Ressource is
      entry Acquire;
      procedure Release;
   private
      Count: Boolean := False;
   end;
   type Request_Map is array(Natural range<>) of Ressource_Id;

   procedure Acquire(Obj: in out Object; R: in Request_Map);
   procedure Acquire(Obj: in out Object; R: in Ressource_Id);
   procedure Release(Obj: in out Object; R: in Request_Map);
   procedure Release(Obj: in out Object; R: in Ressource_Id);
   procedure Tri(R: in out Request_Map);
private
   type Elements is array(Integer range<>) of Ressource;
   type Object(Size: Positive) is record
      Ressources: Elements(0..Size);
   end record;

end Generic_Ressource_Pool;
