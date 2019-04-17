package com.xbox.test;

import java.util.Random;

import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.Toast;

import com.huandong.shenji3d.nearme.gamecenter.R;
import com.xbox.sdk.XSDK;
import com.xbox.sdk.bean.InitResultBean;
import com.xbox.sdk.bean.LoginResultBean;
import com.xbox.sdk.bean.PayResultBean;
import com.xbox.sdk.bean.XPayBean;
import com.xbox.sdk.bean.XRoleBean;
import com.xbox.sdk.inter.IXSDKListener;
import com.xbox.sdk.plugin.XPay;
import com.xbox.sdk.plugin.XUser;

public class MainActivity1 extends Activity {

	public static final String CALLBACK_AUTH = "OnAuthSuc";
	public static final String CALLBACK_GAMEOBJECT_NAME = "(sdk_callback)";
	public static final String CALLBACK_INIT = "OnInitSuc";
	public static final String CALLBACK_LOGOUT = "OnSDKLogout";
	public static final String CALLBACK_SDK_LOGIN = "OnSDKLoginSuc";
	public static final String CALLBACK_SWITCH_LOGIN = "OnSDKSwitchAccount";
	public static final String TAG = "SDK";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main1);
		XSDK.getInstance().setSDKListener(new IXSDKListener() {

			@Override
			public void onSwitchAccount(String paramString) {
				// TODO Auto-generated method stub
				showToast("onSwitchAccount---have param");
			}

			@Override
			public void onSwitchAccount() {
				// TODO Auto-generated method stub
				showToast("onSwitchAccount---");
			}

			@Override
			public void onResult(int paramInt, String paramString) {
				// TODO Auto-generated method stub
			}

			@Override
			public void onPayResult(PayResultBean paramPayResult) {
				// TODO Auto-generated method stub
				showToast("resultCode:"+paramPayResult.getIsPaySuccess()+"-------resultMsg:"+paramPayResult.getExtension());
			}

			@Override
			public void onLogout() {
				// TODO Auto-generated method stub
				showToast("onLogout---");
			}

			@Override
			public void onInitResult(InitResultBean paramInitResult) {
				// TODO Auto-generated method stub
				showToast("resultCode:"+paramInitResult.getIsInitSuccess()+"-------resultMsg:"+paramInitResult.getExtension());
			}

			@Override
			public void onAuthResult(String paramToken) {
				// TODO Auto-generated method stub
				showToast("onAuthResult=="+paramToken);
			}

			@Override
			public void onLoginResult(LoginResultBean paramLoginResult) {
				// TODO Auto-generated method stub
			}
		});
		XSDK.getInstance().onCreate(this);
		Button login = (Button) findViewById(R.id.login);
		login.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				login();
			}
		});
		
//		7ca7fc7eb1304b558BAAAAD|6|6 元|1|1|100003|2|yuan|null|246942
		
