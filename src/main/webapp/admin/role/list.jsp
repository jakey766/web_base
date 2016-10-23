<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../common/env.jsp"%>
<jsp:include page="../../common/hd_frame.jsp"></jsp:include>
<link href="${PATH}r/plugins/zTree_v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" />

<!-- BEGIN PAGE -->
<div class="page-content">
	<!-- BEGIN 右边容器-->
	<div class="container-fluid">
		<!-- BEGIN 右容器头部-->
		<div class="row-fluid">
			<div class="span12">
				<!-- BEGIN 页面标题和面包屑导航 -->
				<h3 class="page-title">角色管理</h3>
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="${PATH}">Home</a> <i class="icon-angle-right"></i></li>
					<li>系统管理<i class="icon-angle-right"></i></li>
					<li>角色管理</li>
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
							<i class="icon-reorder"></i>角色列表
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
									<th>名称</th>
									<th>描述</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody">
								<script id="listTmpl" type="text/html">
                				{{each list as v i}}
                					<tr>
                  						<td>{{v.name}}</td>
                  						<td>{{v.desc}}</td>
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
							<label class="control-label"><span class="required">*</span> 名称：</label>
							<div class="controls">
								<input type="text" id="name" name="name" class="span8" required maxlength="50" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">描述：</label>
							<div class="controls">
								<input type="text" id="desc" name="desc" class="span8" maxlength="100" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label"><span class="required">*</span> 菜单权限：</label>
							<div class="controls">
								<ul id="menuTree" class="ztree" style="max-height: 300px;overflow: auto;"></ul>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label"><span class="required">*</span> 数据权限：</label>
							<div class="controls" style="max-height: 300px;overflow: auto;">
								<c:forEach var="vo" items="${fields}">
									<label><input type="checkbox" name="field" value="${vo.fname}"/>${vo.name}</label>
								</c:forEach>
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
<script type="text/javascript" src="${PATH}r/plugins/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${PATH}r/plugins/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>

<script>
	var initedMenu = false;
	var treeObj;
	$(document).ready(function() {
		search();
	});

	var curPage = 1;
	var tableSort = $('#tb_list');
	function search(page, size) {
		var fn = arguments.callee;
		var req = 'page=' + (page || 1) + '&size=' + (size = size || 15);
		Loading.show();
		$.post('${PATH}admin/role/list.do', req, function(json) {
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
		$('#name, #desc').val('');
		$('input[name="field"]').removeAttr('checked');
		$.uniform.update("input");
		if (!initedMenu) {
			initMenuTree(function() {
				$.dialog({
					title : '新增角色',
					content : $('#editDialog')[0],
					padding : 0,
					id : 'edit_dialog'
				});
				editType = "add";
			});
		} else {
			$.dialog({
				title : '新增角色',
				content : $('#editDialog')[0],
				padding : 0,
				id : 'edit_dialog'
			});
			editType = "add";
			treeObj.checkAllNodes(false);
		}
	}

	function toEdit(id) {
		if (!initedMenu) {
			initMenuTree(function() {
				toEditCall(id);
			});
		} else {
			toEditCall(id);
		}
	}

	function toEditCall(id) {
		treeObj.checkAllNodes(false);
		$('input[name="field"]').removeAttr('checked');
		Loading.show();
		$.post('${PATH}admin/role/getWithMenuIds.do', 'id=' + id, function(data) {
			Loading.hide();
			if (!data.success) {
				$.alert(data.message);
				return;
			}
			var map = data.object;
			if (!!!map) {
				$.alert('该角色不存在或已被删除!');
				return;
			}

			var vo = map.role;
			var menuIds = map.menuIds;

			$('#id').val(vo.id);
			$('#name').val(vo.name);
			$('#desc').val(vo.desc);

			if (!!menuIds && menuIds.length > 0) {
				var _nodes = null;
				$.each(menuIds, function(i, mid) {
					_nodes = treeObj.getNodesByParam("id", mid, null);
					if (!!_nodes && _nodes.length > 0) {
						treeObj.checkNode(_nodes[0], true, false);
					}
				});
			}
			
			var fields = vo.fields;
			if(!!fields&&fields.length>0){
				var splits = fields.split(',');
				$.each(splits, function(i, n){
					$('input[name="field"][value="'+n+'"]').attr('checked', 'checked');
				});
			}
			$.uniform.update("input");

			$.dialog({
				title : '编辑角色',
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
		var menus = getCheckedMenus();
		if (menus == '') {
			$.alert('请勾选菜单权限');
			return;
		}
		var fields = getFields();
		if(!!!fields||fields.length<1){
			$.alert('请勾选数据权限');
			return;
		}
		var param = {
			name : $.trim($('#name').val()),
			desc : $.trim($('#desc').val()),
			menus : menus,
			fields: fields
		};
		$('#btnSave').attr('disabled', true);
		Loading.show();
		$.post('${PATH}admin/role/add.do', param, function(data) {
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
		var menus = getCheckedMenus();
		if (menus == '') {
			$.alert('请勾选菜单权限');
			return;
		}
		var fields = getFields();
		if(!!!fields||fields.length<1){
			$.alert('请勾选数据权限');
			return;
		}
		var param = {
			id : $('#id').val(),
			name : $.trim($('#name').val()),
			desc : $.trim($('#desc').val()),
			menus : menus,
			fields : fields
		};
		$('#btnSave').attr('disabled', true);
		Loading.show();
		$.post('${PATH}admin/role/update.do', param, function(data) {
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
			$.post("${PATH}admin/role/delete.do", "id=" + id, function(data) {
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

	function initMenuTree(callback) {
		Loading.show();
		$.post('${PATH}admin/menu/loadAll.do', null, function(data) {
			Loading.hide();
			if (data.success) {
				var list = data.object;
				if (!!!list || list.length < 1) {
					$.alert('没有菜单数据,请先添加菜单!');
					return;
				}
				var zNodes = [];
				$.each(list, function(i, vo) {
					zNodes.push({
						id : vo.id,
						pId : vo.pid,
						name : vo.name,
						open : true
					});
				});

				var setting = {
					check : {
						enable : true,
						chkboxType : {
							"Y" : "ps",
							"N" : "ps"
						}
					},
					data : {
						simpleData : {
							enable : true
						}
					},
					view : {
						showLine : false
					}
				};

				treeObj = $.fn.zTree.init($("#menuTree"), setting, zNodes);

				initedMenu = true;

				if (callback)
					callback.call();
			} else {
				$.alert(data.message);
			}
		});
	}

	function getCheckedMenus() {
		var mid = '';
		var mids = [];
		var nodes = treeObj.getCheckedNodes(true);
		if (nodes.length > 0) {
			$.each(nodes, function(i, node) {
				mids.push(node.id);
			});
			mid = mids.join(',');
		}
		return mid;
	}
	
	function getFields(){
		var fs = $('input[name="field"]:checked');
		var arr = [];
		if(fs.length>0){
			fs.each(function(){
				arr.push(this.value);
			});
		}
		return arr.join(',');
	}
</script>
</html>