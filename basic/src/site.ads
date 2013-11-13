with Adagraph; use Adagraph;
package Site is
   type Place_Names is (I1, I2, I3, I4, I5, I6);
   type Ring_Places is (I1, I2, I3, I4, I5, I6);

   function Way_Out(To: Output_Places) return Ring_Places;

   protected Safely is
      procedure Draw_Site();
      procedure Draw_Path();
      procedure Draw_Robot();
      procedure Hide_Robot();
   end;

end Site;
