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
<div class="content-box container-app sum-background">
    <div class="top">
        <div class="advince">个人中心</div>
    </div>
    <div class="self">
    </div>
    <div class="ab-self ab-float">
        <div class="ab-center ab-float1">
            <div class="ab-img ab-float1"><img src="/mm/img/head.png" alt=""></div>
            <div class="ab-float1">
                <div class="ab-one">某某某</div>
                <div class="ab-num" onclick="goRank()"><span class="ab-font">1430</span>&nbsp;&nbsp;积分</div>
            </div>
            <div class="ab-float1 ranks" onclick="goRank()"><span class="ab-font">240</span>&nbsp;&nbsp;名</div>
        </div>

    </div>
    <div class="ab-bottom">
        <div class="ab-pas">
            <div class="abs-float1">&nbsp;密码修改</div>
            <div class="abs-float2 flex">
                <div class="abs-user abs-changecolor2">********</div>
                <div class="abs-pic"><img src="/mm/img/right.png" alt=""></div>
            </div>
        </div>
        <div class="ab-pas">
            <div class="abs-float1">&nbsp;在线客服</div>
            <div class="abs-float2 flex">
                <div class="abs-pic"><img src="/mm/img/right.png" alt=""></div>
            </div>
        </div>
        <div class="ab-pas">
            <div class="abs-float1">&nbsp;关于</div>
            <div class="abs-float2 flex">
                <div class="abs-pic"><img src="/mm/img/right.png" alt=""></div>
            </div>
        </div>
        <div class="ab-pas">
            <div class="abs-float1">&nbsp;版本更新</div>
            <div class="abs-float2 flex">
                <div class="abs-changecolor">1.61.3</div>
            </div>
        </div>
    </div>
</div>
<script>
    function goRank(){
        window.location.href='/mm/news/ranking';
    }
</script>
</body>
</html>