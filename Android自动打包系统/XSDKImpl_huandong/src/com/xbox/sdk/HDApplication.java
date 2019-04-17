package com.xbox.sdk;

//import com.awo.sdk_new.MyApplication;
import com.awo.sdk_new.MyApplication;
import com.xbox.sdk.inter.IApplicationListener;

import android.app.Application;
import android.content.Context;
import android.content.res.Configuration;
import android.util.Log;

public class HDApplication extends MyApplication implements IApplicationListener{
	@Override
	public void onProxyAttachBaseContext(Context paramContext) {
		// TODO Auto-generated method stub
		Log.i("SDK", "onProxyAttachBaseContext is run ");
		super.attachBaseContext(paramContext);
	}

	@Override
	public void onProxyConfigurationChanged(Configuration paramConfiguration) {
		// TODO Auto-generated method stub
		Log.i("SDK", "onProxyConfigurationChanged is run ");
		super.onConfigurationChanged(paramConfiguration);
	}

	@Override
	public void onProxyCreate() {
		// TODO Auto-generated method stub
		Log.i("SDK", "onProxyCreate is run ");
		super.onCreate();
	}
}
