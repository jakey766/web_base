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
						<div class="row-fluid">
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 姓名：</label>
									<div class="controls">
										<input type="text" class="span10" name="xm"/>
									</div>
								</div>
							</div>
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 证件号：</label>
									<div class="controls">
										<input type="text" class="span10" name="zjhm"/>
									</div>
								</div>
							</div>
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 手机号：</label>
									<div class="controls">
										<input type="text" class="span10" name="sjhm"/>
									</div>
								</div>
							</div>
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 婚姻状况：</label>
									<div class="controls">
										<select class="span10" name="hyzk">
											<option value="">所有</option>
											<option value="yh">已婚</option>
											<option value="wh">未婚</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 家庭人数：</label>
									<div class="controls">
										<input type="text" class="span10" name="jtrs"/>
									</div>
								</div>
							</div>
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 行业类型：</label>
									<div class="controls">
										<select class="span10" name="hylx">
											<option value="">所有</option>
											<option value="jry">金融业</option>
											<option value="jzy">建筑业</option>
										</select>
									</div>
								</div>
							</div>
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 省份：</label>
									<div class="controls">
										<select class="span10" name="sf">
											<option value="">所有</option>
										</select>
									</div>
								</div>
							</div>
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 城市：</label>
									<div class="controls">
										<select class="span10" name="cs">
											<option value="">所有</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 车系：</label>
									<div class="controls">
										<select class="span10" name="cxi">
											<option value="">所有</option>
										</select>
									</div>
								</div>
							</div>
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 车型：</label>
									<div class="controls">
										<select class="span10" name="cxing">
											<option value="">所有</option>
										</select>
									</div>
								</div>
							</div>
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 车架号码：</label>
									<div class="controls">
										<input type="text" class="span10" name="cjhm"/>
									</div>
								</div>
							</div>
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 车辆颜色：</label>
									<div class="controls">
										<select class="span10" name="clys">
											<option value="">所有</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 是否交车上牌：</label>
									<div class="controls">
										<select class="span10" name="jcsp">
											<option value="">所有</option>
										</select>
									</div>
								</div>
							</div>
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 所属营销部：</label>
									<div class="controls">
										<select class="span10" name="yxb">
											<option value="">所有</option>
										</select>
									</div>
								</div>
							</div>
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 所属大区：</label>
									<div class="controls">
										<input type="text" class="span10" name="dq"/>
									</div>
								</div>
							</div>
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 所属经销商：</label>
									<div class="controls">
										<select class="span10" name="jxs">
											<option value="">所有</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span3">
								<div class="control-group">
									<label class="control-label"> 付款方式：</label>
									<div class="controls">
										<select class="span10" name="fkfs">
											<option value="">所有</option>
										</select>
									</div>
								</div>
							</div>
						</div>

						<div class="form-actions">
							<button type="button" class="btn green" id="btnSearch" onclick="search()">
								<i class="icon-search"></i> 查询
							</button>
							<button type="button" class="btn blue" id="btnExport" onclick="exportExcel()">
								<i class="icon-download-alt"></i> 导出
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
						</div>
					</div>
					<div class="portlet-body">
						<table id="tb_list"
							class="table table-bordered table-striped table-hover">
							<thead>
								<tr>
									<th>姓名</th>
									<th>证件号</th>
									<th>性别</th>
									<th>手机号</th>
									<th>婚姻状况</th>
									<th>家庭人数</th>
									<th>行业类型</th>
									<th>省份</th>
									<th>城市</th>
									<th>车系</th>
									<th>车型</th>
									<th>车架号码</th>
									<th>车辆颜色</th>
									<th>是否交车上牌</th>
									<th>所属营销部</th>
									<th>所属大区</th>
									<th>所属经销商</th>
									<th>付款方式</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tbody">
								<script id="listTmpl" type="text/html">
                				{{each list as v i}}
                					<tr>
										<td>{{v.xm}}</td>
                    					<td>{{v.zjhm}}</td>
                    					<td>{{v.xb}}</td>
										<td>{{v.sjhm}}</td>
										<td>{{v.hyzk}}</td>
										<td>{{v.jtrs}}</td>
										<td>{{v.hylx}}</td>
										<td>{{v.sf}}</td>
										<td>{{v.cs}}</td>
										<td>{{v.cxi}}</td>
										<td>{{v.cxing}}</td>
										<td>{{v.cjhm}}</td>
										<td>{{v.clys}}</td>
										<td>{{v.jcsp}}</td>
										<td>{{v.yxb}}</td>
										<td>{{v.dq}}</td>
										<td>{{v.jxs}}</td>
										<td>{{v.fkfs}}</td>
                    					<td>
											<button class="btn mini green" onclick="toEdit('{{v.id}}')">编辑</button>
                        					<button class="btn mini blue" onclick="toView('{{v.id}}')">详细</button>
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
<script type="text/javascript" src="${PATH}r/plugins/layer-v2.3/layer.js"></script>
<script>
	$(document).ready(function() {
		search();
	});
	
	var curPage = 1;
	var tableSort = $('#tb_list');
	/*
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
	*/

	function search() {
		var data = [];
		var page = 1;
		var size = 15;
		for(var i=0;i<size;i++){
			var vo = {
				id:i,
				xm:'张三'+i,
				zjhm:'123456789012345678',
				xb:i%2?'男':'女',
				sjhm:'13801380000',
				hyzk:i%2?'已婚':'未婚',
				jtrs:i%5 + 1,
				hylx:'建筑业',
				sf:'广东',
				cs:'深圳',
				cxi:'SUV',
				cxing:'S6',
				cjhm:'12345',
				clys:'白',
				jcsp:'是',
				yxb:'深圳营销部',
				dq:'福田大区',
				jxs:'XX经销商',
				fkfs:'刷卡'
			};
			data.push(vo);
		}
		var json = {
			object:{
				count:20,
				page:1,
				pageCount:2,
				list:data
			}
		};
		var fn = arguments.callee;
		var count = json.object.count, list = json.object.list, p = json.object.page, pCount = json.object.pageCount;
		var html = template('listTmpl', {
			list : list
		});
		TmpTools.handleHTML($('#tbody'), html);
		$('#common_page').show();
		TmpTools.commonPage('#common_page', fn, size, count, p, pCount);
		curPage = page;
	}
	
	function refresh() {
		search(curPage);
	}
	
	function exportExcel(){
		
	}
	
	function toDelete(id, name) {
		$.confirm('确认删除[' + name + ']?', function() {
			/*
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
			*/
			refresh();
		}, function() {
			return;
		});
	}
	
	function toAdd(){
		layer.open({
			type: 2,
			title: '新增',
			shadeClose: false,
			maxmin: true,
			shade: 0.8,
			area: ['80%', '90%'],
			content: '${PATH}cm/add.jspx'
		});
	}
	
	function toEdit(id){
		layer.open({
			type: 2,
			title: '编辑',
			shadeClose: false,
			maxmin: true,
			shade: 0.8,
			area: ['80%', '90%'],
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
			area: ['80%', '90%'],
			content: '${PATH}cm/detail.jspx?id=' + id
		});
	}
</script>
</html>