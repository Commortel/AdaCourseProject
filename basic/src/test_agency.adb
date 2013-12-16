with Agency, Mail_Box, Ada.Numerics.Discrete_Random, Ada.Text_IO, Robot;
with Site;
with Remote_Adagraph; use Remote_Adagraph;
procedure Test_Agency is
   subtype Place is Integer range 0..5;
   package Random_Die is new Ada.Numerics.Discrete_Random (Place);
   use Random_Die;
   G : Generator;
   PI, PO: Place;
   R: Robot.Object(Color => Blue, ID => Robot.R1);
begin
   Site.Safely.InitGUI;
   delay 1.0;
   Site.Safely.Draw_Site;
   delay 1.0;

   loop
      PI := Random(G);
      PO := Random(G);

      --Ada.Text_IO.Put_Line("Path");
      --Ada.Text_IO.Put_Line(Place'Image(PI));

      while PI = PO loop
         PO := Random(G);
      end loop;
      --Ada.Text_IO.Put_Line(Place'Image(PO));

      Agency.Handle_Transfer(Site.Input_Places'Val(PI), Site.Output_Places'Val(PO + 12));
      delay 1.0;
   end loop;
end;
