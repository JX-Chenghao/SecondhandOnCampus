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

<!DOCTYPE html>
<html lang="en" data-textdirection="ltr" class="loading">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Robust admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, robust admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>管理员</title>
<link rel="apple-touch-icon" sizes="60x60"
	href="${pageContext.request.contextPath}/resources/app-assets/images/ico/apple-icon-60.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/resources/app-assets/images/ico/apple-icon-76.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="${pageContext.request.contextPath}/resources/app-assets/images/ico/apple-icon-120.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="${pageContext.request.contextPath}/resources/app-assets/images/ico/apple-icon-152.png">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/app-assets/images/ico/favicon.ico">
<link rel="shortcut icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/app-assets/images/ico/favicon-32.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<!-- BEGIN VENDOR CSS-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap.css">
<!-- font icons-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/fonts/icomoon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/fonts/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/extensions/pace.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/ui/prism.min.css">
<!-- END VENDOR CSS-->
<!-- BEGIN ROBUST CSS-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/app.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/colors.css">
<!-- END ROBUST CSS-->
<!-- BEGIN Page Level CSS-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/core/menu/menu-types/vertical-overlay-menu.css">
<!-- END Page Level CSS-->
<!-- BEGIN Custom CSS-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<!-- END Custom CSS-->



