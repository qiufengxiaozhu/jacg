<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="/css/third/webuploader.css" rel="stylesheet">
    <link rel="stylesheet" href="/mm/css/index.css">


    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
    <script src="/mm/js/rem.js"></script>
    <script src="/js/zudp.js"></script>
    <title>公众投诉</title>
    <style>
        .port span {
            width: 1.9rem;
            display: inline-block
        }

        .icon-img {
            width: 25;
            height: 25
        }
    </style>
</head>

<body>
<div class="content-app">
    <div class="content-box container-app">
        <div class="top flex flex-c-c">
            <div class="top-return"></div>
            <div class="return" onclick="goIndex()">返回</div>
            <div class="advince">公众投诉</div>
        </div>
        <form id="add_form" action="/mm/news/addComplaining" method="post">
            <div class="header-img">
                <div class="ts-table">
                    <div class="put">
                        <input type="hidden" name="contactUser" id="contact_user" value='${contactUser!""}'>
                        <div class="theme">
                            <div class="port flex flex-c-c">
                                <span>主题&nbsp;:</span>
                                <input type="text" name="title" id="title" class="tab-input flex-1" placeholder="请输入您的来信主题(50字以内)">
                            </div>
                        </div>
                        <div class="theme">
                            <div class="port flex flex-c-c">
                                <span>内容&nbsp;:</span>
                                <input type="text" name="description" id="description" class="tab-input flex-1"
                                       placeholder="请输入您的诉求内容(1000字以内)">
                            </div>
                        </div>
                        <div class="theme">
                            <div class="port flex flex-c-c">
                                <span>联系人&nbsp;:</span>
                                <input type="text" name="contact" id="contact" class="tab-input flex-1" placeholder="请输入您的姓名(20字以内)">
                            </div>
                        </div>
                        <div class="theme">
                            <div class="port flex flex-c-c">
                                <span>联系电话&nbsp;:</span>
                                <input type="text" name="phone" id="phone" class="tab-input flex-1" placeholder="请输入您的电话(20字以内)">
                            </div>
                        </div>
                        <div class="theme">
                            <div class="type">
                                <div class="select-left flex flex-c-c">
                                    <span>反应类型&nbsp;:</span>
                                    &nbsp;&nbsp;
                                    <select id="type" name="type" class="selected">
                                        <option value="0">投诉</option>
                                        <option value="1">建议</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="theme">
                            <div class="port flex flex-c-c">
                                <span>填写地址&nbsp;:</span>
                                <input type="text" id="address" name="address" class="tab-input flex-1">
                            </div>
                        </div>
                        <div class="theme">
                            <div class="port">添加附件&nbsp;:</div>
                            <div class="enclosure port flex">
                                <a href="#"><img src="/mm/img/file.png" alt=""></a>
                                <a href="#"><img src="/mm/img/music.png" alt=""></a>
                                <a href="#"><img src="/mm/img/arr15.png" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <input class="sq-btn" type="submit" value="提交">
        </form>
    </div>
    <form id="ret_my_complain_form" action="" method="post">
        <!--<input type="hidden" name="_method" value="DELETE"/>-->
        <input type="hidden" name="contactUser" id="contactUser" value='${contactUser}'>
    </form>
    <script>
        $(document).ready(function () {
            $("#add_form").validate({
                rules: {
                    title:{
                        required:true
//                        rangelength:[0,50]
                    },
                    description:{
                        required:true
                    },
                    contact:{
                        required:true
                    },
                    phone:{
                        required: true
                    }
                },
                messages: {
                    title:{
                        required: "请输入标题"
//                        rangelength: "标题长度不大于50"
                    },
                    description:{
                        required: "请输入事情详情"
                    },
                    contact:{
                        required: "请输入联系人"
                    },
                    phone:{
                        required: "请输入联系人电话"
                    }
                },ignore: []
            });
        });
        function goIndex() {
            $("#ret_my_complain_form").attr("action", "/mm/news/retMyComplain").submit();
        }

//        function submit() {
//            var contact_user = $("#contact_user").val();
//            var title = $("#title").val();
//            var description = $("#description").val();
//            var contact = $("#contact").val();
//            var phone = $("#phone").val();
//            var type = $("#type").val();
//            var address = $("#address").val();
//            var data = {
//                title: title,
//                description: description,
//                type: type,
//                contact: contact,
//                phone: phone,
//                contactUser: contact_user,
//                complainDate: new Date().format("yyyy-MM-dd HH:mm:ss"),
//                address: address
//            };
//            data = JSON.stringify(data);
//
//            zudp.ajax("/mm/news/login").post(data).then(function (data) {
//
//                alert(data + " ------ " + typeof (data));
////                if (da == 'ok') {
////                    $("#msg-show").html("登录成功");
////                    window.location.href = '${laterurl!""}';
////                } else if (da == 'noperson') {
////                    $("#msg-show").html("用户不存在");
////                } else if (da == 'noactive') {
////                    $("#msg-show").html("用户名未激活");
////                } else if (da == 'nomatch') {
////                    $("#msg-show").html("用户名或密码错误");
////                }
//            });
//        }

        Date.prototype.format = function (fmt) {
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "h+": this.getHours() % 12 == 0 ? 12 : this.getHours() % 12, //小时
                "H+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
        }
    </script>
</body>
</html>