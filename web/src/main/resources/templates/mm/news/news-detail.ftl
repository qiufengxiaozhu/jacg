<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="/mm/css/index.css">
    <link rel="stylesheet" href="/mm/css/main.css">
    <title>Document</title>
</head>
<body>
<div class="content-box container-app">
    <div class="top flex flex-c-c">
        <div class="top-return"></div>
        <div class="return" onclick="golist()">返回</div>
        <div class="advince">新闻详情</div>
    </div>
    <div class="inv-bottom">
        <div class="flex inv-cont">
            <div class="">标题:</div>
            <div class="inv-right">文章标题文章标题</div>
        </div>
        <div class="flex inv-cont">
            <div class="">发布时间:</div>
            <div class="inv-right">2019-12-1</div>
        </div>
        <div class="inv-cont inv-special">
            <div class="">内容描述:</div>
            <div class="inv-right inv-right-special">测试用的，萨克斯两三点地方的范德萨范德萨是的撒趁现在撒倒萨发送到发送到</div>
        </div>


    </div>
</div>
<script>
    function golist() {
        if('${type!""}'=='1'){
            window.location.href='/mm/news/mmNews';
        }else{
            window.location.href='/mm/news/index';
        }

    }
</script>
</body>
</html>