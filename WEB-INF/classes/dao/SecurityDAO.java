package dao;

import java.sql.*;
import java.util.*;
import project.Security;

public class SecurityDAO{

   private String dbUrl,
      dbUser,
      dbPass;

   private Connection dbConnection;

   public SecurityDAO(String dbUrl, String dbUser, String dbPass){
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

   public boolean insert(Security newSecurity) throws SQLException{
      String insertQuery = "INSERT INTO Securities VALUES(?, ?, ?, ?, ?, ?)";

      connect();
      PreparedStatement insertSTAT = dbConnection.prepareStatement(insertQuery);

      insertSTAT.setString(1, newSecurity.getId());
      insertSTAT.setString(2, newSecurity.getCompanyId());
      insertSTAT.setString(3, newSecurity.getTypeId());
      insertSTAT.setString(4, Double.toString(newSecurity.getPrice()));
      insertSTAT.setString(5, Integer.toString(newSecurity.getRegistered()));
      insertSTAT.setString(6, Integer.toString(newSecurity.getIssued()));

      boolean inserted = insertSTAT.executeUpdate()==0?false:true;

      disconnect();

      return inserted;
   }

   public String getNextId() throws SQLException{
      String newId = "sec";

      String getQuery = "SELECT COUNT(*) FROM securities";

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
