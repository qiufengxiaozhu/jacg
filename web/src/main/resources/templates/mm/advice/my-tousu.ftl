<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">

    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="/mm/css/index.css">
</head>
<body>
<div class="content-box container-app " style="background: #F6F6F6">
    <div class="top flex flex-c-c">
        <div class="top-return"></div>
        <div class="return" onclick="goIndex()">返回</div>
        <div class="advince">我的投诉</div>
    </div>
    <div class="center">
        <div class="flex sum-work" onclick="goDetail()">
            <div class="flex-2">
                <p class="date-year">2019-10</p>
                <p class="date-day">05</p>
            </div>
            <div class="flex-6">
                <div>
                    <p class="violation">违规高空悬吊作业</p>
                    <p class="well-peopel">为了保持良好的用电秩序，使广大用户能更好的用电 .....</p>
                </div>
            </div>
            <div class="flex-1 flex flex-c-c flex-r-c flex-fx-c">
                <span class="my-hf green">已回复</span>
                <img class="right-ceil" src="/mm/img/right.png" style="margin:0.3rem 0">
            </div>
        </div>
        <div class="flex sum-work">
            <div class="flex-2">
                <p class="date-year">2019-10</p>
                <p class="date-day">04</p>
            </div>
            <div class="flex-6">
                <div>
                    <p class="violation">违规高空悬吊作业</p>
                    <p class="well-peopel">为了保持良好的用电秩序，使广大用户能更好的用电 .....</p>
                </div>
            </div>
            <div class="flex-1 flex flex-c-c flex-r-c flex-fx-c">
                <span class="my-hf">未回复</span>
                <img class="right-ceil" src="/mm/img/right.png" style="margin:0.3rem 0"></div>
        </div>
    </div>
</div>
<script>
    function goIndex(){
        window.location.href='/mm/news/index';
    }
    function goDetail(){
        window.location.href='/mm/news/tsdetail';
    }
</script>
</body>
</html>