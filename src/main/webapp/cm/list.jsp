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
						</div>
					</div>
					<div class="portlet-body">
						<table id="tb_list"
							class="table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<th>ID</th>
									<th>姓名</th>
									<th>证件号</th>
									<th>性别</th>
									<th>手机号</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody">
								<script id="listTmpl" type="text/html">
                				{{each list as v i}}
                					<tr>
                    					<td>{{v.id}}</td>
										<td>{{v.name}}</td>
                    					<td>{{v.idcard}}</td>
                    					<td>{{v.sex}}</td>
										<td>{{v.mobile}}</td>
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
	
</div>
<!-- END PAGE -->

<jsp:include page="../common/ft_frame.jsp"></jsp:include>
<script>
	$(document).ready(function() {
		//search();
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