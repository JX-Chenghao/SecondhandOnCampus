package com.ncu.common;

import java.io.UnsupportedEncodingException;

public class StringUtil {
	 /*
	  * get  Method乱码解决
	  */
     public static String messyCodetoChineseStr(String str){
    	try {
			return new String(str.getBytes("ISO8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
     }
}
