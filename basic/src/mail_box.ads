with Parking;
generic
   type Message is (<>);
package Mail_Box is
   type Messages is array(Positive range <>) of Message;

   protected type Object(Size: Positive) is
      entry Put(M: in Message);
      entry Get(M: out Message);
   private
      Content: Messages (1..Size);
      First  : Positive := 1;
      Last   : Positive := Size;
      Count  : Natural := 0;
   end;
end Mail_Box;
