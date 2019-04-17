package com.xbox.sdk;

import com.xbox.sdk.adapter.XUserAdapter;
import com.xbox.sdk.bean.XRoleBean;

import android.app.Activity;
import android.util.Log;

public class HDUser extends XUserAdapter {

	private String[] supportedMethods = { "login", "switchLogin", "logout" };

	@Override
	public boolean isSupportMethod(String paramString) {
		// TODO Auto-generated method stub
		return false;
	}

	public HDUser(Activity paramActivity) {
		HDSDK.getInstance().initSDK();
	}

	@Override
	public void login() {
		// TODO Auto-generated method stub
		super.login();
		XSDK.getInstance().getContext().runOnUiThread(new Runnable() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				HDSDK.getInstance().login();
			}
		});
	}

	// public void login() {

	// }

	@Override
	public void submitExtraData(final XRoleBean roleBean) {
		// TODO Auto-generated method stub
		super.submitExtraData(roleBean);
		XSDK.getInstance().getContext().runOnUiThread(new Runnable() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				HDSDK.getInstance().upIoadInfo(roleBean);
			}
		});
	}
	
	@Override
	public void exit() {
		// TODO Auto-generated method stub
		super.exit();
		XSDK.getInstance().getContext().runOnUiThread(new Runnable() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				HDSDK.getInstance().exit();
			}
		});
	}
}
