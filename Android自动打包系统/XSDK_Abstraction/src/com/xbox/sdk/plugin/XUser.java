package com.xbox.sdk.plugin;

import android.util.Log;

import com.xbox.sdk.PluginFactory;
import com.xbox.sdk.bean.XRoleBean;
import com.xbox.sdk.impl.DefaultUser;
import com.xbox.sdk.inter.IUser;

public class XUser {
	private static XUser instance;
	private IUser userPlugin;

	public static XUser getInstance() {
		if (instance == null)
			instance = new XUser();
		return instance;
	}

	public void exit() {
		if (this.userPlugin == null)
			return;
		this.userPlugin.exit();
	}

	public void init() {
		Log.i("SDK", "Xuser  init执行了");
		this.userPlugin = (IUser)PluginFactory.getInstance().initPlugin("1");
		if (this.userPlugin == null) {
			 this.userPlugin = new DefaultUser();
		}
	}

	public boolean isSupport(String paramString) {
		if (this.userPlugin == null)
			return false;
		return this.userPlugin.isSupportMethod(paramString);
	}

	public void login() {
		if (this.userPlugin == null)
			return;
		this.userPlugin.login();
	}

	public void login(String paramString) {
		if (this.userPlugin == null)
			return;
		this.userPlugin.loginCustom(paramString);
	}

	public void logout() {
		if (this.userPlugin == null)
			return;
		this.userPlugin.logout();
	}

	public void postGiftCode(String paramString) {
		if (this.userPlugin == null)
			return;
		this.userPlugin.postGiftCode(paramString);
	}

	public void showAccountCenter() {
		if (this.userPlugin == null)
			return;
		this.userPlugin.showAccountCenter();
	}
	
	public void uploadRoleInfo(XRoleBean roleInfo){
		if (this.userPlugin == null)
			return;
		this.userPlugin.submitExtraData(roleInfo);
	}

	public void switchLogin() {
		if (this.userPlugin == null)
			return;
		this.userPlugin.switchLogin();
	}
}