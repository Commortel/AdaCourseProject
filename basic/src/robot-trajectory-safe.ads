with Generic_Ressource_Pool, Site.Place_Path;
package Robot.Trajectory.Safe is
   type T_Safe is new Robot.Trajectory.Object with private;
   package Ressources is new Generic_Ressource_Pool(Ressource_Id => Site.Place_Names);
   Pool: Ressources.Object(18);

   overriding
   procedure Open(T: in out T_Safe; From: in Site.Input_Places; To: in Site.Output_Places;  S: in Float; Color: in Color_Type; ID: in Robot.Robot_ID);
   procedure Next(T: in out T_Safe);
   overriding
   procedure Close(T: in out T_Safe);
   function GetPoint(R: in Robot.Robot_ID) return Path.Point;

private
   type T_Safe is new Robot.Trajectory.Object with record
      It: Site.Place_Path.Object;
   end record;
end;
