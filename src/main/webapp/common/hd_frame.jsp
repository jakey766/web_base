<%@page import="com.pk.framework.cfg.Constants"%>
<%@page import="com.pk.framework.util.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String title = request.getParameter("title");
    if(title==null||title.length()<1){
    	title="客户管理系统";
    }
    request.setAttribute("title", title);
    request.setAttribute("sysName", "客户管理系统");
    
    CookieUtil cookieUtil = new CookieUtil(request, response);
    String username = cookieUtil.getString(Constants.KEY_USER_NAME);
    request.setAttribute("curUserName", username);
%>

<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8"> <![endif]-->
<!--[if IE 9]> <html class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html> <!--<![endif]-->
<head>
  <meta charset="utf-8" />
  <title>${title}</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />
  <link rel="shortcut icon" href="${PATH}r/img/ico.ico" />
  <link href="${PATH}r/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${PATH}r/plugins/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
  <link href="${PATH}r/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
  <link href="${PATH}r/plugins/uniform/css/uniform.default.css" rel="stylesheet" />
  <link href="${PATH}r/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
  <link href="${PATH}r/plugins/data-tables/DT_bootstrap.css" rel="stylesheet" />
  <link href="${PATH}r/plugins/artDialog-5.0.4/skins/default.css" rel="stylesheet" />
  <link href="${PATH}r/plugins/select2/select2.css" rel="stylesheet" />
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
      <a class="brand" href="${PATH}">
        <img width="30" height="30" src="${PATH}r/img/ico.png" alt="logo" />
        <span id="sysName">${sysName}</span>
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
          	欢迎您：
            <span class="username">${curUserName}</span>
            <i class="icon-angle-down"></i>
          </a>
          <ul class="dropdown-menu">
            <!-- 
            <li><a href="#"><i class="icon-user"></i> 资料</a></li>
            <li><a href="#"><i class="icon-map-marker"></i> IP:127.0.0.1</a></li>
             -->
            <li><a href="javascript:;" id="trigger_fullscreen"><i class="icon-move"></i> 全屏</a></li>
            <li><a href="javascript:;" onclick="logout()"><i class="icon-key"></i> 退出</a></li>
          </ul>
        </li>
        <!-- END 用户信息 -->
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