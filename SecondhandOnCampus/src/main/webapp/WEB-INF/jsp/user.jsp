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
		$(function() {
		            //隐藏保存按钮
		            $('#oneSave').hide();
		            $('#twoSave').hide();
		            $('#threeSave').hide();
		            //隐藏保存按钮
		            $('#btnSaveImg').hide();
		            //隐藏保存按钮 ----真正表单submit按钮
		            $('#submitSaveImg').hide();
		            //更改头像
					$('#headImgFile').hide();
                    $('#btnUpdateImg').hide();
                    $('#btnUpdateImg').click(function(){
                    $('#headImgFile').click();
                           
                    });
                    $('#headImg,#btnUpdateImg').mouseover(function(){
                      $('#btnUpdateImg').show();
                    });

                    $('#headImg,#btnUpdateImg').mouseout(function(){
                      $('#btnUpdateImg').hide();
                    });
                    //头像注册改变事件
                     $("form :file").change(function(){
	      					$('#btnSaveImg').show();
	      					$('#headImg').unbind(); 
					 });
					//保存头像按钮
					$('#btnSaveImg').click(function(){
                         $('#submitSaveImg').click();
                           
                    });
					 
                    //修改按钮
                    $('#oneSet').click(function(){
                         $('.one').removeAttr("disabled");
                          $('#oneSave').show();
                    });
                    $('#twoSet').click(function(){
                         $('.two input').removeAttr("disabled");
                          $('#twoSave').show();
                    });
                    $('#threeSet').click(function(){
                         $('.three input').removeAttr("disabled");
                          $('#threeSave').show();
                    });
                    
		});
		
	       /* 函数：修改用户信息 */
           function updateUserInfo(){
                               var realName=$('input[name=realName]').val();
                               var sex=$('input:checked').val();
                               
                               var email=$('input[name=email]').val();
                             
                               if(realName==""||sex==null||email==""){
                                     alert("请填写完信息项！");
                                     return false;
                               }
                             
                               $.ajax({
                                url:'${pageContext.request.contextPath}/user/updateUserInfo.action',
		                     	type:"get",
			                    dataType :"json",
			                    data:"sex="+sex+"&email="+email+"&realName="+realName,
			                    success:function(data){
			                      
			                      	 	if(data.updateRes=="success"){
			                         	 	 alert("修改成功！");
			                         	 	 $('.one').attr("disabled","disabled");
			                         	 	 $('#oneSave').hide();
			                      		 }else if(data.updateRes=="ilegal"){
			                       		     alert("<"+data.failInfo+">");
			                      		 }else if(data.updateRes=="fail"){
			                       		     alert("修改失败！");
			                      		 }
			                       
                                }
                               });
             }	
		
		   /* 函数：修改交易信息 */
           function updateTradeInfo(){
                               
                               var alipayNumber=$('input[name=alipayNumber]').val();
                               var shippingAddress=$('input[name=shippingAddress]').val();
                             
                               if(alipayNumber=="" || shippingAddress==""){
                                     alert("请填写完信息项！");
                                     return false;
                               }
                             
                               $.ajax({
                                url:'${pageContext.request.contextPath}/user/updateTradeInfo.action',
		                     	type:"post",
			                    dataType :"json",
			                    data:"alipayNumber="+alipayNumber+"&shippingAddress="+shippingAddress,
			                    success:function(data){
			                      
			                      	 	if(data.updateRes=="success"){
			                         	 	 alert("修改成功！");
			                         	 	 $('.two input').attr("disabled","disabled");
			                         	 	 $('#twoSave').hide();
			                      		 }else if(data.updateRes=="ilegal"){
			                       		     alert("<"+data.failInfo+">");
			                      		 }else if(data.updateRes=="fail"){
			                       		     alert("修改失败！");
			                      		 }
			                       
                                }
                               });
             }
		   /* 函数：修改密码*/
           function updatePWDInfo(){
                               
                               var pwd_confirm=$('input[name=pwd_confirm]').val();
                               var pwd_old=$('input[name=pwd_old]').val();
                               var pwd_new=$('input[name=pwd_new]').val();
                               if(pwd_confirm=="" || pwd_old==""||pwd_new==""){
                                     alert("请填写完信息项！");
                                     return false;
                               }
                               if(pwd_confirm!=pwd_new){
                                     alert("两次填写新密码不相同！");
                                     return false;
                               } 
                               $.ajax({
                                url:'${pageContext.request.contextPath}/user/updatePWD.action',
		                     	type:"post",
			                    dataType :"json",
			                    data:"pwd_old="+pwd_old+"&pwd_new="+pwd_new,
			                    success:function(data){
			                      
			                      	 	if(data.updateRes=="success"){
			                         	 	 alert("修改密码成功！");
			                         	 	 $('input[name=pwd_confirm]').val("");
                             				 $('input[name=pwd_old]').val("");
                               				$('input[name=pwd_new]').val("");
			                         	 	 $('.three input').attr("disabled","disabled");
			                         	 	 $('#threeSave').hide();
			                         	 	  window.location.href = "${pageContext.request.contextPath}/user/index.action";
			                      		 }else if(data.updateRes=="ilegal"){
			                       		     alert("<"+data.failInfo+">");
			                      		 }else if(data.updateRes=="fail"){
			                       		     alert("原密码错误，修改密码失败！");
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
		<li><a href="${pageContext.request.contextPath}/goods/showMainGoods.action" class="home">首页</a></li>
		<li ><a href="${pageContext.request.contextPath}/goods/showGoodsByPage.action" class="goods" >商品</a></li>
		<li ><a href="${pageContext.request.contextPath}/cart/showCart.action" class="cart">购物车</a></li>
		<li ><a href="${pageContext.request.contextPath}/order/showOrder.action"  class="orderInfo">订单信息</a></li>
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
        		&raquo; <a href="#">个人中心</a>&raquo; <a href="#">我的信息</a>
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
                 <a href="#" style="text-decoration: none; color: #333;font-size:16px;">
                       <dl id="dt_2" >我的信息</dl>
                  </a>
                 <a href="${pageContext.request.contextPath}/goods/showCollection.action?userId=${sessionScope.user.id}"  style="text-decoration: none; color: #333;font-size:16px;">
                       <dl id="dt_3" class="catalog">  我的收藏</dl>
                  </a>
                   <a href="${pageContext.request.contextPath}/goods/showOwnerGoods.action?userId=${sessionScope.user.id}&auditState=0"  style="text-decoration: none; color: #333;font-size:16px;">
                      <dl id="dt_5" class="catalog"> 正审核商品</dl>
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
            </dt>
        </div>
  
  
  
          		 <div class="decorationBlock">个人信息：</div>
           			<div class="user-info">
                      <div>用户名:</div><input type="text" Name="Userame" placeholder="用户名/学号" required="" disabled="disabled" value="${sessionScope.user.aliasName }"><br/>
                      <div>学号:</div><input type="text" Name="sno" placeholder="学号" required="" disabled="disabled" value="${sessionScope.user.sno }"><br/>
                      <div>手机号:</div><input type="text" Name="phoneNumber" placeholder="手机号" required="" disabled="disabled" value="${sessionScope.user.phoneNumber }"><br/>
                      <div>真实姓名:</div><input class="one" type="text" Name="realName" placeholder="真实姓名" required="" disabled="disabled" value="${sessionScope.user.realName }"><br/>
                      <div>性别:</div>
                      <c:if test="${sessionScope.user.sex=='男'}">           
                      		 <label style="font-size:small"> <input class="one" type="radio" style="width:25px;height:20px;" name="sex" id="optionsRadios1" disabled="disabled" value="男" checked> 男 </label>
                     		 <label style="font-size:small"> <input class="one" type="radio" style="width:25px;height:20px;" name="sex" id="optionsRadios2" disabled="disabled" value="女">女 </label><br/>
                      </c:if>
                      <c:if test="${sessionScope.user.sex=='女'}">           
                      		 <label style="font-size:small"> <input class="one" type="radio" style="width:25px;height:20px;" name="sex" id="optionsRadios1" disabled="disabled" value="男" > 男 </label>
                     		 <label style="font-size:small"> <input class="one" type="radio" style="width:25px;height:20px;" name="sex" id="optionsRadios2" disabled="disabled" value="女" checked>女 </label><br/>
                      </c:if>
                      <c:if test="${sessionScope.user.sex==null || (sessionScope.user.sex!='女' && sessionScope.user.sex!='男')}">           
                      		 <label style="font-size:small"> <input class="one" type="radio" style="width:25px;height:20px;" name="sex" id="optionsRadios1" disabled="disabled" value="男" > 男 </label>
                     		 <label style="font-size:small"> <input class="one" type="radio" style="width:25px;height:20px;" name="sex" id="optionsRadios2" disabled="disabled" value="女" >女 </label><br/>
                      </c:if>
                      <div>邮箱地址:</div><input class="one" type="text" Name="email" placeholder="邮箱地址" required="" disabled="disabled" value="${sessionScope.user.email }">
                      <a id="oneSet" href="#" >修改</a> <a id="oneSave" href="javascript:void(0);" onclick="updateUserInfo()">保存</a>
                     
         		 </div>
     
                 <div class="decorationBlock">交易信息：</div>
                 <div class="user-info two">
                            <div>支付宝账户:</div><input type="text" Name="alipayNumber" placeholder="支付宝账户" required="" disabled="disabled" value="${sessionScope.user.alipayNumber }" ><br/>
                            <div>收货地址:</div><input type="text" Name="shippingAddress" placeholder="收货地址" required="" disabled="disabled" value="${sessionScope.user.shippingAddress }">
                              <a href="#" id="twoSet">修改</a> <a id="twoSave" href="javascript:void(0);" onclick="updateTradeInfo()" >保存</a>
                 </div>

                  <div class="decorationBlock">修改密码：</div>
                  <div class="user-info three">
                        <div>旧密码:</div><input type="password" Name="pwd_old" placeholder="旧密码" required="" disabled="disabled"><br/>
                        <div>新密码:</div><input type="password" Name="pwd_new" placeholder="新密码" required="" disabled="disabled"><br/>
                         <div>再次确认密码:</div><input type="password" Name="pwd_confirm" placeholder="再次确认密码" required="" disabled="disabled">
                         <a href="#" id="threeSet">修改</a><a id="threeSave" href="javascript:void(0);" onclick="updatePWDInfo()" >保存</a>
                 </div>
           		 
           		 		<div class="updateImg">
           		 		   <c:if test="${sessionScope.user.headImg ==null}">
           		 		      <img src="${pageContext.request.contextPath}/resources/images/null.jpg" id="headImg">
           		 		   </c:if>
           		 		   <c:if test="${sessionScope.user.headImg !=null}">
           		 		      <img class="headImg" src="/picForBS/user/headImg/${sessionScope.user.headImg}" id="headImg" >
           		 		   </c:if>           		 		  
           		 		   <a href="#" id="btnUpdateImg">更换头像</a>
           		 		 </div>
						<a href="#" id="btnSaveImg" class="saveImgBtn">保存头像</a>
	</div>
<form action="${pageContext.request.contextPath}/user/updateHeadImg.action" method="post" enctype="multipart/form-data">
  <input type="file" id="headImgFile" name="headImgFile"/>
  <input type="hidden" value="${sessionScope.user.id}" name="id"/>
  <input type="submit" id="submitSaveImg" >
</form>
</body>
</html>