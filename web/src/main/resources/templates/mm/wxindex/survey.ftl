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



</head>
<body>
<div class="content-box container-app " style="background: #F6F6F6">
    <div class="top flex flex-c-c">
        <div class="top-return"></div>
        <div class="return" onclick="goIndex()">返回</div>
        <div class="advince">公众调查</div>
    </div>

<#list queinvestList! as queinvest>

    <div class="center" id = "queinvestDiv">

        <div class="flex sum-work" onclick="startQueinvest('${queinvest.id!}')">
            <div class="flex-2">
                <p class="date-year">${queinvest.yearStr!""}</p>
                <p class="date-day">${queinvest.dayStr!}</p>
            </div>
            <div class="flex-6">
                <div>
                    <p class="violation">${queinvest.title!}</p>
                    <p class="well-peopel">${queinvest.description!}</p>
                </div>
            </div>
            <div class="flex-1 flex flex-c-c flex-r-c"><img class="right-ceil" src="/mm/img/right.png"></div>
        </div>

</#list>


</body>



<script>
    function goIndex() {
        window.location.href='/mm/wxindex/index';
    }



    // 点击这个进入答题页面
    function startQueinvest(id) {
//        alert("id : " + id);
//        zudp.ajax("/mm/queinvest/startQueinvest").post(id).then(function (value) {
//                alert(id);
//        });
//        alert("请你进来啊"+id);
    window.location.href='/mm/wxqueinvest/start/'+id;
//    window.location.href='/mm/wxqueinvest/start';
    }


</script>
</html>