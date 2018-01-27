<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	
	<!-- css files -->
	<link href="${pageContext.request.contextPath}/resources/css/user/style.css" rel='stylesheet' type='text/css' media="all" />
	
	<script type="text/javascript">  
    function check(form) {  
        with (form) {  
            if (tel.value == "" || password.value == "") {  
                alert("信息不能为空！");                  
            }  
        }  
    }  
	</script> 
	
	<script type="text/javascript">
	$("input[name='type']:checked").val();
	</script>

  </head>
  
<body>
<h1>&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/resources/images/user/icon.png" align="left"></h1>
<br>
<div class="log">
	<div class="content1">
		<h2>用户登录</h2>
		<form action="${pageContext.request.contextPath}/user/login.action" method="post" onsubmit="check(this)">
			<p>用户类型
			<label>
			  	<input type="radio" name="type" value="crop" id="RadioGroup_0">加盟商家</label>
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="type" value="user" id="RadioGroup_1"  checked>普通用户</label>
			</p>
			<input type="text" name="tel" placeholder="用户手机">
			<input type="password" name="password" placeholder="登录密码">
			<br/>
			<span style="color:red">${error}</span>
			<div class="button-row">
			<p>
				<input type="submit" class="sign-in" value="登录">
				<input type="reset" class="reset" value="取消">
			</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p align="right"><a href="${pageContext.request.contextPath}/user/registerView.action">没有账号，去注册&gt;&gt; </a></p>
				<div class="clear"></div>
			</div>
		</form>
	</div>
</div>
</body>
</html>
