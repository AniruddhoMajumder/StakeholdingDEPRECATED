package dao;

import java.sql.*;
import java.util.*;
import project.*;

public class LoginDAO{

   private String dbUrl,
      dbUser,
      dbPass;

   private Connection dbConnection;

   public LoginDAO(String dbUrl, String dbUser, String dbPass){
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

   public List<Object> login(String USERNAME, String PASSWORD) throws SQLException{
      connect();
      boolean loggedin = false;

      Statement traderSTAT = dbConnection.createStatement();
      Statement companySTAT = dbConnection.createStatement();
      ResultSet traderRSET = traderSTAT.executeQuery("SELECT * FROM trader WHERE username = '" + USERNAME + "' and password = '" + PASSWORD + "'");
      ResultSet companyRSET = companySTAT.executeQuery("SELECT * FROM company WHERE username = '" + USERNAME + "' and password = '" + PASSWORD + "'");

      companyRSET.last();

      loggedin = companyRSET.getRow()!=0;

      if(loggedin){
         List<Object> companyValues = new ArrayList<Object>();

         companyValues.add("company");
         companyValues.add(companyRSET.getString(1));
			companyValues.add(companyRSET.getString(2));
			companyValues.add(companyRSET.getString(3));
			companyValues.add(companyRSET.getString(4));
			companyValues.add(companyRSET.getString(5));
			companyValues.add(companyRSET.getString(6));

         return companyValues;
      }else{
         traderRSET.last();
         loggedin = traderRSET.getRow()!=0;
      }

      if(loggedin){
         List<Object> traderValues = new ArrayList<Object>();

         traderValues.add("trader");
         traderValues.add(traderRSET.getString(1));
			traderValues.add(traderRSET.getString(2));
			traderValues.add(traderRSET.getString(3));
			traderValues.add(traderRSET.getString(4));
			traderValues.add(traderRSET.getString(5));
			traderValues.add(traderRSET.getString(6));
			traderValues.add(traderRSET.getString(7));
			traderValues.add(traderRSET.getString(8));
			traderValues.add(traderRSET.getString(9));
			traderValues.add(traderRSET.getString(10));
			traderValues.add(traderRSET.getString(11));

         return traderValues;
      }else{
         List<Object> returnValues = new ArrayList<Object>();

         returnValues.add("invalid login");

         return returnValues;
      }
   }
}
