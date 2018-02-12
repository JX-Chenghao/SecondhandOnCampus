package com.ncu.common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegularExpressionUtil {
	  public static boolean isUserMobileNumber(String number) {  
		  	//^ 表示待匹配串的开始位置
		  	//$ 表示待匹配串的结束位置
		    if("".equals(number))  return false;
	        Pattern p = Pattern.compile("^((13[0-9])|(15[^4])|(18[0-9])|(17[0-9])|(147))\\d{8}$");  
	        Matcher m = p.matcher(number);  
	        return m.matches();  
	    }
	//学号应遵循不同学校的学号规范  : 如 完全由数字组成并且小于20位字符 
	public static boolean isUserSno(String sno) {
		 if("".equals(sno)|| sno.length()>20)
			 return false;
		 Pattern p = Pattern.compile("^[0-9]*$");  
	     Matcher m = p.matcher(sno);  
	     return m.matches();  
	}
	//用户别名应小于15位字符
	public static boolean isUserAliasName(String aliasname) {
		 if("".equals(aliasname)|| aliasname.length()>15) 
		    return false;
		 else
			return true;
	}
	//密码应大于6位小于16位字符
	public static boolean isUserPwd(String pwd) {
		 if("".equals(pwd)|| pwd.length()<6|| pwd.length()>16) 
			 return false;
		 else 
			 return true;
		
	}
	public static boolean isUserEmail(String messyCodetoChineseStr) {
		// TODO Auto-generated method stub
		return true;
	}
	public static boolean isUserSex(String parameter) {
		// TODO Auto-generated method stub
		return true;
	}
	public static boolean isUserAlipayNumber(String messyCodetoChineseStr) {
		// TODO Auto-generated method stub
		return true;
	}

	public static boolean isUserShippingAddress(String messyCodetoChineseStr) {
		// TODO Auto-generated method stub
		return true;
	}
	public static boolean isUserRealName(String messyCodetoChineseStr) {
		// TODO Auto-generated method stub
		return true;
	}  
}
