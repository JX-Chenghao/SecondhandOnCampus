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
		<li class="active"><a href="#" class="goods" >商品</a></li>
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
        		 &raquo; <a href="#">商品</a>
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
			      商品浏览
			      <div class="find">
			             <input type="text" placeholder="请输入所需商品信息"/>
			             <a href="#"><img src="${pageContext.request.contextPath}/resources/images/find.png"/></a>
			      </div>
			 </div>
			<div class="categoryForGoods">
				<ul>
						<li ><b>数码电子:</b>
						<a id="" class="hui" href="#no">不限</a>
						<a id= "" href="#no" class="hui">< 100万</a>			
						<a id="sjina_D03_08_03" href="/house/s/b220000x/">20000以下</a>
						<a id="" href="">200万-300万</a>
						<a id="" href="">300万-400万</a>
						<a id="" href="">400万-500万</a>
						<a id="" href="/house/s/b2100000s/">>500万</a>
						<a id="" href="/house/s/b29999999999%2C9999999999/">价格待定</a>

						<li > <b>日常生活:</b>
							<a id="sjina_D03_12_01" class="hui" href="#no">不限</a>
							<a id="sjina_D03_08_010" href="/house/s/b2100000s/">< 4000元/㎡</a>
							<a id="sjina_D03_08_010" href="/house/s/b2100000s/">4000-6000元/㎡</a>
							<a id="sjina_D03_08_010" href="/house/s/b2100000s/">6000-8000元/㎡</a>
							<a id="sjina_D03_08_010" href="/house/s/b2100000s/">8000-10000元/㎡</a>
							<a id="sjina_D03_08_02" href="/house/s/b29999999999%2C9999999999/">10000元/㎡</a>
							<a id="sjina_D03_08_02" href="/house/s/b29999999999%2C9999999999/">> 10000元/㎡</a>

						</li>

						<li>  <b>文学杂志:</b>
							<a id="sjina_D03_12_01" class="hui" href="#no">不限</a>
							<a id= "sjina_D03_12_02" data-name="bedrooms" data-id="" href="/house/s/c21/">别墅</a>
							<a id= "sjina_D03_12_02" data-name="bedrooms" data-id="" href="/house/s/c21/">一居</a>
							<a id= "sjina_D03_12_03" data-name="bedrooms" data-id="" href="/house/s/c22/">两居</a>
							<a id= "sjina_D03_12_04" data-name="bedrooms" data-id="" href="/house/s/c23/">三居</a>
							<a id= "sjina_D03_12_05" data-name="bedrooms" data-id="" href="/house/s/c24/">四居</a>
							<a id= "sjina_D03_12_06" data-name="bedrooms" data-id="" href="/house/s/c25/">五居</a>
							<a id= "sjina_D03_12_07" data-name="bedrooms" data-id="" href="/house/s/c26/">五居以上</a> 

						</li>
						<li >  <b>其他产品:</b>
							<a id="sjina_D03_12_01" class="hui" href="#no">不限</a>
							<a id="sjina_D03_08_010" href="/house/s/b2100000s/">< 50m²</a>
							<a id="sjina_D03_08_02" href="/house/s/b29999999999%2C9999999999/">50m²-80m²</a>
							<a id="sjina_D03_08_02" href="/house/s/b29999999999%2C9999999999/">80m²-120m²</a>
							<a id="sjina_D03_08_02" href="/house/s/b29999999999%2C9999999999/">120m²-140m²</a>
							<a id="sjina_D03_08_02" href="/house/s/b29999999999%2C9999999999/">140m²-160m²</a>
							<a id="sjina_D03_08_02" href="/house/s/b29999999999%2C9999999999/">> 160m²</a>

						</li>

					</ul>

        			</div>
		 	<div class="box-product" style="margin-left:50px">
	           <c:forEach items="${pageBeanForGoods.list }" var="goods">
				<div class="showhim">
					<div class="image">
					   <a href="product.html">
					        <c:if test="${goods.picture==''}">
					        <img src="${pageContext.request.contextPath}/resources/images/product_holder.jpg" alt="${goods.name }" />
							</c:if>
							<c:if test="${goods.picture!='' }">
					        <img src="/picForBS/goods/${goods.picture}" alt="${goods.name }" />
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
								<li><a href="#">添加到购物车</a></li>
							</ul>
						</div>
						
					</div>	
				</div>                
			   </c:forEach>	




			</div>

            <div class="pages">
                    <div> 共显示 ${pageBeanForGoods.list.size()} 条数据  （第${pageBeanForGoods.currPage}/${pageBeanForGoods.totalPage}页）</div>
                    <div >
                    		<c:if test="${pageBeanForGoods.currPage==1}">
                      				 <a class="selectPage" href="${pageContext.request.contextPath }/goods/showGoodsByPage.action?currentPage=${pageBeanForGoods.currPage+1}">  下一页</a>
                    		</c:if>
                    		<c:if test="${pageBeanForGoods.currPage!=1 && pageBeanForGoods.currPage!=pageBeanForGoods.totalPage}">
                                 	<a  class="selectPage" href="${pageContext.request.contextPath }/goods/showGoodsByPage.action?currentPage=${pageBeanForGoods.currPage-1}">上一页</a>
                      				 <a class="selectPage" href="${pageContext.request.contextPath }/goods/showGoodsByPage.action?currentPage=${pageBeanForGoods.currPage+1}">  下一页</a>
                   		 	</c:if>
                   			 <c:if test="${pageBeanForGoods.currPage==pageBeanForGoods.totalPage }">
                   			 		<a class="selectPage" href="${pageContext.request.contextPath }/goods/showGoodsByPage.action?currentPage=${pageBeanForGoods.currPage-1}">上一页</a>
                   			 </c:if>
                    
                      
                     </div>
            </div>
	</div>


</body>
</html>