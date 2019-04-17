package com.xbox.sdk.impl;

import android.widget.Toast;

import com.xbox.sdk.XSDK;
import com.xbox.sdk.bean.XPayBean;
import com.xbox.sdk.inter.IPay;

public class DefaultPay implements IPay{

	@Override
	public boolean isSupportMethod(String paramString) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void pay(XPayBean paramPayParams) {
		// TODO Auto-generated method stub
		Toast.makeText(XSDK.getInstance().getContext(), "调用[支付接口]接口成功，PayParams中的参数，其他的请都赋值，最后还需要经过打包工具来打出最终的渠道包", 1).show();
	}

}
