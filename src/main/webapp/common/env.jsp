<%--
  通用环境设置
--%>
<%
    String path = "/";
    if(request.getContextPath()!=null&&request.getContextPath().length()>0)
        path = request.getContextPath() +"/";
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    request.setAttribute("PATH", path);
    request.setAttribute("BASEPATH", basePath);
%>