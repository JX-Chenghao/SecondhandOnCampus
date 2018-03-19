<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/app.css" />
<link rel="stylesheet"  type="text/css"  href="${pageContext.request.contextPath}/resources/css/slider.css" all /> 
<title>校园二手交易网站</title>
           <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#da-slider').cslider();
		});
	</script>
</head>
<body>
	<div class="menu">
	    <div class="logo"></div>
		<ul>
		<li><a href="main.html" class="home">首页</a></li>
		<li class="active"><a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action" class="goods" >商品</a></li>
		<li><a href="cart.html" class="cart">购物车</a></li>
		<li><a href="order.html" class="orderInfo">订单信息</a></li>
		<li><a href="${pageContext.request.contextPath}/user/user.action" class="userInfo">完善信息</a></li>
	
		<c:if test="${sessionScope.user==null}">
			<li style="float:right;"><a href="${pageContext.request.contextPath}/user/index.action" class="login">登录</a></li>
			<li style="float:right;"><a href="${pageContext.request.contextPath}/user/index.action" class="register">注册</a></li>
		</c:if>
		<c:if test="${sessionScope.user!=null}">
			<li style="float:right;"><a href="${pageContext.request.contextPath}/user/loginout.action" class="login">退出登录</a></li>
			<li style="float:right;"><a href="#" class="register">${sessionScope.user.aliasName}</a></li>
		</c:if>

		</ul>
	</div>

	<div class="linktree">
        		<a href="#">主页</a>
        		 &raquo; <a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action">商品</a>&raquo; <a href="#">详细信息</a>
	</div>
	<div style="width:1000px;margin:0 auto;">
    		<div id="cart">
    			<div class="heading">
			<a style="padding:8px;margin-left:-14px;">购物车</a>
			<span style="font-size:14px;color:#fff;">&raquo;</span>
      			<a><span id="cart_total">0 项 - ￥0.00</span></a>
    		  	</div>
   
		 </div>  
	</div>  
	<div class="container" style="width:83%;margin-left:100px">
			<div class="text_box_left">
			      详细信息
			      
			 </div>
		
	
		<div id="container_bg">
			<div id="content">
				<div class="product-info">

					<div class="left">                		                			
						<div class="image"><a href="#" title="iMac" ><img src="${pageContext.request.contextPath}/resources/images/product_holder.jpg" title="iMac" alt="iMac" id="image" /></a></div>
						<div class="image-additional">
							<a href="#" title="iMac"><img src="${pageContext.request.contextPath}/resources/images/thumber.jpg" title="iMac" alt="iMac" /></a>
							<a href="#" title="iMac"><img src="${pageContext.request.contextPath}/resources/images/thumber.jpg" title="iMac" alt="iMac" /></a>
						</div>                		                        
					</div>

					<div class="right">
						<div id="tabs" class="tabs">
							<a href="#tab-information" class="selected"><img alt="Information" src="${pageContext.request.contextPath}/resources/images/Info.png" style="margin-top:6px;" /><div></div></a>
							<a href="#tab-description">商品留言数 (0)</a>
							<a href="#tab-review">商家评论数 (0)</a>
							<a href="#tab-related">商家其他商品 (2)</a>
						</div>

						<div id="tab-information" class="tab-content">		

							<div class="description">
								<span>&raquo;&nbsp;名称:</span> <a href="#">${goods.name }  </a><br />
								<span>&raquo;&nbsp;数量:</span> <a href="#">${goods.quantity }  </a><br />
								<span>&raquo;&nbsp;已用月份:</span>  ${goods.usedMonth }  <br />
								<span>&raquo;&nbsp;发布日期:</span> <f:formatDate value="${goods.publishDate}" pattern="yyyy年MM月dd日"/>                     
							</div>

							<div class="price">
								<span class="price-new">￥${goods.price } </span>
								
							</div>
							<br>
							<div class="cart">
								<div>数量:<input class="quantity" type="text" name="quantity" size="2" value="1" />
									<input type="hidden" name="product_id"  value="41" />
									&nbsp;<a id="button-cart" class="button" href="${goods.id } "><span>添加到购物车</span></a>
								</div>
								<div>
									<span>&nbsp;&nbsp;- OR -&nbsp;&nbsp;</span>
								</div>
								<div>
									<a class="wishlist"><img src="${pageContext.request.contextPath}/resources/images/collect.png" style="margin-top:2px;" title="收藏"/></a>
									
								</div>
							</div>
							<div class="review">
								<div>
									&nbsp;&nbsp;
									<a >0 评论</a>&nbsp;&nbsp;|&nbsp;&nbsp;
									<a >添加评论</a>
								</div>
							</div>
							<div>
								${goods.introducedText }
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>            
            
            
            
	</div>


</body>
</html>