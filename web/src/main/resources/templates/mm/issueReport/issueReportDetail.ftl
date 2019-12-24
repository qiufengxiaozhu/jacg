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
        <div class="return" onclick="golist()">返回</div>
        <div class="advince">上报详情</div>
    </div>
    <div class="inv-bottom" style="position: relative;height: calc(100vh - 1.5rem);">
        <div class="flex inv-cont">
            <div class="">标题:</div>
            <div class="inv-right"  id="title">${mmIssueReport.title!}</div>
        </div>

        <div class="inv-cont inv-special">
            <div class="">内容描述:</div>
            <div class="inv-right inv-right-special" id="content">${mmIssueReport.description!}</div>
        </div>

        <div class="flex inv-cont">
            <div class="">上报时间:</div>
            <div class="inv-right"  id="consultDate">${mmIssueReport.complainDate!}</div>
        </div>

        <div class="flex inv-cont">
            <div class="">联系人:</div>
            <div class="inv-right"  id="title">${mmIssueReport.contact!}</div>
        </div>

        <div class="flex inv-cont">
            <div class="">联系电话:</div>
            <div class="inv-right"  id="telephone">${mmIssueReport.phone!}</div>
        </div>


        <div class="inv-cont inv-pic">
            <div class="">相关附件:</div>
            <div class="inv-right">
                <#--<img src="/mm/img/arr15.png" alt="">-->
                <#--<img src="/mm/img/arr12.png" class="inv-pic2" alt="">-->
                <#if mmIssueReport.attachPaths?exists && mmIssueReport.attachPaths?? &&((mmIssueReport.attachPaths!?size)>0)>
                    <#list 0..(mmIssueReport.attachPaths!?size-1) as i>
                    <#if mmIssueReport.attachPaths[i]?substring(mmIssueReport.attachPaths[i]?last_index_of("."))==".bmp" ||
                    mmIssueReport.attachPaths[i]?substring(mmIssueReport.attachPaths[i]?last_index_of("."))==".png" ||
                    mmIssueReport.attachPaths[i]?substring(mmIssueReport.attachPaths[i]?last_index_of("."))==".jpg" ||
                    mmIssueReport.attachPaths[i]?substring(mmIssueReport.attachPaths[i]?last_index_of("."))==".gif" ||
                    mmIssueReport.attachPaths[i]?substring(mmIssueReport.attachPaths[i]?last_index_of("."))==".jpeg"
                    >
                        <img src='${mmIssueReport.attachPaths[i]!}' class="inv-pic2" title="${mmIssueReport.attachNames[i]!}">
                    <#elseif mmIssueReport.attachPaths[i]?substring(mmIssueReport.attachPaths[i]?last_index_of("."))==".mp3">
                        <audio controls>
                            <source src='${mmIssueReport.attachPaths[i]!}' type="audio/mpeg">
                            您的浏览器不支持 audio 元素。
                        </audio>
                    <#else >
                        <video  width="150" height="100" controls="controls" >
                            <source  src="${mmIssueReport.attachPaths[i]!}" type="video/mp4" />
                        </video>
                    </#if>

                    </#list>
                </#if>
            </div>
        </div>

        <br><br>
        <div class="inv-cont inv-special">
            <div class="">上报回复:</div>
            <div class="inv-right inv-right-special" id="content">${mmIssueReport.replyContent!}</div>
        </div>

        <div class="flex inv-cont">
            <div class="">回复人:</div>
            <div class="inv-right"  id="replyDate">${mmIssueReport.replyUserId!}</div>
        </div>

        <div class="flex inv-cont">
            <div class="">回复单位:</div>
            <div class="inv-right"  id="replyDate">吉安城管</div>
        </div>

        <div class="flex inv-cont">
            <div class="">回复时间:</div>
            <div class="inv-right"  id="replyDate">${mmIssueReport.replyDate!}</div>
        </div>

    </div>
</div>
<script>
    function golist() {
        window.location.href='/mm/issueReport/toMyReportList';
    }
</script>
</body>
</html>