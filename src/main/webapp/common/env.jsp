<%--
  通用环境设置
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath() +"/";
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
  request.setAttribute("path", path);
  request.setAttribute("basePath", basePath);
%>