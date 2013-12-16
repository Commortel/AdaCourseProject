with Ada.Text_IO, Robot;
package body Mail_Box is
   protected body Object is

      procedure Shift (I: in out Positive) is
      begin
         if I = Size then I := 1; else I := I + 1; end if;
      end;

      entry Put(M: in Message) when Count /= Size is
      begin
         Ada.Text_IO.Put_Line("Put " & Message'Image(M));
         Shift(Last);
         Content(Last) := M;
         Count := Count + 1;
         Ada.Text_IO.Put_Line("Put number" & Integer'Image(Message'Pos(M)));
         --           Agency.Park.Park(Robot.Robot_ID'Val(Message'Pos(M)));
--           Site.Safely.Draw_Robot(GetPoint(E),GetColor(E));
--           Ada.Text_IO.Put_Line("Park " & Robot.Robot_ID'Image(E));
      end;

      entry Get(M: out Message) when Count > 0 is
      begin
         M     := Content(First);
         Shift(First);
         Count := Count - 1;
         Ada.Text_IO.Put_Line("Get " & Message'Image(M));
      end;
   end;
end Mail_Box;
