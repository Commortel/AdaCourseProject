package body Parking is
   protected body Object is
      procedure Shift (I: in out Positive) is
      begin
         if I = Size then I := 1; else I := I + 1; end if;
      end;
      entry Take(E: out Robot.Robot_ID) when Count > 0 is
      begin
         E     := Content(First);
         Shift(First);
         Count := Count - 1;
      end;
      procedure Park(E: in Robot.Robot_ID) is
      begin
         Shift(Last);
         Content(Last) := E;
         Count := Count + 1;
      end;
   end;
end Parking;
