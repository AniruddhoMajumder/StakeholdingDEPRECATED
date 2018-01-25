package project;

import java.util.*;

public class Trader{
	private String id;
	private String name;
	private String phone;
	private String address;
	private String email;
	private String govtId;

	private boolean membershipActive;

	public Trader(List<Object> values){
		this.id = "-1";
		this.name = (String) values.get(0);
		this.phone = (String) values.get(1);
		this.address = (String) values.get(2);
		this.email = (String) values.get(3);
		this.govtId = (String) values.get(4);

		this.membershipActive = (boolean) values.get(5);
	}

	public String getId(){
		return this.id;
	}

	public String getName(){
		return this.name;
	}

	public String getGovtId(){
		return this.govtId;
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

	public boolean isMember(){
		return membershipActive;
	}

}