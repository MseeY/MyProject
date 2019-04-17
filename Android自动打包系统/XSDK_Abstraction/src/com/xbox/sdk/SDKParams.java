package com.xbox.sdk;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import android.util.Log;

public class SDKParams {
	private Map<String, String> configs = new HashMap<String, String>();

	public SDKParams() {
	}

	public SDKParams(Map<String, String> paramMap) {
		configs = paramMap;
		Log.i("SDK", configs+"");
	}

	public boolean contains(String paramString) {
		return this.configs.containsKey(paramString);
	}

	public Boolean getBoolean(String paramString) {
		paramString = getString(paramString);
		if (paramString == null)
			return null;
		return Boolean.valueOf(Boolean.parseBoolean(paramString));
	}

	public Byte getByte(String paramString) {
		paramString = getString(paramString);
		if (paramString == null)
			return null;
		return Byte.valueOf(Byte.parseByte(paramString));
	}

	public Double getDouble(String paramString) {
		paramString = getString(paramString);
		if (paramString == null)
			return null;
		return Double.valueOf(Double.parseDouble(paramString));
	}

	public Float getFloat(String paramString) {
		paramString = getString(paramString);
		if (paramString == null)
			return null;
		return Float.valueOf(Float.parseFloat(paramString));
	}

	 public int getInt(String paramString){
		 String ss = getString(paramString);
		 if(ss!=null){
			return Integer.parseInt(ss);
		 }
		return 0;
	 }

	public Long getLong(String paramString) {
		paramString = getString(paramString);
		if (paramString == null)
			return null;
		return Long.valueOf(Long.parseLong(paramString));
	}

	public Short getShort(String paramString) {
		paramString = getString(paramString);
		if (paramString == null)
			return null;
		return Short.valueOf(Short.parseShort(paramString));
	}

	public String getString(String paramString) {
		if (this.configs.containsKey(paramString))
			return (String) this.configs.get(paramString);
		return null;
	}

	public void put(String paramString1, String paramString2) {
		this.configs.put(paramString1, paramString2);
	}

	public String toString() {
		StringBuilder localStringBuilder = new StringBuilder();
		Iterator<String> localIterator = this.configs.keySet().iterator();
		while (true) {
			if (!localIterator.hasNext())return localStringBuilder.toString();
			String str = (String) localIterator.next();
			localStringBuilder.append(str).append("=").append((String) this.configs.get(str)).append("\n");
		}
	}
}
