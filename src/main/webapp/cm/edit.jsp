<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="cm" uri="http://www.cm.com/functions" %>
<%@include file="../common/env.jsp"%>
<jsp:include page="../common/hd_blank.jsp"></jsp:include>
<style>
	@media (max-width: 979px) and (min-width: 768px){
		.row-fluid [class*="span"]{margin-left:0px !important;}
	}
	@media (min-width: 1200px){
		.row-fluid [class*="span"]{margin-left:0px !important;}
	}
	.row-fluid [class*="span"]{margin-left:0px !important;}
	.portlet.box .form-horizontal.form-bordered .control-group:first-child {margin-top:0px !important;}
</style>
<body class="bg-white">
<div class="row-fluid">
	<form id="edit_form" class="form form-horizontal form-bordered form-row-stripped">
		<div id="content" class="row-fluid">
			<script id="voTmpl" type="text/html">
				<input type="hidden" name="id" value="{{v.id}}"/>
				<c:forEach var="vo" items="${fields}">
					<c:choose>
						<c:when test="${vo.stype eq 'dist'}">
							<div class="span4">
								<div class="control-group">
									<label class="control-label"> ${vo.name}：</label>
									<div class="controls">
										<select class="span10" id="${vo.fname}" name="${vo.fname}" v="{{v.${vo.fname}}}">
											<option value="">请选择</option>
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
										<select class="span10 ${vo.treeLevel!=1?'ctree':''}" id="${vo.fname}" name="${vo.fname}" v="{{v.${vo.fname}}}" onchange="orgChange(this, '${vo.distKey}')">
											<option value="">请选择</option>
											<c:if test="${vo.distKey ne null and vo.distKey ne ''}">
												<c:forEach var="v" items="${cm:loadOrg(vo.distType)}">
													<option value="${v.id}" auth="${v.auth}" level="${v.type}">${v.name}</option>
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
										<select class="span10 ${vo.treeLevel!=1?'ctree':''}" id="${vo.fname}" name="${vo.fname}" v="{{v.${vo.fname}}}" onchange="treeChange(this, '${vo.distKey}')">
											<option value="">请选择</option>
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
						<c:when test="${vo.stype eq 'date'}">
							<div class="span4">
								<div class="control-group">
									<label class="control-label"> ${vo.name}：</label>
									<div class="controls">
										<input type="text" class="span10 laydate-icon" id="${vo.fname}" name="${vo.fname}" value="{{v.${vo.fname}}}"/>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="span4">
								<div class="control-group">
									<label class="control-label"> ${vo.name}：</label>
									<div class="controls">
										<input type="text" class="span10" id="${vo.fname}" name="${vo.fname}" value="{{v.${vo.fname}}}"/>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</script>
		</div>
		<div class="form-actions">
			<button type="button" class="btn green" id="btnSave" onclick="save()"><i class="icon-ok"></i> 保存</button>
		</div>
	</form>
</div>
<jsp:include page="../common/ft_blank.jsp"></jsp:include>

<script>
	$(document).ready(function() {
		loadCmInfo();
	});
	function loadCmInfo(){
		Loading.show();
		$.post('${PATH}cm/get.do', 'id=${param.id}', function(json) {
			Loading.hide();
			if (!json.success) {
				$.alert(json.message);
				return;
			}
			var v = json.object;
			if(!!!v){
				$('#content').html('记录不存在');
				return;
			}
			var html = template('voTmpl', {
				v : v
			});
			TmpTools.handleHTML($('#content'), html);

			var sels = $('#content').find('select');
			if(!!sels && sels.length>0){
				sels.each(function(){
					var obj = $(this);
					var defVal = obj.attr('v');
					if(!!defVal&&defVal!=null&&defVal!=''){
						if(obj.find('option[value="'+defVal+'"]').length>0)
							obj.val(defVal);
					}
					if(!obj.hasClass('ctree'))
						obj.change();
				});
			}
			initDate();
		});
	}
	
	function initDate(){
		var ds = $('.laydate-icon');
		if(ds.length>0){
			ds.each(function(){
				laydate({
					elem:'#' + this.id,
					istime:false,
					isclear:true,
					issure:true,
					format: 'YYYY-MM-DD',
				});
			});
		}
	}

	function orgChange(target, cid){
		if(!!!cid||cid=='')
			return;
		var val = $(target).val();
		var cobj = $('#'+cid);
		var defVal = cobj.attr('v');
		if(!!!defVal)
			defVal = '';
		var auth = $(target).find('option:selected').attr('auth');
		var level = $(target).find('option:selected').attr('level');
		var h = '';
		if(val==''||(!!auth&&auth==1)||(!!level&&level==2)){
			h = '<option value="">请选择</option>';
		}
		if(!!!val||val==''){
			cobj.html(h).change();
		}else{
			$.post('${PATH}cm/loadOrgs.do', 'pid='+val, function(json) {
				if (!json.success) {
					$.alert(json.message);
					return;
				}
				var data = json.object;
				if(!!data&&data.length>0){
					$.each(data, function(i, n){
						if(defVal== n.id)
							h += '<option value="'+ n.id + '" selected="selected">' + n.name + '</option>';
						else
							h += '<option value="'+ n.id + '">' + n.name + '</option>';
					});
				}else{
					if(h=='')
						h = '<option value="">请选择</option>';
				}
				cobj.html(h).change();
			});
		}
	}

	function treeChange(target, cid){
		if(!!!cid||cid=='')
			return;
		var val = $(target).val();
		var cobj = $('#'+cid);
		var defVal = cobj.attr('v');
		if(!!!defVal)
			defVal = '';
		var h = '<option value="">所有</option>';
		if(!!!val||val==''){
			cobj.html(h).change();
		}else{
			$.post('${PATH}cm/loadTrees.do', 'pid='+val, function(json) {
				if (!json.success) {
					$.alert(json.message);
					return;
				}
				var data = json.object;
				if(!!data&&data.length>0){
					$.each(data, function(i, n){
						if(defVal== n.id)
							h += '<option value="'+ n.id + '" selected="selected">' + n.name + '</option>';
						else
							h += '<option value="'+ n.id + '">' + n.name + '</option>';
					});
				}
				cobj.html(h).change();
			});
		}
	}

	function save(){
		var formData = $("#edit_form").serializeJson();
		$('#btnSave').attr('disabled', true);
		Loading.show();

		$.post('${PATH}cm/update.do', formData, function(json) {
			$('#btnSave').attr('disabled', false);
			Loading.hide();
			$.alert(json.message, function(){
				if(json.success){
					parent.window.refresh();
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
				}
			});
		});
	}
</script>
</body>
</html>