</head>
<body data-open="click" data-menu="vertical-menu" data-col="2-columns"
	class="vertical-layout vertical-menu 2-columns  fixed-navbar">

	<!-- navbar-fixed-top-->
	<nav
		class="header-navbar navbar navbar-with-menu navbar-fixed-top navbar-semi-dark navbar-shadow">
		<div class="navbar-wrapper">
			<div class="navbar-header">
				<ul class="nav navbar-nav">
					<li class="nav-item mobile-menu hidden-md-up float-xs-left"><a
						class="nav-link nav-menu-main menu-toggle hidden-xs"><i
							class="icon-menu5 font-large-1"></i> </a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/admin/main.action"
						class="navbar-brand nav-link"><img alt="branding logo"
							src="${pageContext.request.contextPath}/resources/app-assets/images/logo/ad.png"
							data-expand="${pageContext.request.contextPath}/resources/app-assets/images/logo/ad.png"
							data-collapse="${pageContext.request.contextPath}/resources/app-assets/images/logo/ad.png"
							class="brand-logo" style="width:50px;margin-left:10px">AdminManager</a>
					</li>
					<li class="nav-item hidden-md-up float-xs-right"><a
						data-toggle="collapse" data-target="#navbar-mobile"
						class="nav-link open-navbar-container"><i
							class="icon-ellipsis pe-2x icon-icon-rotate-right-right"></i> </a></li>
				</ul>
			</div>
			<div class="navbar-container content container-fluid">
				<div id="navbar-mobile" class="collapse navbar-toggleable-sm">

					<ul class="nav navbar-nav float-xs-right">

						<li class="dropdown dropdown-user nav-item"><a href="#"
							data-toggle="dropdown"
							class="dropdown-toggle nav-link dropdown-user-link"><span
								class="avatar avatar-online"><img
									src="${pageContext.request.contextPath}/resources/app-assets/images/logo/ad.png"
									alt="avatar"><i></i> </span><span class="user-name">${sessionScope.admin.account
									}</span> </a>
							<div class="dropdown-menu dropdown-menu-right">
								
								<!-- <div class="dropdown-divider"></div> -->
								<a href="#" class="dropdown-item"><i class="icon-power3"></i>
									Logout</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<!-- ////////////////////////////////////////////////////////////////////////////-->

	<!-- ////////////////////////////////////////////////////////////////////////////-->
	<!-- main menu-->
	<div data-scroll-to-active="true"
		class="main-menu menu-fixed menu-dark menu-accordion menu-shadow">
		<!-- main menu header-->
		<div class="main-menu-header">
			<input type="text" placeholder="Search"
				class="menu-search form-control round" />
		</div>
		<!-- / main menu header-->
		<!-- main menu content-->
		<div class="main-menu-content">
			<ul id="main-menu-navigation" data-menu="menu-navigation"
				class="navigation navigation-main">
				<li class=" nav-item"><a href="#"><i
						class="icon-briefcase4"></i><span data-i18n="nav.project.main"
						class="menu-title">Pages</span> </a>
					<ul class="menu-content">

						<li><a href="unlock-user.html"
							data-i18n="nav.login_register_pages.unlock_user"
							class="menu-item">Unlock User</a>
						</li>
					</ul>
				</li>
				<li class=" nav-item"><a href="#"><i class="icon-compass3"></i><span
						data-i18n="nav.content.main" class="menu-title">商品管理</span> </a>
					<ul class="menu-content">
						<li><a href="${pageContext.request.contextPath}/admin/auditGoodsView.action"
							data-i18n="nav.content.content_grid" class="menu-item">审核</a>
						</li>
					</ul>
				</li>
				<li class=" nav-item">
				     <a href="#"><i class="icon-grid2"></i><span
						data-i18n="nav.components.main" class="menu-title">订单管理</span>
				     </a>
					<ul class="menu-content">
						<li><a href="${pageContext.request.contextPath}/admin/updateOrderView.action?status=0"
							data-i18n="nav.components.component_alerts" class="menu-item">发货</a>
						</li>
						<li><a href="${pageContext.request.contextPath}/admin/updateOrderView.action?status=1"
							data-i18n="nav.components.component_alerts" class="menu-item">收货</a>
						</li>
					</ul>
				</li>
			</ul>
			
		</div>
		<!-- main menu footer-->
	</div>
	<!-- main menu footer-->
	<!-- include includes/menu-footer-->

	<!-- / main menu-->

	<div class="app-content content container-fluid">
		<div class="content-wrapper">
			<div class="content-header row">
				<div class="content-header-left col-md-6 col-xs-12 mb-1">
					<h2 class="content-header-title">商品审核</h2>
				</div>
				<div
					class="content-header-right breadcrumbs-right breadcrumbs-top col-md-6 col-xs-12">
					<div class="breadcrumb-wrapper col-xs-12">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath}/admin/main.action">admin</a>
							</li>
							<li class="breadcrumb-item"><a href="#">goods</a>
							</li>
							<li class="breadcrumb-item active">audit</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="content-body">


				<div class="row">
					<!-- ////////////////////////////////////////////////////////////////////////////-->
					<div class="col-xl-8 col-lg-12" style="width:100%">
						<div class="card">

							<div class="card-body">

								<div class="table-responsive">
									<table class="table table-hover mb-0">
										<thead>
											<tr>
								<!--                              <th>订单编号</th>
                                <th>订单日期</th>
                                <th>取货方式</th>
                                <th>订单价钱</th>
                                <th>送货地址</th> -->
												<th>商品名</th>
												<th>商品数量</th>
												<th>已使用月份</th>
												<th>商品价格</th>
												<th>商品介绍</th>
												<th>审核</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${goodsList }" var="goodsVo">
												<tr>
													<td class="text-truncate">${goodsVo.goods.name }</td>
													<td class="text-truncate">${goodsVo.goods.quantity }</td>
													<td class="text-truncate">${goodsVo.goods.usedMonth }</td>
													<td class="text-truncate">${goodsVo.goods.price }</td>
													<td class="text-truncate"><c:if
															test="${fn:length(goodsVo.goods.introducedText)>8 }">
                                  	 ${fn:substring(goodsVo.goods.introducedText,0,8) }...
                                	</c:if> <c:if
															test="${fn:length(goodsVo.goods.introducedText)<=8 }">
                                  	 ${goodsVo.goods.introducedText }
                                	</c:if>
													</td>
													<td class="valign-middle"><span
														class="avatar avatar-xs"><img class="auditImgBtn"
															src="${pageContext.request.contextPath}/resources/app-assets/images/icons/thumbs-up.jpg"
															data-toggle="modal" data-target="#iconModal" /><input
															type="hidden" value="${goodsVo.goods.id }" /><input
															type="hidden" value="${goodsVo.goods.picturePath }" /><input
															type="hidden" value="${goodsVo.fileName[0]},${goodsVo.fileName[1]},${goodsVo.fileName[2]},${goodsVo.fileName[3]}" /><input
															type="hidden" value="${goodsVo.goods.introducedText }" /><input
															type="hidden" value="${goodsVo.goods.name }" /> </span>
													</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- ////////////////////////////////////////////////////////////////////////////-->
				<div class="col-lg-4 col-md-6 col-sm-12">
					<div class="form-group">
						<!-- Modal -->
						<div class="modal fade text-xs-left" id="iconModal" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel2">
											<i class="icon-road2"></i> 商品审核
										</h4>
									</div>
									<div class="modal-body">
										<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->

										<div class="card-body" style="width:200px;height:300px;">

											<div id="carousel-example-generic" class="carousel slide"
												data-ride="carousel" style="width:250px;height:300px;">
												<ol class="carousel-indicators">
													<li data-target="#carousel-example-generic"
														data-slide-to="0" class=""></li>
													<li data-target="#carousel-example-generic"
														data-slide-to="1" class="active"></li>
													<li data-target="#carousel-example-generic"
														data-slide-to="2" class=""></li>
													<li data-target="#carousel-example-generic"
														data-slide-to="3" class=""></li>
												</ol>
												<div class="carousel-inner" role="listbox">
													<div class="carousel-item">
														<img src="../../app-assets/images/carousel/02.jpg"
															id="slide1" style="width:250px;height:300px;">
													</div>
													<div class="carousel-item active">
														<img src="../../app-assets/images/carousel/03.jpg"
															id="slide2" style="width:250px;height:300px;">
													</div>
													<div class="carousel-item">
														<img src="../../app-assets/images/carousel/01.jpg"
															id="slide3" style="width:250px;height:300px;">
													</div>
													<div class="carousel-item">
														<img src="../../app-assets/images/carousel/04.jpg"
															id="slide4" style="width:250px;height:300px;">
													</div>
												</div>
												<a class="left carousel-control"
													href="#carousel-example-generic" role="button"
													data-slide="prev"> <span class="icon-prev"
													aria-hidden="true"></span> <span class="sr-only">Previous</span>
												</a> <a class="right carousel-control"
													href="#carousel-example-generic" role="button"
													data-slide="next"> <span class="icon-next"
													aria-hidden="true"></span> <span class="sr-only">Next</span>
												</a>
											</div>
											<div class="card-block"
												style="position:relative;top:-320px;left:250px;">
												<p class="card-text" style="width:280px;">
													介绍：<br />No introduction.
												</p>
											<form action="${pageContext.request.contextPath}/admin/auditGoods.action">
											<input type="hidden" id="goodsId" name="goodsId">
											<div class="input-group">
												<label class="display-inline-block custom-control custom-radio ml-1">
													<input type="radio" name="auditStatus" class="custom-control-input radio1" value="1" >
													<span class="custom-control-indicator"></span>
													<span class="custom-control-description ml-0">审核通过</span>
												</label>
												<label class="display-inline-block custom-control custom-radio">
													<input type="radio" name="auditStatus" checked="" class="custom-control-input radio2" value="2" >
													<span class="custom-control-indicator"></span>
													<span class="custom-control-description ml-0">审核不通过</span>
												</label>
											</div>
											<input class="submitFormInput" type="submit" style="display:none" />
												<p>请输入不通过原因：</p>
												
												  <textarea  name="failureText" style="width:280px;"></textarea>
												</form>
											</div>

											<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
										</div>
										<div class="modal-footer">
											<button type="button" class="btn grey btn-outline-secondary"
												data-dismiss="modal">返回</button>
											<button  type="button" class="btn btn-outline-primary submitFormBtn">确认</button>
										</div>
										
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ////////////////////////////////////////////////////////////////////////////-->
				</div>
			</div>
		</div>


		<!-- BEGIN VENDOR JS-->
		<script
			src="${pageContext.request.contextPath}/resources/app-assets/js/core/libraries/jquery.min.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/ui/tether.min.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/app-assets/js/core/libraries/bootstrap.min.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/ui/perfect-scrollbar.jquery.min.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/ui/unison.min.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/ui/blockUI.min.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/ui/jquery.matchHeight-min.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/ui/screenfull.min.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/extensions/pace.min.js"
			type="text/javascript"></script>
		<!-- BEGIN VENDOR JS-->
		<!-- BEGIN PAGE VENDOR JS-->
		<script
			src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/ui/prism.min.js"
			type="text/javascript"></script>
		<!-- END PAGE VENDOR JS-->
		<!-- BEGIN ROBUST JS-->
		<script
			src="${pageContext.request.contextPath}/resources/app-assets/js/core/app-menu.js"
			type="text/javascript"></script>
		<script
			src="${pageContext.request.contextPath}/resources/app-assets/js/core/app.js"
			type="text/javascript"></script>


		<script type="text/javascript">
			$(function() {
				$(".auditImgBtn").click(function() {
					var goodsId = $(this).next().val();
					var goodsPic = $(this).next().next().val();
					var pic = $(this).next().next().next().val();
					var content = $(this).next().next().next().next().val();
					var name = $(this).next().next().next().next().next().val();
					var picArray =pic.split(",");
					
					if(goodsPic==null || goodsPic==""){
					  $("#slide1").attr("src","${pageContext.request.contextPath}/resources/images/thumber.jpg");
					  $("#slide2").attr("src","${pageContext.request.contextPath}/resources/images/thumber.jpg");
					  $("#slide3").attr("src","${pageContext.request.contextPath}/resources/images/thumber.jpg");
					  $("#slide4").attr("src","${pageContext.request.contextPath}/resources/images/thumber.jpg");
					}else{
					  $("#slide1").attr("src","/picForBS/goods/"+goodsPic+"/"+picArray[0]);
					  $("#slide2").attr("src","/picForBS/goods/"+goodsPic+"/"+picArray[1]);
					  $("#slide3").attr("src","/picForBS/goods/"+goodsPic+"/"+picArray[2]);
					  $("#slide4").attr("src","/picForBS/goods/"+goodsPic+"/"+picArray[3]);
					}
					 $("#goodsId").attr("value",goodsId);
					if(content!="")
					  $(".card-text").html("商品："+name+"<br />介绍："+content);
				});
				
				$(".submitFormBtn").click(function(){
				  if($('input:checked').val()=="2"){
				     var failureText=$("textarea").val();
				     if(failureText==""){
				       alert("请填写不通过原因！");
				       return false;
				     }
				  }
				  $(".submitFormInput").click();
				});

			});
		</script>
		<!-- END ROBUST JS-->
		<!-- BEGIN PAGE LEVEL JS-->
		<!-- END PAGE LEVEL JS-->
</body>
</html>

