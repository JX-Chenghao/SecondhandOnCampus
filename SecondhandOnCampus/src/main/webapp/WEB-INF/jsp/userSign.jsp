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
		
	             
	</script>
</head>
<body>
	<div class="menu">
	          <div class="logo"></div>
		<ul>
		<li><a href="main.html" class="home">首页</a></li>
		<li ><a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action" class="goods" >商品</a></li>
		<li ><a href="${pageContext.request.contextPath}/cart/showCart.action" class="cart">购物车</a></li>
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
  <div class="container" style="width:83%;margin-left:100px">
  
  
       <div class="left_option">
            <ul>
                 <a style="text-decoration: none; color: #333;font-size:16px;">
                        <dl id="dt_1" class="catalog"> 首页</dl>
                 </a>
                 <a  href="${pageContext.request.contextPath}/user/user.action" style="text-decoration: none; color: #333;font-size:16px;">
                       <dl id="dt_2" class="catalog">我的信息</dl>
                  </a>
                 <a href="#"  style="text-decoration: none; color: #333;font-size:16px;">
                       <dl id="dt_3">  我的收藏</dl>
                  </a>
                   <a href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=0"  style="text-decoration: none; color: #333;font-size:16px;">
                      <dl id="dt_4" class="catalog"> 正审核商品</dl>
                      </a>
                   <a href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=1"  style="text-decoration: none; color: #333;font-size:16px;">
                        <dl id="dt_5" class="catalog"> 已通过商品</dl>
                      </a>
                  <a href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=2" style="text-decoration: none; color: #333;font-size:16px;">
                        <dl id="dt_6" class="catalog">未通过商品</dl>
                   </a>                                    
            </dt>
        </div>
  
  
  
     <div class="sign-info">
       <table>
        <thead>
          <tr>
            
            <td class="image">图片</td>
            <td class="name">商品名</td>
            <td class="model">介绍</td>
            <td class="quantity">数量</td>
            <td class="price">单价</td>
            <td class="remove">移除收藏</td>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${signGoodsList}" var="signGoods">
          <tr>
            <td class="image"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/thumber.jpg" alt="iMac" title="iMac" /></a>
            </td>
            <td class="name"><a href="#">${signGoods.goods.name}</a>
              <div>
              </div>
            </td>
            <td class="introduce">${signGoods.goods.introducedText}</td>
            <td class="quantity">${signGoods.goods.quantity}</td>
            <td class="price">￥${signGoods.goods.price}</td>
            <td class="remove"><a href="${pageContext.request.contextPath}/user/sign/remove.action?userId=${signGoods.userId}&signId=${signGoods.signId}"><img src="${pageContext.request.contextPath}/resources/images/remove_collection.png"> </a></td>
          </tr> 
         </c:forEach>  
        </tbody>
      </table>
    </div>
</body>
</html>