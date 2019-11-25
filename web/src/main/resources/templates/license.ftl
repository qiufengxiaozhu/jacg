<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>授权证书上传</title>
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link href="/css/login.css" rel="stylesheet"/>
    <link href="/css/third/bootstrap.min.css?v=3.3.6" rel="stylesheet"/>
    <link href="/css/style.css" rel="stylesheet"/>
    <link href="/css/third/sweetalert.css" rel="stylesheet"/>
    <script>if (window.top !== window.self) { window.top.location = window.location;}</script>
    <style>
        .login-form .input-group{width:100%}
        .login-form .input-group .input-group-addon{width:127px;text-align: right}
        label.error{
            position: absolute;
            height: 34px;
            width: 200px;
            line-height: 34px;
            left: 105%;
            text-align: left;
        }
    </style>
</head>
<body>
<form action="/license/licenseauth" method="post" enctype="multipart/form-data">
    证书：<input type="file" name="file"/><br/>
    <#--公钥：<input type="file" name="file"/><br/>-->
    <input type="submit" value="上传">
</form>
</body>
</html
