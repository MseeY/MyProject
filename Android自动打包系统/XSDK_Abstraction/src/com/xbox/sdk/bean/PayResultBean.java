package com.xbox.sdk.bean;

public class PayResultBean {
	private String extension;
	private String productID;
	private String productName;
	private String isPaySuccess;

	public String getIsPaySuccess() {
		return isPaySuccess;
	}

	public void setIsPaySuccess(String isPaySuccess) {
		this.isPaySuccess = isPaySuccess;
	}

	public String getExtension() {
		return this.extension;
	}

	public String getProductID() {
		return this.productID;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setExtension(String paramString) {
		this.extension = paramString;
	}

	public void setProductID(String paramString) {
		this.productID = paramString;
	}

	public void setProductName(String paramString) {
		this.productName = paramString;
	}
}
