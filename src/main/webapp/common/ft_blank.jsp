<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="${PATH}r/plugins/jquery-1.10.1.min.js"></script>
<script src="${PATH}r/plugins/jquery-migrate-1.2.1.min.js"></script>
<script src="${PATH}r/plugins/jquery-ui/jquery-ui-1.10.1.custom.min.js"></script>
<script src="${PATH}r/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${PATH}r/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" ></script>
<!-- fixed ie9以下的canvas和响应式布局功能 -->
<!--[if lt IE 9]>
<script src="${PATH}r/plugins/excanvas.min.js"></script>
<script src="${PATH}r/plugins/respond.min.js"></script>
<![endif]-->
<script src="${PATH}r/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${PATH}r/plugins/jquery.blockui.min.js"></script>
<script src="${PATH}r/plugins/jquery.cookie.min.js"></script>
<script src="${PATH}r/plugins/uniform/jquery.uniform.min.js" ></script>
<script src="${PATH}r/plugins/artTemplate-2.0.2/template.min.js"></script>
<script src="${PATH}r/plugins/artDialog-5.0.4/jquery.artDialog.min.js"></script>
<script src="${PATH}r/plugins/data-tables/jquery.dataTables.min.js"></script>
<script src="${PATH}r/plugins/data-tables/DT_bootstrap.js"></script>
<script src="${PATH}r/plugins/select2/select2.min.js"></script>
<script src="${PATH}r/plugins/laydate-1.0/laydate.js"></script>
<script src="${PATH}r/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="${PATH}r/plugins/jquery-validation/dist/additional-methods.min.js"></script>

<!-- 前端框架组件 -->
<script src="${PATH}r/js/app.js"></script>
<!-- 公共组件方法 -->
<script src="${PATH}r/js/common.js"></script>

<script>
  var PATH = '${PATH}';
  $(document).ready(function() {
    //初始化前端框架交互
    App.init();
  });
</script>