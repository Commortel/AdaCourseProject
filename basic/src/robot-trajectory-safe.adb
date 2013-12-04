package body Robot.Trajectory.Safe is

   procedure Open (T: in out T_Safe; From: in Site.Input_Places; To: in Site.Output_Places;  S: in Float) is
      R: Ressources.Request_Map(0..1);
   begin
      T.From := From;
      T.To := To;
      R(0) := From;
      R(1) := To;
      --Ressources.Acquire(Pool,R);
      Trajectory.Open(Trajectory.Object(T), From, To, S);
   end;
   procedure Next (T: in out T_Safe) is
   begin
      Trajectory.Next(Trajectory.Object(T), Duration(0.05));
   end;
   procedure Close (T: in T_Safe) is
   begin
      null;
   end;
end;
