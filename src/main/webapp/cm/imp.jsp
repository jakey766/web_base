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
							<i class="icon-reorder"></i>客户信息
						</div>
					</div>
					<div class="portlet-body">
						<form id="edit_form" class="form form-horizontal form-bordered form-row-stripped" action="${PATH}cm/imp.do" method="post" enctype="multipart/form-data">
							<div class="control-group">
								<label class="control-label"> 来源：</label>
								<div class="controls">
									<select id="type" name="type" class="m-wrap media">
										<option value="0">本系统</option>
										<option value="1">金融公司</option>
										<option value="2">八部系统</option>
										<option value="3">销服系统</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label"> 文件：</label>
								<div class="controls">
									<input type="file" id="file" name="file" class="m-wrap media" />
								</div>
							</div>
							<div class="form-actions">
								<button type="button" class="btn green" id="btnSave" onclick="save()"><i class="icon-ok"></i> 提交</button>
							</div>
						</form>
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
<script>
	function save(){
		var fileStr = $('#file').val();
		if(fileStr==''){
			$.alert('请选择要导入的文件!');
			return;
		}
		$('#edit_form')[0].submit();
	}
</script>
</html>