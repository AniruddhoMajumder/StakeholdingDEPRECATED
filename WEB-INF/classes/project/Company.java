package project;

import java.util.*;

public class Company{
	private String id;
	private String companyName;
	private String marketLicence;
	private String phone;
	private String email;
	private String address;

	private int sharesRegistered;
	private int sharesIssued;

	private double sharePrice;

	private boolean membershipActive;

	public Company(List<Object> values){
		this.id = "-1";
		this.companyName = (String) values.get(0);
		this.marketLicence = (String) values.get(1);
		this.phone = (String) values.get(2);
		this.email = (String) values.get(3);
		this.address = (String) values.get(4);

		this.sharesRegistered = (int) values.get(5);
		this.sharesIssued = (int) values.get(6);

		this.sharePrice = (double) values.get(7);

		this.membershipActive = (boolean) values.get(8);
	}

	public String getId(){
		return this.id;
	}

	public String getCompanyName(){
		return this.companyName;
	}

	public String getMarketLicence(){
		return this.marketLicence;
	}

	public String getPhone(){
		return this.phone;
	}

	public String getEmail(){
		return this.email;
	}

	public String getAddress(){
		return this.address;
	}

	public int getSharesRegistered(){
		return this.sharesRegistered;
	}

	public int getSharesIssued(){
		return this.sharesIssued;
	}

	public double getSharePrice(){
		return this.sharePrice;
	}

	public boolean isMember(){
		return membershipActive;
	}

}
