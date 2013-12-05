package Site.Place_Path is
   type Object is private;

   function Open(P: in out Object; From: in Site.Input_Places; To: in Site.Output_Places) return Object;
   function At_End(P: in Object) return Boolean;
   procedure Next(P: in out Object);
   function Value(P: in Object) return Site.Place_Names;
   procedure Add(P: in out Object; PN: in Place_Names);
   procedure Reset(P: in out Object);

private
   type Elements is array(Natural range<>) of Site.Place_Names;
   subtype Count is Natural range 0..50;
   type Object(Size: Count := 0) is record
      Path: Elements(0..Size);
      Segment: Natural := 0;
   end record;
   Null_Path: constant Object := Object'(Size => 0, Path => <>, Segment => 0);
end;
