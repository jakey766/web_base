<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/env.jsp"%>
<jsp:include page="../../common/hd_frame.jsp"></jsp:include>

<!-- BEGIN PAGE -->
<div class="page-content">
	<!-- BEGIN 右边容器-->
	<div class="container-fluid">
		<!-- BEGIN 右容器头部-->
		<div class="row-fluid">
			<div class="span12">
				<!-- BEGIN 页面标题和面包屑导航 -->
				<h3 class="page-title">菜单权限管理</h3>
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="${PATH}">Home</a><i class="icon-angle-right"></i></li>
					<li>系统管理<i class="icon-angle-right"></i></li>
					<li>菜单权限管理</li>
				</ul>
				<!-- END 页面标题和面包屑导航 -->
			</div>
		</div>
		<!-- END 右容器头部-->
		<!-- BEGIN 右容器 main-->
		<div class="row-fluid">

			<!-- BEGIN 列表 -->
			<div class="row-fluid">
				<div class="portlet box default">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-reorder"></i>菜单权限列表
						</div>
						<div class="tools">
							<button type="button" class="btn mini green" onclick="toAdd()" style="margin-top: -10px;">
								<i class="icon-plus"></i>新增
							</button>
						</div>
					</div>
					<div class="portlet-body">
						<table id="tb_list"
							class="table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<th>ID</th>
									<th>PID</th>
									<th>名称</th>
									<th>URI</th>
									<th>是否为菜单</th>
									<th>排序</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody">
								<script id="listTmpl" type="text/html">
                				{{each list as v i}}
                					<tr>
                    					<td>{{v.id}}</td>
										<td>{{v.pid}}</td>
                    					<td>{{v.name}}</td>
                    					<td>{{v.uri}}</td>
                    					<td>{{v.isMenu==1?"是":"否"}}</td>
										<td>{{v.sortIndex}}</td>
                    					<td>
                        					<button class="btn mini blue" onclick="toEdit('{{v.id}}')">编辑</button>
                        					<button class="btn mini red" onclick="toDelete('{{v.id}}', '{{v.name}}')">删除</button>
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
	
	<!-- BEGIN 弹窗 -->
	<div class="row-fluid">
		<!-- BEGIN 新增/编辑 弹窗 -->
		<div id="editDialog" class="hide">
			<div class="span8" style="margin-left: 0px;">
				<form action="" id="edit_form"
					class="form form-horizontal form-bordered form-row-stripped">
					<input type="hidden" id="id" name="id" />
					<div class="row-fluid">
						<div class="control-group">
							<label class="control-label"><span class="required">*</span> PID：</label>
							<div class="controls">
								<input type="text" id="pid" name="pid" class="span8" required number="true" maxlength="11" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label"><span class="required">*</span> 名称：</label>
							<div class="controls">
								<input type="text" id="name" name="name" class="span8" required maxlength="50" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label"><span class="required">*</span> URI：</label>
							<div class="controls">
								<input type="text" id="uri" name="uri" class="span8" required maxlength="100" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label"><span class="required">*</span> 是否为菜单：</label>
							<div class="controls">
								<label class="radio_label"><input type="radio" name="isMenu" value="1" checked="checked" />是</label>
								<label class="radio_label"><input type="radio" name="isMenu" value="0" />否</label>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label"><span class="required">*</span> 排序序号：</label>
							<div class="controls">
								<input type="text" id="sortIndex" name="sortIndex" class="span8" required number="true" maxlength="11" />
							</div>
						</div>
						<div class="form-actions">
							<button type="button" class="btn green" id="btnSave" onclick="save()">
								<i class="icon-ok"></i> 保存
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- END 新增/编辑 弹窗 -->
	</div>
	<!-- END 弹窗 -->
</div>
<!-- END PAGE -->

<jsp:include page="../../common/ft_frame.jsp"></jsp:include>
<script>
	$(document).ready(function() {
		search();
	});
	
	var curPage = 1;
	var tableSort = $('#tb_list');
	function search(page, size) {
		var fn = arguments.callee;
		var req = 'page=' + (page || 1) + '&size=' + (size = size || 15);
		Loading.show();
		$('#btnSearch').attr('disabled', true);
		$.post('${PATH}admin/menu/list.do', req, function(json) {
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
	
	var editType = 'add';
	function toAdd() {
		$('##name').val('');
		$('#pid').val('0');
		$('#uri').val('#');
		$('#sortIndex').val('1');
		$('input[name="isMenu"]').removeAttr('checked');
		$('input[name="isMenu"][value="1"]').attr('checked', 'checked');
		$.uniform.update("input");
		$.dialog({
			title : '新增菜单',
			content : $('#editDialog')[0],
			padding : 0,
			id : 'edit_dialog'
		});
		editType = "add";
	}
	
	function toEdit(id) {
		Loading.show();
		$.post('${PATH}admin/menu/get.do', 'id=' + id, function(data) {
			Loading.hide();
			if (!data.success) {
				$.alert(data.message);
				return;
			}
			var vo = data.object;
			if (!!!vo) {
				$.alert('该菜单不存在或已被删除!');
				return;
			}
	
			$('#id').val(vo.id);
			$('#pid').val(vo.pid);
			$('#name').val(vo.name);
			$('#uri').val(vo.uri);
			$('#sortIndex').val(vo.sortIndex);
			$('input[name="isMenu"]').removeAttr('checked');
			$('input[name="isMenu"][value="'+vo.isMenu+'"]').attr('checked', 'checked');
			
			$.dialog({
				title : '编辑菜单',
				content : $('#editDialog')[0],
				padding : 0,
				id : 'edit_dialog'
			});
			editType = 'edit';
		});
	}
	
	function save() {
		var editForm = $('#edit_form');
		editForm.validate();
		if (!editForm.valid())
			return;
		if (editType == 'add') {
			doAdd();
		} else {
			doUpdate();
		}
	}
	
	function doAdd() {
		var param = {
			pid: $.trim($('#pid').val()),
			name : $.trim($('#name').val()),
			uri : $.trim($('#uri').val()),
			sortIndex : $.trim($('#sortIndex').val()),
			isMenu : $('input[name="isMenu"]:checked').val()
		};
		$('#btnSave').attr('disabled', true);
		Loading.show();
		$.post('${PATH}admin/menu/add.do', param, function(data) {
			Loading.hide();
			$('#btnSave').attr('disabled', false);
			if (data.success) {
				$.dialog({
					content : data.message,
					time : 1000
				});
				$.dialog.get('edit_dialog').close();
				search();
			} else {
				$.alert(data.message);
			}
		});
	}
	
	function doUpdate() {
		var param = {
			id : $('#id').val(),
			pid: $.trim($('#pid').val()),
			name : $.trim($('#name').val()),
			uri : $.trim($('#uri').val()),
			sortIndex : $.trim($('#sortIndex').val()),
			isMenu : $('input[name="isMenu"]:checked').val()
		};
		$('#btnSave').attr('disabled', true);
		Loading.show();
		$.post('${PATH}admin/menu/update.do', param, function(data) {
			Loading.hide();
			$('#btnSave').attr('disabled', false);
			if (data.success) {
				$.dialog({
					content : data.message,
					time : 1000
				});
				$.dialog.get('edit_dialog').close();
				refresh();
			} else {
				$.alert(data.message);
			}
		});
	}
	
	function toDelete(id, name) {
		$.confirm('确认删除[' + name + ']?', function() {
			Loading.show();
			$.post("${PATH}admin/menu/delete.do", "id=" + id, function(data) {
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
		}, function() {
			return;
		});
	}
</script>
</html>