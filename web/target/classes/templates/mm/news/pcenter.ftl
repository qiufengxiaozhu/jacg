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
            <div class="ab-img ab-float1">
                <#if mobile_user.avatar??>
                    <img src="${mobile_user.avatar!''}" alt="">
                <#else>
                    <img src="/mm/img/head.png" alt="">
                </#if>

            </div>
            <div class="ab-float1">
                <div class="ab-one">${mobile_user.name!""}</div>
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
        <div class="ab-pas">
            <div class="abs-float1" onclick="goExit()">&nbsp;退出</div>
            <div class="abs-float2 flex">
                <div class="abs-changecolor"></div>
            </div>
        </div>
    </div>
</div>
<script>
    function goRank(){
        window.location.href='/mm/news/ranking';
    }
    function goExit(){
        $.ajax({
            type: "GET",
            url: "/mm/news/goout",
            data: {},
            success: function(){
                window.location.href='/mm/news/index';

        }});
    }
</script>
</body>
</html>