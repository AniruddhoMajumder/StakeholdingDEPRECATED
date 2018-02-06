package project;

import java.util.*;

public class TransactionParty{

   private String id;
   private String companyId;
   private String traderId;

   private double balance;

   public static final int COMPANY = 10;
   public static final int TRADER = 11;

   public TransactionParty(String transactionPartyId, String partyId, int transactionPartyType, double transactionPartyBalance){
      this.id = transactionPartyId;
      if(transactionPartyType == COMPANY){
         this.companyId = partyId;
         this.traderId = "-";
      }else{
         this.companyId = "-";
         this.traderId = partyId;
      }
      this.balance = transactionPartyBalance;
   }

   public String getId(){
      return this.id;
   }

   public String getCompanyId(){
      return this.companyId;
   }

   public String getTraderId(){
      return this.traderId;
   }

   public double getBalance(){
      return this.balance;
   }

}
