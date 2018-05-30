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
             $(".catalog").mousemove(function(){
  				$(this).css("background","#bbb2ac");
  			 });
             $(".catalog").mouseout(function(){
  				$(this).css("background","#e1dfdf");
  			 });
  			 $(".selectOk").mousemove(function(){
  				$(this).css("background","#bbb2ac");
  			 });
             $(".selectOk").mouseout(function(){
  				$(this).css("background","#e8e8e8");
  			 });
           });
	             
	</script>
</head>
<body>
	<div class="menu">
	          <div class="logo"></div>
		<ul>
		<li><a href="${pageContext.request.contextPath}/goods/showMainGoods.action" class="home">首页</a></li>
		<li ><a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action" class="goods" >商品</a></li>
		<li ><a href="${pageContext.request.contextPath}/cart/showCart.action" class="cart">购物车</a></li>
		<li ><a href="${pageContext.request.contextPath}/order/showOrder.action" class="orderInfo">订单信息</a></li>
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
                       <dl id="dt_3" class="selectOk">  我的收藏</dl>
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
                  <a   href="${pageContext.request.contextPath}/goods/addGoodsView.action" style="text-decoration: none; color: #333;font-size:16px;">
                        <dl id="dt_6" class="catalog">上架商品</dl>
                   </a>     
                   <a
						href="${pageContext.request.contextPath}/order/showOrderForCrop.action?orderStatus=0"
						style="text-decoration: none; color: #333;font-size:16px;">
						<dl id="dt_6" class="catalog" >商店未发货订单
						</dl> </a>
					<a
						href="${pageContext.request.contextPath}/order/showOrderForCrop.action?orderStatus=1"
						style="text-decoration: none; color: #333;font-size:16px;">
						<dl id="dt_6" class="catalog">商店已发货订单
						</dl> </a>
					<a
						href="${pageContext.request.contextPath}/order/showOrderForCrop.action?orderStatus=2"
						style="text-decoration: none; color: #333;font-size:16px;">
						<dl id="dt_6" class="catalog">商店已完成订单
						</dl> </a>                                  
            </dt>
        </div>
  
  
  
     <div class="sign-info">
       <table>
        <thead>
          <tr>
            
            <td style="text-align:center;vertical-align:middle" class="image">图片</td>
            <td style="text-align:center;width:100px;vertical-align:middle" class="name">商品名</td>
            <td style="text-align:center;width:200px;vertical-align:middle" class="model">介绍</td>
            <td style="text-align:center;vertical-align:middle" class="quantity">数量</td>
            <td style="text-align:center;vertical-align:middle" class="price">单价</td>
            <td style="text-align:center;vertical-align:middle" class="remove">移除收藏</td>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${signGoodsList}" var="signGoods">
          <tr>
            <c:if test="${signGoods.goods.picturePath==''}">
				<td class="image"><a href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${signGoods.goods.id}"><img src="${pageContext.request.contextPath}/resources/images/thumber.jpg"  /></a></td>
			</c:if>
			<c:if test="${signGoods.goods.picturePath!=''}">
                <td class="image"><a href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${signGoods.goods.id}"><img src="/picForBS/goods/${signGoods.goods.picturePath}/thumbnail/thumb_${signGoods.goods.coverPic}"  /></a></td>
           </c:if>
            <td style="text-align:center;vertical-align:middle" class="name"><a href="#">${signGoods.goods.name}</a>
              <div>
              </div>
            </td>
            <td  style="text-align:center;vertical-align:middle" class="introduce">${signGoods.goods.introducedText}</td>
            <td style="text-align:center;vertical-align:middle" class="quantity">${signGoods.goods.quantity}</td>
            <td style="text-align:center;vertical-align:middle" class="price">￥${signGoods.goods.price}</td>
            <td style="text-align:center;vertical-align:middle" class="remove"><a href="${pageContext.request.contextPath}/user/sign/remove.action?userId=${signGoods.userId}&signId=${signGoods.signId}"><img src="${pageContext.request.contextPath}/resources/images/remove_collection.png"> </a></td>
          </tr> 
         </c:forEach>  
        </tbody>
      </table>
      		  <c:if test="${fn:length(signGoodsList)==0}">
				    <div style="margin-left:450px;margin-top:40px">
				     <img src="${pageContext.request.contextPath}/resources/images/bg-none.png"/>
				              <b style="width:300px"> 非常抱歉，并未收藏任何商品！</b> 
				    </div>
				</c:if> 
    </div>
    
  </div>
</body>
</html>