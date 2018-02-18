package dao;

import java.sql.*;
import java.util.*;
import project.Company;

public class CompanyDAO{

   private String dbUrl,
      dbUser,
      dbPass;

   private Connection dbConnection;

   public CompanyDAO(String dbUrl, String dbUser, String dbPass){
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

   public boolean insert(Company newCompany, String user, String pass) throws SQLException{
      String insertQuery = "INSERT INTO Company VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

      connect();
      PreparedStatement insertSTAT = dbConnection.prepareStatement(insertQuery);

      insertSTAT.setString(1, newCompany.getId());
      insertSTAT.setString(2, newCompany.getName());
      insertSTAT.setString(3, newCompany.getLicence());
      insertSTAT.setString(4, newCompany.getPhone());
      insertSTAT.setString(5, newCompany.getEmail());
      insertSTAT.setString(6, newCompany.getAddress());
      insertSTAT.setString(7, user);
      insertSTAT.setString(8, pass);

      boolean inserted = insertSTAT.executeUpdate()==0?false:true;

      disconnect();

      return inserted;
   }

   public String getNextId() throws SQLException{
      String newId = "cmp";

      String getQuery = "SELECT COUNT(*) FROM company";

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

   public String getCompanyName(String CompanyId) throws SQLException{
      String queryString = "SELECT name FROM company WHERE id = '" + CompanyId + "'";

      connect();
      Statement getNameSTAT = dbConnection.createStatement();
      ResultSet getNameRSET = getNameSTAT.executeQuery(queryString);

      if(getNameRSET.next()){
         String ret = getNameRSET.getString(1);
         disconnect();
         return ret;
      }else{
         disconnect();
         return null;
      }
   }

   public List<String> getAvailableCompanies(){
      TransactionPartyDAO tpdao = new TransactionPartyDAO(dbUrl, dbUser, dbPass);

      String queryString = "SELECT c.id FROM company c, transaction_party tp, transaction t WHERE c.id = tp.company_id and tp.id = t.seller_id and s.issued > sum(t.number)"
   }

}
