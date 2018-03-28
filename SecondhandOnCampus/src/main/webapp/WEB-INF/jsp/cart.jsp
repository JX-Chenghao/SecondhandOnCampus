<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/app.css" />
<link rel="stylesheet"  type="text/css"  href="${pageContext.request.contextPath}/resources/css/slider.css" all /> 
<title>校园二手交易网站</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

     <script type="text/javascript">
           function removeCart(goodsId){
               $.ajax({
                   url :'${pageContext.request.contextPath}/cart/remove.action?id='+goodsId,
                   type :"get",
                   dataType:"json",
                   success :function(data){
                       if(data.res=="success"){
                           alert("移除成功");
                           $("#tr"+goodsId).remove();
                           
                       }                  
                   }
               });
               
           		
           }
      
     </script>
</head>
<body>
	<div class="menu">
	          <div class="logo"></div>
		<ul>
		<li><a href="main.html" class="home">首页</a></li>
		<li ><a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action" class="goods" >商品</a></li>
		<li ><a href="cart.html" class="cart">购物车</a></li>
		<li ><a href="order.html" class="orderInfo">订单信息</a></li>
		<li class="active"><a href="#" class="userInfo">个人中心</a></li>
		
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
        		&raquo; <a href="#">个人中心</a>&raquo; <a href="#">我的收藏</a>
	</div>
	<div style="width:1000px;margin:0 auto;">
    		<div id="cart">
    			<div class="heading">
			      <a style="padding:8px;margin-left:-14px;">购物车</a>
			      <span style="font-size:14px;color:#fff;">&raquo;</span>
      			  <a><span id="cart_total">${fn:length(sessionScope.cart.items)} 项 - ￥${sessionScope.cart.total}</span></a>
    		  	</div>
   
		    </div>  
	</div>  
	
	
	<form action="#" method="post" id="basket">
		<div class="cart-info">
			<table>
				<thead>
					<tr>
						
						<td class="image">图片</td>
						<td class="name">商品名</td>
						<td class="introduceText">商品介绍</td>
						<td class="quantity">数量</td>
						<td class="price">单价</td>
						<td class="total">小计</td>
						<td class="remove">移除</td>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${sessionScope.cart.items }" var="item">
					<tr id="tr${item.goods.id}">
						
						<td class="image"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/thumber.jpg" alt="iMac" title="iMac" /></a>
						</td>
						<td class="name"><a href="#">${item.goods.name}</a>
							<div>
							</div>
						</td>
						<td class="introduceText">${item.goods.introducedText}</td>
						<td class="quantity"><input type="text"  value="${item.quantity }" size="3" /></td>
						<td class="price">￥${item.goods.price}</td>
						<td class="total">￥${item.goods.price*item.quantity }</td>
						<td class="remove"><a href="#" onclick="removeCart(${item.goods.id})"><img src="${pageContext.request.contextPath}/resources/images/remove.png"> </a></td>
					</tr>
				</c:forEach>		
						
				</tbody>
			</table>

		</div>
		<div style="float:right"><a href="order.html">提交订单</a></div>
	</form>
	
  
</body>
</html>