with Ada.Numerics.Generic_Elementary_Functions;
with Adagraph;
use Adagraph;
package body Path is

   -- Instanciation du package generique avec un type float
   package My_Float is new Ada.Numerics.Generic_Elementary_Functions( Float ) ;
   use My_Float ;

   function Value(From : in Points) return Object is
   begin
      return Object'(Size => From'Length, Values => From);
   end;

   function "&"(Left : in Object; Right: in Object) return Object is
   begin
      return Object'(Size => Left.Size + Right.Size, Values => Left.Values & Right.Values);
   end;

   function "&"(Left : in Object; Right: in Point) return Object is
   begin
      return Object'(Size => Left.Size + 1, Values => Left.Values & Right);
   end;

   function "&"(Left : in Point; Right: in Object) return Object is
   begin
      return Object'(Size => 1 + Right.Size, Values => Left & Right.Values);
   end;

   procedure Add(Path: in out Object; P: in Point) is
   begin
      Path := Path & P;
   end;

   function Segment_Count(Path: in Object) return Natural is (Path.Size - 1);
   function Segment_Length(Path : in Object; Segment: in Positive) return Float is
   begin
      return Sqrt((Path.Values(Segment + 1).X - Path.Values(Segment).X)**2 + (Path.Values(Segment + 1).Y - Path.Values(Segment).Y)**2);
   end;

   procedure Draw(Path: in Object; Color: in Color_Type := Light_Green) is
   begin
      for L in 1..Segment_Count(Path) loop
         Adagraph.Draw_Line(Integer(Path.Values(L).X), Integer(Path.Values(L).Y), Integer(Path.Values(L+1).X), Integer(Path.Values(L+1).Y), Color);
      end loop;
   end;

   function GetValues(Path: in Object) return Points is (Path.Values);
   function GetSize(Path: in Object) return Natural is (Path.Size);

   function X(Path: in Object; Segment: in Positive; K: in Param) return Float is
   begin
      return (Path.Values(Segment).X + K * (Path.Values(Segment + 1).X - Path.Values(Segment).X));
   end;

   function Y(Path: in Object; Segment: in Positive; K: in Param) return Float is
   begin
      return (Path.Values(Segment).Y + K * (Path.Values(Segment + 1).Y - Path.Values(Segment).Y));
   end;


end;
