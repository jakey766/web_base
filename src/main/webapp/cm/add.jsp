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
										<input type="text" class="m-wrap large" name="xm" value="张三"/>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><span class="required">*</span> 证件号：</label>
									<div class="controls">
										<input type="text" class="m-wrap large" name="zjhm" value="123456" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><span class="required">*</span> 手机号：</label>
									<div class="controls">
										<input type="text" class="m-wrap large" name="sjhm" value="13800138000" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">婚姻状况：</label>
									<div class="controls">
										<select class="m-wrap large" name="hyzk">
											<option value="yh">已婚</option>
											<option value="wh">未婚</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">家庭人数：</label>
									<div class="controls">
										<input type="text" class="m-wrap large" name="jtrs" value="5" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">行业类型：</label>
									<div class="controls">
										<select class="m-wrap large" name="hylx">
											<option value="jry">金融业</option>
											<option value="jzy">建筑业</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">省份：</label>
									<div class="controls">
										<select class="m-wrap large" name="sf">
											<option>广东</option>
											<option>湖南</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">城市：</label>
									<div class="controls">
										<select class="m-wrap large" name="cs">
											<option>深圳</option>
											<option>广州</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">车系：</label>
									<div class="controls">
										<select class="m-wrap large" name="cxi">
											<option>旗舰版</option>
											<option>豪华版</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">车型：</label>
									<div class="controls">
										<select class="m-wrap large" name="cxing">
											<option>秦</option>
											<option>唐</option>
											<option>S6</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">车架号码：</label>
									<div class="controls">
										<input type="text" class="m-wrap large" name="cjhm" value="LC0CD4C37F1105125" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">车辆颜色：</label>
									<div class="controls">
										<select class="m-wrap large" name="clys">
											<option>天山白</option>
											<option>皓月银</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">是否交车上牌：</label>
									<div class="controls">
										<select class="m-wrap large" name="jcsp">
											<option>是</option>
											<option>否</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">所属营销部：</label>
									<div class="controls">
										<select class="m-wrap large" name="yxb">
											<option>深圳营销部</option>
											<option>上海营销部</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">所属大区：</label>
									<div class="controls">
										<select class="m-wrap large" name="dq">
											<option>宝安大区</option>
											<option>福田大区</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">所属经销商：</label>
									<div class="controls">
										<input type="text" class="m-wrap large" name="jxs" value="湖南岳迪汽车销售有限公司" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">付款方式：</label>
									<div class="controls">
										<select class="m-wrap large" name="fkfs">
											<option>全款</option>
											<option>贷款</option>
										</select>
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
		$.alert('添加成功');
	}
</script>
</html>