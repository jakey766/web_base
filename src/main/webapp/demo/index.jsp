<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/env.jsp" %>
<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8"> <![endif]-->
<!--[if IE 9]> <html class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html> <!--<![endif]-->
<head>
<meta charset="utf-8" />
<title>Demo</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<link rel="shortcut icon" href="${PATH}r/img/ico.ico" />
<link href="${PATH}r/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="${PATH}r/plugins/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="${PATH}r/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<link href="${PATH}r/plugins/uniform/css/uniform.default.css" rel="stylesheet" />
<link href="${PATH}r/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
<link href="${PATH}r/css/style-metro.css" rel="stylesheet" />
<link href="${PATH}r/css/style.css" rel="stylesheet" />
<link href="${PATH}r/css/style-responsive.css" rel="stylesheet" />
<link href="${PATH}r/css/themes/default.css" rel="stylesheet" id="style_color" />
<link href="${PATH}r/css/page.css" rel="stylesheet" />
</head>
<body class="page-header-fixed">
    <!-- BEGIN 页面头部 -->   
    <div class="header navbar navbar-inverse navbar-fixed-top">
        <!-- BEGIN 顶部导航条 -->
        <div class="navbar-inner">
            <div class="container-fluid">
                <!-- BEGIN LOGO -->
                <a class="brand" href="index.html">
                    <img width="30" height="30" src="${PATH}r/img/ico.png" alt="logo" />
                    <span>Demo</span>
                </a>
                <!-- END LOGO -->
                <!-- BEGIN 响应式时 菜单按钮 -->
                <a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
                    <img src="${PATH}r/img/menu-toggler.png" alt="" />
                </a>
                <!-- END 响应式时 菜单按钮 -->            
                <!-- BEGIN 导航条右侧菜单 -->              
                <ul class="nav pull-right">
                    <!-- BEGIN 用户信息 -->
                    <li class="dropdown user">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                        <span class="username">hello world</span>
                        <i class="icon-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="icon-user"></i> 资料</a></li>
                            <li><a href="#"><i class="icon-map-marker"></i> IP:127.0.0.1</a></li>
                            <li><a href="javascript:;" id="trigger_fullscreen"><i class="icon-move"></i> 全屏</a></li>
                            <li><a href="#"><i class="icon-key"></i> 退出</a></li>
                        </ul>
                    </li>
                    <!-- END 用户信息 -->
                    <!-- BEGIN 快速通道 -->
                    <li class="dropdown quick-launcher">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <span>快速通道</span>
                            <i class="icon-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="icon-calendar"></i> 发布系统</a></li>
                            <li><a href="#"><i class="icon-lock"></i> 发布系统</a></li>
                            <li><a href="#"><i class="icon-envelope"></i> 发布系统</a></li>
                            <li><a href="#"><i class="icon-tasks"></i> 发布系统</a></li>
                        </ul>
                    </li>
                    <!-- END 快速通道 -->
                </ul>
                <!-- END 导航条右侧菜单 --> 
            </div>
        </div>
        <!-- END 顶部导航条 -->
    </div>
    <!-- END 页面头部 -->
    <!-- BEGIN 页面主容器 -->   
    <div class="page-container row-fluid">
        <!-- BEGIN 左边栏 -->
        <div class="page-sidebar nav-collapse collapse">
            <!-- BEGIN 左边栏 菜单 -->    
            <!-- BEGIN 左边栏 显示隐藏按钮 -->
            <div class="sidebar-toggler hidden-phone"></div>
            <!-- BEGIN 左边栏 显示隐藏按钮 -->    
            <ul class="page-sidebar-menu" id="menu-container"></ul>
            <!-- END 左边栏 MENU -->
        </div>
        <!-- END 左边栏 -->
        <!-- BEGIN PAGE -->
        <div class="page-content">
            <!-- BEGIN 右边容器-->
            <div class="container-fluid">
                <!-- BEGIN 右容器头部-->
                <div class="row-fluid">
                    <div class="span12">
                        <!-- BEGIN 页面标题和面包屑导航 -->
                        <h3 class="page-title">
                            Home <small>Introduce</small>
                        </h3>
                        <ul class="breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="index.html">Home</a> 
                                <i class="icon-angle-right"></i>
                            </li>
                            <li>
                                <a href="#">Layouts</a>
                                <i class="icon-angle-right"></i>
                            </li>
                            <li><a href="#">Introduce</a></li>
                        </ul>
                        <!-- END 页面标题和面包屑导航 -->
                    </div>
                </div>
                <!-- END 右容器头部-->
                <!-- BEGIN 右容器 main-->
                <div class="row-fluid">
                内容
                </div>
                <!-- END 右容器 main-->
            </div>
            <!-- END 右边容器--> 
        </div>
        <!-- END PAGE -->    
    </div>
    <!-- END 页面主容器 -->
    <!-- BEGIN FOOTER -->
    <div class="footer">
        <div class="footer-tools">
            <span class="go-top">
            <i class="icon-angle-up"></i>
            </span>
        </div>
    </div>
    <!-- END FOOTER -->
</body>
<script src="${PATH}r/plugins/jquery-1.10.1.min.js"></script>
<script src="${PATH}r/plugins/jquery-migrate-1.2.1.min.js"></script>
<script src="${PATH}r/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.js"></script>
<script src="${PATH}r/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${PATH}r/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" ></script>
<!-- fixed ie9以下的canvas和响应式布局功能 -->
<!--[if lt IE 9]>
<script src="${PATH}r/plugins/excanvas.min.js"></script>
<script src="${PATH}r/plugins/respond.min.js"></script>
<![endif]-->
<script src="${PATH}r/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${PATH}r/plugins/jquery.blockui.min.js"></script>
<script src="${PATH}r/plugins/jquery.cookie.min.js"></script>
<script src="${PATH}r/plugins/uniform/jquery.uniform.min.js" ></script>
<script src="${PATH}r/js/app.js"></script>

<!-- 菜单数据 -->
<script src="${PATH}r/js/menuData.js"></script>
<script src="${PATH}r/js/createMenu.js"></script>

<script>
$(document).ready(function() {
    App.init();
    createMenu('#menu-container',menuData); 
});
</script>
</html>