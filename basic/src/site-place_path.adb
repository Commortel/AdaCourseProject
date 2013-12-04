package body Site.Place_Path is

   function Open(P: in out Object; From: in Site.Input_Places; To: in Site.Output_Places) return Object is
   begin
      return P;
   end;
   function At_End(P: in Object) return Boolean is
   begin
      return false;
   end;
   procedure Next(P: in out Object; dt: in Duration) is
   begin
      null;
   end;
   function Value(P: in Object) return Object is
   begin
      return P;
   end;
end;
