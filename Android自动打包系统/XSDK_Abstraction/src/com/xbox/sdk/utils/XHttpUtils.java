package com.xbox.sdk.utils;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import android.util.Log;

public class XHttpUtils {
	// Get方式请求
	public static final int requestCode = 200;
	
	public static String doGet(Map<String,String> parameters,String path) throws Exception {
		
		String newPath = getNewPath(parameters, path);
		// 新建一个URL对象
		URL url = new URL(newPath);
		// 打开一个HttpURLConnection连接
		HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
		// 设置连接超时时间
		urlConn.setConnectTimeout(5 * 1000);
		// 开始连接
		urlConn.connect();
		// 判断请求是否成功
		if (urlConn.getResponseCode() == requestCode) {
			// 获取返回的数据
			byte[] data = readStream(urlConn.getInputStream());
			Log.i("SDK", "Get方式请求成功，返回数据如下：");
			return new String(data, "UTF-8");
		} else {
			Log.i("SDK", "Get方式请求失败");
		}
		// 关闭连接
		urlConn.disconnect();
		return null;
	}
	public static String doPost(Map<String,String> parameters,String path)throws Throwable {
		
		String newPath = getNewPath(parameters, path);
		Log.i("SDK", "newPath=============="+newPath);
		// 请求的参数转换为byte数组
//		String params = "id=" + URLEncoder.encode("helloworld", "UTF-8")+ "&pwd=" + URLEncoder.encode("android", "UTF-8");
		byte[] postData = newPath.getBytes();
		// 新建一个URL对象
		URL url = new URL(newPath);
		// 打开一个HttpURLConnection连接
		HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
		// 设置连接超时时间
		urlConn.setConnectTimeout(5 * 1000);
		urlConn.setReadTimeout(5 * 1000);  
		
		// Post请求不能使用缓存
		urlConn.setUseCaches(false);
		// 设置为Post请求
		urlConn.setDoOutput(true);  
		urlConn.setDoInput(true);  

		urlConn.setInstanceFollowRedirects(true);
		// 配置请求Content-Type
		urlConn.setRequestProperty("accept", "*/*");  
		urlConn.setRequestProperty("connection", "Keep-Alive");  
		urlConn.setRequestMethod("POST");  
		urlConn.setRequestProperty("Content-Type",  "application/x-www-form-urlencoded");  
		urlConn.setRequestProperty("charset", "utf-8");  

		// 开始连接
		urlConn.connect();
		// 发送请求参数
		DataOutputStream dos = new DataOutputStream(urlConn.getOutputStream());
		dos.write(postData);
		dos.flush();
		dos.close();
		// 判断请求是否成功
		if (urlConn.getResponseCode() == requestCode) {
			// 获取返回的数据
			byte[] data = readStream(urlConn.getInputStream());
			return new String(data, "UTF-8");
		} else {
			System.out.println(urlConn.getResponseCode());
		}
		return null;
	}
	
	private static String getNewPath(Map<String,String> parameters,String path){
		StringBuilder sb = new StringBuilder();
		sb.append(path+"?");
		for (Map.Entry<String, String> entry : parameters.entrySet()) {
			   try {
				System.out.println("key= " + entry.getKey() + " and value= " + URLEncoder.encode(entry.getValue(), "utf-8"));
				sb.append(entry.getKey()+"="+URLEncoder.encode(entry.getValue(),"utf-8")+"&");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return sb.substring(0, sb.length()-1);
	}

	// 获取连接返回的数据
	private static byte[] readStream(InputStream inputStream) throws Exception {
		byte[] buffer = new byte[1024];
		int len = -1;
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		while ((len = inputStream.read(buffer)) != -1) {
			baos.write(buffer, 0, len);
		}
		byte[] data = baos.toByteArray();
		inputStream.close();
		baos.close();
		return data;
	}
}
