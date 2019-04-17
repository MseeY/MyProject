package com.xbox.sdk.bean;

public class LoginResultBean {
	private String extension;
	private String userid;
	private String token;
	private String oauth_token_secret;
	//以下是应用宝需要的参数
	private String openId;
	private String openkey;
	private String type;
	
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public String getOpenkey() {
		return openkey;
	}
	public void setOpenkey(String openkey) {
		this.openkey = openkey;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getOauth_token_secret() {
		return oauth_token_secret;
	}
	public void setOauth_token_secret(String oauth_token_secret) {
		this.oauth_token_secret = oauth_token_secret;
	}
	
	
}
