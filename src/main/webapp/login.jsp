<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="common/env.jsp" %>

<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8"> <![endif]-->
<!--[if IE 9]> <html class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html> <!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <title>${title}</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="${PATH}r/img/ico.ico" />

    <link href="${PATH}r/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${PATH}r/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="${PATH}r/css/login.css" rel="stylesheet" />
</head>
<body>
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>XX系统</strong></h1>
                    <!--
                    <div class="description">
                        <p>说明</p>
                    </div>
                    -->
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>登录系统</h3>
                            <p>请输入用户名和密码进行登录</p>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-key"></i>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form role="form" action="" method="post" class="login-form">
                            <div class="form-group">
                                <label class="sr-only" for="form-username">用户名</label>
                                <input type="text" name="form-username" placeholder="请输入用户名..." class="form-username form-control" id="form-username">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="form-password">密码</label>
                                <input type="password" name="form-password" placeholder="请输入密码..." class="form-password form-control" id="form-password">
                            </div>
                            <button type="submit" class="btn">登 录</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${PATH}r/plugins/jquery-1.10.1.min.js"></script>
<script src="${PATH}r/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${PATH}r/plugins/jquery.backstretch.min.js"></script>
<script>
    $(document).ready(function() {
        $.backstretch("${PATH}r/img/login_bg.jpg");
        $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
            $(this).removeClass('input-error');
        });
        $('.login-form').on('submit', function(e) {
            $(this).find('input[type="text"], input[type="password"], textarea').each(function(){
                if( $(this).val() == "" ) {
                    e.preventDefault();
                    $(this).addClass('input-error');
                }
                else {
                    $(this).removeClass('input-error');
                }
            });
        });
    });
</script>
</body>
</html>