//		payBean.setOrderId(payInfo[0]);
//		payBean.setOrderPrice(payInfo[1]);
//		payBean.setOrderTitle(payInfo[2]);
//		payBean.setProductId(payInfo[3]);
//		payBean.setProductCount(payInfo[4]);
//		payBean.setRoleId(payInfo[5]);
//		payBean.setZoneId(payInfo[6]);
//		payBean.setRoleName(payInfo[7]);
//		payBean.setNoteOne("17");
//		payBean.setNoteTwo(payInfo[8]);
//		payBean.setUserId(payInfo[9]);
		Button pay = (Button) findViewById(R.id.pay);
		pay.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				JSONObject json = new JSONObject();
				try {
					json.putOpt("productId", "1");
					json.putOpt("productName", "60元宝");
					json.putOpt("productDesc", "6元");
					json.putOpt("paramPrice", "6");
					json.putOpt("buyNum", "1");
					json.putOpt("coinNum", "1");
					json.putOpt("paramZoneId", "1");
					json.putOpt("serverName", "魔兽一区");
					json.putOpt("paramRoleId", "10");
					json.putOpt("roleName", "好人");
	        		Random r = new Random();
	        		int nextInt = r.nextInt(10000);
					json.putOpt("paramBillNo","9ca7d741-6000-4c68-a18f-"+String.valueOf(nextInt));
					json.putOpt("roleLevel", "1");
					json.putOpt("vip", "12");
					json.putOpt("userid", "312");
					
//					payBean.setUserId("2312312");
//					payBean.setExchangeRate("1");
//					payBean.setOrderPrice("1");
//					payBean.setOrderId("9ca7d741-6000-4c68-a18f-95cdfcffe08d");
//					payBean.setProductId("1");
//					payBean.setProductCount("35");
//					payBean.setOrderTitle("100元宝");
//					payBean.setRoleId("e904e50f0c049ebe2fa99ddb172354d6");
//					payBean.setRoleName("sadfdf");
//					payBean.setZoneId("1");
//					payBean.setPayCallBackUrl("http://lzzg.talkyun.com.cn/Orders/Pay/CallBack/360");
//					payBean.setAppName("我的三国");
//					payBean.setAppKey("27d7a59844aa83e97ca32f4db9d2b524");
//					payBean.setNoteOne("1");
//					payBean.setNoteTwo("");
//					payBean.setAppPrivateKey("c49d7aadc42eba752bd9410eaaabd30f");
//					payBean.setRoleLevel("1");
					
					pay(json.toString());
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// pay(payJson);
			}
		});

		Button intogameupload = (Button) findViewById(R.id.intogameupload);
		intogameupload.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				exit();
			}
		});
		Button uplevel = (Button) findViewById(R.id.uplevel);
		uplevel.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				JSONObject json = new JSONObject();
				try {
					json.putOpt("dataType", XRoleBean.TYPE_ENTER_GAME);
					json.putOpt("roleID", "60");
					json.putOpt("roleName", "6元");
					json.putOpt("roleLevel", "6");
					json.putOpt("serverID", "1");
					json.putOpt("serverName", "欢动");
					json.putOpt("moneyNum", "3");
					uploadRoleInfo(json.toString());
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		});
		Button createrole = (Button) findViewById(R.id.createrole);
		createrole.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				JSONObject json = new JSONObject();
				try {
					json.putOpt("dataType", XRoleBean.TYPE_CREATE_ROLE);
					json.putOpt("roleID", "60元宝");
					json.putOpt("roleName", "6元");
					json.putOpt("roleLevel", "6");
					json.putOpt("serverID", "1");
					json.putOpt("serverName", "欢动");
					json.putOpt("moneyNum", "3");
					uploadRoleInfo(json.toString());
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		});

	}

	public void sendCallback(String paramString1, String paramString2) {
		if (paramString2 == null){
			paramString2 = "";
		}
		//u3d发送给游戏
//		UnityPlayer.UnitySendMessage("(sdk_callback)", paramString1,paramString2);
	}

	// 获取渠道编号
	public String getChannelID() {
		return XSDK.getInstance().getCurrChannel();
	}

	@Override
	protected void onStart() {
		// TODO Auto-generated method stub
		XSDK.getInstance().onStart();
		super.onStart();
	}

	@Override
	protected void onRestart() {
		// TODO Auto-generated method stub
		XSDK.getInstance().onRestart();
		super.onRestart();
	}

	@Override
	protected void onDestroy() {
		// TODO Auto-generated method stub
		XSDK.getInstance().onDestroy();
		super.onDestroy();
	}

	@Override
	protected void onStop() {
		// TODO Auto-generated method stub
		XSDK.getInstance().onStop();
		super.onStop();
	}

	@Override
	protected void onPause() {
		// TODO Auto-generated method stub
		XSDK.getInstance().onPause();
		super.onPause();
	}

	@Override
	protected void onResume() {
		// TODO Auto-generated method stub
		XSDK.getInstance().onResume();
		super.onResume();
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		// TODO Auto-generated method stub
		XSDK.getInstance().onActivityResult(requestCode, resultCode, data);
		super.onActivityResult(requestCode, resultCode, data);
	}

	@Override
	protected void onNewIntent(Intent intent) {
		// TODO Auto-generated method stub
		XSDK.getInstance().onNewIntent(intent);
		super.onNewIntent(intent);
	}

	public void exit() {
		XUser.getInstance().exit();
	}

	/**
	 * 登陆时调用
	 */
	public void login() {
		XUser.getInstance().login();
	}

	/**
	 * 上传角色信息时调用
	 * 
	 * @param roleJson
	 *            角色信息
	 */
	public void uploadRoleInfo(String roleJson) {
		XRoleBean parseRoleInfo = parseRoleInfo(roleJson);
		XUser.getInstance().uploadRoleInfo(parseRoleInfo);
	}

	/**
	 * 支付时调用
	 * 
	 * @param payJson
	 *            支付信息
	 */
	public void pay(String payJson) {
		XPayBean parsePayInfo = parsePayInfo(payJson);
		XPay.getInstance().pay(parsePayInfo);
	}

	private XRoleBean parseRoleInfo(String roleJson) {
		XRoleBean roleBean = new XRoleBean();
		try {
			JSONObject jsonObject = new JSONObject(roleJson);
			roleBean.setDataType(jsonObject.optString("dataType"));
			roleBean.setRoleID(jsonObject.getString("roleID"));
			roleBean.setRoleName(jsonObject.getString("roleName"));
			roleBean.setRoleLevel(jsonObject.getString("roleLevel"));
			roleBean.setServerID(jsonObject.optString("serverID"));
			roleBean.setServerName(jsonObject.getString("serverName"));
			roleBean.setMoneyNum(jsonObject.optString("moneyNum"));
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return roleBean;
	}

	private XPayBean parsePayInfo(String payJson) {
		Log.i("SDK", payJson);
		XPayBean payBean = new XPayBean();
		try {
			JSONObject jsonObject = new JSONObject(payJson);
			payBean.setProductId(jsonObject.getString("productId"));
			payBean.setProductName(jsonObject.getString("productName"));
			payBean.setProductDesc(jsonObject.getString("productDesc"));
			payBean.setPrice(jsonObject.optString("paramPrice"));
			payBean.setRatio("0");
			payBean.setBuyNum(jsonObject.optString("buyNum"));
			payBean.setCoinNum(jsonObject.optString("coinNum"));
			payBean.setServerId(jsonObject.optString("paramZoneId"));
			payBean.setServerName(jsonObject.getString("serverName"));
			payBean.setRoleId(jsonObject.getString("paramRoleId"));
			payBean.setRoleName(jsonObject.getString("roleName"));
			payBean.setRoleLevel(jsonObject.optString("roleLevel"));
			payBean.setPayNotifyUrl("");
			payBean.setVip(jsonObject.getString("vip"));
			payBean.setOrderID(jsonObject.getString("paramBillNo"));
			payBean.setUserid(jsonObject.getString("userid"));
			payBean.setExtend("");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return payBean;
	}
	
	private void showToast(String result){
		Toast.makeText(this, result, Toast.LENGTH_LONG).show();
		Log.i(TAG, "---自动打包---"+result);
	}
}
