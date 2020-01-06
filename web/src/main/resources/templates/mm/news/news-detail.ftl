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
    <title>新闻详情</title>
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
            <div class="inv-right">${News.title!}</div>
        </div>
        <div class="flex inv-cont">
            <div class="">发布时间:</div>
            <div class="inv-right">${News.newsDate!}</div>
        </div>
        <div class="inv-cont inv-special">
            <div class="">内容描述:</div>
            <div class="inv-right inv-right-special">${News.content!}</div>
        </div>



    </div>
</div>
<script>
    function golist() {
        if('${type!""}'=='1'){
            window.location.href="javascript:history.go(-1)";
        }else{
            window.location.href='/mm/news/index';
        }

    }
</script>
</body>
</html>