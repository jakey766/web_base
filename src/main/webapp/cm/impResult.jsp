<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/env.jsp"%>
<jsp:include page="../common/hd_frame.jsp"></jsp:include>

<!-- BEGIN PAGE -->
<div class="page-content">
	<!-- BEGIN 右边容器-->
	<div class="container-fluid">
		<!-- BEGIN 右容器头部-->
		<div class="row-fluid">
			<div class="span12">
				<!-- BEGIN 页面标题和面包屑导航 -->
				<h3 class="page-title">导入客户信息</h3>
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="${PATH}">Home</a><i class="icon-angle-right"></i></li>
					<li>客户信息<i class="icon-angle-right"></i></li>
					<li>导入客户信息</li>
				</ul>
				<!-- END 页面标题和面包屑导航 -->
			</div>
		</div>
		<!-- END 右容器头部-->
		<!-- BEGIN 右容器 main-->
		<div class="row-fluid">
			<!-- BEGIN 查询条件 -->
			<div class="row-fluid">
				<div class="portlet box default">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-reorder"></i>导入结果
						</div>
					</div>
					<div class="portlet-body">
						<div class="row-fluid">
						<c:choose>
							<c:when test="${result.success}">
								导入成功,其中新增${result.object.addCount}条,更新${result.object.updateCount}条.
							</c:when>
							<c:otherwise>
								${result.message}
							</c:otherwise>
						</c:choose>
						</div>

						<div class="row-fluid">
							<a href="${PATH}cm/list.jspx" class="btn green">信息查询</a>
							<a href="${PATH}cm/imp.jspx" class="btn blue">继续导入</a>
						</div>
					</div>
				</div>
			</div>
			<!-- END 查询条件 -->
		</div>
		<!-- END 右容器 main-->
	</div>
	<!-- END 右边容器-->
</div>
<!-- END PAGE -->

<jsp:include page="../common/ft_frame.jsp"></jsp:include>
</html>