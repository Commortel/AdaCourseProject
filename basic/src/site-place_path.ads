package Site.Place_Path is
   type Object is tagged private;

   function Open(P: in out Object; From: in Site.Input_Places; To: in Site.Output_Places) return Object;
   function At_End(P: in Object) return Boolean;
   procedure Next(P: in out Object; dt: in Duration);
   function Value(P: in Object) return Object;

private
   type Elements is array(Natural range<>) of Site.Place_Names;
   type Object is tagged record
      Path: Elements(0..18);
   end record;
end;
