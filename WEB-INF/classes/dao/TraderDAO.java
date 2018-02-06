package dao;

import java.sql.*;
import java.util.*;
import project.Trader;

public class TraderDAO{

   private String dbUrl,
      dbUser,
      dbPass;

   private Connection dbConnection;

   public TraderDAO(String dbUrl, String dbUser, String dbPass){
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

   public boolean insert(Trader newTrader, String user, String pass) throws SQLException{
      String insertQuery = "INSERT INTO Trader VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

      connect();
      PreparedStatement insertSTAT = dbConnection.prepareStatement(insertQuery);

      String dob = newTrader.getDob().get(Calendar.YEAR) + "-"
      + ((newTrader.getDob().get(Calendar.MONTH)+1)<10?("0" + (newTrader.getDob().get(Calendar.MONTH)+1)):(newTrader.getDob().get(Calendar.MONTH)+1)) + "-"
      + ((newTrader.getDob().get(Calendar.MONTH))<10?("0" + (newTrader.getDob().get(Calendar.MONTH))):(newTrader.getDob().get(Calendar.DATE)));

      insertSTAT.setString(1, newTrader.getId());
      insertSTAT.setString(2, newTrader.getTitle());
      insertSTAT.setString(3, newTrader.getFname());
      insertSTAT.setString(4, newTrader.getMname());
      insertSTAT.setString(5, newTrader.getLname());
      insertSTAT.setString(6, String.valueOf(newTrader.getGender()));
      insertSTAT.setString(7, newTrader.getIdproof());
      insertSTAT.setString(8, dob);
      insertSTAT.setString(9, newTrader.getPhone());
      insertSTAT.setString(10, newTrader.getEmail());
      insertSTAT.setString(11, newTrader.getAddress());
      insertSTAT.setString(12, user);
      insertSTAT.setString(13, pass);

      boolean inserted = insertSTAT.executeUpdate()==0?false:true;

      disconnect();

      return inserted;
   }

   public String getNextId() throws SQLException{
      String newId = "trd";

      String getQuery = "SELECT COUNT(*) FROM trader";

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
