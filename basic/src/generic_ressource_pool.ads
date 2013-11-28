generic
	type Ressource_Id is (<>);
package Generic_Ressource_Pool is
   type Object(Size: Positive) is limited private;
   protected type Ressource is
      entry Acquire;
      procedure Release;
   private
      Count: Boolean := True;
   end;
   type Request_Map is array(0..6) of Ressource_Id;
   type Safe_Access is access all Ressource;
   function S return Safe_Access;

   procedure Acquire(Obj: in Object; R: in Request_Map);
   procedure Acquire(Obj: in Object; R: in Ressource_Id);
   procedure Release(Obj: in Object; R: in Request_Map);
   procedure Release(Obj: in Object; R: in Ressource_Id);
private
   type Elements is array(Integer range<>) of Ressource;
   type Object(Size: Positive) is record
      Ressources: Elements(0..Size);
   end record;

end Generic_Ressource_Pool;
