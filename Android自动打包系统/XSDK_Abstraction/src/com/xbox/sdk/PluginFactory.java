package com.xbox.sdk;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.AssetManager;
import android.os.Bundle;
import android.util.Log;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Constructor;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

public class PluginFactory {
	private static PluginFactory instance;
	private Map<String, String> supportedPlugins = new HashMap<String, String>();

	public static PluginFactory getInstance() {
		if (instance == null)
			instance = new PluginFactory();
		return instance;
	}

	public Object initPlugin(String pluginType) {
		Log.i("SDK", "supportedPlugins  ="+supportedPlugins);
		if (!isSupportPlugin(pluginType)) {
			if (("1".equals(pluginType)) || ("2".equals(pluginType))) {
				Log.i("SDK","The config of the XSDK is not support plugin type:"+ pluginType);
				return null;
			}
		}
		try {
			Log.i("SDK", getPluginName(pluginType)+"------------------------------------");
			Class<?> localClass = Class.forName(getPluginName(pluginType));
			Constructor<?> localConstructor = localClass.getDeclaredConstructor(new Class[] { Activity.class });
			Object[] arrayOfObject = new Object[1];
			arrayOfObject[0] = XSDK.getInstance().getContext();
			Object localObject = localConstructor.newInstance(arrayOfObject);
			return localObject;
		} catch (Exception localException) {
			localException.printStackTrace();
		}
		return null;
	}

	private String getPluginName(String paramInt) {
		if (this.supportedPlugins.containsKey(paramInt)) {
			return (String) this.supportedPlugins.get(paramInt);
		}
		return null;
	}

	private boolean isSupportPlugin(String paramInt) {
		return this.supportedPlugins.containsKey(paramInt);
	}

	/**
	 * 获取asset下的xml文件,在抽象层中的onAppAttachBaseContext方法中调用
	 * 
	 * @param context
	 */
	public void loadPluginInfo(Context context) {
		try {
			AssetManager assets = context.getAssets();
			InputStream is = assets.open("x_plugin_config.xml");
			XmlPullParserFactory xppf = XmlPullParserFactory.newInstance();
			XmlPullParser newPullParser = xppf.newPullParser();
			newPullParser.setInput(is, "UTF-8");
			int evtType = newPullParser.getEventType();
			while (evtType != XmlPullParser.END_DOCUMENT) {
				switch (evtType) {
				case XmlPullParser.START_TAG:
					String tag = newPullParser.getName();
					if ("plugin".equals(tag)) {
						String pluginName = newPullParser.getAttributeValue(0);
						String pluginValue = newPullParser.getAttributeValue(1);
						supportedPlugins.put(pluginValue, pluginName);
					}
					break;
				case XmlPullParser.END_TAG:
					break;
				default:
					break;
				}
				// 获得下一个节点的信息
				evtType = newPullParser.next();
			}
			is.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Log.i("SDK", supportedPlugins + "");

	}

	public SDKParams getSDKParams(Context paramContext) {
		Map<String, String> map = null;
		try {
			map = new HashMap<String, String>();
			Properties pro = new Properties();
			AssetManager assets = paramContext.getAssets();
			InputStream is = assets.open("x_developer_config.properties");
			InputStreamReader isr = new InputStreamReader(is, "UTF-8");
			pro.load(isr);
			Enumeration<?> propertyNames = pro.propertyNames();
			while (propertyNames.hasMoreElements()) {
				String nextElement = (String) propertyNames.nextElement();
				map.put(nextElement, pro.getProperty(nextElement));
			}
			isr.close();
			is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new SDKParams(map);
	}

	public Bundle getMetaData(Context paramContext) {
		ApplicationInfo applicationInfo = null;
		try {
			PackageManager packageManager = paramContext.getPackageManager();
			applicationInfo = packageManager.getApplicationInfo(paramContext.getPackageName(), PackageManager.GET_META_DATA);
		} catch (NameNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return applicationInfo.metaData;
	}
}
