with Generic_Ressource_Pool;
private package body Robot.Trajectory.Safe is
   package Ressources is new Generic_Ressource_Pool(Ressource_Id => Site.Place_Names);
   Pool: Ressourcerces.Object(18);

   procedure Open(S: in out Object; From: in Site.Input_Places; To: in Site.Output_Places; S: in Float) is
   begin
      null;
   end;
   procedure Next(S: in out Object) is
   begin
      null;
   end;
   procedure Close(S: in Object) is
   begin
      null;
   end;

end;
