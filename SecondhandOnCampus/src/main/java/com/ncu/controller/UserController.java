package com.ncu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hamcrest.core.IsNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ncu.common.RegularExpressionUtil;
import com.ncu.common.StringUtil;
import com.ncu.pojo.User;
import com.ncu.service.UserService;


@Controller 
@RequestMapping("/user")  
public class UserController {
    @Autowired
	UserService userService;
    //进入登录注册页面
    @RequestMapping("/index")  
    public ModelAndView index()throws Exception{  
        ModelAndView modelAndview=new ModelAndView();
        modelAndview.setViewName("index");
        return modelAndview; 
    }
    //登录
    @RequestMapping("/login")  
    public ModelAndView login(@RequestParam String user_account,@RequestParam String pwd,HttpServletRequest request)throws Exception{ 
    	ModelAndView modelAndview=new ModelAndView();
    	User user = userService.loginValidate(user_account, pwd);
    	if(user!=null){
    		request.getSession().setAttribute("user", user);
            modelAndview.setViewName("user");
           
    	}else{
    		modelAndview.setViewName("index");
    	}
    	 return modelAndview; 

    }
    //退出登录
    @RequestMapping("/loginout")  
    public String loginout(HttpServletRequest request)throws Exception{ 
    	//注销session
    	request.getSession().invalidate();
    	System.out.println("退出登录");
    	return "redirect:/user/index.action";
    }
    //注册
    @RequestMapping("/register")  
    @ResponseBody
    public Map<String, String> register(HttpServletRequest request)throws Exception{ 
    	Map<String, String> resMap=new HashMap<String, String>();
    	//注册信息是否合法
    	if(IsIegalToRegisterInfo(request,resMap)){
    		int res=userService.register(request);
    		if(res==1){
    		  resMap.put("res", "success");
    		}else if(res==2){
    		  resMap.put("res", "fail");
    		  resMap.put("failInfo", "学号已被注册");
    		}else if(res==3){
      		  resMap.put("res", "fail");
      		  resMap.put("failInfo", "用户名已被使用");
      		}else if(res==4){
    		  resMap.put("res", "fail");
    		  resMap.put("failInfo", "手机号已被注册 ");
    		}else if(res==5){
    		  resMap.put("res", "fail");
    		  resMap.put("failInfo", "学号不存在");
    		}
    	}else{
    		resMap.put("res", "fail");
    	}
    	return resMap;
    }
   
    
    //完善个人资料-界面
    @RequestMapping("/user")  
    public ModelAndView userInfoView(HttpServletRequest request)throws Exception{ 
    	ModelAndView modelAndview=new ModelAndView();
        modelAndview.setViewName("user");
        return modelAndview; 
    }
    //完善个人资料-修改个人信息功能
    @RequestMapping("/updateUserInfo")  
    @ResponseBody
    public  Map<String, String> updateUserInfo(HttpServletRequest request)throws Exception{ 
    	Map<String, String> resMap=new HashMap<String, String>();
    	if (IsIegalToUpdateUserInfo(request, resMap)) {
    		boolean res =userService.updateUserInfo(request.getParameter("realName"),request.getParameter("sex"),request.getParameter("email"), ((User)request.getSession().getAttribute("user")).getId());
    		if(res){
    			resMap.put("updateRes", "success");	
    			User user=userService.findUserById(getUserID(request));
        		request.getSession().setAttribute("user", user);
    		}else{
    			resMap.put("updateRes", "fail");	
    		}
    	}else{
    		resMap.put("updateRes", "ilegal");	
    	}
    	return resMap;
    }
    //完善个人资料-修改交易信息功能
    @RequestMapping("/updateTradeInfo")  
    @ResponseBody
    public  Map<String, String> updateTradeInfo(HttpServletRequest request)throws Exception{ 
    	Map<String, String> resMap=new HashMap<String, String>();
		if (IsIegalToUpdateTradeInfo(request, resMap)) {
			boolean res = userService.updateTradeInfo(request.getParameter("alipayNumber"), request.getParameter("shippingAddress"),((User) request.getSession().getAttribute("user")).getId());
			if (res) {
				resMap.put("updateRes", "success");
				User user=userService.findUserById(getUserID(request));
	    		request.getSession().setAttribute("user", user);
			} else {
				resMap.put("updateRes", "fail");
			}
		}else{
    		resMap.put("updateRes", "ilegal");	
    	}
    	return resMap;
    }
    //完善个人资料-修改密码功能
    @RequestMapping("/updatePWD")  
    @ResponseBody
    public  Map<String, String> updatePWD(HttpServletRequest request)throws Exception{ 
    	Map<String, String> resMap=new HashMap<String, String>();
    	if (IsIegalToUpdatePWDInfo(request, resMap)) {
    		boolean res = userService.updatePWD(((User)request.getSession().getAttribute("user")).getPwd(),request.getParameter("pwd_old"), request.getParameter("pwd_new"),((User)request.getSession().getAttribute("user")).getId());
    		if(res){
    			resMap.put("updateRes", "success");	
    		}else{
    			resMap.put("updateRes", "fail");	
    		}  
    	}else{
    		resMap.put("updateRes", "ilegal");	
    	}
    	request.getSession().invalidate();
    	System.out.println("退出登录");
    	return resMap;
    }
    @RequestMapping("/updateHeadImg")      
    public ModelAndView updateHeadImg(MultipartFile headImgFile,HttpServletRequest request)throws Exception{
    	ModelAndView modelAndview=new ModelAndView();
        modelAndview.setViewName("user");
        
        HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
       // 图片路径
     		String store_path = "D:\\upfilesForBS\\user\\headImg\\";
        String img_name = userService.saveHeadImg(headImgFile,store_path,request.getParameter("id"));
        user.setHeadImg(img_name);
        
        return modelAndview; 
    }
    
