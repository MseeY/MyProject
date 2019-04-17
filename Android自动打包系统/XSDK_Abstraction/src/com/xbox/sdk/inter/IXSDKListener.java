package com.xbox.sdk.inter;

import com.xbox.sdk.bean.InitResultBean;
import com.xbox.sdk.bean.LoginResultBean;
import com.xbox.sdk.bean.PayResultBean;

public abstract interface IXSDKListener {
	
	public abstract void onAuthResult(String paramToken);

	public abstract void onInitResult(InitResultBean paramInitResult);

	public abstract void onLoginResult(LoginResultBean paramLoginResult);

	public abstract void onLogout();

	public abstract void onPayResult(PayResultBean paramPayResult);

	public abstract void onResult(int paramInt, String paramString);

	public abstract void onSwitchAccount();

	public abstract void onSwitchAccount(String paramString);
}
