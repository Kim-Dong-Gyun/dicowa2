package com.dicowa.board.domain;

import java.util.Date;

public class MemberDto {
	private Integer uno;
	private String userId;
	private String userPwd;
	private String userName;
	private String userPhone;
	private String userEmail;
	private Date reg_date;
	private String userGender;
	
	public Integer getUno() {
		return uno;
	}
	public void setUno(Integer uno) {
		this.uno = uno;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	@Override
	public String toString() {
		return "MemberDto [uno=" + uno + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userPhone=" + userPhone + ", userEmail=" + userEmail + ", reg_date=" + reg_date + ", userGender="
				+ userGender + "]";
	}
	
	
	
	
}
