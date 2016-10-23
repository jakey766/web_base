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
</style>

<!-- BEGIN PAGE -->
<div class="page-content">
	<!-- BEGIN 右边容器-->
	<div class="container-fluid">
		<!-- BEGIN 右容器头部-->
		<div class="row-fluid">
			<div class="span12">
				<!-- BEGIN 页面标题和面包屑导航 -->
				<h3 class="page-title">客户信息管理</h3>
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="${PATH}">Home</a><i class="icon-angle-right"></i></li>
					<li>客户信息<i class="icon-angle-right"></i></li>
					<li>客户信息管理</li>
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
							<i class="icon-reorder"></i>查询条件
						</div>
						<div class="tools">
							<a href="javascript:;" class="collapse"></a>
						</div>
					</div>
					<div class="portlet-body form form-horizontal form-row-seperated">
						<form id="queryForm" action="#">
						<div class="row-fluid">
							<c:forEach var="vo" items="${fields}">
								<c:choose>
									<c:when test="${vo.stype eq 'dist'}">
										<div class="span4">
											<div class="control-group">
												<label class="control-label"> ${vo.name}：</label>
												<div class="controls">
													<select class="span10" id="${vo.fname}" name="Q^${vo.fname}^EQ">
														<option value="">所有</option>
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
													<select class="span10" id="${vo.fname}" name="Q^${vo.fname}^EQ" onchange="orgChange(this, '${vo.distKey}')">
														<option value="">所有</option>
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
													<select class="span10" id="${vo.fname}" name="Q^${vo.fname}^EQ" onchange="treeChange(this, '${vo.distKey}')">
														<option value="">所有</option>
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
									<c:otherwise>
										<div class="span4">
											<div class="control-group">
												<label class="control-label"> ${vo.name}：</label>
												<div class="controls">
													<input type="text" class="span10" id="${vo.fname}" name="Q^${vo.fname}^LK"/>
												</div>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						</form>

						<div class="form-actions">
							<button type="button" class="btn green" id="btnSearch" onclick="search()">
								<i class="icon-search"></i> 查询
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- END 查询条件 -->

			<!-- BEGIN 列表 -->
			<div class="row-fluid">
				<div class="portlet box default">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-reorder"></i>客户信息列表
						</div>
						<div class="tools">
							<button type="button" class="btn mini green" onclick="toAdd()" style="margin-top: -10px;">
								<i class="icon-plus"></i>新增
							</button>
							<button type="button" class="btn mini blue" id="btnExport" onclick="exportExcel()" style="margin-top: -10px;">
								<i class="icon-download-alt"></i> 导出
							</button>
							<a href="${PATH}cm/imp.jspx" class="btn mini blue" style="margin-top: -10px;"><i class="icon-upload-alt"></i> 导入</a>
						</div>
					</div>
					<div class="portlet-body">
						<table id="tb_list" class="table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<c:forEach var="vo" items="${fields}">
										<th>${vo.name}</th>
									</c:forEach>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody">
								<script id="listTmpl" type="text/html">
                				{{each list as v i}}
                					<tr>
										<c:forEach var="vo" items="${fields}">
											<td>{{v.${vo.sname}}}</td>
										</c:forEach>
                    					<td>
											<button class="btn mini green" onclick="toEdit('{{v.id}}')">编辑</button>
                        					<button class="btn mini blue" onclick="toView('{{v.id}}')">详细</button>
                        					<button class="btn mini red" onclick="toDelete('{{v.id}}')">删除</button>
                    					</td>
                					</tr>
                				{{/each}}
              					</script>
							</tbody>
						</table>
						<div id="common_page"></div>
					</div>
				</div>
			</div>
			<!-- END 列表 -->

		</div>
		<!-- END 右容器 main-->
	</div>
	<!-- END 右边容器-->
	
</div>
<!-- END PAGE -->

<jsp:include page="../common/ft_frame.jsp"></jsp:include>
<script type="text/javascript" src="${PATH}r/plugins/layer-v2.3/layer.js"></script>
<script>
	$(document).ready(function() {
		search();
	});

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
	
	var curPage = 1;
	var tableSort = $('#tb_list');
	function search(page, size) {
		var fn = arguments.callee;
		var formData = $("#queryForm").serializeJson();
		formData['page'] = page||1;
		formData['size'] = (size = size || 15);

		Loading.show();
		$('#btnSearch').attr('disabled', true);
		$.post('${PATH}cm/list.do', formData, function(json) {
			$('#btnSearch').attr('disabled', false);
			Loading.hide();
			if (!json.success) {
				$.alert(json.message);
				return;
			}
			var count = json.object.count, list = json.object.list, p = json.object.page, pCount = json.object.pageCount;
			var html = template('listTmpl', {
				list : list
			});
			TmpTools.handleHTML($('#tbody'), html);
			if (count > size) {
				$('#common_page').show();
				TmpTools.commonPage('#common_page', fn, size, count, p, pCount);
			} else {
				$('#common_page').hide();
			}
		});
		curPage = page;
	}
	
	function refresh() {
		search(curPage);
	}
	
	function exportExcel(){
		
	}
	
	function toDelete(id) {
		$.confirm('确认删除该行?', function() {
			Loading.show();
			$.post("${PATH}cm/delete.do", "id=" + id, function(data) {
				Loading.hide();
				if (data.success) {
					refresh();
					$.dialog({
						content : data.message,
						time : 1000
					});
				} else {
					$.alert(data.message);
				}
			});
			refresh();
		}, function() {
			return;
		});
	}
	
	function toAdd(){
		location.href = '${PATH}cm/add.jspx';
	}
	
	function toEdit(id){
		layer.open({
			type: 2,
			title: '编辑',
			shadeClose: false,
			maxmin: true,
			shade: 0.8,
			area: ['90%', '90%'],
			content: '${PATH}cm/edit.jspx?id=' + id
		});
	}
	
	function toView(id){
		layer.open({
			type: 2,
			title: '详细',
			shadeClose: false,
			maxmin: true,
			shade: 0.8,
			area: ['90%', '90%'],
			content: '${PATH}cm/detail.jspx?id=' + id
		});
	}
</script>
</html>