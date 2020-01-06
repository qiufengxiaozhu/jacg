<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="/mm/css/index.css">
    <title>上报详情</title>
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
            <input type="hidden" id="reportId" value="${Report.id!""}">
            <div class="inv-right"  id="title">${Report.title!}</div>
        </div>

        <div class="inv-cont inv-special">
            <div class="">内容描述:</div>
            <div class="inv-right inv-right-special" id="content">${Report.description!}</div>
        </div>

        <div class="flex inv-cont">
            <div class="">上报时间:</div>
            <div class="inv-right"  id="consultDate">${Report.complainDate!}</div>
        </div>

        <div class="flex inv-cont">
            <div class="">联系人:</div>
            <div class="inv-right"  id="title">${Report.contact!}</div>
        </div>

        <div class="flex inv-cont">
            <div class="">联系电话:</div>
            <div class="inv-right"  id="telephone">${Report.phone!}</div>
        </div>


        <div class="inv-cont inv-pic">
            <div class="">相关附件:</div>
            <div class="inv-right">
                <#--<img src="/mm/img/arr15.png" alt="">-->
                <#--<img src="/mm/img/arr12.png" class="inv-pic2" alt="">-->
                <#if Report.attachPaths?exists && Report.attachPaths?? &&((Report.attachPaths!?size)>0)>
                    <#list 0..(Report.attachPaths!?size-1) as i>
                        <#if Report.attachPaths[i]?substring(Report.attachPaths[i]?last_index_of("."))==".bmp" ||
                            Report.attachPaths[i]?substring(Report.attachPaths[i]?last_index_of("."))==".png" ||
                            Report.attachPaths[i]?substring(Report.attachPaths[i]?last_index_of("."))==".jpg" ||
                            Report.attachPaths[i]?substring(Report.attachPaths[i]?last_index_of("."))==".gif" ||
                            Report.attachPaths[i]?substring(Report.attachPaths[i]?last_index_of("."))==".jpeg"
                        >
                            <img src='${Report.attachPaths[i]!}' class="inv-pic2" title="${Report.attachNames[i]!}">
                        <#elseif Report.attachPaths[i]?substring(Report.attachPaths[i]?last_index_of("."))==".mp3">
                            <audio controls>
                                <source src='${Report.attachPaths[i]!}' type="audio/mpeg">
                                您的浏览器不支持 audio 元素。
                            </audio>
                        <#else >
                            <video  width="150" height="100" controls="controls" >
                                <source  src="${Report.attachPaths[i]!}" type="video/mp4" />
                            </video>
                        </#if>

                    </#list>
                </#if>
            </div>
        </div>

        <br><br>
        <div class="inv-cont inv-special">
            <div class="">上报回复:</div>
            <div class="inv-right inv-right-special" id="content">${Report.replyContent!""}</div>
        </div>

        <div class="flex inv-cont">
            <div class="">回复人:</div>
            <div class="inv-right"  id="replyDate">${Report.replyUserId!""}</div>
        </div>

        <div class="flex inv-cont">
            <div class="">回复单位:</div>
            <div class="inv-right"  id="replyDate">吉安城管</div>
        </div>

        <div class="flex inv-cont">
            <div class="">回复时间:</div>
            <div class="inv-right"  id="replyDate">${Report.replyDate!""}</div>
        </div>

        <div class="de-lists">
            <div class="de-list">
                <div class="de-line de-float"></div>
                    <div class="de-listleft de-float">评论</div>
                    <div class="de-listright de-float1">立即评论</div>
            </div>
        </div>

        <#--//评论列表-->
        <div class="de-bottom" id="comment">
            <#list CommentList as comment>
                <div class="de-getlists flex">
                    <div class="de-stat"><img src="/mm/img/star.jpg" alt=""></div>
                    <div class="de-sum">
                        <div class="de-name">${comment.name!}</div>
                        <div class="de-cont">${comment.content!}</div>
                    </div>
                    <div class="de-time flex">
                        <div class="flex de-getcont">
                            <div class="de-pic">
                                <input type="hidden" id="commentId" value="${comment.id!''}">
                                <img src="/mm/img/good.png" alt="点赞" onclick="clicka(this)" >
                            </div>&nbsp;
                            <input type="hidden" value="${comment.clicks!''}" id="clicks">
                            <div class="de-num" id="clickNumber">${comment.clicks!}</div>
                        </div>
                        <div class="de-year">${comment.publicTime!}</div>
                        <#--<div class="de-month">8:00</div>-->
                    </div>
                </div>
            </#list>
        </div>

        <#--//市民评论框-->
        <div class="cover" style="dis">
            <div class="alert-center">
                <div class="slow">写下评论</div>
                <div class="input-area">
                    <textarea id="content-comment" cols="45" rows="5" class="text-area"  ></textarea>
                </div>
                <div class="judge flex">
                    <div class="agrement flex-1" onclick="commentSubmit()">确定</div>
                    <div class="cancel flex-1">取消</div>
                </div>
            </div>
        </div>

    </div>
</div>
<script>

    //返回到评论列表
    function golist() {
        window.location.href='/mm/comment/selectAll';
    }

    //评论框
    $(function(){
        $('.cover').hide();
        $(document).on('click','.de-listright',function(){
            $('.cover').show();
        })
        $('.cancel').click(function(){
            $('.cover').hide();
        })
    });

    //评论提交
    function commentSubmit() {
        $('.cover').hide();
        var contentValue= $("#content-comment").val();
        var reportId = $("#reportId").val();
//        alert(contentValue);
//        alert(reportId);
        $.ajax({
            url: "/mm/comment/addComment",
            type: "get",
            data: {
                "content":contentValue,
                "reportId":reportId
            },
            dataType: 'json',
            success: function (data) {
                window.location.reload();
//                dataTable.ajax.reload();
            }
        });
    }

    //增加点赞数
    function clicka(obj) {

        var commentId = $(obj).prev().val();    //此评论id

        var test = $(obj).parent().next().next().text();

        test = Number(test) + 1;

        $(obj).parent().next().next().text(test);   //点赞数

        $.ajax({
            url: "/mm/comment/addClicks",
            type: "get",
            data: {
                "commentId": commentId
            },
            dataType: 'json',
            success: function (data) {
                window.location.reload();
//                dataTable.ajax.reload();
            }
        });
    }
    //document.getElementById("clickNumber").innerHTML=parseInt(document.getElementById("clickNumber").innerHTML)+1;

//        dataTable.ajax.reload();




</script>
</body>
</html>