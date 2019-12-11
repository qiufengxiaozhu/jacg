<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="/css/third/webuploader.css" rel="stylesheet">
    <link rel="stylesheet" href="/mm/css/index.css">
    <link href="/css/third/webuploader.css">

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
                                <input type="text" name="title" id="title" class="tab-input flex-1"
                                       placeholder="请输入您的来信主题(50字以内)">
                                <span id="sp_title"></span>
                            </div>
                        </div>
                        <div class="theme">
                            <div class="port flex flex-c-c">
                                <span>内容&nbsp;:</span>
                                <input type="text" name="description" id="description" class="tab-input flex-1"
                                       placeholder="请输入您的诉求内容(1000字以内)">
                                <span id="sp_description"></span>
                            </div>
                        </div>
                        <div class="theme">
                            <div class="port flex flex-c-c">
                                <span>联系人&nbsp;:</span>
                                <input type="text" name="contact" id="contact" class="tab-input flex-1"
                                       placeholder="请输入您的姓名(20字以内)">
                                <span id="sp_contact"></span>
                            </div>
                        </div>
                        <div class="theme">
                            <div class="port flex flex-c-c">
                                <span>联系电话&nbsp;:</span>
                                <input type="text" name="phone" id="phone" class="tab-input flex-1"
                                       placeholder="请输入您的电话(20字以内)">
                                <span id="sp_phone"></span>
                            </div>
                        </div>
                        <div class="theme">
                            <div class="type">
                                <div class="select-left flex flex-c-c">
                                    <span>反映类型&nbsp;:</span>
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
<#--                        <div class="theme">-->
<#--                            <div class="port">添加附件&nbsp;:</div>-->
<#--                                <a href="#"><img src="/mm/img/file.png" alt=""></a>-->
<#--                                <a href="#"><img src="/mm/img/music.png" alt=""></a>-->
<#--                                <a href="#"><img src="/mm/img/arr15.png" alt=""></a>-->
<#--                            </div>-->
<#--                        </div>-->
                        <div class="theme">
                            <div style="width:80;height: 35px;position: relative;margin:0 auto">
                                <div id="xg_rar">上传附件</div>
                            </div>
                            <div id="fileShowName" class="port" style="text-align: center;margin:0 auto"></div>
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
    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
    <script src="/mm/js/rem.js"></script>
    <script src="/js/zudp.js"></script>
    <script src="/js/third/webuploader.js"></script>
    <script>
        $(function () {
            //前端校验
            $("#add_form").submit(function () {
                return checktitle()&&checkcontent()&&checkname()&&checktelephone();
            });
            $("input[name='title']").blur(function () {
                checktitle();
            });

            $("input[name='description']").blur(function () {
                checkcontent();
            });

            $("input[name='contact']").blur(function () {
                checkname();
            });
            $("input[name='phone']").blur(function () {
                checktelephone();
            });


            //初始化 webUploader
            initUpload();
        });


        //检验标题
        function checktitle(){
            var title=$("input[name='title']").val();
            var reg_title= /^.{1,50}$/;
            var flag=reg_title.test(title)
            if(title!=null && title!='' &&flag){
                $("#sp_title").css("color","green").html("√");
                return true;
            }else{
                $("#sp_title").css("color","red").html("×");
                return false;
            }
        }

        //检验内容
        function checkcontent(){
            var content=$("input[name='description']").val();
            var reg_content= /^.{1,2000}$/;
            var flag=reg_content.test(content);
            if(content!=null && content!='' &&flag){
                $("#sp_description").css("color","green").html("√");
                return true;
            }else{
                $("#sp_description").css("color","red").html("×");
                return false;
            }
        }

        //检验联系人
        function checkname(){
            var name=$("input[name='contact']").val();
            var reg_name=/^([\u4e00-\u9fa5]){2,7}$/;
            var flag=reg_name.test(name);
            if (flag){
                $("#sp_contact").css("color","green").html("√");
                return true;
            }else{
                $("#sp_contact").css("color","red").html("×");
                return false;
            }
        }

        //检查手机号
        function checktelephone(){
            var telephone=$("input[name='phone']").val();
            var reg_telephonr= /^(((13|14|15|18|17)\d{9}))$/;
            var flag=reg_telephonr.test(telephone);
            if (flag){
                $("#sp_phone").css("color","green").html("√");
                return true;
            }else{
                $("#sp_phone").css("color","red").html("×");
                return false;
            }
        }

        function goIndex() {
            $("#ret_my_complain_form").attr("action", "/mm/news/retMyComplain").submit();
        }

        function initUpload() {
            var uploader = WebUploader.create({
                // swf文件路径
                swf: '/css/third/Uploader.swf',
                auto: true,
                // 文件接收服务端。
                server: '/uploadOfGuest/custom',

                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: '#xg_rar',

                // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
                resize: false,
                //重复上传
                duplicate: true,
                accept: {
                    extensions: 'bmp,jpg,png',
                    title: 'file',
                    mimeTypes: '*/*'
                }
            });
            // 文件上传成功，给item添加成功class, 用样式标记上传成功。
            uploader.on('uploadSuccess', function (file, response) {
                var name = file.name;
                var fileurl = response.data;
                $("#fileShowName").append("<p>" +
                    "<b>" + name + "</b>" +
                    "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                    "<input type='hidden' name='attachPaths' value='" + fileurl + "'>" +
                    "<input type='hidden' name='attachNames' value='" + name + "'>" +
                    "</p>");

                //change(response);
            });
        }

        //删除，删除节点
        function deleteFile(obj) {
            var fid = $(obj).parent().find("input[name='fid']").eq(0).val();
            if (fid != '') {
                var str = $("#attachIdss").val() + "," + fid;
                if (str.indexOf(",") == 0) {
                    str = str.substr(1);
                }
                $("#attachIdss").val(str);
            }
            $(obj).parent().remove();
        }
    </script>
</body>
</html>