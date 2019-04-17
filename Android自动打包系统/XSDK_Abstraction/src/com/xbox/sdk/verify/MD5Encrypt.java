package com.xbox.sdk.verify;

import java.security.MessageDigest;

public class MD5Encrypt {
	public MD5Encrypt() {
	}

	private final static String[] hexDigits = { "0", "1", "2", "3", "4", "5",
			"6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

	/**
	 * 转换字节数组�?6进制字串
	 * 
	 * @param b
	 *            字节数组
	 * @return 16进制字串
	 */
	public static String byteArrayToString(byte[] b) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			resultSb.append(byteToHexString(b[i]));// 若使用本函数转换则可得到加密结果�?6进制表示，即数字字母混合的形�?
			// resultSb.append(byteToNumString(b[i]));//使用本函数则返回加密结果�?0进制数字字串，即全数字形�?
		}
		return resultSb.toString();
	}

	/*private static String byteToNumString(byte b) {// 加密结果�?0进制

		int _b = b;
		if (_b < 0) {
			_b = 256 + _b;
		}

		return String.valueOf(_b);
	}*/

	private static String byteToHexString(byte b) {// 加密结果�?6进制
		int n = b;
		if (n < 0) {
			n = 256 + n;
		}
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
	}

	public static String MD5Encode(String origin) {// 调用此方法用MD5进行加密
		String resultString = null;

		try {
			resultString = new String(origin);
			MessageDigest md = MessageDigest.getInstance("MD5");
			resultString = byteArrayToString(md.digest(resultString.getBytes()));
		} catch (Exception e) {

		}
		return resultString;
	}

	public static String SHAEncode(String origin) {// 调用此方法用SHA进行加密
		String resultString = null;

		try {
			resultString = new String(origin);
			MessageDigest md = MessageDigest.getInstance("SHA");
			resultString = byteArrayToString(md.digest(resultString.getBytes()));
		} catch (Exception e) {

		}
		return resultString;
	}

	public final static String MD5(String s) {// 结果与上�?��MD5相同，算法不同，将小写字母换成大写大写字�?
		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F' };
		try {
			byte[] btInput = s.getBytes();
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			mdInst.update(btInput);
			byte[] md = mdInst.digest();
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
				str[k++] = hexDigits[byte0 & 0xf];
			}
			return new String(str);
		} catch (Exception e) {
			// e.printStackTrace();
			return null;
		}
	}

}