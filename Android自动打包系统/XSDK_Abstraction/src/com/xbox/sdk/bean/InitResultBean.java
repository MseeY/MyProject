package com.xbox.sdk.bean;

public class InitResultBean {
	private String extension;
	private int isInitSuccess;//1为成功 0为失败
	
	public InitResultBean() {
		// TODO Auto-generated constructor stub
	}

	public int getIsInitSuccess() {
		return isInitSuccess;
	}

	public void setIsInitSuccess(int isInitSuccess) {
		this.isInitSuccess = isInitSuccess;
	}

	public InitResultBean(boolean paramBoolean, String paramString,int paramSuccess) {
		this.extension = paramString;
		this.isInitSuccess = paramSuccess;
	}

	public String getExtension() {
		return this.extension;
	}

	public void setExtension(String paramString) {
		this.extension = paramString;
	}
}
