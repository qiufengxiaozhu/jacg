<#--noinspection ALL-->
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
        <div class="return" onclick="goList()">返回</div>
        <div class="advince">点赞详情</div>
    </div>
    <div class="inv-bottom" style="position: relative">
        <div class="flex inv-cont">
            <div class="" >标题:</div>
            <p class="inv-right" id="title"></p>
        </div>
        <div class="inv-cont inv-special">
            <div class="">有效时间:</div>
            <div class="inv-right inv-right-special" id="validTime"></div>
        </div>
        <div class="inv-cont inv-special">
            <div class="">内容描述:</div>
            <div class="inv-right inv-right-special" id="content"></div>
        </div>
        <div class="inv-cont inv-pic" style="border-bottom: none">
            <div class="">相关附件:</div>
            <div class="inv-right" id="accessory">
            <#--<img src="/mm/img/arr15.png" alt="">
                <img src="/mm/img/arr12.png" class="inv-pic2" alt="">-->
            </div>
        </div>
        <div class="clearfix">
            <div class="dz-box flex flex-c-c">
                <img src="/mm/img/mythumbs.png" alt="" class="">
                <p id="likeNum"></p>人
            </div>
        </div>
        <div class="flex inv-cont">
            <div class="">点赞人:<p id="likePID"></p></div>
            <p class="inv-right" id ="comment"></p>
        </div>

        <div class="flex inv-cont">
            <textarea class="ts-txtarea">评论内容:</textarea>
            <input type="button" id = "submitBtn" onclick="submit()" />
        </div>


    </div>
</div>
<script>
    var contentID;
    //跳转
    function goList() {
        window.location.href='/mm/dz/dzlist';
    }
    //初始化获取Id
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);//search,查询？后面的参数，并匹配正则
        if(r!=null)return  unescape(r[2]); return null;
    }
    //点赞列表初始化
    function dzListInfo(){
        $.ajax({
            url: "/api/like/getLikeInfo",
            type: "post",
            data: {"likeContentId":contentID},
            dataType: 'json',
            success: function (data) {

            }
        });
    }
    //详情初始化
    function getinfo(){
        $.ajax({
            url: "/api/like/getLikeInfo",
            type: "post",
            data: {"likeContentId":contentID},
            dataType: 'json',
            success: function (data) {
                if (data != null){
                    var  likeInfo = data.data;
                    var accessory ="";
                    var img = /img/i;
                    var jpg = /jpg/i;
                    var png = /png/i;
                    var gif = /gif/i;
                    var mp4 = /mp4/i;
                    var mp3 = /mp3/i;
                    console.log(likeInfo);
                    for(var i=0;i<likeInfo.attachPaths.length;i++) {
                        var attachPaths = likeInfo.attachPaths[i];
                        if(img.test(attachPaths)||jpg.test(attachPaths)||png.test(attachPaths)||gif.test(attachPaths)){
                            accessory   +=  '<img src="'+attachPaths+'" class="inv-pic2" alt="">';
                        }else if(mp4.test(attachPaths)){
                            accessory   +=  '<video width="100" height="100" controls>\n' +
                                    '  <source src="'+attachPaths+'" type="video/mp4">\n' +
                                    '</video>\n';
                        }else if(mp3.test(attachPaths)){
                            accessory   +=  '<audio width="100" height="100" src="'+attachPaths+'" controls="controls">\n' +
                                    '</audio>';
                        }
                        $("#accessory").html(accessory);
                    }
                    $("#title").text(likeInfo.title);
                    $("#content").html(likeInfo.content);
                    $("#likeNum").html(likeInfo.likeNum);
                    $("#likePID").html(likeInfo.likePID);
                    $("#validTime").html(format(likeInfo.validTime));
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
    //预加载
    $(document).ready(function(){
        // 初始化内容
      contentID  =  GetQueryString("likeContentId");
      getinfo()
    });
</script>
</body>
</html>