package com.u2.util;


import java.security.MessageDigest;

/**
 * MD5通用类
 * 
 * @author 浩令天下
 * @since 2017.04.15
 * @version 1.0.0_1
 * 
 */
public class MD5 {
	private static final String slat = "&%1927***8687&&%%$$#@";
	public static String encrypt(String dataStr) {
		try {
			dataStr = dataStr + slat;
			MessageDigest m = MessageDigest.getInstance("MD5");
			m.update(dataStr.getBytes("UTF8"));
			byte s[] = m.digest();
			String result = "";
			for (int i = 0; i < s.length; i++) {
				result += Integer.toHexString((0x000000FF & s[i]) | 0xFFFFFF00).substring(6);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "";
	}
	public static void main(String[] args) {
		
		System.out.println(encrypt("superman"));
		
	}
}
