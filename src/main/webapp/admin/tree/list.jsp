<%@ page import="com.pk.framework.cfg.Constants" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../common/env.jsp"%>
<jsp:include page="../../common/hd_frame.jsp"></jsp:include>
<%
	request.setAttribute("types", Constants.getTreeTypeMap());
%>
<link href="${PATH}r/plugins/zTree_v3/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" />

<!-- BEGIN PAGE -->
<div class="page-content">
	<!-- BEGIN 右边容器-->
	<div class="container-fluid">
		<!-- BEGIN 右容器头部-->
		<div class="row-fluid">
			<div class="span12">
				<!-- BEGIN 页面标题和面包屑导航 -->
				<h3 class="page-title">树形字典管理</h3>
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="${PATH}">Home</a><i class="icon-angle-right"></i></li>
					<li>系统管理<i class="icon-angle-right"></i></li>
					<li>树形字典管理</li>
				</ul>
				<!-- END 页面标题和面包屑导航 -->
			</div>
		</div>
		<!-- END 右容器头部-->
		<!-- BEGIN 右容器 main-->
		<div class="row-fluid">
			<div class="span4">
				<div class="portlet box default">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-reorder"></i>
							<select id="searchType" name="searchType" class="m-wrap small" onchange="typeChange()" style="margin-bottom:0px;">
								<c:forEach var="vo" items="${types}">
									<option value="${vo.key}">${vo.value}</option>
								</c:forEach>
							</select>
						</div>
						<div class="tools">
							<button type="button" class="btn mini green" onclick="toAdd(0, 1)" style="margin-top: -10px;">
								<i class="icon-plus"></i>增加父项
							</button>
						</div>
					</div>
					<div class="portlet-body">
						<ul id="orgTree" class="ztree" style="width:99%;background-color:white;overflow: auto;padding:0px;"></ul>
					</div>
				</div>
			</div>
			<div class="span8">
				<div class="portlet box default detail">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-reorder"></i>字典信息
						</div>
						<div class="tools">
							<button type="button" id="btnAddChild" class="btn mini green hide" onclick="toAddChild()" style="margin-top: -10px;">增加子项</button>
							<button type="button" id="btnEdit" class="btn mini blue hide" onclick="toEdit()" style="margin-top: -10px;">编辑</button>
							<button type="button" id="btnDelete" class="btn mini red hide" onclick="toDelete()" style="margin-top: -10px;">删除</button>
						</div>
					</div>
					<div class="portlet-body form-horizontal form">
						<div class="control-group">
							<label class="control-label">名称:</label>
							<div class="controls" id="show_name"></div>
						</div>
					</div>
				</div>
			</div>
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
					<input type="hidden" id="pid" name="pid" />
					<input type="hidden" id="level" name="level" />
					<div class="row-fluid">
						<div class="control-group">
							<label class="control-label"><span class="required">*</span> 名称：</label>
							<div class="controls">
								<input type="text" id="name" name="name" class="span8" required maxlength="50" />
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
<script src="${PATH}r/plugins/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
<script src="${PATH}r/plugins/zTree_v3/js/jquery.ztree.excheck-3.5.js"></script>
<script>
	var orgList;
	var curId;
	var curLevel;
	var curName;
	$(document).ready(function() {
		search();
	});

	function getOrg(id){
		if(!!orgList){
			for(var i = 0,len=orgList.length;i<len;i++){
				var vo = orgList[i];
				if(vo.id==id)
					return vo;
			}
		}
		return null;
	}

	function showOrgInfo(id){
		var vo = getOrg(id);
		curId = vo.id;
		curName = vo.name;
		curLevel = vo.level;
		$('#show_name').text(vo.name);

		if(vo.pid==0){
			$('#btnAddChild').show();
		}else{
			$('#btnAddChild').hide();
		}
		$('#btnEdit').show();
		$('#btnDelete').show();
	}

	var zNodes = [];
	var setting = {
		data: {
			simpleData: {
				enable: true
			}
		},
		view:{
			showLine: true,
			dblClickExpand: false
		},
		callback: {
			onClick: function(e, treeId, treeNode){
				var zTree = $.fn.zTree.getZTreeObj("orgTree");
				nodes = zTree.getSelectedNodes();
				var node = nodes[0];
				showOrgInfo(node.id);
			}
		}
	};

	function search() {
		zNodes = [];
		Loading.show();
		$.post('${PATH}admin/tree/list.do', 'pid=-1&type='+$('#searchType').val(), function(json) {
			Loading.hide();
			if (!json.success) {
				$.alert(json.message);
				return;
			}
			var data = json.object;
			if(!!data&&data.length>0){
				$.each(data, function(i, vo){
					zNodes.push({id: vo.id, pId:vo.pid, name:vo.name, level:vo.level, open:true});
				});
			}
			$.fn.zTree.init($("#orgTree"), setting, zNodes);
			orgList = data;
		});
	}

	function typeChange(){
		search();
		$('#show_name').text('');
		$('#btnAddChild, #btnEdit, #btnDelete').hide();
	}
	
	var editType = 'add';
	function toAdd(pid, level) {
		$('#id').val('');
		$('#pid').val(pid);
		$('#name').val('');
		$('#level').val(level);
		$.dialog({
			title : '新增',
			content : $('#editDialog')[0],
			padding : 0,
			id : 'edit_dialog'
		});
		editType = "add";
	}

	function toAddChild(){
		toAdd(curId, curLevel+1);
	}
	
	function toEdit() {
		var id = curId;
		Loading.show();
		$.post('${PATH}admin/tree/get.do', 'id=' + id, function(data) {
			Loading.hide();
			if (!data.success) {
				$.alert(data.message);
				return;
			}
			var vo = data.object;
			if (!!!vo) {
				$.alert('不存在或已被删除!');
				return;
			}
	
			$('#id').val(vo.id);
			$('#pid').val(vo.pid);
			$('#name').val(vo.name);
			$('#level').val(vo.level);
			$.dialog({
				title : '编辑',
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
			level : $.trim($('#level').val()),
			type : $('#searchType').val()
		};
		$('#btnSave').attr('disabled', true);
		Loading.show();
		$.post('${PATH}admin/tree/add.do', param, function(data) {
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
			level : $.trim($('#level').val()),
			type : $('#searchType').val()
		};
		$('#btnSave').attr('disabled', true);
		Loading.show();
		$.post('${PATH}admin/tree/update.do', param, function(data) {
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
			$('#show_name').text($.trim($('#name').val()));
		});
	}
	
	function toDelete() {
		var id = curId;
		var name = curName;
		$.confirm('确认删除[' + name + ']?', function() {
			Loading.show();
			$.post("${PATH}admin/tree/delete.do", "id=" + id, function(data) {
				Loading.hide();
				if (data.success) {
					search();
					$.dialog({
						content : data.message,
						time : 1000
					});
				} else {
					$.alert(data.message);
				}
				$('#show_name').text('');
				$('#btnAddChild, #btnEdit, #btnDelete').hide();
			});
		}, function() {
			return;
		});
	}
</script>
</html>