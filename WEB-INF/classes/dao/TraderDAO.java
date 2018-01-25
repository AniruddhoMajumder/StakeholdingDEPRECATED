package dao;

import project.Trader;
import java.util.*;
import java.sql.*;

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

	public boolean insertTrader(Trader newTrader, String userId, String pass) throws SQLException{
		String insertQuery = "INSERT INTO trader VALUES (?, ?, ?, ?, ?, ?, ?, ?, true)";

		String id = getNewId();

		connect();

		PreparedStatement insertSTAT = dbConnection.prepareStatement(insertQuery);

		insertSTAT.setString(1, id);
		insertSTAT.setString(2, newTrader.getName());
		insertSTAT.setString(3, newTrader.getPhone());
		insertSTAT.setString(4, newTrader.getAddress());
		insertSTAT.setString(5, newTrader.getEmail());
		insertSTAT.setString(6, newTrader.getGovtId());
		insertSTAT.setString(7, userId);
		insertSTAT.setString(8, pass);

		boolean inserted = insertSTAT.executeUpdate() > 0;

		insertSTAT.close();
		disconnect();
		return inserted;

	}
	
	private String getNewId() throws SQLException{
		String newID = "trd";

		connect();

		String queryString = "SELECT count(id) FROM trader";

		Statement statement = dbConnection.createStatement();
		ResultSet resultSet = statement.executeQuery(queryString);

		resultSet.next();
		String idNo = resultSet.getString(1);
		idNo = (Integer.parseInt(idNo) + 1) + "";

		for(int i=5; i>idNo.length(); i--){
			newID += "0";
		}

		newID += idNo;

		return newID;
	}
	
}