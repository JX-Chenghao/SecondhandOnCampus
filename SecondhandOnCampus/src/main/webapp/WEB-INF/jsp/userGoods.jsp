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
        		&raquo; <a href="#">个人中心</a>&raquo; <a href="#">商品管理</a>
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
  
  
       <div class="left_option" >
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
                      <dl id="dt_4" class="selectOk" > 正审核商品</dl>
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
  
  
  
     <div class="ownGoods-info">
       <table>
        <thead>
          <tr>
            
            <td style="text-align:center;vertical-align:middle" class="image">图片</td>
            <td style="text-align:center;vertical-align:middle" class="name">商品名</td>
            <td style="text-align:center;vertical-align:middle" class="model">介绍</td>
            <td style="text-align:center;vertical-align:middle" class="quantity">数量</td>
            <td style="text-align:center;vertical-align:middle" class="price">单价</td>
            <c:if test="${statusType!=2 }">
                <td style="text-align:center;vertical-align:middle" class="status">审核状态</td>
            </c:if>
            <c:if test="${statusType==1 }">
                <td style="text-align:center;vertical-align:middle" >留言</td>
            </c:if>
            <c:if test="${statusType==2 }">
                <td  style="text-align:center;vertical-align:middle" class="status">未通过原因</td>
            </c:if>
            <c:if test="${statusType==0 }">
                <td style="text-align:center;vertical-align:middle" class="remove">移除商品</td>
            </c:if>
            <c:if test="${statusType==2 }">
                <td style="text-align:center;vertical-align:middle" class="remove">移除商品</td>
            </c:if>
            <c:if test="${statusType==1 }">
                <td style="text-align:center;vertical-align:middle" class="remove">下架商品</td>
            </c:if>
            
          </tr>
        </thead>
        <tbody >
        <c:forEach items="${ownGoodsList}" var="ownGoods">
          <tr id="tr${ownGoods.goods.id}">
           <c:if test="${ownGoods.goods.picturePath==''}">
				<td class="image" style="text-align:center"><a href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${ownGoods.goods.id}"><img src="${pageContext.request.contextPath}/resources/images/thumber.jpg"  /></a></td>
			</c:if>
			<c:if test="${ownGoods.goods.picturePath!=''}">
                <td class="image" style="text-align:center"><a href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${ownGoods.goods.id}"><img src="/picForBS/goods/${ownGoods.goods.picturePath}/thumbnail/thumb_${ownGoods.goods.coverPic}"  /></a></td>
           </c:if>
            
            <td class="name" style="width:100px;text-align:center;vertical-align:middle"><a href="#">${ownGoods.goods.name}</a>
              <div>
              </div>
            </td>
            <td class="introduce" style="width:200px;text-align:center;vertical-align:middle">${ownGoods.goods.introducedText}</td>
            <td class="quantity" style="width:100px;text-align:center;vertical-align:middle">${ownGoods.goods.quantity}</td>
            <td class="price" style="text-align:center;vertical-align:middle">￥${ownGoods.goods.price}</td>
            <c:if test="${statusType==0 }">
                <td style="text-align:center;vertical-align:middle">正在审核中</td>
            </c:if>
            <c:if test="${statusType==1 }">
                <td style="text-align:center;vertical-align:middle">成功上架</td>
            </c:if>
            <c:if test="${statusType==2 }">
                <td class="failureText" style="text-align:center;vertical-align:middle">${ownGoods.goods.failureText}</td>
            </c:if>
            <c:if test="${statusType==1 }">
            <td style="text-align:center;vertical-align:middle">
                <c:if test="${ownGoods.newMsg==false }">暂无新消息</c:if>
            	<c:if test="${ownGoods.newMsg==true }"><${ownGoods.msgNum}>新消息<br/><a  style="font-size:12px;color:gray;" href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${ownGoods.goods.id}">>>>去回复</a></c:if>
			</td>
			</c:if>
            <td class="remove" style="text-align:center;vertical-align:middle"><a onclick="removeGoods(${ownGoods.goods.id})"><img src="${pageContext.request.contextPath}/resources/images/remove_collection.png"> </a></td>
          </tr> 
         </c:forEach>  
        </tbody>
      </table>
            	<c:if test="${fn:length(ownGoodsList)==0}">
				    <div style="margin-left:450px;margin-top:40px">
				     <img src="${pageContext.request.contextPath}/resources/images/bg-none.png"/>
				              <b style="width:300px">不好意思，没有任何商品
				                <c:if test="${statusType==0 }">
                                                                                                  正在审核中
            					</c:if>
            					<c:if test="${statusType==1 }">
                				  成功上架
                				 </c:if>
                				 <c:if test="${statusType==2 }">
            					   上架失败	
            					</c:if>！
            					</b> 
				    </div>
				</c:if> 
    </div>
</body>
</html>