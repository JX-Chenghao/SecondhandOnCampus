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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<title>校园二手交易网站</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

     <script type="text/javascript">
     $(function(){
     	 $(".order-info select").change(function(){
		  	   if($(this).val()=="1"){
		  	       var price=$(this).parent().next().find(".orderTotalPrice").html();
		  	       $(this).parent().next().find(".orderTotalPrice").html(parseFloat(price)+2.5);;
	 	 	   }
	 	});
	 	 $(":radio").change(function(){
                           var way=$(this).val();
                           if(way==0){
                                         $("#payWayInfo0").show();
                                         $("#payWayInfo1").hide();
                                        $("button[name='addOrder']").removeAttr("disabled");
                           }else{
                                   	  $("#payWayInfo0").hide();
                                     $("#payWayInfo1").show();
                                       $("button[name='addOrder']").attr("disabled","disabled");
                            }
        });	
      
     
     });
 	function addOrderBtn(){
 	      $("form[name='addForm']").submit();
 	
 	}
   
      
     </script>
</head>
<body style="background-color:#edece8">
	<div class="menu">
	          <div class="logo"></div>
		<ul>
		<li><a href="main.html" class="home">首页</a></li>
		<li ><a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action" class="goods" >商品</a></li>
		<li ><a href="${pageContext.request.contextPath}/cart/showCart.action" class="cart">购物车</a></li>
		<li class="active"><a href="#" class="orderInfo">订单信息</a></li>
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
        		&raquo; <a href="${pageContext.request.contextPath}/cart/showCart.action">订单信息</a>
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
    <div class="container" style="width:83%;margin-left:100px">
            <div class="orderForUser">
                         <ul class="nav nav-tabs" >
                   		 <li class="active"><a href="#panel-1" data-toggle="tab" contenteditable="true" style="cursor:pointer;color:gray">所有订单</a></li>
                    		 <li class=""><a href="#panel-2" data-toggle="tab" contenteditable="true" style="cursor:pointer;color:gray">代付款</a></li>
                    		 <li class=""><a href="#panel-3" data-toggle="tab" contenteditable="true" style="cursor:pointer;color:gray">代发货</a></li>
                    		 <li class="" style="cursor:pointer;"><a href="#panel-4" data-toggle="tab" contenteditable="true" style="cursor:pointer;color:gray">代收货</a></li>
                         </ul>
                         <div class="tab-content">
                    		
                    		<div class="tab-pane active" id="panel-1" >
                     <c:forEach items="${orderVOs}" var="orderVO">
                     	<div class="orderInfo">
                          	<div class="first">
                        		 <f:formatDate  value="${orderVO.order.orderDate}" pattern="yyyy/MM/dd"/>
                          		 &nbsp;  订单号：${orderVO.order.orderNumber }
                          	</div>
                          <c:forEach items="${orderVO.orderitemVOs}" var="orderitemVO">  
                          	<div class="info">
                          	   <c:if test="${orderitemVO.goodPicPath==''}">
                          	      <div class="img"><img src="${pageContext.request.contextPath}/resources/images/thumber.jpg"  width="120px"></div>
                          	   </c:if>
                          	   <c:if test="${orderitemVO.goodPicPath!=''}">
                          	      <div class="img"><img src="/picForBS/goods/${orderitemVO.goodPicPath}/thumbnail/thumb_${orderitemVO.goodCoverPic}"  width="120px"></div>
                          	   </c:if>
                          		
                          		<div class="totalPrice">${orderitemVO.orderitem.price }</div>
                          		<div class="state">交易成功</div>
                          		<div class="evaluate">还未评价，去评价</div>
                          	</div>
                          </c:forEach>
                         </div>
					</c:forEach>
                   	 </div>
                  	<div class="tab-pane" id="panel-2" >
                    		     <div class="orderInfo">
                          		  <div class="first">
                          		    2017/1/15    订单号：123456789
                          		</div>
                          		  <div class="info">
                          			    <div class="img"></div>
                          			    <div class="totalPrice"></div>
                          			    <div class="state"></div>
                           			   <div class="evaluate"></div>
                          		  </div>
                          	</div>
                    	</div>
                  	<div class="tab-pane" id="panel-3" >
                    		     <div class="orderInfo">
                          		  <div class="first">
                          		    2017/1/15    订单号：123456789
                          		</div>
                          		  <div class="info">
                          			    <div class="img"></div>
                          			    <div class="totalPrice"></div>
                          			    <div class="state"></div>
                           			   <div class="evaluate"></div>
                          		  </div>
                          	</div>
                    	</div>
                  	<div class="tab-pane" id="panel-4" >
                    		     <div class="orderInfo">
                          		  <div class="first">
                          		    2017/1/15    订单号：123456789
                          		</div>
                          		  <div class="info">
                          			    <div class="img"></div>
                          			    <div class="totalPrice"></div>
                          			    <div class="state"></div>
                           			   <div class="evaluate"></div>
                          		  </div>
                          	</div>
                    	</div>                    	                    	
                  </div>
            </div>

       </div>

		
	
  
</body>
</html>