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
				<h3 class="page-title">新增客户信息</h3>
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="${PATH}">Home</a><i class="icon-angle-right"></i></li>
					<li>客户信息<i class="icon-angle-right"></i></li>
					<li>新增客户信息</li>
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
						<div class="tools">
							<a href="javascript:;" class="collapse"></a>
						</div>
					</div>
					<div class="portlet-body">
							<form id="edit_form" class="form form-horizontal form-bordered form-row-stripped">
								<div class="control-group">
									<label class="control-label"><span class="required">*</span> 姓名：</label>
									<div class="controls">
										<input type="text" class="m-wrap large" name="sqr_xm" value="张三"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><span class="required">*</span> 证件号：</label>
									<div class="controls">
										<input type="text" class="m-wrap large" name="sqr_zjhm" value="123456" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><span class="required">*</span> 电话号码：</label>
									<div class="controls">
										<input type="text" class="m-wrap large" name="sqr_dhhm" value="13800138000" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">性别：</label>
									<div class="controls">
										<select name="xb" class="m-wrap large">
											<option value="1">男</option>
											<option value="2">女</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">VIN号：</label>
									<div class="controls">
										<input type="text" class="m-wrap large" name="vin" value="LC0CD4C37F1105125" />
									</div>
								</div>
								<div class="form-actions">
									<button type="button" class="btn green" id="btnSave" onclick="save()"><i class="icon-ok"></i> 保存</button>
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
		var formData = $("#edit_form").serialize();
		$('#btnSave').attr('disabled', true);
		Loading.show();
		$.post('${PATH}cm/add.do', formData, function(json) {
			$('#btnSave').attr('disabled', false);
			Loading.hide();
			$.alert(json.message);
		});
	}
</script>
</html>