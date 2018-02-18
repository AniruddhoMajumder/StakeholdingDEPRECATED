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

   public double getRemainingBalance(String TraderId) throws SQLException{
      String queryString = "SELECT balance FROM transaction_party WHERE trader_id = '" + TraderId + "'";

      TransactionPartyDAO tpdao = new TransactionPartyDAO(dbUrl, dbUser, dbPass);
      connect();

      Statement balanceSTAT = dbConnection.createStatement();
      ResultSet balanceRSET = balanceSTAT.executeQuery(queryString);

      if(balanceRSET.next()){
         double ret = balanceRSET.getDouble(1);
         disconnect();
         return ret;
      }else{
         disconnect();
         return 0;
      }
   }

   public List<String> getInvestments(String TraderId) throws SQLException{
      TransactionPartyDAO tpdao = new TransactionPartyDAO(dbUrl, dbUser, dbPass);

      String queryString = "SELECT DISTINCT seller_id FROM transaction WHERE buyer_id = '" + tpdao.getTraderTpid(TraderId) + "'";

      List<String> companyIds = new ArrayList<String>();
      connect();

      Statement getSellersSTAT = dbConnection.createStatement();
      ResultSet getSellersRSET = getSellersSTAT.executeQuery(queryString);

      while(getSellersRSET.next()){
         if(tpdao.isCompany(getSellersRSET.getString(1))){
            companyIds.add(tpdao.getRealId(getSellersRSET.getString(1)));
         }
      }

      disconnect();
      return companyIds;
   }

   public double getInvestedNo(String TraderId, String CompanyId) throws SQLException{
      TransactionPartyDAO tpdao = new TransactionPartyDAO(dbUrl, dbUser, dbPass);

      String queryString = "SELECT number FROM transaction WHERE buyer_id = '" + tpdao.getTraderTpid(TraderId) + "' and seller_id = '" + tpdao.getCompanyTpid(CompanyId) + "'";

      int ret = 0;
      connect();
      Statement boughtSTAT = dbConnection.createStatement();
      ResultSet boughtRSET = boughtSTAT.executeQuery(queryString);

      while(boughtRSET.next()){
         ret += boughtRSET.getInt(1);
      }
      disconnect();

      queryString = "SELECT t.number FROM transaction t, securities s WHERE s.id = t.security_id and s.company_id = '" + CompanyId +"' and t.seller_id = '" + tpdao.getTraderTpid(TraderId) + "'";

      connect();
      Statement soldSTAT = dbConnection.createStatement();
      ResultSet soldRSET = soldSTAT.executeQuery(queryString);

      while(soldRSET.next()){
         ret -= soldRSET.getInt(1);
      }
      disconnect();
      return ret;
   }

   public double getTotalInvestment(String TraderId) throws SQLException{
      TransactionPartyDAO tpdao = new TransactionPartyDAO(dbUrl, dbUser, dbPass);

      String queryString = "SELECT amount FROM transaction WHERE buyer_id = '" + tpdao.getTraderTpid( TraderId ) + "'";

      double ret = 0;
      connect();
      Statement boughtSTAT = dbConnection.createStatement();
      ResultSet boughtRSET = boughtSTAT.executeQuery(queryString);

      while(boughtRSET.next()){
         ret += boughtRSET.getDouble(1);
      }
      disconnect();

      queryString = "SELECT amount FROM transaction WHERE seller_id = '" + tpdao.getTraderTpid( TraderId ) + "'";

      connect();
      Statement soldSTAT = dbConnection.createStatement();
      ResultSet soldRSET = soldSTAT.executeQuery(queryString);

      while(soldRSET.next()){
         ret -= soldRSET.getInt(1);
      }
      disconnect();
      return ret;
   }

}
