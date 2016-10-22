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
</style>

<body class="bg-white detail">
<div id="content" class="row-fluid form form-horizontal form-bordered form-row-stripped">
	<script id="voTmpl" type="text/html">
		<c:forEach var="vo" items="${fields}">
			<div class="span4">
				<div class="control-group">
					<label class="control-label"> ${vo.name}：</label>
					<div class="controls">{{v.${vo.sname}}} </div>
				</div>
			</div>
		</c:forEach>
	</script>
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
		});
	}
</script>
</body>
</html>