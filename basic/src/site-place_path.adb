with Ada.Text_IO;
package body Site.Place_Path is

   function Open(P: in out Object; From: in Site.Input_Places; To: in Site.Output_Places) return Object is
      type Test is mod 6;
      T : Test := 0;
      JI : Integer := Input_Places'Pos(From);
      JO : Integer := Output_Places'Pos(To) - 12;
   begin
      P := Null_Path;
      P.Segment := 0;
      Add(P,From);
      Add(P,Site.Way_In(From));

      T := Test(JI) - Test(JO);

      case T is
         when 2 =>  Add(P, Site.Previous(Site.Way_In(From)));
         when 3 =>  Add(P, Site.C);
         when 4 =>  Add(P, Site.Next(Site.Way_In(From)));
         when others  => null;
      end case;

      Add(P, Site.Way_Out(To));
      Add(P, To);
      return P;
   end;
   function At_End(P: in Object) return Boolean is
   begin
      return Boolean(P.Segment < P.Size);
   end;
   procedure Next(P: in out Object) is
   begin
      P.Segment := P.Segment + 1;
   end;
   function Value(P: in Object) return Site.Place_Names is
   begin
      return P.Path(P.Segment);
   end;
   procedure Add(P: in out Object; PN: in Place_Names) is
   begin
      P := Place_Path.Object'(Size => P.Size + 1, Path => P.Path & PN, Segment => P.Segment);
   end;
   procedure Reset(P: in out Object) is
   begin
      P := Place_Path.Object'(Size => P.Size, Path => P.Path, Segment => 0);
   end;

end;
