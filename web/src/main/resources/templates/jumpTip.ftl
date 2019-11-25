<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>提示</title>
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link href="/css/third/bootstrap.min.css" rel="stylesheet">
    <link href="/css/third/font-awesome.min.css" rel="stylesheet">
    <link href="/css/third/animate.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="middle-box text-center animated fadeInDown">
    <h2>${msg}</h2>
    <h3 class="font-bold">${msgDesc}</h3>
    <div class="error-desc">
        <br/><a href="${url}" class="btn btn-primary m-t">${urlName}</a>
    </div>
</div>
<script src="/js/third/jquery.min.js"></script>
<script src="/js/third/bootstrap.min.js"></script>
</body>
<script>
    $(function () {
        if(${isJump?c}) {
            window.setTimeout(function(){
                window.location.href = "${url}"
            }, 3000)
        }

    })
</script>
</html>