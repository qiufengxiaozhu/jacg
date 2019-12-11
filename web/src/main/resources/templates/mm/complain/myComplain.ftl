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
        <div class="advince">我的投诉</div>
        <a href="/mm/news/addComplain" class="li-add flex-1" style="text-align: right" id="addComplain">
            <img src="/mm/img/add.png" alt="" class="">
        </a>
    </div>
    <div class="center">
        <#if complainEntity?exists && complainEntity??>
            <#list complainEntity as list>

                <#if list.replyStatus == "1">
                    <div class="flex sum-work" onclick="goDetail('${list.id!}')">
                        <div class="flex-2">
                            <p class="date-year">${list.yearAndMonth!}</p>
                            <p class="date-day">${list.day!}</p>
                        </div>
                        <div class="flex-6">
                            <div>
                                <p class="violation">${list.title!}</p>
                                <p class="well-peopel">${list.description!}</p>
                            </div>
                        </div>
                        <div class="flex-1 flex flex-c-c flex-r-c flex-fx-c">
                            <span class="my-hf green">已回复</span>
                            <img class="right-ceil" src="/mm/img/right.png" style="margin:0.3rem 0">
                        </div>
                    </div>
                <#else>
                    <div class="flex sum-work">
                        <div class="flex-2">
                            <p class="date-year">${list.yearAndMonth!}</p>
                            <p class="date-day">${list.day!}</p>
                        </div>
                        <div class="flex-6">
                            <div>
                                <p class="violation">${list.title!}</p>
                                <p class="well-peopel">${list.description!}</p>
                            </div>
                        </div>
                        <div class="flex-1 flex flex-c-c flex-r-c flex-fx-c">
                            <span class="my-hf">未回复</span>
                            <img class="right-ceil" src="/mm/img/right.png" style="margin:0.3rem 0"></div>
                    </div>
                </#if>
            </#list>
        <#else>
            <div class="inv-right inv-right-special">您还没有投诉内容</div>
        </#if>
    </div>
</div>
<form id="add_form" action="" method="post">
    <!--<input type="hidden" name="_method" value="DELETE"/>-->
    <input type="hidden" name="contactUser"  value='${contactUser!}'>
</form>
<form id="detail_form" action="" method="post">
    <!--<input type="hidden" name="_method" value="DELETE"/>-->
    <input type="hidden" name="id" id="id"/>
    <input type="hidden" name="contactUser" value='${contactUser!}'>
</form>
<script src="/js/zudp.js"></script>
<script>

    $(document).ready(function () {
        $("#addComplain").click(function () {
            var href = $(this).attr("href");
            $("#add_form").attr("action", href).submit();
            /*定义表单提交的地址*/
            return false;
        });
    });


    function goDetail(id) {
        $("#id").val(id);
        $("#detail_form").attr("action", "/mm/news/detail").submit();
    }

    function goIndex() {
        window.location.href = '/mm/news/index';
    }

    function addComplain() {
        var contactUser = "123";
        var data = {
            contactUser: contactUser
        };
//        alert(data.contactUser);
        var dataJSON = JSON.stringify(data);
        zudp.ajax("/mm/news/addComplain").post(dataJSON).then(function (result) {
//            debugger;
//            alert(result);
//            window.location.href = '${path!""}';
            window.location.href = result;
        });
    }
</script>
</body>
</html>