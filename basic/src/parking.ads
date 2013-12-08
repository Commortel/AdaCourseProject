With Robot;
package Parking is
   type Elements is array(Positive range <>) of Robot.Robot_ID;
   protected type Object(Size: Positive) is
      entry Take(E: out Robot.Robot_ID);
      procedure Park(E: in Robot.Robot_ID);
   private
      Content: Elements(1..Size);
      First  : Positive := 1;
      Last   : Positive := Size;
      Count  : Natural := Size;
   end;
end Parking;
