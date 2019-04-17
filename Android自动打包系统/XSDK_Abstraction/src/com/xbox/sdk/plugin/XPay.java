package com.xbox.sdk.plugin;

import android.os.AsyncTask;
import android.util.Log;
import com.xbox.sdk.PluginFactory;
import com.xbox.sdk.XSDK;
import com.xbox.sdk.bean.XPayBean;
import com.xbox.sdk.impl.DefaultPay;
import com.xbox.sdk.inter.IPay;
import com.xbox.sdk.verify.XVerify;

public class XPay {
	private static XPay instance;
	private IPay payPlugin;

	public static XPay getInstance() {
		if (instance == null)
			instance = new XPay();
		return instance;
	}

	public void init() {
		Log.i("SDK", "Xpay  init执行了");
		this.payPlugin = (IPay) PluginFactory.getInstance().initPlugin("2");
		if (this.payPlugin == null) {
			Log.i("SDK", "payPlugin=="+payPlugin);
			 this.payPlugin = new DefaultPay();
		}
	}

	public boolean isSupport(String paramString) {
		if (this.payPlugin == null)
			return false;
		return this.payPlugin.isSupportMethod(paramString);
	}

	public void pay(XPayBean paramPayParams) {
		Log.i("SDK", "Xpay中的pay执行了吗="+payPlugin);
		if (this.payPlugin == null){
			return;
		}
		
		if(payPlugin instanceof DefaultPay){
			this.payPlugin.pay(paramPayParams);
			return;
		}
		
		//对应用宝的特殊处理
		if("91".equals(XSDK.getInstance().getCurrChannel())||"69".equals(XSDK.getInstance().getCurrChannel())){
			this.payPlugin.pay(paramPayParams);
		}else{
			new PayTask().execute(paramPayParams);
		}
	}
	
	private void onPayAuthResult(XPayBean payInfo){
		if(payInfo!=null){
			this.payPlugin.pay(payInfo);
		}
	}
	
	class PayTask extends AsyncTask<XPayBean, Void, XPayBean> {

		@Override
		protected XPayBean doInBackground(XPayBean... params) {
			// TODO Auto-generated method stub
			Log.i("SDK", "doInBackground = "+params);
			return XVerify.payAuth(params[0]);
		}

		@Override
		protected void onPostExecute(XPayBean result) {
			// TODO Auto-generated method stub
			super.onPostExecute(result);
			Log.i("SDK", result+"----------------------------------------------------");
			onPayAuthResult(result);
		}

		@Override
		protected void onPreExecute() {
			// TODO Auto-generated method stub
			super.onPreExecute();
		}
	}

}
