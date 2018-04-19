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
		function addMessage(goodsId,userId, aliasName){
					var content=$('#contentInput').val();
					if(content==""){
					   alert("请填写留言！");
					   return ;
					}
					$.ajax({
                                url:'${pageContext.request.contextPath}/user/message/add.action',
		                     	type:"post",
			                    dataType :"json",
			                    // 输入英文???会出BUG
			                    data:{
			                    goodsId : goodsId,
			                    userId :userId,
			                    content:content
			                    },
			                    success:function(data){
			                      
			                      	 	if(data.res=="success"){
			                         	 	 alert("<留言成功！>");
			                         	 	 $('#contentInput').val("");
			                         	 	 var innerHTML="<div class='messageDiv'>";
			                         	 	 innerHTML+="<div class='lineItem'><span>"+aliasName+" :"+"<span>"+content+"<span class='dateTag'>"+getNowFormatDate()+"<span></div>";
			                         	 	 innerHTML+="</div>";
			                         	 	 $('.review').after(innerHTML);
			                      		 }else {
			                       		     alert("<异常>");
			                      		 }
			                       
                                }
                        });
		}
		function sign(goodsId,userId){
					$.ajax({
                                url:'${pageContext.request.contextPath}/user/sign/add.action',
		                     	type:"post",
			                    dataType :"json",
			                    data:"goodsId="+goodsId+"&userId="+userId,
			                    success:function(data){
			                      
			                      	 	if(data.res=="success"){
			                         	 	 alert("<添加收藏成功！>");
			                         	 	 $('.one').attr("disabled","disabled");
			                         	 	 $('#oneSave').hide();
			                      		 }else if(data.res=="collected"){
			                       		     alert("<已经收藏过了>");
			                      		 }
			                       
                                }
                        });
		}
		function findEvaluate(userId){
		   $("#messageBlock").remove();
		   $("#tab-info").removeClass("selected");
		   $("#tab-related").removeClass("selected");
		   $("#tab-evaluate").addClass("selected");
		   $.ajax({
                                url:'${pageContext.request.contextPath}/user/evaluate/query.action',
		                     	type:"get",
			                    dataType :"json",
			                    data:"userId="+userId,
			                    success:function(data){
			                            var evaluateHTML="<div id='evaluateBlock' class='evaluate'>";
			                      	 	for(var i=0;i <data.length;i++){
			                      	 		evaluateHTML+="<div class='lineItemEvaluate'>匿名买家：";
			                      	 	    evaluateHTML+= data[i].content;
			                      	 	    evaluateHTML+= "<span class='dateTag'>"
			                      	 	    evaluateHTML+=data[i].evaluateDate;
			                      	 	    evaluateHTML+= "</span>";
			                      	 	    evaluateHTML+="</div><br/>";
			                      	 	}
			                      	 	evaluateHTML+="</div>";
			                       		$("#goodsIntroduce").after(evaluateHTML);
                                }
                        });
		  
		}
		function findOtherGoods(cropId,excludeGoodsId){
		   $("#messageBlock").remove();
		   $("#evaluateBlock").remove();
		   $("#tab-info").removeClass("selected");
		   $("#tab-evaluate").removeClass("selected");
		   $("#tab-related").addClass("selected");
		   $.ajax({
                                url:'${pageContext.request.contextPath}/goods/findOtherGoodsByCropId.action',
		                     	type:"post",
			                    dataType :"json",
			                    data:{
			                    cropId :cropId,
			                    excludeGoodsId:excludeGoodsId
			                    },
			                    success:function(data){
			                            var goodsHTML="<div id='evaluateBlock' class='evaluate'>";
			                      	 	for(var i=0;i <data.length;i++){
			                      	 		goodsHTML+="<a href='${pageContext.request.contextPath}/goods/detailOfGoods.action?id="+data[i].id+"'><div class='lineItemGood'>";
			                      	 		if(data[i].picturePath!=""){
			                      	 	     goodsHTML+="<img src='/picForBS/goods/" +data[i].picturePath+"/thumbnail/thumb_"+data[i].coverPic+"' width='80px'/>";
			                      	 	    }else{
			                      	 	     goodsHTML+="<img src='${pageContext.request.contextPath}/resources/images/thumber.jpg'/>";
			                      	 	    }
			                      	 	    goodsHTML+=data[i].name;
			                      	 	    goodsHTML+="</div></a><br/>";
			                      	 	}
			                      	 	goodsHTML+="</div>";
			                       		$("#goodsIntroduce").after(goodsHTML);
                                }
                        });		   
		   
		   
		  
		}
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
       function getNowFormatDate() {
    		 var date = new Date();
   			 var seperator1 = "-";
   			 var seperator2 = ":";
   			 var month = date.getMonth() + 1;
   			 var strDate = date.getDate();
   		     if (month >= 1 && month <= 9) {
       			 month = "0" + month;
   		     }
   	 		 if (strDate >= 0 && strDate <= 9) {
       		 strDate = "0" + strDate;
    		 }
    		var currentdate = date.getFullYear() + "年" + month + "月" + strDate + "日"
           		 + " " + date.getHours() + seperator2 + date.getMinutes();
   		  return currentdate;
	}     
	
	   function showBigPic( picName){
	       $(".image img").attr("src",picName);
	   }
	</script>
