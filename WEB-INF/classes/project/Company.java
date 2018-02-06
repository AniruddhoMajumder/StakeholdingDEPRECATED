package project;

import java.util.*;

public class Company{

   private String id;
   private String name;
   private String licence;
   private String phone;
   private String email;
   private String address;

   public Company(List<String> values){
      this.id = values.get(0);
      this.name = values.get(1);
      this.licence = values.get(2);
      this.phone = values.get(3);
      this.email = values.get(4);
      this.address = values.get(5);
   }

   public String getId(){
      return this.id;
   }

   public String getName(){
      return this.name;
   }

   public String getLicence(){
      return this.licence;
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
