package project;

import java.util.*;

public class Trader{

   private String id;
   private String title;
   private String fname;
   private String mname;
   private String lname;

   private char gender;

   private String idproof;

   private Calendar dob;

   private String phone;
   private String email;
   private String address;

   public Trader(List<Object> values){
      this.id = (String) values.get(0);
      this.title = (String) values.get(1);
      this.fname = (String) values.get(2);
      this.mname = (String) values.get(3);
      this.lname = (String) values.get(4);
      this.gender = (char) values.get(5);
      this.idproof = (String) values.get(6);
      this.dob = (Calendar) values.get(7);
      this.phone = (String) values.get(8);
      this.email = (String) values.get(9);
      this.address = (String) values.get(10);
   }

   public String getId(){
      return this.id;
   }

   public String getTitle(){
      return this.title;
   }

   public String getFname(){
      return this.fname;
   }

   public String getMname(){
      return this.mname;
   }

   public String getLname(){
      return this.lname;
   }

   public char getGender(){
      return this.gender;
   }

   public String getIdproof(){
      return this.idproof;
   }

   public Calendar getDob(){
      return this.dob;
   }

   public String getPhone(){
      return this.phone;
   }

   public String getEmail(){
      return this.email;
   }

   public String getAddress(){
      return this.address;
   }
}
