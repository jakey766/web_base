<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/env.jsp" %>
<%
    request.setAttribute("haha", "abcc");
%>
<html>
<body>
<h2>Hello World 222 ${haha}!</h2>
<br/>
path:${path}
<br/>
basePath:${basePath}
</body>
</html>