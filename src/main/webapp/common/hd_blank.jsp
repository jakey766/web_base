<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String title = request.getParameter("title");
     if(title==null||title.length()<1){
    	title="XX系统";
    }
    request.setAttribute("title", title);
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