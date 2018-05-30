<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/app.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/slider.css" all />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<title>校园二手交易网站</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		$(".order-info select").change(
				function() {
					if ($(this).val() == "1") {
						var price = $(this).parent().next().find(
								".orderTotalPrice").html();
						$(this).parent().next().find(".orderTotalPrice").html(
								parseFloat(price) + 2.5);
						;
					}
				});
			 $(".orderForUser .orderInfo").mousemove(function(){
  				$(this).css("border","1px solid #ceb4a2");
  			 });
             $(".orderForUser .orderInfo").mouseout(function(){
  				$(this).css("border","1px solid #d0cecd");
  			 });
		$(":radio").change(function() {
			var way = $(this).val();
			if (way == 0) {
				$("#payWayInfo0").show();
				$("#payWayInfo1").hide();
				$("button[name='addOrder']").removeAttr("disabled");
			} else {
				$("#payWayInfo0").hide();
				$("#payWayInfo1").show();
				$("button[name='addOrder']").attr("disabled", "disabled");
			}
		});
		
		$("#addConfirmOrderBtn").click(function(){
		           var orderId=  $("#confirmOrderId").val();
		             $.ajax({
                                url:'${pageContext.request.contextPath}/order/confirmOrder.action',
		                     	type:"post",
		                     	 dataType :"json",
			                    data:{
			                    orderId : orderId,
			                    },
			                    success:function(data){
			                      	 	if(data.res=="success"){
			                         	 	 alert("<确认收货成功！>");
			                         	 	 $("#tuihui1").click();
			                         	 	 $(".orderDiv"+orderId).toggle();
			                      		 }else {
			                       		     alert("<异常>");
			                      		 }
			                       
                                }
                        });

		});
		
		
		$("#addEvaluateBtn").click(function(){
		    var orderId=  $("#evaluateOrderId").val();
			var content= $("#evaluateContent").val();
			var cropId= $("#evaluatCropId").val();
			$.ajax({
                                url:'${pageContext.request.contextPath}/user/evaluate/add.action',
		                     	type:"post",
			                    dataType :"json",
			                    // 输入英文???会出BUG
			                    data:{
			                    orderId : orderId,
			                    content :content,
			                    cropId  :cropId
			                    },
			                    success:function(data){
			                      	 	if(data.res=="success"){
			                         	 	 alert("<评价成功！>");
			                         	 	 $("#goEvaluateBtn"+orderId+"a").remove();
			                         	 	 $("#goEvaluateBtn"+orderId).html("<span style='color:red'>"+content+"</span>");
			                         	 	 $("#evaluateContent").val("");
			                         	 	 $("#evaluateOrderId").val("");
			                         	 	 $("#evaluatCropId").val("");
			                         	 	 $(".modal-header .close").click();
			                      		 }else {
			                       		     alert("<异常>");
			                      		 }
			                       
                                }
                        });

		});

	});
	//评价对话框弹出，需保存我所要评价的订单
	function dialog(param1,param2) {
  			 $("#evaluateOrderId").attr("value", param1);//把动态Id保存到弹出的input中
  			 $("#evaluatCropId").attr("value", param2);
	}
	//确认收货对话框弹出
	function dialog2(param1) {
  			 $("#confirmOrderId").attr("value", param1);//把动态Id保存到input中
	}