    private boolean IsIegalToUpdateUserInfo(HttpServletRequest request,Map<String, String> resMap) {
		if(!RegularExpressionUtil.isUserRealName(StringUtil.messyCodetoChineseStr(request.getParameter("sex")))){
			resMap.put("failInfo", "请填写真实姓名");
			return false;
		}
    	if(!RegularExpressionUtil.isUserSex(StringUtil.messyCodetoChineseStr(request.getParameter("sex")))){
			resMap.put("failInfo", "性别为空或不规范");
			return false;
		}
		if(!RegularExpressionUtil.isUserEmail(StringUtil.messyCodetoChineseStr(request.getParameter("email")))){
			resMap.put("failInfo", "电子邮件不规范");
			return false;
		}

		return true;
	}
    private boolean IsIegalToUpdateTradeInfo(HttpServletRequest request,Map<String, String> resMap) {
		if(!RegularExpressionUtil.isUserAlipayNumber(StringUtil.messyCodetoChineseStr(request.getParameter("alipayNumber")))){
			resMap.put("failInfo", "支付宝账户为空或不规范");
			return false;
		}
		if(!RegularExpressionUtil.isUserShippingAddress(StringUtil.messyCodetoChineseStr(request.getParameter("shippingAddress")))){
			resMap.put("failInfo", "收件地址为空或不规范");
			return false;
		}

		return true;
	}
    private boolean IsIegalToUpdatePWDInfo(HttpServletRequest request,Map<String, String> resMap) {
		if(!RegularExpressionUtil.isUserPwd(request.getParameter("pwd_old"))){
			resMap.put("failInfo", "密码应大于6位小于16位字符");
			return false;
		}
		if(!RegularExpressionUtil.isUserPwd(request.getParameter("pwd_new"))){
			resMap.put("failInfo", "密码应大于6位小于16位字符");
			return false;
		}
		return true;
	}
	private boolean IsIegalToRegisterInfo(HttpServletRequest request,Map<String, String> resMap) {
		if(!RegularExpressionUtil.isUserSno(request.getParameter("sno"))){
			resMap.put("failInfo", "学号不规范");
			return false;
		}
		if(!RegularExpressionUtil.isUserAliasName(StringUtil.messyCodetoChineseStr(request.getParameter("aliasname")))){
			resMap.put("failInfo", "用户名不能超过15个字符");
			return false;
		}
		if(!RegularExpressionUtil.isUserPwd(request.getParameter("pwd"))){
			resMap.put("failInfo", "密码应大于6位小于16位字符");
			return false;
		}
		if(!RegularExpressionUtil.isUserMobileNumber(request.getParameter("phone_number"))){
			resMap.put("failInfo", "手机号格式不规范");
			return false;
		}
		return true;
	}
	
	private Integer getUserID(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user != null) {
		   return user.getId();
		}
		return null;
	}	
  
}



