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
        <div class="advince">我的咨询</div>
    </div>
    <div class="center">
        <#list list as consult>
        <div class="flex sum-work" <#if consult.reply?? && consult.reply !="">onclick="goDetail('${consult.id}')"
             <#else >
             onclick="goDetail():return false"
        </#if> >
            <div class="flex-2">
                <p class="date-year">${consult.yearStr!}</p>
                <p class="date-day">${consult.dayStr!}</p>
            </div>
            <div class="flex-6">
                <div>
                    <p class="violation">${consult.title!}</p>
                    <p class="well-peopel">${consult.content!}</p>
                </div>
            </div>
            <div class="flex-1 flex flex-c-c flex-r-c flex-fx-c">
                    <#if consult.reply?? && consult.reply !="">
                        <span class="my-hf green">
                        已回复
                        </span>
                        <#else >
                        <span class="my-hf">未回复</span>
                    </#if>

                <img class="right-ceil" src="/mm/img/right.png" style="margin:0.3rem 0">
            </div>
        </div>
        </#list>
    </div>
</div>
<script>
    function goIndex(){
        window.location.href='/mm/news/index';
    }
    function goDetail(id){
        window.location.href='/consult/zxdetail/'+id;
    }

</script>
</body>
</html>