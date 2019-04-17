package com.xbox.sdk.adapter;
import com.xbox.sdk.bean.XRoleBean;
import com.xbox.sdk.inter.IUser;

public abstract class XUserAdapter implements IUser{
	
	@Override
	public abstract boolean isSupportMethod(String paramString);
		// TODO Auto-generated method stub

	@Override
	public void exit() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void login() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void loginCustom(String paramString) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void logout() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postGiftCode(String paramString) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void queryAntiAddiction() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void realNameRegister() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean showAccountCenter() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void submitExtraData(XRoleBean roleBean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void switchLogin() {
		// TODO Auto-generated method stub
		
	}
	

}
