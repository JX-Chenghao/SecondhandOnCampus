<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>

<!-- Head -->
<head>

	

	<!-- Meta-Tags -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //Meta-Tags -->

	<!-- Style --> <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css" media="all">



</head>
<!-- //Head -->

<!-- Body -->
<body>

	
        <h1></h1>
	<div class="container w3layouts agileits">

		<div class="login w3layouts agileits">
			<h2>登 录</h2>
		    <form action="${pageContext.request.contextPath}/user/login.action" method="post">
			
					<input type="text" Name="user_account" placeholder="用户名/学号" required="">
					<input type="password" Name="pwd" placeholder="密码" required="">
			
				<ul class="tick w3layouts agileits">
					<li>
						<input type="checkbox" id="brand1" value="">
						<label for="brand1"><span></span>记住我</label>
					</li>
				</ul>
				<div class="send-button w3layouts agileits">
					<input type="submit"  value="登 录">
				</div>
			</form>
			<div class="social-icons w3layouts agileits">
				<p>- 其他方式登录 -</p>
				<ul>
					<li class="qq"><a href="#">
					<span class="icons w3layouts agileits"></span>
					<span class="text w3layouts agileits">QQ</span></a></li>
					<li class="weixin w3ls"><a href="#">
					<span class="icons w3layouts"></span>
					<span class="text w3layouts agileits">微信</span></a></li>
					<li class="weibo aits"><a href="#">
					<span class="icons agileits"></span>
					<span class="text w3layouts agileits">微博</span></a></li>
					<div class="clear"> </div>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<div class="register w3layouts agileits">
			<h2>注 册</h2>
			<form action="#" method="post">
			          <input type="text" Name="sno" placeholder="学号" required="">
				<input type="text" Name="name" placeholder="用户名" required="">
				<input type="password" Name="pwd" placeholder="密码" required="">
				<input type="password" Name="pwd_confirm" placeholder="再次输入密码" required="">
				<input type="text" Name="phone_number" placeholder="手机号码" required="">
			</form>
			<div class="send-button w3layouts agileits">
				<form>
					<input type="submit" value="免费注册">
				</form>
			</div>
			<div class="clear"></div>
		</div>

		<div class="clear"></div>

	</div>

	<div class="footer w3layouts agileits">
		<p>@南昌大学软件学院</p>
	</div>

</body>
<!-- //Body -->

</html>