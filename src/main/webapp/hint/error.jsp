<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/env.jsp" %>
<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8"> <![endif]-->
<!--[if IE 9]> <html class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html> <!--<![endif]-->
<head>
<meta charset="utf-8" />
<title>系统提示</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<link rel="shortcut icon" href="${PATH}r/img/ico.ico" />
<link href="${PATH}r/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<style>
.dashline {height: 30px; border-top: #ccc 1px dashed;}
@media (min-width: 1400px) {
    .warn-wrap{ width:600px}
}
@media (min-width: 1000px) and (max-width: 1399px) {
    .warn-wrap{ width:500px}
}
@media (max-width: 999px) {
    .warn-wrap{ width:60%}
}
.warn-wrap{ margin: 200px auto 0; border: #f88 2px solid; padding: 20px; font-family: "microsoft yahei";}
.warn-wrap h1{ display: table; margin: 0 auto; text-align: center;}
.warn-wrap h1 span{ display: table-cell; vertical-align: middle; font-size: 24px; line-height: 48px;}
.warn-wrap .content{ padding: 20px 0;}
.warn-wrap .content span {color: #f00;}
.warn-wrap .foot{ text-align: center;}
.vertical-center{ position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);}
</style>
</head>
<%
 	String error = (String)request.getAttribute("error");
%>
<body>
<div class="row-fluid">
	<div class="vertical-center warn-wrap">
        <h1><span class="text">提示</span></h1>
        <div class="content">
	   		系统提醒：<span><%=error%></span>
        </div>
        <div class="dashline"></div>
        <div class="foot">
            <input type="button" class="button" value="返回" onclick="history.back();" />
        </div>
    </div>
</div>
</body>
</html>