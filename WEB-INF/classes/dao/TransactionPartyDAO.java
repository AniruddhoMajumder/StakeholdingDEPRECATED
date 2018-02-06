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

}
