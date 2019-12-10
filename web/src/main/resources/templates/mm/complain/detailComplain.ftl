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
        <div class="return" onclick="goMyComplain()">返回</div>
        <div class="advince">投诉详情</div>
    </div>
    <div class="inv-bottom" style="position: relative">
        <#if entity?exists && entity??>
            <div class="flex inv-cont">
                <div class="">标题:</div>
                <div class="inv-right">${entity.title}</div>
            </div>
            <div class="flex inv-cont">
                <div class="">类型:</div>
                <div class="inv-right">
                    <#if entity.type == "0">
                        投诉
                    <#else>
                        建议
                    </#if>
                </div>
            </div>
            <div class="inv-cont inv-special">
                <div class="">内容描述:</div>
                <div class="inv-right inv-right-special">${entity.description}</div>
            </div>
            <div class="inv-cont inv-pic">
                <div class="">相关附件:</div>
                <div class="inv-right">
                    <img src="/mm/img/arr15.png" alt="">
                    <img src="/mm/img/arr12.png" class="inv-pic2" alt="">
                </div>
            </div>
            <div class="inv-cont inv-special">
                <div class="">投诉回复:</div>
                <div class="inv-right inv-right-special">${entity.replyContent}</div>
            </div>
        </#if>
    </div>
</div>
<form id="ret_my_complain_form" action="" method="post">
    <!--<input type="hidden" name="_method" value="DELETE"/>-->
    <input type="hidden" name="contactUser" id="contactUser" value='${contactUser}'>
</form>
<script>
    function goMyComplain() {
        $("#ret_my_complain_form").attr("action", "/mm/news/retMyComplain").submit();
    }
</script>
</body>
</html>