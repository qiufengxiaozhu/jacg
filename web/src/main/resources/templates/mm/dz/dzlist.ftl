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
<div class="content-box container-app" style="background: #F6F6F6">
    <div class="top flex flex-c-c">
        <div class="top-return"></div>
        <div class="return" onclick="goIndex()">返回</div>
        <div class="advince">点赞列表</div>
    </div>
    <div class="li-input">
        <input id = "searchTitle" type="text" placeholder="输入标题搜索" class="li-put" onkeydown="searchTitle()">
        <img src="/mm/img/find.png">
    </div>
    <div class="fb-time">
        <select name="" id="" style="background: none">
            <option value="">点赞时间段</option>
        </select>
    </div>

    <div id = "summaryContent">

    </div>
</div>
<script>
    function goIndex(){
        window.location.href='/mm/news/index';
    }
    function goDetail(id){
        window.location.href='/mm/dz/dzdetail?likeContentId='+id;
    }

    $(document).ready(function(){
        // 初始化内容
        findList();
    });
    //搜索框事件绑定
    function searchTitle(){
        var event = window.event || arguments.callee.caller.arguments[0];
        if (event.keyCode == 13) {
            search();
        }
    }
    //执行搜索方法
    function search(){
     var title = $("#searchTitle").val();
        $.ajax({
            url: "/api/like/searchTitle",
            type: "post",
            data: {"title":title},
            dataType: 'json',
            success: function (data) {
                if (data != null) {
                    $("#summaryContent").empty();
                    //拼接列表页面
                    var tableContent = "";
                    var list = data.data;
                    if(list.length>0){
                        for(var i = 0; i < list.length; i++) { // 这里的i是代表数组的下标
                            var commentInfo = list[i];
                            var creatTime =  format(commentInfo.createDate);
                            tableContent += '  <div class="flex sum-work"  >\n' +
                                    '        <div class="flex-2">\n' + creatTime+
                                    '        </div>\n' +
                                    '        <div class="flex-6">\n' +
                                    '            <div class="">\n' +
                                    '                <p class="violation">'+commentInfo.title+'</p>\n' +
                                    '                <p class="well-peopel">'+commentInfo.content+'</p>\n' +
                                    '                <div class="add-pic flex">\n' +
                                    '                    <div class="flex flex-1 flex-c-c">' +
                                    "<img src='/mm/img/good.png' onclick =\"like(\'"+commentInfo.id+"\')\" >"+
                                    '<div class="li-num1">'+commentInfo.likeNum+'人</div></div>\n' +
                                    '                </div>\n' +
                                    '            </div>\n' +
                                    '        </div>\n' +
                                    '        <div class="de-pos flex flex-c-c">\n' +
                                    '        </div>\n' +
                                    '        <div class="flex-1">\n' +
                                    "            <img class='right-ceil' src='/mm/img/right.png' onclick=\"goDetail(\'"+commentInfo.id+"\')\" >" +
                                    '        </div>\n' +
                                    '    </div>';
                        }
                    }
                    //将拼接的页面放入列表里面
                    $("#summaryContent").append(tableContent);

                }
            },
            error: function () {
                alert("请刷新页面")
            }
        });
    }
    //点赞操作
    function like(id){
        $.ajax({
            url: "/api/like/likeNum",
            type: "post",
            data: {"id":id},
            dataType: 'json',
            success: function (data) {
               if (data != null){
                   location.reload();
               }
            },
            error: function () {
                 alert("请刷新页面")
            }
        });

    }
    //时间格式化
    function format(time) {
        var date = new Date(time);
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? ('0' + m) : m;
        var d = date.getDate();
        d = d < 10 ? ('0' + d) : d;
        var h = date.getHours();
        h = h < 10 ? ('0' + h) : h;
        var minute = date.getMinutes();
        var second = date.getSeconds();
        minute = minute < 10 ? ('0' + minute) : minute;
        second = second < 10 ? ('0' + second) : second;
      var fortime = '<p class="date-year">'+y+' - '+ m +'</p><p class="date-day">'+d+'</p>';
        return fortime;
    }
    //列表数据初始化方法
    function findList() {
        $.ajax({
            url: "/api/likeInfo/findList",
            type: "post",
            dataType: 'json',
            contentType: 'application/json',
            success: function (data) {
                if (data != null) {
                    //拼接列表页面
                    var tableContent = "";
                    var list = data.data;
                    if(list.length>0){
                        for(var i = 0; i < list.length; i++) { // 这里的i是代表数组的下标
                            var commentInfo = list[i];
                           var creatTime =  format(commentInfo.createDate);
                            console.log(commentInfo);
                            var id  = String(commentInfo.id);
                            tableContent += '  <div class="flex sum-work"  >\n' +
                                    '        <div class="flex-2">\n' + creatTime+
                                    '        </div>\n' +
                                    '        <div class="flex-6">\n' +
                                    '            <div class="">\n' +
                                    '                <p class="violation">'+commentInfo.title+'</p>\n' +
                                    '                <p class="well-peopel">'+commentInfo.content+'</p>\n' +
                                    '                <div class="add-pic flex">\n' +
                                    '                    <div class="flex flex-1 flex-c-c">' +
                                    "<img src='/mm/img/good.png' onclick =\"like(\'"+id+"\')\" >"+
                                    '<div class="li-num1">'+commentInfo.likeNum+'人</div></div>\n' +
                                    '                </div>\n' +
                                    '            </div>\n' +
                                    '        </div>\n' +
                                    '        <div class="de-pos flex flex-c-c">\n' +
                                    '        </div>\n' +
                                    '        <div class="flex-1">\n' +
                                    "            <img class='right-ceil' src='/mm/img/right.png' onclick=\"goDetail(\'"+commentInfo.id+"\')\" >" +
                                    '        </div>\n' +
                                    '    </div>';
                        }
                    }
                    //将拼接的页面放入列表里面
                    $("#summaryContent").append(tableContent);

                }
            },
            error: function () {
                alert("请刷新页面")
            }
        });

    }
</script>
</body>
</html>