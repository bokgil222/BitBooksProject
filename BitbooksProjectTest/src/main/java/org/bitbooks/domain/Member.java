package org.bitbooks.domain;

public class Member {

	private String userName = "hongkd";
	
	private String password = "1234";

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}