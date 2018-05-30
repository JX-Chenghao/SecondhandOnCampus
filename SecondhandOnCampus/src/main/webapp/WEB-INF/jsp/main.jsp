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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr.custom.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.cslider.js"></script>
	<script>
        (function(doc, win) {
            // 基于 window.screen.width 实现自适应布局
            var screenWidth = 0,
                size = 'XL',
                root = doc.documentElement;
            if (window.screen && screen.width) {
                screenWidth = screen.width;
                if (screenWidth >= 1200) size = 'XL'; // 大屏 - 1200px
                else if (screenWidth < 1200) size = 'XS'; // 小屏 - 1000px
            }
            root.className += " " + size; // 标记CSS
            win.SIZE = size; // 标记JS
        })(document, window);

        window.OT2 = {}; // 全局命名空间
        OT2.AboveIE9 = true; // 默认非iE或IE9及以上
        OT2.ns = function(name) {
            var container = OT2;
            var parts = name.split('.');
            var current = '';
            if (parts[0] == 'OT2') parts.shift();
            while (current = parts.shift()) {
                if (!container[current]) container[current] = {};
                container = container[current];
            }
            return container;
        };

    </script>
	
	
	<script type="text/javascript">
    	$(function() {
			$('#da-slider').cslider();
			
		});
		
		
		function addCart(goodsId){
               $.ajax({
                   url :'${pageContext.request.contextPath}/cart/add.action?id='+goodsId,
                   type :"get",
                   dataType:"json",
                   success :function(data){
                       if(data.res=="success"){
                           alert("添加到购物车成功");
                           $("#cart_total").html(data.items+" 项 - ￥"+data.totalPrice);
                       }  else if( data.res=="fail") {
                           alert("添加到购物车失败，添加数量大于物品转让的个数");
                       }               
                   }
               });
               
           		
           }
	</script>
</head>
<body >
	<div class="menu" >
	    <div class="logo"></div>
		<ul>
		<li class="active"><a href="${pageContext.request.contextPath}/goods/showMainGoods.action" class="home">首页</a></li>
		<li ><a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action" class="goods" >商品</a></li>
		<li ><a href="${pageContext.request.contextPath}/cart/showCart.action" class="cart">购物车</a></li>
		<li ><a href="${pageContext.request.contextPath}/order/showOrder.action"  class="orderInfo">订单信息</a></li>
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
    <div id="da-slider" class="da-slider">
				<div class="da-slide">
					<h2>欢迎来到二手交易网站</h2>
					<p>在这，你能找到你所需要的东西.</p>
					<a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action" class="da-link">Go!</a>
					<div class="da-img"><img src="${pageContext.request.contextPath}/resources/images/slider1.png" alt="image01" /></div>
				</div>
				<div class="da-slide">
					<h2>实惠高效</h2>
					<p>花费不多的代价来选择所需要物品.迅速在校园中获得自己所要物品。</p>
					<a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action" class="da-link">Go!</a>
					<div class="da-img"><img src="${pageContext.request.contextPath}/resources/images/slider2.png" alt="image01" /></div>
				</div>
				<div class="da-slide">
					<h2>人员招聘</h2>
					<p>网站需要一些兼职人员来处理快递发送与物品站的管理.</p>
					<a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action" class="da-link">Go!</a>
					<div class="da-img"><img src="${pageContext.request.contextPath}/resources/images/slider3.png" alt="image01" /></div>
				</div>
				<div class="da-slide">
					<h2>温馨提示</h2>
					<p>收获时请确定物品的质量达到预期</p>
					<a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action" class="da-link">Go!</a>
					<div class="da-img"><img src="${pageContext.request.contextPath}/resources/images/slider4.png" alt="image01" /></div>
				</div>
				<nav class="da-arrows">
					<span class="da-arrows-prev"></span>
					<span class="da-arrows-next"></span>
				</nav>
	</div>

	<div class="container">
			<div class="text_box_left">最新发布<a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action"  >>>>分类浏览</a></div>
		 	<div class="box-product">


			   	
				<c:forEach items="${goodsList }" var="goods">
				<div class="showhim">
					<div class="image">
					   <a href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${goods.id}">
					        <c:if test="${goods.picturePath==''}">
					        <img src="${pageContext.request.contextPath}/resources/images/product_holder.jpg" alt="${goods.name }" />
							</c:if>
							<c:if test="${goods.picturePath!='' }">
					        <img src="/picForBS/goods/${goods.picturePath}/thumbnail/thumb_${goods.coverPic}" alt="${goods.name }" />
							</c:if>
							<div class="showme">
								<div class="description_featured" style="min-height:110px;">	
									<p>${goods.introducedText }</p>
								</div>
							</div>
						</a>
						<div class="name"><a href="#">${goods.name }</a></div>
						<div class="priced">
							<ul>
								<li>￥${goods.price }</li>
								<li><a onclick="addCart(${goods.id})" >添加到购物车</a></li>
							</ul>
						</div>
						
					</div>	
				</div>                
			   </c:forEach>	       
				
			</div>
	</div>
</body>
</html>