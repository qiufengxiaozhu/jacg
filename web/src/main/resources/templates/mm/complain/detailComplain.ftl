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
                <div class="inv-right">${entity.title!}</div>
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
            <div class="flex inv-cont">
                <div class="">联系人:</div>
                <div class="inv-right">${entity.contact!}</div>
            </div>
            <div class="flex inv-cont">
                <div class="">联系电话:</div>
                <div class="inv-right">${entity.phone!}</div>
            </div>
            <div class="flex inv-cont">
                <div class="">回复时间:</div>
                <div class="inv-right">${entity.replyDate!}</div>
            </div>
            <div class="inv-cont inv-special">
                <div class="">内容描述:</div>
                <div class="inv-right inv-right-special">${entity.description!}</div>
            </div>
            <div class="inv-cont inv-pic">
                <div class="">相关附件:</div>
                <div class="inv-right">
                    <#if entity.attachPaths?exists && entity.attachPaths??>
                        <#list 0..(entity.attachPaths!?size-1) as i>
                            <#if entity.attachPaths[i]?substring(entity.attachPaths[i]?last_index_of("."))==".bmp" ||
                            entity.attachPaths[i]?substring(entity.attachPaths[i]?last_index_of("."))==".png" ||
                            entity.attachPaths[i]?substring(entity.attachPaths[i]?last_index_of("."))==".jpg" ||
                            entity.attachPaths[i]?substring(entity.attachPaths[i]?last_index_of("."))==".gif" ||
                            entity.attachPaths[i]?substring(entity.attachPaths[i]?last_index_of("."))==".jpeg"
                            >
                                <img src='${entity.attachPaths[i]!}' class="inv-pic2" title="${entity.attachNames[i]!}">
                            <#elseif entity.attachPaths[i]?substring(entity.attachPaths[i]?last_index_of("."))==".mp3">
                                <audio controls>
                                    <source src='${entity.attachPaths[i]!}' type="audio/mpeg">
                                    您的浏览器不支持 audio 元素。
                                </audio>
                            <#else >
                                <video  width="150" height="100" controls="controls" >
                                    <source  src="${entity.attachPaths[i]!}" type="video/mp4" />
                                </video>
                            </#if>
                        </#list>
                    </#if>
                </div>
            </div>
            <div class="inv-cont inv-special">
                <div class="">回复内容:</div>
                <div class="inv-right inv-right-special">${entity.replyContent!}</div>
            </div>
        </#if>
    </div>
</div>
<form id="ret_my_complain_form" action="" method="post">
    <!--<input type="hidden" name="_method" value="DELETE"/>-->
    <input type="hidden" name="contactUser" id="contactUser" value='${contactUser!}'>
</form>
<script>
    function goMyComplain() {
        $("#ret_my_complain_form").attr("action", "/mm/complain/retMyComplain").submit();
    }
</script>
</body>
</html>