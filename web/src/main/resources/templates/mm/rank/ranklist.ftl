<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="/mm/css/index.css">
    <title>排行榜</title>
</head>
<body>
<div class="content-box container-app" style="background: #F5F5F5">
    <div class="top flex flex-c-c">
        <div class="top-return"></div>
        <div class="return" onclick="goIndex()">首页</div>
        <div class="advince">排行榜</div>
    </div>
    <div class="center-top flex">
        <#if rankEntity?exists && rankEntity??>
            <div class="flex-2 rank-head">
                <div class="rankimg">
                    <img src="/mm/img/head.png" alt="">
                </div>
                <div class="xxx">${rankEntity.name!}</div>
                积分:${rankEntity.points!}
            </div>
            <div class="flex-1">
                <div class="rank">排名:${rankEntity.rank!}</div>
            </div>
        </#if>
    </div>
    <div class="bottom">
        <div class="flex">
            <div class="flex-1">
                <div class="name sum">姓名</div>
            </div>
            <div class="flex-1">
                <div class="integral sum">积分</div>
            </div>
        </div>
        <#if mmRankEntityList?exists && mmRankEntityList??>
            <#list 0..(mmRankEntityList!?size-1) as i>
                <#switch i>
                    <#case 0>
                        <div class="flex">
                            <div class="ranking flex first-num">
                                <div class="flex-1">
                                    <div class="ra-img">
                                        <img src="/mm/img/arr1847.png" alt="">
                                    </div>
                                    <div class="ra-font">${mmRankEntityList[i].name!}</div>
                                </div>
                                <div class="flex-1">
                                    <div class="last-ra-num">${mmRankEntityList[i].points!}</div>
                                </div>
                            </div>
                        </div>
                        <#break>
                    <#case 1>
                        <div class="flex">
                            <div class="ranking flex second-num">
                                <div class="flex-1">
                                    <div class="ra-img">
                                        <img src="/mm/img/arr1843.png" alt="">
                                    </div>
                                    <div class="ra-font">${mmRankEntityList[i].name!}</div>
                                </div>
                                <div class="flex-1">
                                    <div class="last-ra-num">${mmRankEntityList[i].points!}</div>
                                </div>
                            </div>
                        </div>
                        <#break>
                    <#case 2>
                        <div class="flex">
                            <div class="ranking flex three-num">
                                <div class="flex-1">
                                    <div class="ra-img">
                                        <img src="/mm/img/arr1845.png" alt="">
                                    </div>
                                    <div class="ra-font">${mmRankEntityList[i].name!}</div>
                                </div>
                                <div class="flex-1">
                                    <div class="last-ra-num">${mmRankEntityList[i].points!}</div>
                                </div>
                            </div>
                        </div>
                        <#break>
                    <#default>
                        <div class="last-ran flex last-num">
                            <div class="flex-1">
                                <div class="last-ra-img">${mmRankEntityList[i].rank!}</div>
                                <div class="last-ra-font">${mmRankEntityList[i].name!}</div>
                            </div>
                            <div class="flex-1">
                                <div class="last-ra-num">${mmRankEntityList[i].points!}</div>
                            </div>
                        </div>
                </#switch>
            </#list>
        </#if>
    </div>
</div>
<script>
    function goIndex() {
        window.location.href = '/mm/news/index';
    }
</script>
</body>
</html>