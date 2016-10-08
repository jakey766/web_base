<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/env.jsp"%>
<jsp:include page="../common/hd_blank.jsp"></jsp:include>
<div class="row-fluid form form-horizontal form-bordered form-row-stripped">
	<div class="control-group">
		<label class="control-label"><span class="required">*</span> 姓名：</label>
		<div class="controls">
			<input type="text" class="m-wrap large" name="xm" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label"><span class="required">*</span> 证件号：</label>
		<div class="controls">
			<input type="text" class="m-wrap large" name="zjhm" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label"><span class="required">*</span> 手机号：</label>
		<div class="controls">
			<input type="text" class="m-wrap large" name="sjhm" />
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
			<input type="text" class="m-wrap large" name="jtrs" />
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
</div>
<jsp:include page="../common/ft_blank.jsp"></jsp:include>

<script>
</script>
</html>