package body Agency is
   Park: Parking.Object(Size => 5);

   procedure Handle_Transfer (From : in Site.Input_Places; To: in Site.Output_Places) is
   begin
      Agency.Singleton.Robots(1).Go(From,To);
   end;
   procedure Shutdown is
   begin
      null;
   end;
end Agency;
