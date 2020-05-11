<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>市民评论</title>
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
        <div class="advince">市民评论</div>
    </div>
    <div class="center">
        <#list Comment as comment>
        <div class="flex sum-work"
             <#if comment.replyContent?? && comment.replyContent !="">
                onclick="goDetail('${comment.id}')"
             <#else >
                onclick="goDetail():return false"
            </#if> >
            <div class="flex-2">
                <#--<p class="date-year">${comment.replyDate!}</p>-->
                <p class="date-year">${comment.yearAndMonth!}</p>
                <p class="date-day">${comment.day!}</p>
            </div>
            <div class="flex-6">
                <div>
                    <p class="violation">${comment.title!}</p>
                    <p class="well-peopel">${comment.description!}</p>
                </div>
            </div>
            <div class="flex-1 flex flex-c-c flex-r-c flex-fx-c">
                <#if comment.replyStatus = '1'>
                    <span class="my-hf green">已回复</span>
                    <img class="right-ceil" src="/mm/img/right.png" style="margin:0.3rem 0">
                <#else >
                    <span class="my-hf">未回复</span>
                </#if>
            </div>
        </div>
        </#list>
    </div>
</div>
        <form id="detail_form" action="/mm/comment/getDetail" method="post">
            <input type="hidden" name="id" id="id"/>
        </form>
<script>
    function goIndex(){
        window.location.href='/mm/wxindex/index';
    }
    function goDetail(id){

//        alert(id);
        $("#id").val(id);
//        alert($("#id").val());
        $("#detail_form").submit();
    }

</script>
</body>
</html>