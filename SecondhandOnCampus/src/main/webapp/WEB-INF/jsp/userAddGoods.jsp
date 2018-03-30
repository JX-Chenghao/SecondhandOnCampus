<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/app.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/slider.css" all />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/add_style.css"  />	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/select2css.css"  />	
<title>校园二手交易网站</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

<script type="text/javascript" 
    src="${pageContext.request.contextPath}/resources/js/select2css.js"></script>

<script type="text/javascript">
	$(function() {
	 		$("form input[type=text]").change(function(){
	   		  if($(this).val()!=""){
	   	 	    $(this).css("border-left","lightgreen solid 4px");
	   	 	 }
		 });
		 $("form select").change(function(){
		  	   if($(this).val()!=""&& $(this).val()!="-请选择-"){
	 	  	     $(this).css("border-left","lightgreen solid 4px");
	 	 	   }
	 	});
	 	$("form :file").change(function(){
	  	 	  if($(this).val()!=""){
	  	    	  $(this).parent().css("border-left","lightgreen solid 4px");
	  	 	  }
		 });
	});
	//提交表单
   	function sendForm(){
           //控制空值检验
             var error=0;

            //检查文件是否为图片
              var image =$("input[type=file]").each(function(){
                   if($(this).val()!=''){
			        if (!$(this).val().match(/(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/))
			          {
			          	  $(this).parent().css("border-left","orange solid 4px");
			    	      error++; 
			          } 
			        }
               });

              if(error>0) {
              	  alert("请选择图片格式  .jpg,.png,.jpeg的文件上传！");
              	  return ;
              }
             $("form input[type=text]").each(function(){
                 if($(this).val()==""){
                    $(this).css("border-left","red solid 4px");
                    error++;
                 }
             });
             $("form :file").each(function(){
                //alert($(this).val());
                 if($(this).val()==""){
                    $(this).parent().css("border-left","red solid 4px");
                    error++;
                 }
             });

              

              if(error>0) {
              	alert("请填写完信息！");
              	return false;
              }
             
             
           //提交
             $("form[name=addForm]").submit();
				
   }	

</script>
</head>
<body>
	<div class="menu">
		<div class="logo"></div>
		<ul>
			<li><a href="main.html" class="home">首页</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/goods/showGoodsByPage.action"
				class="goods">商品</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/cart/showCart.action"
				class="cart">购物车</a>
			</li>
			<li><a href="order.html" class="orderInfo">订单信息</a>
			</li>
			<li class="active"><a href="#" class="userInfo">个人中心</a>
			</li>

			<c:if test="${sessionScope.user==null}">
				<li style="float:right;"><a
					href="${pageContext.request.contextPath}/user/index.action"
					class="login">登录</a>
				</li>
				<li style="float:right;"><a
					href="${pageContext.request.contextPath}/user/index.action"
					class="register">注册</a>
				</li>
			</c:if>
			<c:if test="${sessionScope.user!=null}">
				<li style="float:right;"><a
					href="${pageContext.request.contextPath}/user/loginout.action"
					class="login">退出登录</a>
				</li>
				<li style="float:right;"><a href="#" class="register">${sessionScope.user.aliasName}</a>
				</li>
			</c:if>
		</ul>
	</div>
	<div class="linktree">
		<a href="#">主页</a> &raquo; <a href="#">个人中心</a>&raquo; 
		<a href="#">我的收藏</a>
	</div>
	<div style="width:1000px;margin:0 auto;">
		<div id="cart">
			<div class="heading">
				<a style="padding:8px;margin-left:-14px;">购物车</a> <span
					style="font-size:14px;color:#fff;">&raquo;</span> <a><span
					id="cart_total">${fn:length(sessionScope.cart.items)} 项 -
						￥${sessionScope.cart.total}</span>
				</a>
			</div>

		</div>
	</div>
	<div class="container" style="width:83%;margin-left:100px">


		<div class="left_option">
			<ul>
				 <a style="text-decoration: none; color: #333;font-size:16px;">
					<dl id="dt_1" class="catalog">首页
					</dl> </a>
				  <a href="${pageContext.request.contextPath}/user/user.action"
					style="text-decoration: none; color: #333;font-size:16px;">
					<dl id="dt_2" class="catalog">我的信息
					</dl> </a>
				  <a href="${pageContext.request.contextPath}/goods/showCollection.action?userId=${sessionScope.user.id}"
					style="text-decoration: none; color: #333;font-size:16px;">
					<dl id="dt_3" class="catalog">我的收藏
					</dl> </a>

					<a href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=0"
						style="text-decoration: none; color: #333;font-size:16px;">
						<dl id="dt_4" class="catalog">正审核商品
						</dl> </a>
					<a href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=1"
						style="text-decoration: none; color: #333;font-size:16px;">
						<dl id="dt_5" class="catalog">已通过商品
						</dl> </a>
					<a href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=2"
						style="text-decoration: none; color: #333;font-size:16px;">
						<dl id="dt_6" class="catalog">未通过商品
						</dl> </a>
					<a href="#"
						style="text-decoration: none; color: #333;font-size:16px;">
						<dl id="dt_6" >上架商品
						</dl> </a>
				</dt>
		</div>
		<div class="addGoods">
			<form>
				<ul class="left-form">

					<li><input type="text" placeholder="商品名" required />
						<div class="clear"></div></li>
					<li><input type="text" placeholder="数量" required />

						<div class="clear"></div></li>
					<li><input type="text" placeholder="单价" required />

						<div class="clear"></div></li>

					<li><input type="text" placeholder="商品介绍" required />

						<div class="clear"></div></li>

					<li><input type="text" placeholder="已使用月份" required />

						<div class="clear"></div></li>
					<input type="submit" onclick="sendForm()" value="确认上架"
						style="margin-left:10px;width:350px">
					<div class="right-form">

						<a href="javascript:void(0);" class="btn_addPic"><span><em>+</em>添加图片</span><input
							type="file" tabindex="3" title="支持jpg、jpeg、gif、png格式，文件小于5M"
							size="3" name="pic" class="filePrew">
						</a>
						<div class="clear"></div>


						<a href="javascript:void(0);" class="btn_addPic"><span><em>+</em>添加图片</span><input
							type="file" tabindex="3" title="支持jpg、jpeg、gif、png格式，文件小于5M"
							size="3" name="pic" class="filePrew">
						</a>
						<div class="clear"></div>


						<a href="javascript:void(0);" class="btn_addPic"><span><em>+</em>添加图片</span><input
							type="file" tabindex="3" title="支持jpg、jpeg、gif、png格式，文件小于5M"
							size="3" name="pic" class="filePrew">
						</a>
						<div class="clear"></div>


						<a href="javascript:void(0);" class="btn_addPic"><span><em>+</em>添加图片</span><input
							type="file" tabindex="3" title="支持jpg、jpeg、gif、png格式，文件小于5M"
							size="3" name="pic" class="filePrew">
						</a>
						<div class="clear"></div>

					</div>


				</ul>
						 <div id="uboxstyle"  style="float:left; margin-right:30px;">
						   <select name="language" id="language">
								<option value="选择风格" selected="selected">商品类型</option>
							    <option value="复古风">电子物品</option>
						   		<option value="摇滚风">生活用品</option>
						   		<option value="怀旧风">阅读书籍</option>
						   		<option value="站长素材">服装物品</option>
						   </select>
						</div>
			</form>
		</div>

	</div>

</body>

</html>