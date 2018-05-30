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
<html class="loading">
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/app-assets/css/core/colors/palette-gradient.css">
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
							class="icon-menu5 font-large-1"></i>
					</a>
					</li>
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
							class="icon-ellipsis pe-2x icon-icon-rotate-right-right"></i>
					</a>
					</li>
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
									alt="avatar"><i></i>
							</span><span class="user-name">${sessionScope.admin.account }</span>
						</a>
							<div class="dropdown-menu dropdown-menu-right">
								<a href="${pageContext.request.contextPath}/admin/loginout.action" class="dropdown-item"><i class="icon-power3"></i>
									Logout</a>
							</div></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<!-- ////////////////////////////////////////////////////////////////////////////-->
	<!-- main menu-->
	<div data-scroll-to-active="true"
		class="main-menu menu-fixed menu-dark menu-accordion menu-shadow">
		<!-- main menu header-->
		<div class="main-menu-header">
			<!-- <input type="text" placeholder="Search"
				class="menu-search form-control round" /> -->
		</div>
		<!-- / main menu header-->
		<!-- main menu content-->
		<div class="main-menu-content">
			<ul id="main-menu-navigation" data-menu="menu-navigation"
				class="navigation navigation-main">
				<li class=" nav-item"><a href="#"><i
						class="icon-briefcase4"></i><span data-i18n="nav.project.main"
						class="menu-title">用户管理</span>
				</a>
					<ul class="menu-content">

						<li><a href="${pageContext.request.contextPath}/admin/main.action"
							data-i18n="nav.login_register_pages.unlock_user"
							class="menu-item">查询</a></li>
					</ul></li>
				<li class=" nav-item"><a href="#"><i class="icon-compass3"></i><span
						data-i18n="nav.content.main" class="menu-title">商品管理</span>
				</a>
					<ul class="menu-content">
						<li><a
							href="${pageContext.request.contextPath}/admin/auditGoodsView.action"
							data-i18n="nav.content.content_grid" class="menu-item">审核</a></li>
					</ul></li>
				<li class=" nav-item"><a href="#"><i class="icon-grid2"></i><span
						data-i18n="nav.components.main" class="menu-title">订单管理</span> </a>
					<ul class="menu-content">
						<li><a
							href="${pageContext.request.contextPath}/admin/updateOrderView.action?status=0"
							data-i18n="nav.components.component_alerts" class="menu-item">发货</a>
						</li>
						<li><a
							href="${pageContext.request.contextPath}/admin/updateOrderView.action?status=1"
							data-i18n="nav.components.component_alerts" class="menu-item">收货</a>
						</li>
					</ul></li>




			</ul>

		</div>
		<!-- main menu footer-->
	</div>






	<!-- / main menu-->

	<div class="app-content content container-fluid">
		<div class="content-wrapper">
			<div class="content-header row"></div>
			<div class="content-body">
				<!-- Statistics -->
				<div class="row">
					<div class="col-xl-3 col-lg-6 col-xs-12">
						<div class="card">
							<div class="card-body">
								<div class="media">
									<div
										class="p-2 text-xs-center bg-cyan bg-darken-2 media-left media-middle">
										<i class="icon-camera7 font-large-2 white"></i>
									</div>
									<div class="p-2 bg-cyan white media-body">
										<h5>订单数</h5>
										<h5 class="text-bold-400">${ocount}</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-xs-12">
						<div class="card">
							<div class="card-body">
								<div class="media">
									<div
										class="p-2 text-xs-center bg-deep-orange bg-darken-2 media-left media-middle">
										<i class="icon-user1 font-large-2 white"></i>
									</div>
									<div class="p-2 bg-deep-orange white media-body">
										<h5>用户数</h5>
										<h5 class="text-bold-400">${ucount }</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-xs-12">
						<div class="card">
							<div class="card-body">
								<div class="media">
									<div
										class="p-2 text-xs-center bg-teal bg-darken-2 media-left media-middle">
										<i class="icon-cart font-large-2 white"></i>
									</div>
									<div class="p-2 bg-teal white media-body">
										<h5>上架商品</h5>
										<h5 class="text-bold-400">${gcount1 }</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-xs-12">
						<div class="card">
							<div class="card-body">
								<div class="media">
									<div
										class="p-2 text-xs-center bg-pink bg-darken-2 media-left media-middle">
										<i class="icon-banknote font-large-2 white"></i>
									</div>
									<div class="p-2 bg-pink white media-body">
										<h5>待审核商品</h5>
										<h5 class="text-bold-400">${gcount0 }</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/ Statistics -->

				<!-- projects table with monthly chart -->
				<div class="row">
					<div class="col-xl-8 col-lg-12" style="width:100%">
						<div class="card">

							<div class="card-body">

								<div class="table-responsive">
									<table class="table table-hover mb-0">
										<thead>
											<tr>
												<th>学号</th>
												<th>用户名</th>
												<th>真实姓名</th>
												<th>手机号</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${ users}" var="u">
												<tr>
													<td class="text-truncate">${u.sno }</td>
													<td class="text-truncate"><c:if
															test="${u.headImg !=null}">
															<span class="avatar avatar-xs"><img
																src="/picForBS/user/headImg/${u.headImg }" alt="avatar">
															</span>
															<span>${u.aliasName }</span>
														</c:if> <c:if test="${u.headImg ==null}">
															<span class="avatar avatar-xs"><img
																src="${pageContext.request.contextPath}/resources/images/null.jpg"
																alt="avatar">
															</span>
															<span>${u.aliasName }</span>
														</c:if></td>
													<td class="text-truncate"><span
														class="tag tag-success">${u.realName }</span>
													</td>
													<td class="valign-middle">${u.phoneNumber } <%--  <progress value="88" max="100" class="progress progress-xs progress-success m-0">${u.phoneNumber }</progress> --%>
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
				<!--/ projects table with monthly chart -->


			</div>
		</div>
	</div>
	<!-- ////////////////////////////////////////////////////////////////////////////-->




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
		src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/charts/chart.min.js"
		type="text/javascript"></script>
	<!-- END PAGE VENDOR JS-->
	<!-- BEGIN ROBUST JS-->
	<script
		src="${pageContext.request.contextPath}/resources/app-assets/js/core/app-menu.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/app-assets/js/core/app.js"
		type="text/javascript"></script>
	<!-- END ROBUST JS-->
	<!-- BEGIN PAGE LEVEL JS-->
	<script
		src="${pageContext.request.contextPath}/resources/app-assets/js/scripts/pages/dashboard-2.js"
		type="text/javascript"></script>
	<!-- END PAGE LEVEL JS-->
</body>
</html>
