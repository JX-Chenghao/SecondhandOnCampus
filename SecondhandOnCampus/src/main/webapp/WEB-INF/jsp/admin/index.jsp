<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en" data-textdirection="ltr" class="loading">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="Robust admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, robust admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
    <title>Login Page - Robust Free Bootstrap Admin Template</title>
    <link rel="apple-touch-icon" sizes="60x60" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/apple-icon-60.png">
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/apple-icon-76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/apple-icon-120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/apple-icon-152.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/favicon.ico">
    <link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/resources/app-assets/images/ico/favicon-32.png">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <!-- BEGIN VENDOR CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap.css">
    <!-- font icons-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/fonts/icomoon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/fonts/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/vendors/css/extensions/pace.css">
    <!-- END VENDOR CSS-->
    <!-- BEGIN ROBUST CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/app.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/colors.css">
    <!-- END ROBUST CSS-->
    <!-- BEGIN Page Level CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/core/menu/menu-types/vertical-overlay-menu.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/app-assets/css/pages/login-register.css">
    <!-- END Page Level CSS-->
    <!-- BEGIN Custom CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
    <!-- END Custom CSS-->
  </head>
  <body data-open="click" data-menu="vertical-menu" data-col="1-column" class="vertical-layout vertical-menu 1-column  blank-page blank-page">
    <!-- ////////////////////////////////////////////////////////////////////////////-->
    <div class="app-content content container-fluid">
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body"><section class="flexbox-container">
    <div class="col-md-4 offset-md-4 col-xs-10 offset-xs-1  box-shadow-2 p-0">
        <div class="card border-grey border-lighten-3 m-0">
            <div class="card-header no-border">
                <div class="card-title text-xs-center">
                    <div class="p-1"><img src="${pageContext.request.contextPath}/resources/app-assets/images/logo/ad.png" alt="branding logo"></div>
                </div>
                <h6 class="card-subtitle line-on-side text-muted text-xs-center font-small-3 pt-2"><span>管理员登录</span></h6>
            </div>
            <div class="card-body collapse in">
                <div class="card-block">
                    <form class="form-horizontal form-simple" action="${pageContext.request.contextPath}/admin/login.action" method="post" novalidate>
                        <fieldset class="form-group position-relative has-icon-left mb-0">
                            <input type="text" class="form-control form-control-lg input-lg" id="user-name" name="account" placeholder="Your PhoneNumber" required>
                            <div class="form-control-position">
                                <i class="icon-head"></i>
                            </div>
                        </fieldset>
                        <fieldset class="form-group position-relative has-icon-left">
                            <input type="password" class="form-control form-control-lg input-lg" id="user-password" name="pwd" placeholder="Enter Password" required>
                            <div class="form-control-position">
                                <i class="icon-key3"></i>
                            </div>
                        </fieldset>

                        <button type="submit" class="btn btn-primary btn-lg btn-block"><i class="icon-unlock2"></i> 登录</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</section>

        </div>
      </div>
    </div>


    <script src="${pageContext.request.contextPath}/resources/app-assets/js/core/libraries/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/ui/tether.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/core/libraries/bootstrap.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/ui/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/ui/unison.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/ui/blockUI.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/ui/jquery.matchHeight-min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/ui/screenfull.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/vendors/js/extensions/pace.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/core/app-menu.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/app-assets/js/core/app.js" type="text/javascript"></script>

  </body>
</html>
