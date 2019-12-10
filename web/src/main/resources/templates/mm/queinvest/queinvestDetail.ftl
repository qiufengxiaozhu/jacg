<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>index</title>
    <link rel="stylesheet" href="css/frozen.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="js/zepto.min.js"></script>
    <script src="js/frozen.js"></script>

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

</head>

<body ontouchstart>
<header class="ui-header ui-header-stable ui-border-b">
    <i class="ui-icon-return" onclick="history.back()"></i>
    <h1>调查问卷</h1>
</header>
<footer class="ui-footer ui-footer-btn" style="height: 44px">
</footer>
<section class="ui-container">
    <li class="ui-border-t">
        <p align="center" class="queinvestName" value="${title!}">${title!}</p>
    </li>



    <form class="form-class" action="/mm/queinvest/test" method="get" onsubmit="return check()">

    <#list list! as question>
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
        <input type="submit" value="提交">
    </form>


</section>


<script>

    function check() {
        alert("感谢您参与本次问卷调查");
        return true;
    }



</script>
</body>
</html>