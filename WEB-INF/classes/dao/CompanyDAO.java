package dao;

import project.Company;
import java.util.*;
import java.sql.*;

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

	public boolean insertCompany(Company newCompany, String userId, String pass) throws SQLException{
		String insertQuery = "INSERT INTO company VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, true)";

		String id = getNewId();

		connect();

		PreparedStatement insertSTAT = dbConnection.prepareStatement(insertQuery);

		insertSTAT.setString(1, id);
		insertSTAT.setString(2, newCompany.getCompanyName());
		insertSTAT.setString(3, (newCompany.getSharesRegistered() + ""));
		insertSTAT.setString(4, (newCompany.getSharesIssued() + ""));
		insertSTAT.setString(5, (newCompany.getSharePrice() + ""));
		insertSTAT.setString(6, newCompany.getMarketLicence());
		insertSTAT.setString(7, newCompany.getPhone());
		insertSTAT.setString(8, newCompany.getEmail());
		insertSTAT.setString(9, newCompany.getAddress());
		insertSTAT.setString(10, userId);
		insertSTAT.setString(11, pass);

		boolean inserted = insertSTAT.executeUpdate() > 0;

		insertSTAT.close();
		disconnect();
		return inserted;

	}
	
	private String getNewId() throws SQLException{
		String newID = "cmp";

		connect();

		String queryString = "SELECT count(id) FROM company";

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