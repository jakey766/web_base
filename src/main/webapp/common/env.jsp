<%--
  通用环境设置
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = "/";
    if(request.getContextPath()!=null&&request.getContextPath().length()>0)
        path = request.getContextPath() +"/";
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    request.setAttribute("PATH", path);
    request.setAttribute("BASEPATH", basePath);
%>