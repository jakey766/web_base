<%@ page import="com.pk.framework.cfg.Constants" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../common/env.jsp"%>
<jsp:include page="../../common/hd_frame.jsp"></jsp:include>
<%
	request.setAttribute("types", Constants.getDistTypeMap());
%>

<!-- BEGIN PAGE -->
<div class="page-content">
	<!-- BEGIN 右边容器-->
	<div class="container-fluid">
		<!-- BEGIN 右容器头部-->
		<div class="row-fluid">
			<div class="span12">
				<!-- BEGIN 页面标题和面包屑导航 -->
				<h3 class="page-title">字段配置</h3>
				<ul class="breadcrumb">
					<li><i class="icon-home"></i> <a href="${PATH}">Home</a><i class="icon-angle-right"></i></li>
					<li>系统管理<i class="icon-angle-right"></i></li>
					<li>字段配置</li>
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
							<i class="icon-reorder"></i>字段列表
						</div>
					</div>
					<div class="portlet-body">
						<table id="tb_list" class="table table-bordered table-striped table-hover">
							<thead>
							<tr>
								<th>名称</th>
								<th>列表显示</th>
								<th>做为查询条件</th>
								<th>排序</th>
							</tr>
							</thead>
							<tbody id="tbody">
							<script id="listTmpl" type="text/html">
								{{each list as v i}}
								<tr fname="{{v.fname}}">
									<td>{{v.name}}</td>
									<td>
										<label class="radio_label"><input type="checkbox" name="list" value="1" {{if v.list==1}}checked="checked"{{/if}}/>是</label>
									</td>
									<td>
										<label class="radio_label"><input type="checkbox" name="query" value="1" {{if v.query==1}}checked="checked"{{/if}}/>是</label>
									</td>
									<td>
										<a href="javascript:;" class="btn blue mini" onclick="upRow(this)" style="margin-top:3px;"><i class="icon-arrow-up"></i> </a>
										<a href="javascript:;" class="btn blue mini" onclick="downRow(this)" style="margin-top:3px;"><i class="icon-arrow-down"></i> </a>
									</td>
								</tr>
								{{/each}}
							</script>
							</tbody>
						</table>
						<div class="row-fluid">
							<button type="button" id="btnSave" class="btn green" onclick="save();"><i class="icon-ok"></i> 保存</button>
						</div>
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

<jsp:include page="../../common/ft_frame.jsp"></jsp:include>
<script>
	$(document).ready(function() {
		search();
	});

	var curPage = 1;
	function search() {
		Loading.show();
		$('#btnSearch').attr('disabled', true);
		$.post('${PATH}admin/field/loadAll.do', null, function(json) {
			$('#btnSearch').attr('disabled', false);
			Loading.hide();
			if (!json.success) {
				$.alert(json.message);
				return;
			}
			var html = template('listTmpl', {
				list : json.object
			});
			TmpTools.handleHTML($('#tbody'), html);
		});
	}

	function save() {
		var rows = $('#tbody').children('tr');
		var arr = [];
		$.each(rows, function(i, n){
			var rowObj = $(n);
			var fname = rowObj.attr('fname');
			var list = rowObj.find('input[name="list"]').is(':checked')?1:0;
			var query = rowObj.find('input[name="query"]').is(':checked')?1:0;
			arr.push({
				fname: fname,
				list: list,
				query: query,
				sortIndex: i+1
			});
		});
		var params = {
			json: JSON.stringify(arr)
		};
		$('#btnSave').attr('disabled', true);
		Loading.show();
		$.post('${PATH}admin/field/update.do', params, function(data) {
			Loading.hide();
			$('#btnSave').attr('disabled', false);
			if (data.success) {
				$.dialog({
					content : data.message,
					time : 1000
				});
				search();
			} else {
				$.alert(data.message);
			}
		});
	}

	function upRow(target){
		var tr = $(target).parent().parent(),
				tb = tr.parent(),
				trs = tb.children("tr"),
				idx = trs.index(tr);
		if(idx>0){
			trs.eq(idx-1).before(tr);
		}
	}

	function downRow(target){
		var tr = $(target).parent().parent(),
				tb = tr.parent(),
				trs = tb.children("tr"),
				idx = trs.index(tr);
		if(idx<trs.length-1){
			trs.eq(idx+1).after(tr);
		}
	}

</script>
</html>