package com.xbox.sdk.impl;

import android.widget.Toast;

import com.xbox.sdk.XSDK;
import com.xbox.sdk.bean.XRoleBean;
import com.xbox.sdk.inter.IUser;

public class DefaultUser implements IUser{

	private void showToast(String paramString)
	  {
	    Toast.makeText(XSDK.getInstance().getContext(), paramString, Toast.LENGTH_LONG).show();
	  }
	
	@Override
	public boolean isSupportMethod(String paramString) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void exit() {
		// TODO Auto-generated method stub
		showToast("调用[退出游戏确认]接口成功，还需要经过打包工具来打出最终的渠道包");
	}

	@Override
	public void login() {
		// TODO Auto-generated method stub
		showToast("调用[登录]接口成功，这个默认的实现，还需要经过打包工具来打出最终的渠道包");
	}

	@Override
	public void loginCustom(String paramString) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void logout() {
		// TODO Auto-generated method stub
		showToast("调用[登出接口]接口成功，还需要经过打包工具来打出最终的渠道包");
	}

	@Override
	public void postGiftCode(String paramString) {
		// TODO Auto-generated method stub
		showToast("调用[上传礼包兑换码]接口成功，还需要经过打包工具来打出最终的渠道包");
	}

	@Override
	public void queryAntiAddiction() {
		// TODO Auto-generated method stub
		showToast("游戏中暂时不需要调用该接口");
	}

	@Override
	public void realNameRegister() {
		// TODO Auto-generated method stub
		showToast("游戏中暂时不需要调用该接口");
	}

	@Override
	public boolean showAccountCenter() {
		// TODO Auto-generated method stub
		showToast("调用[个人中心]接口成功，还需要经过打包工具来打出最终的渠道包");
		return false;
	}

	@Override
	public void submitExtraData(XRoleBean roleBean) {
		// TODO Auto-generated method stub
		showToast("调用[提交扩展数据]接口成功，还需要经过打包工具来打出最终的渠道包");
	}

	@Override
	public void switchLogin() {
		// TODO Auto-generated method stub
		showToast("调用[切换帐号]接口成功，还需要经过打包工具来打出最终的渠道包");
	}

}
