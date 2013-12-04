with Generic_Ressource_Pool, Site.Place_Path;
package Robot.Trajectory.Safe is
   type T_Safe is new Robot.Trajectory.Object with private;
   package Ressources is new Generic_Ressource_Pool(Ressource_Id => Site.Place_Names);
   Pool: Ressources.Object(18);

   overriding
   procedure Open(T: in out T_Safe; From: in Site.Input_Places; To: in Site.Output_Places;  S: in Float);
   procedure Next(T: in out T_Safe);
   overriding
   procedure Close(T: in T_Safe);

private
   type Elements is array(Natural range<>) of Site.Place_Names;
   type T_Safe is new Robot.Trajectory.Object with record
      From: Site.Input_Places;
      To: Site.Output_Places;
      --RM : Ressources.Request_Map();
   end record;
end;
