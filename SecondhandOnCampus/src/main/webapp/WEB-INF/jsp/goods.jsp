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
<link rel="stylesheet"  type="text/css"  href="${pageContext.request.contextPath}/resources/css/slider.css"  /> 
<title>校园二手交易网站</title>
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
     <script type="text/javascript">
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
<body>
	<div class="menu">
	    <div class="logo"></div>
		<ul>
		<li><a href="main.html" class="home">首页</a></li>
		<li class="active"><a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action" class="goods" >商品</a></li>
		<li ><a href="${pageContext.request.contextPath}/cart/showCart.action" class="cart">购物车</a></li>
		<li><a href="order.html" class="orderInfo">订单信息</a></li>
		<li><a href="${pageContext.request.contextPath}/user/user.action" class="userInfo">个人中心</a></li>
	
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
      			<a><span id="cart_total">${fn:length(sessionScope.cart.items)} 项 - ￥${sessionScope.cart.total}</span></a>
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
						
						<c:forEach items="${categoryVOs }" var="categoryVO">
						   <li ><b>${categoryVO.firstCategory.name }:</b>
						       <a id="" class="hui" href="#no">不限</a>
						       <c:forEach items="${categoryVO.secondCategories }" var="category">
						              <a href="#no" class="hui">${category.name }</a>	
						       	</c:forEach>
						   </li>
						
						</c:forEach>
					
					

					</ul>

        			</div>
		 	<div class="box-product" style="margin-left:50px">
	           <c:forEach items="${pageBeanForGoods.list }" var="goods">
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