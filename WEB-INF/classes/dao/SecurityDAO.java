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

   public String getEquityShareID(String CompanyId) throws SQLException{
      String queryString = "SELECT id FROM securities WHERE company_id = '" + CompanyId + "' and type_id = 'eshr'";

      connect();

      Statement getPriceSTAT = dbConnection.createStatement();
      ResultSet getPriceRSET = getPriceSTAT.executeQuery(queryString);

      if(getPriceRSET.next()){
         String ret = getPriceRSET.getString(1);
         disconnect();
         return ret;
      }else{
         disconnect();
         return null;
      }
   }

   public double getEquitySharePrice(String CompanyId) throws SQLException{
      String queryString = "SELECT price FROM securities WHERE company_id = '" + CompanyId + "' and type_id = 'eshr'";

      connect();

      Statement getPriceSTAT = dbConnection.createStatement();
      ResultSet getPriceRSET = getPriceSTAT.executeQuery(queryString);

      if(getPriceRSET.next()){
         double ret = getPriceRSET.getDouble(1);
         disconnect();
         return ret;
      }else{
         disconnect();
         return 0;
      }
   }

   public int getEquitySharesIssued(String CompanyId) throws SQLException{
      String queryString = "SELECT issued FROM securities WHERE company_id = '" + CompanyId + "' and type_id = 'eshr'";

      connect();

      Statement getIssuedSTAT = dbConnection.createStatement();
      ResultSet getIssuedRSET = getIssuedSTAT.executeQuery(queryString);

      if(getIssuedRSET.next()){
         int ret = getIssuedRSET.getInt(1);
         disconnect();
         return ret;
      }else{
         disconnect();
         return 0;
      }
   }

   public int getEquitySharesSold(String CompanyId) throws SQLException{
      String queryString = "SELECT number FROM transaction WHERE seller_id = (SELECT id FROM transaction_party WHERE company_id='" + CompanyId + "') and security_id = '" + getEquityShareID(CompanyId) + "'";

      connect();

      int sold = 0;

      Statement getSoldSTAT = dbConnection.createStatement();
      ResultSet getSoldRSET = getSoldSTAT.executeQuery(queryString);

      while(getSoldRSET.next()){
         sold += getSoldRSET.getInt(1);
      }

      disconnect();
      return sold;
   }

}
