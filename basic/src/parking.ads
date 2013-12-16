With Robot;
with Ada.Numerics.Discrete_Random, Remote_Adagraph;
use Remote_Adagraph;
with Site;
with Path;
with Ada.Text_IO;
package Parking is
   type Elements is array(Natural range <>) of Boolean;
   protected type Object(Size: Positive) is
      entry Take(E: out Robot.Robot_ID);
      procedure Park(E: in Robot.Robot_ID);
      function GetPoint(R: in Robot.Robot_ID) return Path.Point;
      function GetColor(R: in Robot.Robot_ID) return Color_Type;
   private
      Content: Elements(0..5) := (others => True);
      Count  : Natural := Size;
   end;
end Parking;
