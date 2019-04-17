package com.xbox.sdk.bean;

public class XRoleBean {
	public static final String TYPE_CREATE_ROLE = "2";
	public static final String TYPE_ENTER_GAME = "3";
	public static final String TYPE_EXIT_GAME = "5";
	public static final String TYPE_LEVEL_UP = "4";
	public static final String TYPE_SELECT_SERVER = "1";
	private String dataType;
	private String moneyNum;
	private String roleID;
	private String roleLevel;
	private String roleName;
	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getMoneyNum() {
		return moneyNum;
	}

	public void setMoneyNum(String moneyNum) {
		this.moneyNum = moneyNum;
	}

	public String getServerID() {
		return serverID;
	}

	public void setServerID(String serverID) {
		this.serverID = serverID;
	}

	private String serverID;
	private String serverName;

	public String getRoleID() {
		return this.roleID;
	}

	public String getRoleLevel() {
		return this.roleLevel;
	}

	public String getRoleName() {
		return this.roleName;
	}

	
	public String getServerName() {
		return this.serverName;
	}

	public void setRoleID(String paramString) {
		this.roleID = paramString;
	}

	public void setRoleLevel(String paramString) {
		this.roleLevel = paramString;
	}

	public void setRoleName(String paramString) {
		this.roleName = paramString;
	}

	public void setServerName(String paramString) {
		this.serverName = paramString;
	}
}
