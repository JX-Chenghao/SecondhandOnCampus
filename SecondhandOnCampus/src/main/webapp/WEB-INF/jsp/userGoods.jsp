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
		  function removeGoods(goodsId){
               $.ajax({
                   url :'${pageContext.request.contextPath}/goods/removeGoods.action?id='+goodsId,
                   type :"get",
                   dataType:"json",
                   success :function(data){
                       if(data.res=="success"){
                           alert("移除成功");
                           $("#tr"+goodsId).remove();
                       }else{
                           alert("移除失败");
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
                 <a href="${pageContext.request.contextPath}/goods/showCollection.action?userId=${sessionScope.user.id}"  style="text-decoration: none; color: #333;font-size:16px;">
                       <dl id="dt_3"  class="catalog">  我的收藏</dl>
                  </a>
                  
                <c:if test="${statusType==0 }">
                   <a  href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=0"  style="text-decoration: none; color: #333;font-size:16px;">
                      <dl id="dt_4" > 正审核商品</dl>
                      </a>
                   <a  href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=1"  style="text-decoration: none; color: #333;font-size:16px;">
                        <dl id="dt_5" class="catalog"> 已通过商品</dl>
                      </a>
                   <a   href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=2" style="text-decoration: none; color: #333;font-size:16px;">
                        <dl id="dt_6" class="catalog">未通过商品</dl>
                   </a>    
           	    </c:if>
                <c:if test="${statusType==1 }">
                   <a  href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=0"  style="text-decoration: none; color: #333;font-size:16px;">
                      <dl id="dt_4" class="catalog"> 正审核商品</dl>
                      </a>
                   <a  href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=1"  style="text-decoration: none; color: #333;font-size:16px;">
                        <dl id="dt_5" > 已通过商品</dl>
                      </a>
                   <a   href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=2" style="text-decoration: none; color: #333;font-size:16px;">
                        <dl id="dt_6" class="catalog">未通过商品</dl>
                   </a>    
                </c:if>
                <c:if test="${statusType==2 }">
                   <a  href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=0"  style="text-decoration: none; color: #333;font-size:16px;">
                      <dl id="dt_4" class="catalog"> 正审核商品</dl>
                      </a>
                   <a  href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=1"  style="text-decoration: none; color: #333;font-size:16px;">
                        <dl id="dt_5" class="catalog"> 已通过商品</dl>
                      </a>
                   <a   href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=2" style="text-decoration: none; color: #333;font-size:16px;">
                        <dl id="dt_6" >未通过商品</dl>
                   </a> 
                       
                </c:if>
                    <a   href="${pageContext.request.contextPath}/goods/addGoodsView.action" style="text-decoration: none; color: #333;font-size:16px;">
                        <dl id="dt_6" class="catalog">上架商品</dl>
                   </a>   
                                                   
            </dt>
        </div>
  
  
  
     <div class="ownGoods-info">
       <table>
        <thead>
          <tr>
            
            <td class="image">图片</td>
            <td class="name">商品名</td>
            <td class="model">介绍</td>
            <td class="quantity">数量</td>
            <td class="price">单价</td>
            <c:if test="${statusType!=2 }">
                <td class="status">审核状态</td>
            </c:if>
            <c:if test="${statusType==2 }">
                <td class="status">未通过原因</td>
            </c:if>
            <td class="remove">下架商品</td>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${ownGoodsList}" var="ownGoods">
          <tr id="tr${ownGoods.id}">
           <c:if test="${ownGoods.picturePath==''}">
				<td class="image"><a href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${ownGoods.id}"><img src="${pageContext.request.contextPath}/resources/images/thumber.jpg"  /></a></td>
			</c:if>
			<c:if test="${ownGoods.picturePath!=''}">
                <td class="image"><a href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${ownGoods.id}"><img src="/picForBS/goods/${ownGoods.picturePath}/thumbnail/thumb_${ownGoods.coverPic}"  /></a></td>
           </c:if>
            
            <td class="name"><a href="#">${ownGoods.name}</a>
              <div>
              </div>
            </td>
            <td class="introduce">${ownGoods.introducedText}</td>
            <td class="quantity">${ownGoods.quantity}</td>
            <td class="price">￥${ownGoods.price}</td>
            <c:if test="${statusType==0 }">
                <td >正在审核中</td>
            </c:if>
            <c:if test="${statusType==1 }">
                <td >成功上架</td>
            </c:if>
            <c:if test="${statusType==2 }">
                <td class="failureText">${ownGoods.failureText}</td>
            </c:if>
            <td class="remove"><a onclick="removeGoods(${ownGoods.id})"><img src="${pageContext.request.contextPath}/resources/images/remove_collection.png"> </a></td>
          </tr> 
         </c:forEach>  
        </tbody>
      </table>
    </div>
</body>
</html>