</script>
</head>
<body style="background-color:#edece8">
	<div class="menu">
		<div class="logo"></div>
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/goods/showMainGoods.action"
				class="home">首页</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/goods/showGoodsByPage.action"
				class="goods">商品</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/cart/showCart.action"
				class="cart">购物车</a>
			</li>
			<li class="active"><a href="#" class="orderInfo">订单信息</a>
			</li>
			<li><a
				href="${pageContext.request.contextPath}/user/user.action"
				class="userInfo">个人中心</a>
			</li>

			<c:if test="${sessionScope.user==null}">
				<li style="float:right;"><a
					href="${pageContext.request.contextPath}/user/index.action"
					class="login">登录</a>
				</li>
				<li style="float:right;"><a
					href="${pageContext.request.contextPath}/user/index.action"
					class="register">注册</a>
				</li>
			</c:if>
			<c:if test="${sessionScope.user!=null}">
				<li style="float:right;"><a
					href="${pageContext.request.contextPath}/user/loginout.action"
					class="login">退出登录</a>
				</li>
				<li style="float:right;"><a href="#" class="register">${sessionScope.user.aliasName}</a>
				</li>
			</c:if>
		</ul>
	</div>
	<div class="linktree">
		<a href="#">主页</a> &raquo; <a
			href="#">订单信息</a>
	</div>
	<div style="width:1000px;margin:0 auto;">
		<div id="cart">
			<%-- <div class="heading">
				<a style="padding:8px;margin-left:-14px;">购物车</a> <span
					style="font-size:14px;color:#fff;">&raquo;</span> <a><span
					id="cart_total">${fn:length(sessionScope.cart.items)} 项 -
						￥${sessionScope.cart.total}</span> </a>
			</div> --%>

		</div>
	</div>
	<br />
	<br />
	<div class="container"
		style="width:85%;margin-left:100px;margin-top:-10px;">
		<div class="orderForUser">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#panel-1" data-toggle="tab"
					contenteditable="true" style="cursor:pointer;color:gray">所有订单</a>
				</li>
				<li class="" style="cursor:pointer;"><a href="#panel-2"
					data-toggle="tab" contenteditable="true"
					style="cursor:pointer;color:gray">待付款</a>
				</li>
				<li class="" style="cursor:pointer;"><a href="#panel-3"
					data-toggle="tab" contenteditable="true"
					style="cursor:pointer;color:gray">待发货</a>
				</li>
				<li class="" style="cursor:pointer;"><a href="#panel-4"
					data-toggle="tab" contenteditable="true"
					style="cursor:pointer;color:gray">待收货</a>
				</li>
				<li class="" style="cursor:pointer;"><a href="#panel-5"
					data-toggle="tab" contenteditable="true"
					style="cursor:pointer;color:gray">已完成</a>
				</li>
			</ul>
			<div class="tab-content" style="font-weight:normal;">

				<div class="tab-pane active" id="panel-1" style="margin-left:30px">
				   <c:if test="${fn:length(orderVOs)==0}">
				      <div style="margin-left:420px;margin-top:100px">
				       <img src="${pageContext.request.contextPath}/resources/images/bg-none.png"/>
				              <b style="width:300px;font-size:18px">不存在此种订单！</b> 
				      </div>
				   </c:if> 
				
					<c:forEach items="${orderVOs}" var="orderVO">
						<div class="orderInfo" >
							<div class="first" >
							订单号：${orderVO.order.orderNumber } <span
									class="totalPrice">总价：￥${orderVO.order.totalPrice }</span>&nbsp;
								日期：<f:formatDate value="${orderVO.order.orderDate}"
									pattern="yyyy/MM/dd" />
								 
							</div>
							<c:if test="${fn:length(orderVO.orderitemVOs)==0}">
							    <div class="info">
							          <div class="img">
											<a
												href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${orderitemVO.orderitem.goodsId}">
												<img
												src="${pageContext.request.contextPath}/resources/images/thumber.jpg"
												width="120px"> </a>
										</div>
										<div class="goodName">----</div>
										<div class="getWay">----</div>
										<div class="totalPrice">----</div>
										<div class="state">失败订单</div>
										<div class="evaluate"><a href="${pageContext.request.contextPath}/order/delete.action?id=${orderVO.order.id}">删除它</a></div>
							   </div>
							</c:if>
							<c:forEach items="${orderVO.orderitemVOs}" var="orderitemVO">
								<div class="info">
									<c:if test="${orderitemVO.goodPicPath==''}">
										<div class="img">
											<a
												href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${orderitemVO.orderitem.goodsId}">
												<img
												src="${pageContext.request.contextPath}/resources/images/thumber.jpg"
												width="120px"> </a>
										</div>
										
									</c:if>
									<c:if test="${orderitemVO.goodPicPath!=''}">
										<div class="img">
											<a
												href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${orderitemVO.orderitem.goodsId}">
												<img
												src="/picForBS/goods/${orderitemVO.goodPicPath}/thumbnail/thumb_${orderitemVO.goodCoverPic}"
												width="120px"> </a>
										</div>
									</c:if>
									<div class="goodName">${ orderitemVO.goodName}</div>
									<c:if test="${orderVO.order.getWay==0}">
										<div class="getWay">校园自取</div>
									</c:if>
									<c:if test="${orderVO.order.getWay==1}">
										<div class="getWay">送货上门</div>
									</c:if>
									<div class="totalPrice">￥${orderitemVO.orderitem.price }</div>
									<c:if test="${orderVO.order.orderState==0}">
										<div class="state">待发货</div>
										<div class="evaluate">-</div>
									</c:if>
									<c:if test="${orderVO.order.orderState==1}">
										<div class="state">待收货</div>
										<div class="evaluate">-</div>
									</c:if>
									<c:if test="${orderVO.order.orderState==-1}">
										<div class="state">失败订单</div>
										<div class="evaluate"><a href="${pageContext.request.contextPath}/order/delete.action?id=${orderVO.order.id}">删除它</a></div>
									</c:if>
									<c:if test="${orderVO.order.orderState==2}">
										<div class="state">交易成功</div>
										<div class="evaluate">
											<c:if test="${orderVO.evaluateContent==null}">
												<a data-toggle="modal" data-target="#dialog"
												onclick="dialog('${orderVO.order.id}','${orderVO.order.cropId}')"
												>还未评价，去评价</a>
									    	</c:if>
									    	<c:if test="${orderVO.evaluateContent!=''}">
										    	<span>${orderVO.evaluateContent}</span>
									   	 	</c:if>
										</div>
									</c:if>


								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
				<div class="tab-pane" id="panel-2" style="margin-left:30px">
				   <c:if test="${fn:length(sessionScope.orderVOs)==0}">
				      <div style="margin-left:420px;margin-top:100px">
				       <img src="${pageContext.request.contextPath}/resources/images/bg-none.png"/>
				              <span style="width:300px;font-size:18px">不存在此种订单！</span> 
				      </div>
				   </c:if> 
					<c:forEach items="${sessionScope.orderVOs}" var="orderVO">
						<div class="orderInfo">
							<div class="first">
								<f:formatDate value="${orderVO.order.orderDate}"
									pattern="yyyy/MM/dd" />
								&nbsp; 订单号：${orderVO.order.orderNumber }
							</div>
							<c:forEach items="${orderVO.orderitemVOs}" var="orderitemVO">
								<div class="info">
									<c:if test="${orderitemVO.goodPicPath==''}">
										<div class="img">
											<a
												href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${orderitemVO.orderitem.goodsId}">
												<img
												src="${pageContext.request.contextPath}/resources/images/thumber.jpg"
												width="120px"> </a>
										</div>
									</c:if>
									<c:if test="${orderitemVO.goodPicPath!=''}">
										<div class="img">
											<a
												href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${orderitemVO.orderitem.goodsId}">
												<img
												src="/picForBS/goods/${orderitemVO.goodPicPath}/thumbnail/thumb_${orderitemVO.goodCoverPic}"
												width="120px"> </a>
										</div>
									</c:if>
									<div class="goodName">${ orderitemVO.goodName}</div>
									<div class="getWay">---</div>
									<div class="totalPrice">${orderitemVO.orderitem.price }</div>
									<div class="state">待付款</div>
									<div class="evaluate">
										<a
											href="${pageContext.request.contextPath}/order/commitOrderInCart.action">去付款<a></a>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
				<div class="tab-pane" id="panel-3" style="margin-left:30px">
				   <c:if test="${fn:length(orderVOs0)==0}">
				      <div style="margin-left:420px;margin-top:100px">
				       <img src="${pageContext.request.contextPath}/resources/images/bg-none.png"/>
				              <b style="width:300px;font-size:18px">不存在此种订单！</b> 
				      </div>
				   </c:if> 
					<c:forEach items="${orderVOs0}" var="orderVO">
						<div class="orderInfo">
							<div class="first">
								<f:formatDate value="${orderVO.order.orderDate}"
									pattern="yyyy/MM/dd" />
								&nbsp; 订单号：${orderVO.order.orderNumber } <span
									class="totalPrice">总价：￥${orderVO.order.totalPrice }</span>
							</div>
							<c:forEach items="${orderVO.orderitemVOs}" var="orderitemVO">
								<div class="info">
									<c:if test="${orderitemVO.goodPicPath==''}">
										<div class="img">
											<a
												href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${orderitemVO.orderitem.goodsId}">
												<img
												src="${pageContext.request.contextPath}/resources/images/thumber.jpg"
												width="120px"> </a>
										</div>
									</c:if>
									<c:if test="${orderitemVO.goodPicPath!=''}">
										<div class="img">
											<a
												href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${orderitemVO.orderitem.goodsId}">
												<img
												src="/picForBS/goods/${orderitemVO.goodPicPath}/thumbnail/thumb_${orderitemVO.goodCoverPic}"
												width="120px"> </a>
										</div>
									</c:if>
									<div class="goodName">${ orderitemVO.goodName}</div>
									<c:if test="${orderVO.order.getWay==0}">
										<div class="getWay">校园自取</div>
									</c:if>
									<c:if test="${orderVO.order.getWay==1}">
										<div class="getWay">送货上门</div>
									</c:if>
									<div class="totalPrice">${orderitemVO.orderitem.price }</div>
									<div class="state">待发货</div>
									<div class="evaluate">-</div>
								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
				<div class="tab-pane" id="panel-4" style="margin-left:30px">
				  <c:if test="${fn:length(orderVOs1)==0}">
				      <div style="margin-left:420px;margin-top:100px">
				       <img src="${pageContext.request.contextPath}/resources/images/bg-none.png"/>
				              <b style="width:300px;font-size:18px">不存在此种订单！</b> 
				      </div>
				   </c:if>
					<c:forEach items="${orderVOs1}" var="orderVO">
						<div class="orderInfo  orderDiv${orderVO.order.id }">
							<div class="first">
								<f:formatDate value="${orderVO.order.orderDate}"
									pattern="yyyy/MM/dd" />
								&nbsp; 订单号：${orderVO.order.orderNumber } <span
									class="totalPrice">总价：￥${orderVO.order.totalPrice }</span>
							</div>
							<c:forEach items="${orderVO.orderitemVOs}" var="orderitemVO">
								<div class="info">
									<c:if test="${orderitemVO.goodPicPath==''}">
										<div class="img">
											<a
												href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${orderitemVO.orderitem.goodsId}">
												<img
												src="${pageContext.request.contextPath}/resources/images/thumber.jpg"
												width="120px"> </a>
										</div>
									</c:if>
									<c:if test="${orderitemVO.goodPicPath!=''}">
										<div class="img">
											<a
												href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${orderitemVO.orderitem.goodsId}">
												<img
												src="/picForBS/goods/${orderitemVO.goodPicPath}/thumbnail/thumb_${orderitemVO.goodCoverPic}"
												width="120px"> </a>
										</div>
									</c:if>

									<div class="goodName">${ orderitemVO.goodName}</div>
									<c:if test="${orderVO.order.getWay==0}">
										<div class="getWay">校园自取</div>
									</c:if>
									<c:if test="${orderVO.order.getWay==1}">
										<div class="getWay">送货上门</div>
									</c:if>
									<div class="totalPrice">${orderitemVO.orderitem.price }</div>
									<div class="state">待收货</div>
									<div class="evaluate">
										<a data-toggle="modal" data-target="#dialog1"
											onclick="dialog2('${orderVO.order.id}')"
											>确认收货</a>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
				<div class="tab-pane" id="panel-5" style="margin-left:30px">
				    <c:if test="${fn:length(orderVOs2)==0}">
				      <div style="margin-left:420px;margin-top:100px">
				       <img src="${pageContext.request.contextPath}/resources/images/bg-none.png"/>
				              <b style="width:300px;font-size:18px">不存在此种订单！</b> 
				      </div>
				   </c:if>
					<c:forEach items="${orderVOs2}" var="orderVO">
						<div class="orderInfo">
							<div class="first">
								<f:formatDate value="${orderVO.order.orderDate}"
									pattern="yyyy/MM/dd" />
								&nbsp; 订单号：${orderVO.order.orderNumber } <span
									class="totalPrice">总价：￥${orderVO.order.totalPrice }</span>
							</div>
							<c:forEach items="${orderVO.orderitemVOs}" var="orderitemVO">
								<div class="info">
									<c:if test="${orderitemVO.goodPicPath==''}">
										<div class="img">
											<a
												href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${orderitemVO.orderitem.goodsId}">
												<img
												src="${pageContext.request.contextPath}/resources/images/thumber.jpg"
												width="120px"> </a>
										</div>
									</c:if>
									<c:if test="${orderitemVO.goodPicPath!=''}">
										<div class="img">
											<a
												href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${orderitemVO.orderitem.goodsId}">
												<img
												src="/picForBS/goods/${orderitemVO.goodPicPath}/thumbnail/thumb_${orderitemVO.goodCoverPic}"
												width="120px"> </a>
										</div>
									</c:if>
									<div class="goodName">${ orderitemVO.goodName}</div>
									<c:if test="${orderVO.order.getWay==0}">
										<div class="getWay">校园自取</div>
									</c:if>
									<c:if test="${orderVO.order.getWay==1}">
										<div class="getWay">送货上门</div>
									</c:if>
									<div class="totalPrice">${orderitemVO.orderitem.price }</div>
									<div class="state">交易成功</div>
									<div class="evaluate" id="goEvaluateBtn${orderVO.order.id}">
										<c:if test="${orderVO.evaluateContent==null}">
										<a data-toggle="modal" data-target="#dialog"
											onclick="dialog('${orderVO.order.id}','${orderVO.order.cropId}')"
											>还未评价，去评价</a>
									    </c:if>
									    <c:if test="${orderVO.evaluateContent!=''}">
										    <span>${orderVO.evaluateContent}</span>
									    </c:if>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:forEach>
				</div>

			</div>


			<!-- 评论    模态框（Modal） -->
			<div class="modal fade" id="dialog" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">评价商家</h4>
						</div>
						
							<!-- 保存所评价订单ID -->
							<input type="hidden" id="evaluateOrderId" />
							<input type="hidden" id="evaluatCropId" />
							<textarea id="evaluateContent" style="width:450px;margin-left:50px;"></textarea>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">退回</button>
								<button id="addEvaluateBtn" class="btn btn-primary">提交</button>
							</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
			
			
			<!-- 评论    模态框（Modal） -->
			<div class="modal fade" id="dialog1" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">确认收货</h4>
						</div>
						  <input type="hidden" id="confirmOrderId" />
						  <p style="margin-left:100px">  请是否确认收货，若不满意请10天<br/>内联系校园点管理人员！</p>
							
							<div class="modal-footer">
								<button id="tuihui1" class="btn btn-default" data-dismiss="modal">退回</button>
								<button id="addConfirmOrderBtn" class="btn btn-primary">提交</button>
							</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
</body>
</html>