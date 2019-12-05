<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">

    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="/mm/css/index.css">

    <script src="/js/zudp.js"></script>
    <style>
        #msg-show{float: left;color: red}
    </style>
</head>
<body>
<div class="container-app">
    <div class="ja-login">
        <div class="ja-login-top flex flex-r-c">
            <img src="img/ja-logo.png" alt="" class="ja-logo">
        </div>
        <div class="login-box">
            <div class="login-group flex flex-c-c">
                <div class="lg-user"></div>
                <input type="text" id="username" class="login-input flex-1" placeholder="请输入手机号/邮箱">
            </div>
            <div class="login-group flex flex-c-c">
                <div class="lg-pwd"></div>
                <input type="password" id="passwd" class="login-input flex-1" placeholder="请输入密码">
            </div>
            <div class="forget-pwd">
                <span id="msg-show"></span>
                <a href="#">忘记密码</a>
            </div>
            <div class="btn login-btn" onclick="login()">立即登录</div>
            <div class="regist-user">
                <span>还没有账号?</span>
                <a href="#">马上注册</a>
            </div>
        </div>
    </div>
</div>
<script>

    function login(){
        var name=$("#username").val();
        var pwd = $("#passwd").val();
        var data={loginName:name,password:pwd};
        data = JSON.stringify(data);
        $("#msg-show").html("正在登陆中...");
        zudp.ajax("/mm/news/login").post(data).then(function (da) {

            if(da=='ok'){
                $("#msg-show").html("登录成功");
                window.location.href='${laterurl!""}';
            }else if(da=='noperson'){
                $("#msg-show").html("用户不存在");
            }else if(da=='noactive'){
                $("#msg-show").html("用户名未激活");
            }else if(da=='nomatch'){
                $("#msg-show").html("用户名或密码错误");
            }
        });
    }
</script>
</body>
</html>