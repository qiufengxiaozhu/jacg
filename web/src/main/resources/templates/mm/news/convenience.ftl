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
<div class="container-app">
    <div class="top flex flex-c-c">
        <div class="top-return"></div>
        <div class="return" onclick="goIndex()">返回</div>
    </div>
    <!-- 头部背景 -->
    <div class="container-top flex flex-c-c flex-r-c">
        <div class="head-center">
            <p>便民服务</p>
            <img src="/mm/img/rx-img.png" class="head-img">
        </div>
    </div>
    <!-- 底部内容按键等 -->
    <div class="container-bottom">
        <div class="bottom-title flex flex-c-c">
            <span class="border-left"></span><h3>便民服务</h3>
        </div>

            <#list 0..(ListType!?size-1) as i>

                <#if i % 4 == 0>

                    <div class="bottom-content">
                        <ul class="list flex">

                            <#if i < ListType?size >
                                <li class="flex flex-c-c">
                                    <span class="space"></span>

                                    <a href="#">${ListType[i].label!}</a>
                                </li>
                            </#if>
                            <#if i+1 < ListType?size >
                                    <li class="flex flex-c-c">
                                        <span class="space"></span>
                                        <a href="#">${ListType[i+1].label!}</a>
                                    </li>
                            </#if>
                            <#if i+2 < ListType?size >
                                    <li class="flex flex-c-c">
                                        <span class="space"></span>
                                        <a href="#">${ListType[i+2].label!}</a>
                                    </li>
                            </#if>
                            <#if i+3 < ListType?size >
                                <li class="flex flex-c-c">
                                    <span class="space"></span>
                                    <a href="#">${ListType[i+3].label!}</a>
                                </li>
                            </#if>
                        </ul>
                    </div>

                </#if>
            </#list>

    </div>
</div>

</body>
<script>

    function goIndex() {

        window.location.href='/mm/news/index';
    }

</script>
</html>