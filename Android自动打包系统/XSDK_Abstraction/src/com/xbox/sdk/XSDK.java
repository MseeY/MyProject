package com.xbox.sdk;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.xbox.sdk.bean.InitResultBean;
import com.xbox.sdk.bean.LoginResultBean;
import com.xbox.sdk.bean.PayResultBean;
import com.xbox.sdk.inter.IActivityCallback;
import com.xbox.sdk.inter.IApplicationListener;
import com.xbox.sdk.inter.IXSDKListener;
import com.xbox.sdk.plugin.XPay;
import com.xbox.sdk.plugin.XUser;
import com.xbox.sdk.verify.XVerify;

import android.app.Activity;
import android.app.Application;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.AsyncTask;
import android.os.Bundle;

public class XSDK {

	private Activity mActivity;
	private static XSDK instance;
	private IApplicationListener mApplicationListener;
	private IXSDKListener mXSDKListener;
	private IActivityCallback mActivityCallback;
	private SDKParams developInfo;
	private Bundle metaData;
	private ProgressDialog dialog = null;
	private List<IApplicationListener> applicationListeners = new ArrayList<IApplicationListener>();
	private String userid;

	public static XSDK getInstance() {
		if (instance == null)
			instance = new XSDK();
		return instance;
	}

	public Activity getContext() {
		return this.mActivity;
	}

	public void setActivityCallback(IActivityCallback paramIActivityCallback) {
		this.mActivityCallback = paramIActivityCallback;
	}

	public void setSDKListener(IXSDKListener paramIXSDKListener) {
		this.mXSDKListener = paramIXSDKListener;
	}

	private void showProgressDialog(Activity paramActivity, String paramString) {
		if (this.dialog != null)
			return;
		this.dialog = new ProgressDialog(paramActivity);
		this.dialog.setIndeterminate(true);
		this.dialog.setCancelable(true);
		this.dialog.setMessage(paramString);
		this.dialog.setOnCancelListener(new DialogInterface.OnCancelListener() {
			public void onCancel(DialogInterface paramAnonymousDialogInterface) {
			}
		});
		this.dialog.show();
	}

	private void hideProgressDialog(Activity paramActivity) {
		if (this.dialog == null)
			return;
		this.dialog.dismiss();
		this.dialog = null;
	}

	public String getAuthURL() {
		if ((this.developInfo == null)
				|| (!this.developInfo.contains("XSDK_AUTH_URL"))) {
			return null;
		}
		return this.developInfo.getString("XSDK_AUTH_URL");
	}

	public String getCurrChannel() {
		if ((this.developInfo == null)
				|| (!this.developInfo.contains("XSDK_Channel")))
			return null;
		return this.developInfo.getString("XSDK_Channel");
	}

	public String getAppID() {
		if ((this.developInfo == null)
				|| (!this.developInfo.contains("XSDK_APPID")))
			return null;
		return this.developInfo.getString("XSDK_APPID");
	}

	public String getAppKey() {
		if ((this.developInfo == null)
				|| (!this.developInfo.contains("XSDK_APPKEY")))
			return null;
		return this.developInfo.getString("XSDK_APPKEY");
	}

	public String getPayCheckUrl() {
		if ((this.developInfo == null)
				|| (!this.developInfo.contains("XSDK_PAY_CHECK_URL")))
			return null;
		return this.developInfo.getString("XSDK_PAY_CHECK_URL");
	}

	public String getNoteOne() {
		if ((this.developInfo == null)
				|| (!this.developInfo.contains("XSDK_NOTEONE")))
			return null;
		return this.developInfo.getString("XSDK_NOTEONE");
	}

	public SDKParams getSDKParams() {
		return this.developInfo;
	}

	public String getSDKUserID() {
		return this.userid;
	}

	private boolean isAuth() {
		return getAuthURL() != null;
	}

	class AuthTask extends AsyncTask<LoginResultBean, Void, String> {

		@Override
		protected String doInBackground(LoginResultBean... params) {
			// TODO Auto-generated method stub
			return XVerify.loginAuth(params[0]);
		}

		@Override
		protected void onPostExecute(String result) {
			// TODO Auto-generated method stub
			super.onPostExecute(result);
			onAuthResult(result);
			hideProgressDialog(getContext());
		}

		@Override
		protected void onPreExecute() {
			// TODO Auto-generated method stub
			super.onPreExecute();
			showProgressDialog(getContext(), "正在进行登录认证，请稍候...");
		}
	}

