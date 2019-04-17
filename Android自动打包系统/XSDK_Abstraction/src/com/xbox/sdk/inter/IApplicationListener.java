package com.xbox.sdk.inter;
import android.content.Context;
import android.content.res.Configuration;
public abstract interface IApplicationListener {
	public abstract void onProxyAttachBaseContext(Context paramContext);
	public abstract void onProxyConfigurationChanged(Configuration paramConfiguration);
	public abstract void onProxyCreate();
}