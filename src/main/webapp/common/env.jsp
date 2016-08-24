<%--
  通用环境设置
--%>
<%
  String path = request.getContextPath() +"/";
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
  request.setAttribute("path", path);
  request.setAttribute("basePath", basePath);
%>