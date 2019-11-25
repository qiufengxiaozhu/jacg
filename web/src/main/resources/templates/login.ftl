<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link href="/css/login.css" rel="stylesheet"/>
    <link href="/css/third/bootstrap.min.css?v=3.3.6" rel="stylesheet"/>
    <link href="/css/style.css" rel="stylesheet"/>
    <link href="/css/third/sweetalert.css" rel="stylesheet"/>
    <script>if (window.top !== window.self) { window.top.location = window.location;}</script>
    <style>
        .login-form .input-group{width:100%}
        .login-form .input-group .input-group-addon{width:127px;text-align: right}
        label.error{position: absolute;height: 34px;width: 200px;line-height: 34px;left: 105%;text-align: left;}
        .login_captcha{width:150px}
        .ly-logo{position: relative;height: 115px;}
        .lylogo{   position: absolute;bottom: 5px;left: 10px}
        .ly-footer{text-align: left;width: 33%;margin: 5px auto}
        .ly-ewm{float: left;width: 100px}
        .ly-ewm img{width: 100%}
        .ly-addr{line-height: 25px;margin-left: 110px;}
        .sc-option{position: absolute;right: 5px;    bottom: -3px;color:#AAAAAA;line-height: 35px}
        .sc-option img{width: 35px;position: relative;margin-right: -5px}
        .sc-option span{    vertical-align: -2px;}

    </style>
</head>
<body>
<div class="ly-logo">
    <img src="img/ly-logo.png" alt="" class="lylogo">
    <a href="#" class="sc-option"><img src="img/dwn.png" alt="" class=""><span>操作手册</span></a>
</div>
<div class="content-login">

    <div class="login-box">
        <div class="login-tit">用户登录</div>
        <form class="m-t" role="form" action="/login" method="post">
            <div class="l-group clearfix">
                <div class="i-icon user-icon"></div>
                <input type="text" class="login-input" name="loginName" id="loginName" placeholder="用户名">
            </div>
            <div class="l-group clearfix">
                <div class="i-icon psw-icon"></div>
                <input class="login-input" type="password" name="password" placeholder="密码">
            </div>
            <div id="login-msg"></div>
            <button class="login-btn" id="login" type="submit">登录</button>
            <div class="reg-box clearfix">
            </div>
        </form>
    </div>

</div>
<div class="ly-footer">
    <div class="ly-ewm">
        <img src="img/ewm.png" alt="" class="">
    </div>
    <div class="ly-addr">
        <p>版权所有：中兴软件技术（南昌）有限公司</p>
        <p>技术支持：中兴软件技术（南昌）有限公司</p>
    </div>
</div>
</body>
<script src="/js/third/jquery.min.js"></script>
<script src="/js/third/jquery.validate.min.js"></script>
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/sys/login.js"></script>
<script src="/js/zudp.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        <#if enabledCaptcha??>
            /*$("#captcha").click(function () {
                var img = $("#captcha");
                var imageSrc = img.attr("src");
                if (imageSrc.indexOf("?") > 0) {
                    imageSrc = imageSrc.substr(0, imageSrc.indexOf("?"));
                }
                imageSrc = imageSrc + "?" + new Date().getTime();
                img.attr("src", imageSrc);
            });*/
        </#if>
    });
</script>
</html>
