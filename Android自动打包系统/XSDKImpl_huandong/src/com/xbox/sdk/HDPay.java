package com.xbox.sdk;
import android.app.Activity;
import android.util.Log;

import com.xbox.sdk.bean.XPayBean;
import com.xbox.sdk.inter.IPay;

public class HDPay implements IPay{

	@Override
	public boolean isSupportMethod(String paramString) {
		// TODO Auto-generated method stub
		return false;
	}
	
	public HDPay(Activity paramActivity) {
		
	}

	@Override
	public void pay(final XPayBean paramPayParams) {
		// TODO Auto-generated method stub
		Log.i("SDK", "pay 执行了");
		XSDK.getInstance().getContext().runOnUiThread(new Runnable() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				HDSDK.getInstance().pay(paramPayParams);
			}
		});
	}
}
