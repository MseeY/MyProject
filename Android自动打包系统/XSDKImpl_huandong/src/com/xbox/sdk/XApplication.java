package com.xbox.sdk;
import android.content.Context;
import android.content.res.Configuration;

import com.xbox.sdk.HDApplication;
import com.xbox.sdk.XSDK;

public class XApplication extends HDApplication {
	
	@Override
	public void onCreate() {
		// TODO Auto-generated method stub
		super.onCreate();
		XSDK.getInstance().onAppCreate(this);
	}
	
	@Override
	protected void attachBaseContext(Context base) {
		// TODO Auto-generated method stub
		super.attachBaseContext(base);
		XSDK.getInstance().onAppAttachBaseContext(this, base);
	}
	
	@Override
	public void onConfigurationChanged(Configuration newConfig) {
		// TODO Auto-generated method stub
		super.onConfigurationChanged(newConfig);
		XSDK.getInstance().onAppConfigurationChanged(this, newConfig);
	}

}
