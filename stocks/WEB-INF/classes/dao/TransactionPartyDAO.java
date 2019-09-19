package dao;

import java.sql.*;
import java.util.*;
import project.TransactionParty;

public class TransactionPartyDAO{

   private String dbUrl,
      dbUser,
      dbPass;

   private Connection dbConnection;

   public TransactionPartyDAO(String dbUrl, String dbUser, String dbPass){
      this.dbUrl = dbUrl;
      this.dbUser = dbUser;
      this.dbPass = dbPass;
   }

   private void connect() throws SQLException{
      if(dbConnection == null || dbConnection.isClosed()){
         try{
            Class.forName("com.mysql.jdbc.Driver");
            dbConnection = DriverManager.getConnection(dbUrl, dbUser, dbPass);
         }catch(Exception e){
            e.printStackTrace();
         }
      }
   }

   private void disconnect() throws SQLException{
      if(dbConnection != null || !dbConnection.isClosed()){
         dbConnection.close();
      }
   }

   public boolean insert(TransactionParty newParty) throws SQLException{
      String insertQuery = "INSERT INTO Transaction_Party VALUES(?, ?, ?, ?)";

      connect();
      PreparedStatement insertSTAT = dbConnection.prepareStatement(insertQuery);

      insertSTAT.setString(1, newParty.getId());
      insertSTAT.setString(2, newParty.getCompanyId());
      insertSTAT.setString(3, newParty.getTraderId());
      insertSTAT.setString(4, Double.toString(newParty.getBalance()));

      boolean inserted = insertSTAT.executeUpdate()==0?false:true;

      insertSTAT.close();
      disconnect();

      return inserted;
   }

   public String getNextId() throws SQLException{
      String newId = "tpy";

      String getQuery = "SELECT COUNT(*) FROM Transaction_Party";

      connect();
      Statement getIdSTAT = dbConnection.createStatement();
      ResultSet getIdRSET = getIdSTAT.executeQuery(getQuery);

      getIdRSET.next();
      String id = getIdRSET.getString(1);
      id = (Integer.parseInt(id) + 1) + "";

      for (int i=7; i>id.length(); i--) {
         newId += "0";
      }
      newId += id;

      disconnect();

      return newId;
   }

   public String getCompanyTpid(String CompanyId) throws SQLException{
      String queryString = "SELECT id FROM transaction_party WHERE company_id = '" + CompanyId + "'";

      connect();

      Statement idSTAT = dbConnection.createStatement();
      ResultSet idRSET = idSTAT.executeQuery(queryString);
      if(idRSET.next()){
         String ret = idRSET.getString(1);
         disconnect();
         return ret;
      }else{
         disconnect();
         return null;
      }
   }

   public String getTraderTpid(String TraderId) throws SQLException{
      String queryString = "SELECT id FROM transaction_party WHERE trader_id = '" + TraderId + "'";

      connect();

      Statement idSTAT = dbConnection.createStatement();
      ResultSet idRSET = idSTAT.executeQuery(queryString);
      if(idRSET.next()){
         String ret = idRSET.getString(1);
         disconnect();
         return ret;
      }else{
         disconnect();
         return null;
      }
   }

   public boolean isCompany(String TransactionPartyId) throws SQLException{
      String queryString = "SELECT company_id FROM transaction_party WHERE id = '" + TransactionPartyId + "'";

      connect();

      Statement getSTAT = dbConnection.createStatement();
      ResultSet getRSET = getSTAT.executeQuery(queryString);
      if(getRSET.next() && !getRSET.getString(1).equals("-")){
         disconnect();
         return true;
      }else{
         disconnect();
         return false;
      }
   }

   public boolean isTrader(String TransactionPartyId) throws SQLException{
      String queryString = "SELECT trader_id FROM transaction_party WHERE id = '" + TransactionPartyId + "'";

      connect();

      Statement getSTAT = dbConnection.createStatement();
      ResultSet getRSET = getSTAT.executeQuery(queryString);
      if(getRSET.next() && !getRSET.getString(1).equals("-")){
         disconnect();
         return true;
      }else{
         disconnect();
         return false;
      }
   }

   public String getRealId(String TransactionPartyId) throws SQLException{
      if(isCompany(TransactionPartyId)){
         String queryString = "SELECT company_id FROM transaction_party WHERE id = '" + TransactionPartyId + "'";
         connect();

         Statement getSTAT = dbConnection.createStatement();
         ResultSet getRSET = getSTAT.executeQuery(queryString);
         if(getRSET.next()){
            String ret = getRSET.getString(1);
            disconnect();
            return ret;
         }else{
            disconnect();
            return null;
         }
      }else if(isTrader(TransactionPartyId)){
         String queryString = "SELECT trader_id FROM transaction_party WHERE id = '" + TransactionPartyId + "'";
         connect();

         Statement getSTAT = dbConnection.createStatement();
         ResultSet getRSET = getSTAT.executeQuery(queryString);
         if(getRSET.next()){
            String ret = getRSET.getString(1);
            disconnect();
            return ret;
         }else{
            disconnect();
            return null;
         }
      }else{
         return null;
      }
   }

}
