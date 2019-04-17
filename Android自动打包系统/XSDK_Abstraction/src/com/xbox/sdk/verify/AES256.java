package com.xbox.sdk.verify;

import java.io.UnsupportedEncodingException;
import java.security.Key;
import java.security.Security;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

/**
 * ios JAVA6 ֧��PKCS5PADDING��䷽ʽ Bouncy castle֧��PKCS7Padding��䷽ʽ
 * 
 * @author Administrator
 * 
 */
public class AES256 {
	/**
	 * ��Կ�㷨 java6֧��56λ��Կ��bouncycastle֧��64λ
	 * */
	public static final String KEY_ALGORITHM = "AES";

	/**
	 * ����/�����㷨/����ģʽ/��䷽ʽ
	 * 
	 * JAVA6 ֧��PKCS5PADDING��䷽ʽ Bouncy castle֧��PKCS7Padding��䷽ʽ
	 * */
	public static final String CIPHER_ALGORITHM = "AES/ECB/PKCS7Padding";

	/**
	 * 
	 * �����Կ��java6ֻ֧��56λ��Կ��bouncycastle֧��64λ��Կ
	 * 
	 * @return byte[] ��������Կ
	 * */
	public static byte[] initkey() throws Exception {
		// ʵ����Կ�����
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		KeyGenerator kg = KeyGenerator.getInstance(KEY_ALGORITHM, "BC");
		// ��ʼ����Կ�������AESҪ����Կ����Ϊ128λ��192λ��256λ
		kg.init(256);
		// kg.init(128);
		// �����Կ
		SecretKey secretKey = kg.generateKey();
		// ��ȡ��������Կ������ʽ
		// return secretKey.getEncoded();
		return new byte[] { 103, 126, -47, 73, 122, -109, 12, -14, -103, -98,
				62, 7, -79, 11, -33, -124, 125, -76, 85, -31, -79, -98, -55,
				123, 83, 17, 111, 1, -103, 34, -14, 115 };

	}

	public static byte[] hex2bytea(String str) { // �ַ�ת������
		if (str == null)
			return null;
		str = str.trim();
		int len = str.length();
		if (len == 0 || len % 2 == 1)
			return null;
		byte[] b = new byte[len / 2];
		try {
			for (int i = 0; i < str.length(); i += 2) {
				b[i / 2] = (byte) Integer
						.decode("0x" + str.substring(i, i + 2)).intValue();
			}
			return b;
		} catch (Exception e) {
			return null;
		}
	}

	public static String byte2hex(byte[] b) // ������ת�ַ�
	{
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++) {
			stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
			if (stmp.length() == 1)
				hs = hs + "0" + stmp;
			else
				hs = hs + stmp;
		}
		return hs;
	}

	/**
	 * ת����Կ
	 * 
	 * @param key
	 *            ��������Կ
	 * @return Key ��Կ
	 * */
	public static Key toKey(byte[] key) throws Exception {
		// ʵ��DES��Կ
		// �����Կ
		SecretKey secretKey = new SecretKeySpec(key, KEY_ALGORITHM);
		return secretKey;
	}

	/**
	 * �������
	 * 
	 * @param data
	 *            ��������
	 * @param key
	 *            ��Կ
	 * @return byte[] ���ܺ�����
	 * */
	public static byte[] encrypt(byte[] data, byte[] key) throws Exception {
		// ��ԭ��Կ
		Key k = toKey(key);
		/**
		 * ʵ�� ʹ�� PKCS7PADDING ��䷽ʽ�������·�ʽʵ��,���ǵ���bouncycastle���ʵ��
		 * Cipher.getInstance(CIPHER_ALGORITHM,"BC")
		 */
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM, "BC");
		// ��ʼ��������Ϊ����ģʽ
		cipher.init(Cipher.ENCRYPT_MODE, k);
		// ִ�в���
		return cipher.doFinal(data);
	}

	/**
	 * �������
	 * 
	 * @param data
	 *            ��������
	 * @param key
	 *            ��Կ
	 * @return byte[] ���ܺ�����
	 * */
	public static byte[] decrypt(byte[] data, byte[] key) throws Exception {
		// ��ӭ��Կ
		Key k = toKey(key);
		/**
		 * ʵ�� ʹ�� PKCS7PADDING ��䷽ʽ�������·�ʽʵ��,���ǵ���bouncycastle���ʵ��
		 * Cipher.getInstance(CIPHER_ALGORITHM,"BC")
		 */
		Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);
		// ��ʼ��������Ϊ����ģʽ
		cipher.init(Cipher.DECRYPT_MODE, k);
		// ִ�в���
		return cipher.doFinal(data);
	}

	/**
	 * @param args
	 * @throws UnsupportedEncodingException
	 * @throws Exception
	 */
	public static void main(String[] args) throws UnsupportedEncodingException {

		String str = "{\"string\":\"hello���ӳ�\"}";
		System.out.println("ԭ�ģ�" + str);

		// ��ʼ����Կ
		byte[] key;
		try {
			key = AES256.initkey();
			System.out.print("��Կ��");
			for (int i = 0; i < key.length; i++) {
				System.out.printf("%x", key[i]);
			}

			// �������
			byte[] data = AES256.encrypt(str.getBytes(), key);
			System.out.print("\n");
			System.out.println( "���ܺ�" +  Base64.encode(data));

			 String sql = "gsaHpy9MXzAQa9zMo8/0zPN27HdLCgqssSs4LQEtk6SRzA0WvmRd6gf/aCfPJNkD";//Base64.encode(data);
			 data = Base64.decode(sql);

			// �������
			data = AES256.decrypt(data, key);
			System.out.println("���ܺ�" + new String(data,"UTF-8"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}