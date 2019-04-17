package com.xbox.sdk.verify;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

import android.util.Log;

import com.xbox.sdk.XSDK;
import com.xbox.sdk.bean.LoginResultBean;
import com.xbox.sdk.bean.XPayBean;
import com.xbox.sdk.utils.XHttpUtils;

public class XVerify {
	public static String loginAuth(LoginResultBean resultBean){
		try {
			JSONObject json1 = new JSONObject();
			json1.putOpt("token", resultBean.getToken());
			json1.putOpt("userid", resultBean.getUserid());
			json1.putOpt("oauth_token_secret",resultBean.getOauth_token_secret());
			json1.putOpt("openid", resultBean.getOpenId());
			json1.putOpt("type", resultBean.getType());
			json1.putOpt("openkey", resultBean.getOpenkey());
			json1.putOpt("channel", XSDK.getInstance().getCurrChannel());
			byte[] data1 = AES256.encrypt(json1.toString().getBytes(), AES256.initkey());
			String message = Base64.encode(data1);
			String msg1 = message.replace("+", "%2B");
			Map<String, String> map = new HashMap<String, String>();
			map.put("data", msg1);
			map.put("appid", XSDK.getInstance().getAppID());
			map.put("time", System.currentTimeMillis()+"");
			
			Log.i("SDK", "map=============+"+map.toString());
			try {
				String result = XHttpUtils.doPost(map, XSDK.getInstance().getAuthURL());
				Log.i("SDK", "login =========="+result);
				return result;
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	public static XPayBean payAuth(XPayBean params){
		HashMap<String, String> payInfo = new HashMap<String, String>();
		try {
			JSONObject obj = new JSONObject();
			obj.put("channelid", XSDK.getInstance().getCurrChannel());
			obj.put("userId", XSDK.getInstance().getSDKUserID());
			obj.put("goodstNo", params.getProductId());
			obj.put("price", params.getPrice());
			obj.put("note1", XSDK.getInstance().getNoteOne());
			obj.put("note2", params.getExtend());
			obj.put("appSerialNumber", params.getOrderID());
			obj.put("nickname", params.getRoleName());
			obj.put("serverid", params.getServerId());
			obj.put("goodsName", params.getProductName());
			obj.put("goodsNumber", params.getBuyNum());
			obj.put("extend", XSDK.getInstance().getNoteOne());
			String message = obj.toString();
			Log.i("SDK", "message=" + message);
			byte[] data = AES256.encrypt(message.getBytes(),AES256.initkey());
			message = Base64.encode(data);
			message = message.replace("+", "%2B");
			String preSign = XSDK.getInstance().getAppID() + message+ XSDK.getInstance().getAppKey();
			String sign = MD5Encrypt.MD5Encode(preSign);
			payInfo.put("appid", XSDK.getInstance().getAppID());
			payInfo.put("message", message);
			payInfo.put("sign", sign);
			try {
				String result = XHttpUtils.doPost(payInfo,XSDK.getInstance().getPayCheckUrl());
				Log.i("SDK", "保存结果："+result);
				JSONObject objResult = new JSONObject(result);
				String status = objResult.getString("status");
				if (status.equals("1")) {
					String orderNo = objResult.optString("orderNo");
					String userid = objResult.optString("userid");
					Log.i("SDK", "payBean= "+orderNo+";;;;"+userid);
					params.setOrderID(orderNo);
					params.setUserid(userid);
					return params;
				}
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
}
