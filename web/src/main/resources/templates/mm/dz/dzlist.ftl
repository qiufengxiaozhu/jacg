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
<div class="content-box container-app" style="background: #F6F6F6">
    <div class="top flex flex-c-c">
        <div class="top-return"></div>
        <div class="return" onclick="goIndex()">返回</div>
        <div class="advince">点赞列表</div>
        <div class="li-add"><img src="/mm/img/add.png" alt=""></div>
    </div>
    <div class="li-input">
        <input type="text" placeholder="输入相关词汇搜索" class="li-put">
        <img src="/mm/img/find.png">
    </div>
    <div class="fb-time">
        <select name="" id="" style="background: none">
            <option value="">点赞时间段</option>
        </select>
    </div>
    <div class="flex sum-work" >
        <div class="flex-2">
            <p class="date-year">2019-10</p>
            <p class="date-day">05</p>
        </div>
        <div class="flex-6" onclick="goDetail()">
            <div class="">
                <p class="violation">谁谁谁很赞，厉害了。。。 </p>
                <p class="well-peopel">测试测试测试测试.....</p>
                <div class="add-pic flex">
                    <div class="flex flex-1 flex-c-c"><img src="/mm/img/good.png"><div class="li-num1">43200人</div></div>
                    <div class="flex flex-c-c"><img src="/mm/img/watch.png" style="height: 0.2rem"><div class="li-num2">14300人</div></div>
                </div>
            </div>
        </div>
        <div class="de-pos flex flex-c-c">
            <img src="/mm/img/revise.png" alt="" class="right-del">
            <img class="right-del" src="/mm/img/delete.png" alt="">
        </div>
        <div class="flex-1">
            <img class="right-ceil" src="/mm/img/right.png">
        </div>
    </div>
</div>
<script>
    function goIndex(){
        window.location.href='/mm/news/index';
    }
    function goDetail(){
        window.location.href='/mm/dz/dzdetail';
    }
</script>
</body>
</html>