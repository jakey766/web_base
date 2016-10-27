<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="cm" uri="http://www.cm.com/functions" %>
<%@include file="../common/env.jsp"%>
<jsp:include page="../common/hd_frame.jsp"></jsp:include>
<style>
	@media (max-width: 979px) and (min-width: 768px){
		.row-fluid [class*="span"]{margin-left:0px !important;}
	}
	@media (min-width: 1200px){
		.row-fluid [class*="span"]{margin-left:0px !important;}
	}
	.row-fluid [class*="span"]{margin-left:0px !important;}
	.portlet.box .form-horizontal.form-bordered .control-group:first-child {margin-top:0px !important;}
</style>

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
							<div class="row-fluid">
								<c:forEach var="vo" items="${fields}">
									<c:choose>
										<c:when test="${vo.stype eq 'dist'}">
											<div class="span4">
												<div class="control-group">
													<label class="control-label"> ${vo.name}：</label>
													<div class="controls">
														<select class="span10" id="${vo.fname}" name="${vo.fname}">
															<option value="">请选择</option>
															<c:forEach var="v" items="${cm:loadDist(vo.distType)}">
																<option value="${v.key}">${v.name}</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
										</c:when>
										<c:when test="${vo.stype eq 'org'}">
											<div class="span4">
												<div class="control-group">
													<label class="control-label"> ${vo.name}：</label>
													<div class="controls">
														<select class="span10" id="${vo.fname}" name="${vo.fname}" onchange="orgChange(this, '${vo.distKey}')">
															<option value="">请选择</option>
															<c:if test="${vo.distKey ne null and vo.distKey ne ''}">
																<c:forEach var="v" items="${cm:loadOrg(vo.distType)}">
																	<option value="${v.id}">${v.name}</option>
																</c:forEach>
															</c:if>
														</select>
													</div>
												</div>
											</div>
										</c:when>
										<c:when test="${vo.stype eq 'tree'}">
											<div class="span4">
												<div class="control-group">
													<label class="control-label"> ${vo.name}：</label>
													<div class="controls">
														<select class="span10" id="${vo.fname}" name="${vo.fname}" onchange="treeChange(this, '${vo.distKey}')">
															<option value="">请选择</option>
															<c:if test="${vo.distKey ne null and vo.distKey ne ''}">
																<c:forEach var="v" items="${cm:loadTree(vo.distType, '0')}">
																	<option value="${v.id}">${v.name}</option>
																</c:forEach>
															</c:if>
														</select>
													</div>
												</div>
											</div>
										</c:when>
										<c:when test="${vo.stype eq 'date'}">
											<div class="span4">
												<div class="control-group">
													<label class="control-label"> ${vo.name}：</label>
													<div class="controls">
														<input type="text" class="span10 laydate-icon" id="${vo.fname}" name="${vo.fname}"/>
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="span4">
												<div class="control-group">
													<label class="control-label"> ${vo.name}：</label>
													<div class="controls">
														<input type="text" class="span10" id="${vo.fname}" name="${vo.fname}"/>
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
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
	$(document).ready(function() {
		initDate();
	});
	
	function initDate(){
		var ds = $('.laydate-icon');
		if(ds.length>0){
			ds.each(function(){
				laydate({
					elem:'#' + this.id,
					istime:false,
					isclear:true,
					issure:true,
					format: 'YYYY-MM-DD',
				});
			});
		}
	}
	
	function orgChange(target, cid){
		if(!!!cid||cid=='')
			return;
		var val = $(target).val();
		var h = '<option value="">所有</option>';
		if(!!!val||val==''){
			$('#'+cid).html(h).change();
		}else{
			$.post('${PATH}cm/loadOrgs.do', 'pid='+val, function(json) {
				if (!json.success) {
					$.alert(json.message);
					return;
				}
				var data = json.object;
				if(!!data&&data.length>0){
					$.each(data, function(i, n){
						h += '<option value="'+ n.id + '">' + n.name + '</option>';
					});
				}
				$('#'+cid).html(h).change();
			});
		}
	}

	function treeChange(target, cid){
		if(!!!cid||cid=='')
			return;
		var val = $(target).val();
		var h = '<option value="">所有</option>';
		if(!!!val||val==''){
			$('#'+cid).html(h).change();
		}else{
			$.post('${PATH}cm/loadTrees.do', 'pid='+val, function(json) {
				if (!json.success) {
					$.alert(json.message);
					return;
				}
				var data = json.object;
				if(!!data&&data.length>0){
					$.each(data, function(i, n){
						h += '<option value="'+ n.id + '">' + n.name + '</option>';
					});
				}
				$('#'+cid).html(h).change();
			});
		}
	}

	function save(){
		var formData = $("#edit_form").serializeJson();
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