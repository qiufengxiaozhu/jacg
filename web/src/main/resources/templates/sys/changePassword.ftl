<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改密码!</title>
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link href="/css/third/bootstrap.min.css" rel="stylesheet">
    <link href="/css/third/font-awesome.min.css" rel="stylesheet">
    <link href="/css/third/custom.css" rel="stylesheet">
    <link href="/css/third/animate.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
    <link href="/css/third/sweetalert.css" rel="stylesheet">
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>
<body class="gray-bg">
<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">ZUDP</h1>
        </div>
        <h3>修改密码</h3>
        <input type="hidden" id="id" value="${id}" name="id">
        <input type="hidden" id="code" value="${code}" name="code">
        <input type="password" class="form-control" placeholder="请输入新密码" id="password" name="password">
        <br/>
        <input type="password" class="form-control" placeholder="请重复输入新密码" id="password1" name="password1">
        </br>
        <button id="submitBtn" class="btn btn-primary block full-width m-b">修改密码</button>
        <p class="text-muted text-center"><small>已经有账户了？</small><a href="/login">点此登录</a>
        </p>
    </div>
</div>
<script src="/js/third/jquery.min.js"></script>
<script src="/js/third/bootstrap.min.js"></script>
<script src="/js/third/icheck.min.js"></script>
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/zudp.js"></script>
<script>
    $(document).ready(function(){
        $('#submit-btn').click(function () {
            var password=$("#password").val();
            var password1=$("#password1").val();
            if (password == password1) {
                var data = {
                    "id": $("#id").val(),
                    "code": $("#code").val(),
                    "password": password
                };
                zudp.ajax("/api/user/changePassword").get(data).then(function (da, data) {
                    if (zudp.util.isBoolean(da)) {
                        if (da) {
                            swalFunction(data.msg, function () {
                                window.location.href = "/login";
                            }, "跳转登陆");
                        } else {
                            zudp.plugin.dialog('info')
                                .confirm('邮件超时,准备跳转邮件发送页面重新发送邮件', '确定', function () {});
                        }
                    } else {
                        zudp.plugin.dialog('error').confirm('邮件发送失败,服务器错误', '确定', function () {});
                    }
                }, function (error) {
                    zudp.plugin.dialog('error').confirm('邮件发送失败,服务器错误', '确定', function () {});
                });
            } else {
                zudp.plugin.dialog('info').confirm('两次密码不统一', '确定', function () {});
            }
        });
    });

    function swalFunction(a,b,c) {
        swal({
                 title: a,
                 showCancelButton: true,
                 cancelButtonText: "取消",
                 confirmButtonColor: "#DD6B55",
                 confirmButtonText: c,
             },b);
    }
</script>
</body>
</html>
