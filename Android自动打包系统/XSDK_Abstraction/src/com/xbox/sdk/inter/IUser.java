package com.xbox.sdk.inter;

import com.xbox.sdk.bean.XRoleBean;

public abstract interface IUser extends IPlugin {
	
	public static final int PLUGIN_TYPE = 1;

	public abstract void exit();

	public abstract void login();

	public abstract void loginCustom(String paramString);

	public abstract void logout();

	public abstract void postGiftCode(String paramString);

	public abstract void queryAntiAddiction();

	public abstract void realNameRegister();

	public abstract boolean showAccountCenter();

	public abstract void submitExtraData(XRoleBean roleBean);

	public abstract void switchLogin();
}
