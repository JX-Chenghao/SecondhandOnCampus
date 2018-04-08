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
     $(function(){
     	 $(".order-info select").change(function(){
		  	   if($(this).val()=="sh"){
		  	       var price=$(this).parent().next().find(".orderTotalPrice").html();
		  	       $(this).parent().next().find(".orderTotalPrice").html(parseFloat(price)+2.5);;
	 	 	   }
	 	});
     
     });
 	
   
      
     </script>
</head>
<body>
	<div class="menu">
	          <div class="logo"></div>
		<ul>
		<li><a href="main.html" class="home">首页</a></li>
		<li ><a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action" class="goods" >商品</a></li>
		<li class="active"><a href="cart.html" class="cart">购物车</a></li>
		<li ><a href="order.html" class="orderInfo">订单信息</a></li>
		<li ><a href="${pageContext.request.contextPath}/user/user.action" class="userInfo">个人中心</a></li>
		
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
        		&raquo; <a href="${pageContext.request.contextPath}/cart/showCart.action">购物车</a>&raquo; <a href="#">提交订单</a>
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
	<br/><br/>
   <div class="order-info-all">
		<h3 >确认订单信息</h3>
		<div class="headLine" >
			<div>卖家宝贝</div>
			<div>单价</div>
			<div>数量</div>
			<div>已使用月份</div>
			<div>小计</div>
		</div>

		 		<c:forEach items="${orderVOs}" var="orderVO">
		 				   <div  class="order-info">
							           <div class="crop">卖家：${orderVO.cropName }</div>
							         <c:forEach items="${orderVO.orderitemVOs}" var="orderitemVO">  
           	                            <div class="orderItem">
                                       	<div ><a href="#"><img src="${pageContext.request.contextPath}/resources/images/thumber.jpg" /></a>${orderitemVO.goodName }</div>
											<div>${orderitemVO.orderitem.price/orderitemVO.orderitem.quantity }</div>
											<div>${orderitemVO.orderitem.quantity }</div>
											<div>${orderitemVO.goodUsedMonth }个月</div>
											<div>${orderitemVO.orderitem.price }</div>
                                       </div>
                                      </c:forEach> 
                                       
                                       <div>
                                       	<div class="way">运送方式
                                       		<select> 
                                       			<option value="zq">校内货物点自取</option><option value="sh">送货上门(2.5元)</option>
                                       		</select>
                                       	</div>
                                       	<div class="feeToCrop">卖家合计(含运费)￥<span class="orderTotalPrice">${orderVO.order.totalPrice }</span></div>
                                       </div>                                            
							</div>
		 		</c:forEach>
		
		
		
		
		<div class="orderSubmit">总计 ：￥317.8<a href="#">提交</a></div>
	</div>
  
</body>
</html>