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
                                        $("#addOrder").removeAttr("disabled");
                           }else{
                                   	   $("#payWayInfo0").hide();
                                       $("#payWayInfo1").show();
                                       $("#addOrder").attr("disabled","disabled");
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
		<li ><a href="${pageContext.request.contextPath}/order/showOrder.action" class="orderInfo">订单信息</a></li>
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
<form name="addForm" action="${pageContext.request.contextPath}/order/addOrders.action">
		 		<c:forEach items="${orderVOs}" var="orderVO">
		 				   <div  class="order-info">
							           <div class="crop">卖家：${orderVO.cropName }</div>
							         <c:forEach items="${orderVO.orderitemVOs}" var="orderitemVO">  
           	                            <div class="orderItem">
                                       	<div >
                                   <c:if test="${orderitemVO.goodPicPath==''}">
												<a href="#"><img src="${pageContext.request.contextPath}/resources/images/thumber.jpg" /></a>
									</c:if>
									<c:if test="${orderitemVO.goodPicPath!=''}">
												<a href="#"><img src="/picForBS/goods/${orderitemVO.goodPicPath}/thumbnail/thumb_${orderitemVO.goodCoverPic}" width="80px"/></a>
									</c:if>
                                       ${orderitemVO.goodName }</div>
											<div>${orderitemVO.orderitem.price/orderitemVO.orderitem.quantity }</div>
											<div>${orderitemVO.orderitem.quantity }</div>
											<div>${orderitemVO.goodUsedMonth }个月</div>
											<div>${orderitemVO.orderitem.price }</div>
                                       </div>
                                      </c:forEach> 
                                       
                                       <div>
                                       	<div class="way">运送方式
                                       		<select name="o_${orderVO.order.cropId}"> 
                                       			<option value="0">校内货物点自取</option><option value="1">送货上门(2.5元)</option>
                                       		</select>
                                       	</div>
                                       	<div class="feeToCrop">卖家合计(含运费)￥<span class="orderTotalPrice">${orderVO.order.totalPrice }</span></div>
                                       </div>                                            
							</div>
		 		</c:forEach>
		
		<div class="orderSubmit">总计 ：￥317.8<a  data-toggle="modal" data-target="#dialog" style="cursor:pointer">提交</a></div>
		   <!-- 评论    模态框（Modal） -->
   <div class="modal fade" id="dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					选择付款方式
				</h4>
			</div>
			
			 <label style="font-size:small"> <input class="oneWay" type="radio" style="width:25px;height:20px;" name="payWay" id="optionsRadios1"  value="0" checked> 货到付款 </label>
                     		 <label style="font-size:small">
                     		  <input class="twoWay" type="radio" style="width:25px;height:20px;" name="payWay" id="optionsRadios2" value="1" />在线付款 </label><br/>
			 </form>
			
			  <div id="payWayInfo0" class="alert alert-info" contenteditable="true">
               			  
                 			<h4>提示!</h4>
                			  <strong>注意!</strong> 若取货方式不为送货上门而是，校园取货点自取，请带好相应订单价钱，支持手机支付，否则无法取走！
                		</div>
                		 <div id="payWayInfo1" class="alert alert-info" contenteditable="true" style="display:none" >  
                 			<h4>请扫二维码付款（暂不支持）!</h4>

                			  <img src="${pageContext.request.contextPath}/resources/images/2wm.png" style="margin-left:100px;">
			</div>

			<div class="modal-footer" >	  
				<button  class="btn btn-default"  data-dismiss="modal" >退回</button>
				<button  class="btn btn-primary" id="addOrder" onclick="addOrderBtn()" >提交</button>
			</div>
	
		  </div><!-- /.modal-content -->
	   </div><!-- /.modal -->
		
	</div>
  
</body>
</html>