	public void onAppAttachBaseContext(Application paramApplication,
			Context paramContext) {
		if (applicationListeners.size() != 0 || applicationListeners != null) {
			applicationListeners.clear();
		}
		PluginFactory.getInstance().loadPluginInfo(paramContext);
		developInfo = PluginFactory.getInstance().getSDKParams(paramContext);
		metaData = PluginFactory.getInstance().getMetaData(paramContext);
		if (metaData != null) {
			if (metaData.containsKey("X_APPLICATION_PROXY_NAME")) {
				String appStr1 = metaData.getString("X_APPLICATION_PROXY_NAME");
				String[] split = appStr1.split(",");
				try {
					for (String str : split) {
						mApplicationListener = (IApplicationListener) Class.forName(str).newInstance();
						mApplicationListener.onProxyAttachBaseContext(paramContext);
						applicationListeners.add(mApplicationListener);
					}
				} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	public void onAppCreate(Application paramApplication) {
		if (applicationListeners.size() > 0) {
			for (IApplicationListener mApplicationListener : applicationListeners) {
				mApplicationListener.onProxyCreate();
			}
		}
	}

	public void onAppConfigurationChanged(Application paramApplication,Configuration paramConfiguration) {
		if (applicationListeners.size() > 0) {
			for (IApplicationListener mApplicationListener : applicationListeners) {
				mApplicationListener.onProxyConfigurationChanged(paramConfiguration);
			}
		}
	}

	private void onAuthResult(String paramToken) {
		// TODO Auto-generated method stub
		this.mXSDKListener.onAuthResult(paramToken);
		try {
			JSONObject jsonObject = new JSONObject(paramToken);
			userid = jsonObject.getString("userid");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void onInitResult(InitResultBean paramInitResult) {
		// TODO Auto-generated method stub
		this.mXSDKListener.onInitResult(paramInitResult);
	}

	public void onLoginResult(LoginResultBean paramString) {
		// TODO Auto-generated method stub
		if (isAuth()) {
			new AuthTask().execute(paramString);
		}
		this.mXSDKListener.onLoginResult(paramString);
	}

	public void onLogout() {
		// TODO Auto-generated method stub
		this.mXSDKListener.onLogout();
	}

	public void onPayResult(PayResultBean paramPayResult) {
		// TODO Auto-generated method stub
		this.mXSDKListener.onPayResult(paramPayResult);
	}

	public void onResult(int paramInt, String paramString) {
		// TODO Auto-generated method stub
		this.mXSDKListener.onResult(paramInt, paramString);
	}

	public void onSwitchAccount() {
		// TODO Auto-generated method stub
		this.mXSDKListener.onSwitchAccount();
	}

	public void onSwitchAccount(String paramString) {
		// TODO Auto-generated method stub
		this.mXSDKListener.onSwitchAccount(paramString);
	}

	/**************************************************************************************************************/

	public void onActivityResult(int paramInt1, int paramInt2,
			Intent paramIntent) {
		// TODO Auto-generated method stub
		if (mActivityCallback != null) {
			this.mActivityCallback.onActivityResult(paramInt1, paramInt2,paramIntent);
		}

	}

	public void onBackPressed() {
		// TODO Auto-generated method stub
		if (mActivityCallback != null) {
			this.mActivityCallback.onBackPressed();
		}
	}

	public void onCreate(Activity activity) {
		// TODO Auto-generated method stub
		this.mActivity = activity;
		try {
			XUser.getInstance().init();
			XPay.getInstance().init();
			if (mActivityCallback != null) {
				this.mActivityCallback.onCreate();
			}
		} catch (Exception localException) {
			localException.printStackTrace();
		}
	}

	public void onDestroy() {
		// TODO Auto-generated method stub
		if (mActivityCallback != null) {
			this.mActivityCallback.onDestroy();
		}
	}

	public void onNewIntent(Intent paramIntent) {
		// TODO Auto-generated method stub
		if (mActivityCallback != null) {
			this.mActivityCallback.onNewIntent(paramIntent);
		}
	}

	public void onPause() {
		// TODO Auto-generated method stub
		if (mActivityCallback != null) {
			this.mActivityCallback.onPause();
		}
	}

	public void onRestart() {
		// TODO Auto-generated method stub
		if (mActivityCallback != null) {
			this.mActivityCallback.onRestart();
		}
	}

	public void onResume() {
		// TODO Auto-generated method stub
		if (mActivityCallback != null) {
			this.mActivityCallback.onResume();
		}
	}

	public void onStart() {
		// TODO Auto-generated method stub
		if (mActivityCallback != null) {
			this.mActivityCallback.onStart();
		}
	}

	public void onStop() {
		// TODO Auto-generated method stub
		if (mActivityCallback != null) {
			this.mActivityCallback.onStop();
		}
	}

}
