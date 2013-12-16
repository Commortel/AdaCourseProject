package body Agency is
   subtype Place is Integer range 1..6;
   package Random_Die is new Ada.Numerics.Discrete_Random (Place);
   use Random_Die;

   procedure Handle_Transfer (From : in Site.Input_Places; To: in Site.Output_Places) is
      R : Robot.Robot_ID;
   begin
      Park.Take(R);
      Ada.Text_IO.Put_Line("Robot " & Integer'Image(Robot.Robot_ID'Pos(R)));
      Agency.Singleton.Robots(Robot.Robot_ID'Pos(R) + 1).Go(From,To);
   end;
   procedure Shutdown is
   begin
      null;
   end;

--     task body Mission_Listener is
--     begin
--        loop
--           select
--              Mail_Box.Object.Get(M);
--           then abort
--                 Park.Park(M);
--           end select;
--        end loop;
--     end;
end Agency;
