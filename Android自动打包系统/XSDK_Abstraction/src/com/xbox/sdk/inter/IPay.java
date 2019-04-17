package com.xbox.sdk.inter;

import com.xbox.sdk.bean.XPayBean;

public abstract interface IPay extends IPlugin {
	public static final int PLUGIN_TYPE = 2;

	public abstract void pay(XPayBean paramPayParams);
}
