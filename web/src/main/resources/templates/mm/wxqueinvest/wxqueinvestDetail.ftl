<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>公众调查</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">

    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="/mm/css/index.css">


    <script src="/js/third/jquery.min.js"></script>
    <script src="/js/pluginInit/animation.js"></script>
    <script src="/js/third/bootstrap.min.js"></script>
    <script src="/js/third/jquery.validate.min.js"></script>
    <script src="/js/third/jquery.dataTables.min.js"></script>
    <script src="/js/third/dataTables.bootstrap.js"></script>
    <script src="/js/third/layer/layer.min.js"></script>
    <script src="/js/third/icheck.min.js"></script>
    <script src="/js/third/sweetalert.min.js"></script>
    <script src="/js/third/toastr.min.js"></script>
    <script src="/js/third/laydate/laydate.js"></script>
    <script src="/js/pluginInit/dataecho.js"></script>
    <script src="/js/third/laydate/laydate.js"></script>
    <script src="/js/zudp.js"></script>
    <script type="text/javascript" src="/js/third/jquery.ztree.all.js"></script>
    <script src="/js/third/bootstrap-suggest.min.js"></script>
    <script src="/js/sys/avatar.js"></script>
    <script src="/js/third/webuploader.js"></script>
    <script src="/js/rest.js"></script>

    <style>
        .change-font{
            font-size: 0.45rem;
        }
        .te-btn{
            width: 90%;
            height: 1rem;
            margin: auto;
            margin-left: 5%;
            margin-bottom: 0.3rem;
            position: absolute;
            bottom: 0.3rem;
            background: #007EF3;
            color: #fff;
            font-size: 0.4rem;
            max-width: 495px;
        }
    </style>


</head>
<body>
<div class="content-box container-app " style="background: #F6F6F6">
    <div class="top flex flex-c-c">
        <div class="top-return"></div>
        <div class="return" onclick="goIndex()">返回</div>
        <div class="advince">公众调查</div>
    </div>
    <li class="ui-border-t">
        <p align="center" style="font-size: 0.50rem;letter-spacing: 0.05rem" class="queinvestName change-font" value="${title!}">${title!}</p>
    </li>



    <form class="form-class" action="/mm/wxqueinvest/test" method="post" onsubmit="return check()">

    <#list list! as question>
    <#--题目id-->
        <input type="hidden" value="${question.questionId!}" class="queSize" name = "${question.rowNum!}queId">
        <#--<input type="hidden" value="${list?size}" class="queSize" name = "queSize">-->
        <div>
            <div class="ui-flex ui-flex-align-start" style="border-bottom:1px solid #05B7F3;width: auto;">
                <p class="exam-question">${question.rowNum!}、${question.contents!}</p>
            </div>
            <div class="ui-flex ui-flex-align-start" style="border-bottom:1px solid #05B7F3;width: auto;">
                <input type="hidden" value="${list?size}" class="queSize" name = "queSize">

                <input type="radio" name="${question.rowNum!}"
                       value="${question.choiceText01!}">${question.choiceText01!}</br>
                <input type="radio" name="${question.rowNum!}"
                       value="${question.choiceText02!}">${question.choiceText02!} </br>
                <input type="radio" name="${question.rowNum!}"
                       value="${question.choiceText03!}">${question.choiceText03!}</br>
                <input type="radio" name="${question.rowNum!}"
                       value="${question.choiceText04!}">${question.choiceText04!}</br>
            </div>
        </div>
    </#list>
        <input type="submit"class="te-btn" value="提交">
    </form>




<script>

    // 校验用户是否答题
    function check() {
        var flag = false;
        var len=$("input[type='radio']").length;
        for(i=0;i<len;i++){
            if($("input[type='radio']")[i].checked==true){
                flag = true;
            }
        }
        if (flag == false)
        {
            alert("您还未作答哦！！")
            return false;
        }

    }

    // 返回
    function goIndex() {
        window.location.href='/mm/news/index';
    }



</script>
</body>
</html>