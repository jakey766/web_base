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
				<h3 class="page-title">用户管理</h3>
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="${PATH}">Home</a><i class="icon-angle-right"></i></li>
					<li>系统管理<i class="icon-angle-right"></i></li>
					<li>用户管理</li>
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
						<div class="control-group">
							<label class="control-label"> 账号：</label>
							<div class="controls">
								<input type="text" id="keywords" name="keywords" onkeydown="if(event.keyCode==13){search();}" />
							</div>
						</div>
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
							<i class="icon-reorder"></i>用户列表
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
									<th>用户名</th>
									<th>姓名</th>
									<th>手机</th>
									<th>Email</th>
									<th>角色</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody">
								<script id="listTmpl" type="text/html">
                				{{each list as v i}}
                					<tr>
                    					<td>{{v.username}}</td>
                    					<td>{{v.name}}</td>
                    					<td>{{v.mobile}}</td>
                    					<td>{{v.email}}</td>
										<td>{{formatTrim(v.roleNames)}}</td>
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
							<label class="control-label"><span class="required">*</span> 用户名：</label>
							<div class="controls">
								<input type="text" id="username" name="username" class="span8" required maxlength="50" />
							</div>
						</div>
						<div id="passDiv" class="control-group hide">
							<label class="control-label"><span class="required">*</span> 密码：</label>
							<div class="controls">
								<input type="password" id="password" name="password" class="span8" maxlength="100" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label"><span class="required">*</span> 姓名：</label>
							<div class="controls">
								<input type="text" id="name" name="name" class="span8" required maxlength="10" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label"><span class="required">*</span> 角色：</label>
							<div class="controls" id="roleDiv"></div>
						</div>
						<div class="control-group">
							<label class="control-label">手机：</label>
							<div class="controls">
								<input type="text" id="mobile" name="mobile" class="span8" maxlength="20" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">Email：</label>
							<div class="controls">
								<input type="text" id="email" name="email" class="span8" maxlength="50" />
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
<script src="${PATH}r/plugins/jquery.md5.js"></script>
<script>
	var roleInited = false;
	$(document).ready(function() {
		initTemplateFunc();
		search();
	});
	
	function initTemplateFunc() {
		template.helper('formatTrim', function(v) {
			return trimChar(v);
		});
	}
	
	var curPage = 1;
	var tableSort = $('#tb_list');
	function search(page, size) {
		var fn = arguments.callee;
		var keywords = $.trim($('#keywords').val());
		var req = 'page=' + (page || 1) + '&size=' + (size = size || 15);
		req += '&state=-1&keywords=' + keywords;
		Loading.show();
		$('#btnSearch').attr('disabled', true);
		$.post('${PATH}admin/user/list.do', req, function(json) {
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
		$('#username, #name, #password, #mobile, #email').val('');
		$.uniform.update("input");
		$('#passDiv').show();
		$('#password').attr('required', true);
		$('#username').removeAttr('readonly');
		/*
		if (!roleInited) {
			loadRoles(function() {
				$.dialog({
					title : '新增用户',
					content : $('#editDialog')[0],
					padding : 0,
					id : 'edit_dialog'
				});
				editType = "add";
				$('[name="roles"]').removeAttr('checked');
			});
		} else {
			$.dialog({
				title : '新增用户',
				content : $('#editDialog')[0],
				padding : 0,
				id : 'edit_dialog'
			});
			editType = "add";
			$('[name="roles"]').removeAttr('checked');
		}
		*/
		$.dialog({
			title : '新增用户',
			content : $('#editDialog')[0],
			padding : 0,
			id : 'edit_dialog'
		});
		editType = "add";
	}
	
	function toEdit(id) {
		/*
		$('[name="roles"]').removeAttr('checked');
		if (!roleInited) {
			loadRoles(function() {
				toEditCall(id);
			});
		} else {
			toEditCall(id);
		}
		*/
		toEditCall(id);
	}
	
	function toEditCall(id) {
		Loading.show();
		$.post('${PATH}admin/user/get.do', 'id=' + id, function(data) {
			Loading.hide();
			if (!data.success) {
				$.alert(data.message);
				return;
			}
			var vo = data.object;
			if (!!!vo) {
				$.alert('该用户不存在或已被删除!');
				return;
			}
			$('#password').removeAttr('required');
			$('#username').attr('readonly', true);
			$('#passDiv').hide();
	
			$('#id').val(vo.id);
			$('#username').val(vo.username);
			$('#name').val(vo.name);
			$('#mobile').val(vo.mobile);
			$('#email').val(vo.email);
			
			/*
			var role_ids = vo.roleIds;
			if (!!!role_ids)
				role_ids = '';
			if (role_ids != '') {
				role_ids = trimChar(role_ids);
				var rids = role_ids.split(',');
				$.each(rids, function(i, rid) {
					$('[name="roles"][value="' + rid + '"]').attr('checked', 'checked');
				});
			}
			$.uniform.update("input");
			*/
			
			$.dialog({
				title : '编辑用户',
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
		/*
		var roles = getCheckedRoles();
		if (roles == null) {
			$.alert('请选择角色!');
			return;
		}
		*/
		var username = $.trim($('#username').val());
		var password = $('#password').val();
		password = $.md5(password + '' + name);
		var param = {
			username : username,
			password : password,
			name : $.trim($('#name').val()),
			mobile : $.trim($('#mobile').val()),
			email : $.trim($('#email').val())
			/*
			,roleIds : roles[0],
			roleNames : roles[1]
			*/
		};
		$('#btnSave').attr('disabled', true);
		Loading.show();
		$.post('${PATH}admin/user/add.do', param, function(data) {
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
		/*
		var roles = getCheckedRoles();
		if (roles == null) {
			$.alert('请选择角色!');
			return;
		}
		*/
		var param = {
			id : $('#id').val(),
			username : $.trim($('#username').val()),
			name : $.trim($("#name").val()),
			mobile : $.trim($('#mobile').val()),
			email : $.trim($('#email').val())
			/*
			,roleIds : roles[0],
			roleNames : roles[1]
			*/
		};
		$('#btnSave').attr('disabled', true);
		Loading.show();
		$.post('${PATH}admin/user/update.do', param, function(data) {
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
			$.post("${PATH}admin/user/delete.do", "id=" + id, function(data) {
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

	function loadRoles(callback) {
		$.post("${PATH}common/loadRoles.do", null, function(data) {
			if (data.success) {
				var list = data.object;
				if (list == null || list.length < 1) {
					$.alert('没有角色,请先添加角色!');
					return;
				}
				var h = '';
				$.each(list, function(i, vo) {
					h += '<label class="radio_label"><input type="checkbox" name="roles" value="'+vo.id+'" text="'+vo.name+'"/>'
						+ vo.name + '</label>';
				});
				$('#roleDiv').html(h);
				roleInited = true;
				if (callback)
					callback.call();
			} else {
				$.alert('加载角色列表异常:' + data.message);
			}
		});
	}

	function getCheckedRoles() {
		var cks = $('[name="roles"]:checked');
		var ids = [];
		var names = [];
		if (cks.length > 0) {
			cks.each(function() {
				ids.push(this.value);
				names.push($(this).attr('text'));
			});
			var idStr = ids.join(',');
			var nameStr = names.join(',');
			idStr = appendChar(idStr);
			nameStr = appendChar(nameStr);
			return [ idStr, nameStr ];
		}
		return null;
	}
</script>
</html>