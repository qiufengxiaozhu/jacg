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
    <title>点赞详情</title>
</head>
<body>
<div class="content-box container-app sum-background">
    <div class="top flex flex-c-c">
        <div class="top-return"></div>
        <div class="return" onclick="goList()">返回</div>
        <div class="advince">点赞详情</div>
    </div>
    <div class="de-top">
        <div class="de-text">
            <div class="de-title" id = "title" ></div>
            <div class="de-demo"><span>有效时间:</span><span class="de-xxx" id="likePID"></span></div>
            <div class="de-main" id="content">

            </div>
            <div class="flex de-good">
                <div id="img-btn" onclick="like()"><img src="/mm/img/good.png" alt=""></div>&nbsp;
                <div id="likeNum"></div>
            </div>
        </div>
        <div class="de-center">
            <div class="de-relative">相关附件:</div>
            <div class="flex de-getimg" id="accessory">

            </div>
        </div>
    </div>
    <div class="de-bottom" id="comment">

        </div>
    </div>

<div class="cover cover1" style="display: none;">
    <div class="alert-center">
        <div class="slow">写下评论</div>
        <div class="input-area"><textarea id="matter" cols="45" rows="5" class="text-area"  ></textarea></div>
        <div class="judge flex">
            <div class="agrement flex-1" onclick="commentSubmit()">确定</div>
            <div class="cancel flex-1">取消</div>
        </div>
    </div>
</div>
<script>
    var contentID;
    //评论框
    $(function(){
        function bodyScroll(event){
            event.preventDefault();
        }
        $('.cover').hide();
        $(document).on('click','.de-listright',function(){
            $('.cover').show();
            document.body.addEventListener('touchmove',bodyScroll,false);
            $('body').css({'position':'fixed',"width":"100%"});
        })
        $('.cancel').click(function(){
            $('.cover').hide();
            document.body.removeEventListener('touchmove',bodyScroll,false);
            $("body").css({"position":"initial"});
        })
    })
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
    //评论提交
    function commentSubmit() {
        function bodyScroll(event){
            event.preventDefault();
        }
        var matterValue= $("#matter").val();

        if(matterValue == null || matterValue ==""){
            alert("评论内容不能为空！");
            $('.cover').hide();
            document.body.removeEventListener('touchmove',bodyScroll,false);
            $("body").css({"position":"initial"});
        }
        else{
            $('.cover').hide();
            document.body.removeEventListener('touchmove',bodyScroll,false);
            $("body").css({"position":"initial"});
            $.ajax({
                url: "/api/likeInfo/commentSubmit",
                type: "get",
                data: {
                    "contentID":contentID,
                    "matter":matterValue
                },
                dataType: 'json',
                success: function (data) {
                    dzListInfo(); //评论列表更新
                }
            });
            alert("评论成功！");
        }
        $('#matter').val(" ");
    }
    //评论点赞数增加
    function commentLike(id) {
        $.ajax({
            url: "/api/likeInfo/updateLikeCNum",
            type: "post",
            data: {"id":id},
            dataType: 'json',
            success: function (data) {
                $("#"+id).html(data.data.likeCNum);
            }
        });
    }
    //点赞列表初始化
    function dzListInfo(){
        $.ajax({
            url: "/api/likeInfo/likeInfoList",
            type: "post",
            data: {"contentID":contentID},
            dataType: 'json',
            success: function (data) {
                if(data != null){
                   var infoList  = data.data;
                   var likeName = '';
                   var likeCommten = ' <div class="de-lists">\n' +
                           '            <div class="de-list">\n' +
                           '                <div class="de-line de-float"></div>\n' +
                           '                <div class="de-listleft de-float">评论</div>\n' +
                           '                <div class="de-listright de-float1">立即评论</div>\n' +
                           '        </div>';
                   for(var i=0;i<infoList.length;i++){
                       var info = infoList[i];
                       likeCommten += '  <div class="de-getlists flex">\n' +
                               '                <div class="de-stat"><img src="/mm/img/star.jpg" alt=""></div>\n' +
                               '                <div class="de-sum flex-1">\n' +
                               '                    <div class="de-name">'+info.likePID+'</div>\n' +
                               '                    <div class="de-cont">'+info.comment+'</div>\n' +
                               '                </div>\n' +
                               '                <div class="de-time flex">\n' +
                               '                    <div class="flex de-getcont">\n' +
                               "                        <div class='de-pic'><img src='/mm/img/good.png' onclick=\"commentLike(\'"+info.id+"\')\"></div>&nbsp;\n" +
                               '                        <div class="de-num"  id = "'+info.id+'">'+info.likeCNum+'</div>\n' +
                               '                    </div>\n' +
                               '                    <div class="de-year" >'+info.likeTime+'</div>\n' +
                               '                </div>\n' +
                               '            </div>';
                   }
                    $("#comment").html(likeCommten);
                }
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
                    for(var i=0;i<likeInfo.attachPaths.length;i++) {
                        var attachPaths = likeInfo.attachPaths[i];
                        if(img.test(attachPaths)||jpg.test(attachPaths)||png.test(attachPaths)||gif.test(attachPaths)){
                            accessory   +=  '<div class="de-img de-img1"><img src="'+attachPaths+'"  alt=""></div>';
                        }else if(mp4.test(attachPaths)){
                            accessory   +=  '<div class="de-img de-img1"><video width="100" height="100" controls>\n' +
                                    '  <source src="'+attachPaths+'" type="video/mp4">\n' +
                                    '</video></div>\n';
                        }else if(mp3.test(attachPaths)){
                            accessory   +=  '<div class="de-img de-img1"><audio width="100" height="100" src="'+attachPaths+'" controls="controls">\n' +
                                    '</audio></div>';
                        }
                        $("#accessory").html(accessory);
                    }
                    $("#title").text(likeInfo.title);
                    $("#content").html(likeInfo.content);
                    $("#likeNum").html(likeInfo.likeNum);
                    $("#likePID").html(likeInfo.validTime);
                  /*  $("#validTime").html(format(likeInfo.validTime));*/
                }
            },
            error: function () {
                alert("请刷新页面")
            }
        });
    }

    //点赞操作
    function like(){

        $.ajax({
            url: "/api/like/likeNum",
            type: "post",
            data: {"id":contentID},
            dataType: 'json',
            success: function (data) {
                if (data != null){
                    var likeInfo = data.data;
                    $("#likeNum").html(likeInfo.likeNum);
                }
            },
            error: function () {
                alert("请刷新页面")
            }
        });

    }

    // //时间格式化
    // function format(time) {
    //     var date = new Date(time);
    //     var y = date.getFullYear();
    //     var m = date.getMonth() + 1;
    //     m = m < 10 ? ('0' + m) : m;
    //     var d = date.getDate();
    //     d = d < 10 ? ('0' + d) : d;
    //     var h = date.getHours();
    //     h = h < 10 ? ('0' + h) : h;
    //     var minute = date.getMinutes();
    //     var second = date.getSeconds();
    //     minute = minute < 10 ? ('0' + minute) : minute;
    //     second = second < 10 ? ('0' + second) : second;
    //     var fortime = y+":"+m+":"+d;
    //     return fortime;
    // }
    //预加载
    $(document).ready(function(){
        // 初始化内容
      contentID  =  GetQueryString("likeContentId");
      getinfo();
      dzListInfo();
    });
</script>
</body>
</html>