</head>
<body>
	<div class="menu">
	    <div class="logo"></div>
		<ul>
		<li><a href="${pageContext.request.contextPath}/goods/showMainGoods.action" class="home">首页</a></li>
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
        		 &raquo; <a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action">商品</a>&raquo; <a href="#">详细信息</a>
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
			      详细信息
			      
			 </div>
		
	
		<div id="container_bg">
			<div id="content">
				<div class="product-info">

					<div class="left">                		                			
						
						<c:if test="${goods.picturePath==''}">
						<div class="image"><a href="#"  ><img src="${pageContext.request.contextPath}/resources/images/product_holder.jpg"  id="image" /></a></div>
						<div class="image-additional">
						    <a ><img src="${pageContext.request.contextPath}/resources/images/thumber.jpg" /></a>
							<a  ><img src="${pageContext.request.contextPath}/resources/images/thumber.jpg" /></a>
							<a  ><img src="${pageContext.request.contextPath}/resources/images/thumber.jpg" /></a>
							<a  ><img src="${pageContext.request.contextPath}/resources/images/thumber.jpg" /></a>
						</div>  
						</c:if>
						<c:if test="${goods.picturePath!=''}">
						<div class="image"><a href="#" ><img src="/picForBS/goods/${goods.picturePath}/${goods.coverPic}"  id="image" /></a></div>
						<div class="image-additional">
							<a  onclick="showBigPic('/picForBS/goods/${goods.picturePath}/${ files[0]}')" title="${goods.name }"><img src="/picForBS/goods/${goods.picturePath}/thumbnail/thumb_${ files[0]}" /></a>
							<a  onclick="showBigPic('/picForBS/goods/${goods.picturePath}/${ files[1]}')" title="${goods.name }"><img src="/picForBS/goods/${goods.picturePath}/thumbnail/thumb_${ files[1]}" /></a>
							<a  onclick="showBigPic('/picForBS/goods/${goods.picturePath}/${ files[2]}')" title="${goods.name }"><img src="/picForBS/goods/${goods.picturePath}/thumbnail/thumb_${ files[2]}" /></a>
							<a  onclick="showBigPic('/picForBS/goods/${goods.picturePath}/${ files[3]}')" title="${goods.name }"><img src="/picForBS/goods/${goods.picturePath}/thumbnail/thumb_${ files[3]}" /></a>
						</div>  
						</c:if>              		                        
					</div>

					<div class="right">
						<div id="tabs" class="tabs">
							<a href="${pageContext.request.contextPath}/goods/detailOfGoods.action?id=${goods.id}" id="tab-info" class="selected"><img alt="Information" src="${pageContext.request.contextPath}/resources/images/Info.png" style="margin-top:6px;" /><div></div></a>
							<a id="tab-evaluate" onclick="findEvaluate('${goods.userId }')">商家评价</a>
							<a id="tab-related" onclick="findOtherGoods('${goods.userId }','${goods.id}')" >商家其他商品 </a>
						</div>

						<div id="tab-information" class="tab-content">		

							<div class="description">
								<span>&raquo;&nbsp;名称:</span> <a href="#">${goods.name }  </a><br />
								<span>&raquo;&nbsp;数量:</span> <a href="#">${goods.quantity }  </a><br />
								<span>&raquo;&nbsp;已用月份:</span>  ${goods.usedMonth }  <br />
								<span>&raquo;&nbsp;发布日期:</span> <f:formatDate value="${goods.publishDate}" pattern="yyyy年MM月dd日"/>                     
							</div>

							<div class="price">
								<span class="price-new">￥${goods.price } </span>
								
							</div>
							<br>
							<div class="cart">
								<div>数量:<input class="quantity" type="text" name="quantity" size="2" value="1" />
									<input type="hidden" name="product_id"  value="41" />
									&nbsp;<a id="button-cart" class="button" onclick="addCart(${goods.id }) " href="#"><span>添加到购物车</span></a>
								</div>
								<div>
									<span>&nbsp;&nbsp;- OR -&nbsp;&nbsp;</span>
								</div>
								<div>
									<a onclick="sign(${goods.id},${sessionScope.user.id })" class="wishlist"><img src="${pageContext.request.contextPath}/resources/images/collect.png" style="margin-top:2px;" title="收藏"/></a>
								</div>
							</div>
							 <div id="goodsIntroduce">商品介绍：${goods.introducedText }<br/><br/><br/></div>
							<div id="messageBlock">
								<div class="review">
									<div >
										&nbsp;&nbsp;
										<a >${fn:length(messagesVO)}&nbsp; 留言</a>&nbsp;&nbsp;|&nbsp;&nbsp;
										<input id="contentInput" type="text" />&nbsp;<a class="addMsg" onclick="addMessage('${goods.id}','${sessionScope.user.id }','${sessionScope.user.aliasName}')">留言</a>
									</div>
									</div>
								<div >
								
									<c:forEach items="${ messagesVO}" var="messageVO">
								  	 <div class="messageDiv">
								   	 	<div class="lineItem"><span>${messageVO.userAliasname } :</span>${ messageVO.message.content} <span class="dateTag"><f:formatDate value="${messageVO.message.messageDate }" pattern="yyyy年MM月dd日 HH:mm"/> </span></div>
								    	<c:if test="${messageVO.replyStatus==true }">
								    		<div class="lineItem">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;商家回复： ${messageVO.replyMessage.content} <span class="dateTag"><f:formatDate value="${messageVO.replyMessage.messageDate }" pattern="yyyy年MM月dd日 HH:mm"/> </span></div>
								    	</c:if>
								  	 </div>
									</c:forEach>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>            
            
            
            
	</div>


</body>
</html>