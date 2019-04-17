package com.xbox.sdk;

import org.json.JSONException;
import org.json.JSONObject;

import android.content.Intent;
import android.util.Log;
import android.widget.Toast;

import com.awo.sdk_new.bean.GoodInfo;
import com.awo.sdk_new.service.FloatService;
import com.awo.sdk_new.utils.DispatcherCallback;
import com.awo.sdk_new.utils.ExitCallback;
import com.awo.sdk_new.utils.Matrix;
import com.xbox.sdk.adapter.ActivityCallbackAdapter;
import com.xbox.sdk.bean.InitResultBean;
import com.xbox.sdk.bean.LoginResultBean;
import com.xbox.sdk.bean.PayResultBean;
import com.xbox.sdk.bean.XPayBean;
import com.xbox.sdk.bean.XRoleBean;

public class HDSDK {
	private static HDSDK instance;
	private PayResultBean payResultBean;

	public static HDSDK getInstance() {
		if (instance == null)
			instance = new HDSDK();
		return instance;
	}

	public void initSDK() {
		 XSDK.getInstance().setActivityCallback(new ActivityCallbackAdapter(){
			@Override
			public void onCreate() {
				// TODO Auto-generated method stub
				Log.i("SDK", "初始化执行了。。。。。。。");
				Matrix.init(XSDK.getInstance().getContext());
				doLogout();
				InitResultBean  init = new InitResultBean();
				init.setIsInitSuccess(XCode.CODE_INIT_SUCCESS);
				init.setExtension("Init is success");
				XSDK.getInstance().onInitResult(init);
			}
			
			@Override
			public void onResume() {
				// TODO Auto-generated method stub
				Matrix.showsFloatView(XSDK.getInstance().getContext(),Matrix.LEFT_CENTER);
				
			}
			
			@Override
			public void onDestroy() {
				Log.i("SDK", "onDestroy is run");
				   Intent intentService=new Intent(XSDK.getInstance().getContext(),FloatService.class);
				   XSDK.getInstance().getContext().stopService(intentService);
			}
		 });
	}
	
	private void doLogout() {
		Matrix.logout(XSDK.getInstance().getContext(), new DispatcherCallback() {
			
			@Override
			public void onSystemExit(String result) {
			}
			@Override
			public void onFinished(String result) {
				XSDK.getInstance().onSwitchAccount();
			}
		},false);
	}
	
	public void login(){
		Matrix.doLogin(XSDK.getInstance().getContext(), new DispatcherCallback() {
			@Override
			public void onFinished(String result) {
				
				JSONObject obj;
				try {
					obj = new JSONObject(result);
					LoginResultBean resultBean = new LoginResultBean();
					resultBean.setUserid(obj.optString("userid"));
					resultBean.setToken(obj.optString("accessToken"));
					XSDK.getInstance().onLoginResult(resultBean);
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			@Override
			public void onSystemExit(String result) {
//				XSDK.getInstance().getContext().finish();
			}
		}, false);
	}
	
	public void pay(XPayBean payInfo){
		Matrix.doPay(XSDK.getInstance().getContext(), new DispatcherCallback() {
   			@Override
   			public void onFinished(String result) {
   				if(result!=null){
   					payResultBean = new PayResultBean();
 					payResultBean.setIsPaySuccess(String.valueOf(XCode.CODE_PAY_SUCCESS));
 					XSDK.getInstance().onPayResult(payResultBean);
 					XSDK.getInstance().onResult(XCode.CODE_PAY_SUCCESS,"pay is success");
   				}else{
   					payResultBean = new PayResultBean();
 					payResultBean.setIsPaySuccess(String.valueOf(XCode.CODE_PAY_FAIL));
 					XSDK.getInstance().onPayResult(payResultBean);
 					XSDK.getInstance().onResult(XCode.CODE_PAY_FAIL,"pay is fail");
   				}
   			}
   			@Override
   			public void onSystemExit(String result) {
   				Log.i("SDK", "如果涉及到退出程序时,可以可以调用退出游戏的方法,否则不用管");
   			}
   		},payInfo.getUserid(),payInfo.getServerId(),new GoodInfo(payInfo.getProductId(),Double.parseDouble(payInfo.getPrice()),XSDK.getInstance().getNoteOne(),payInfo.getExtend(),payInfo.getOrderID(),payInfo.getRoleName(),payInfo.getProductName(),payInfo.getBuyNum(),payInfo.getUserid()));
	}
	
	public void upIoadInfo(XRoleBean roleInfo){
		if(roleInfo.getDataType().equals(XRoleBean.TYPE_CREATE_ROLE)){
			Log.i("SDK", "创建角色");
			Matrix.doCreateUser(XSDK.getInstance().getContext(), new DispatcherCallback() {
				
				@Override
				public void onSystemExit(String arg0) {
					// TODO Auto-generated method stub
					
				}
				
				@Override
				public void onFinished(String arg0) {
					// TODO Auto-generated method stub
				}
			}, roleInfo.getServerID(),roleInfo.getRoleID() ,roleInfo.getRoleName());
		}
		
		if(roleInfo.getDataType().equals(XRoleBean.TYPE_LEVEL_UP)){
			Matrix.doUserLelel(XSDK.getInstance().getContext(), new DispatcherCallback() {
				
				@Override
				public void onSystemExit(String arg0) {
					// TODO Auto-generated method stub
				}
				
				@Override
				public void onFinished(String arg0) {
					// TODO Auto-generated method stub
				}
			}, roleInfo.getServerID(), roleInfo.getRoleID(), roleInfo.getRoleLevel());
		}
	}
	
	public void exit(){
		Matrix.exit(XSDK.getInstance().getContext(), new ExitCallback() {
			
			@Override
			public void onSystemExit(String arg0) {
				// TODO Auto-generated method stub
				XSDK.getInstance().getContext().finish();
			}
		});
	}
}
