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
        .sp-span{display: inline-block;width: 100%;padding-left: 2.2rem;color:#ff2233;display: none}
        .port .sp-span2{padding:0 .2rem;width: auto;width: 0.2rem;display: none}
        .port .sp-span3{padding:0 .2rem;width: auto;width: 0.2rem}
        .webuploader-container div {width: 86px;  height: 35px;line-height: 35px;}
        .fx-img{width: 32%;height: 2rem;margin:0.1rem 0.5%}
        .fx-img img{width: 100%;height: 100%}
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
        <form id="add_form" action="/mm/complain/addComplaining" method="post">
            <div class="header-img">
                <div class="ts-table">
                    <div class="put">
                        <input type="hidden" name="contactUser" id="contact_user" value='${Session.userPhone}'>
                        <div class="theme">
                            <div class="port flex flex-c-c">
                                <span>标题&nbsp;:</span>
                                <input type="text" name="title" id="title" class="tab-input flex-1"
                                       placeholder="请输入您的来信标题(20字以内)">
                                <span class="sp-span2" id="sp_title2" style="color:green">√</span>
                                <span class="sp-span3" id="sp_title3" style="color:red">*</span>
                            </div>
                            <span class="sp-span" id="sp_title">字符个数应在1-20个</span>
                        </div>
                        <div class="theme">
                            <div class="port flex flex-c-c">
                                <span>问题描述&nbsp;:</span>
                                <input type="text" name="description" id="description" class="tab-input flex-1"
                                       placeholder="请输入您的诉求内容(50字以内)">
                                <span class="sp-span2" id="sp_description2" style="color:green">√</span>
                                <span class="sp-span3" id="sp_description3" style="color:red">*</span>
                            </div>
                            <span class="sp-span" id="sp_description">请输入1-50位字符</span>
                        </div>
                        <div class="theme">
                            <div class="port flex flex-c-c">
                                <span>联系人&nbsp;:</span>
                                <input type="text" name="contact" id="contact" class="tab-input flex-1"
                                       placeholder="请输入您的姓名(20字以内)" value="${Session.userName}">
                                <span class="sp-span2" id="sp_contact2" style="color:green">√</span>
                            </div>
                            <span class="sp-span" id="sp_contact">请输入1-20位字符</span>
                        </div>
                        <div class="theme">
                            <div class="port flex flex-c-c">
                                <span>联系电话&nbsp;:</span>
                                <input type="text" name="phone" id="phone" class="tab-input flex-1"
                                       placeholder="请输入您的电话"value="${Session.userPhone}">
                                <span class="sp-span2" id="sp_phone2" style="color:green">√</span>
                            </div>
                            <span class="sp-span" id="sp_phone">手机号格式不对</span>
                        </div>
                        <div class="theme">
                            <div class="type">
                                <div class="select-left port flex flex-c-c">
                                    <span>类型&nbsp;:</span>
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
                                <span class="sp-span2" id="sp_address2" style="color:green">√</span>
                                <span class="sp-span3" id="sp_address3" style="color:red">*</span>
                            </div>
                            <span class="sp-span" id="sp_address">字符不超过20位</span>
                        </div>
                        <div class="theme">
                            <div class="form-group" style="min-height: 2rem;margin-top: 0.3rem">
                                <div style="width:80;height: 35px;position: relative;margin:0 auto">
                                    <div id="xg_rar">上传图片附件</div>
                                </div>
                                <div id="fileShowName" style="text-align: center;margin:0 auto"></div>
                            </div>

                            <div class="form-group" style="min-height: 2rem;">
                                <div style="width:80;height: 35px;position: relative;margin:0 auto">
                                    <div id="yy">上传语音附件</div>
                                </div>
                                <div id="yyfileShowName" style="text-align: center;margin:0 auto"></div>
                            </div>

                            <div class="form-group" style="min-height: 2rem;">
                                <div style="width:80;height: 35px;position: relative;margin:0 auto">
                                    <div id="sp">上传视频附件</div>
                                </div>
                                <div id="spfileShowName" style="text-align: center;margin:0 auto"></div>
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
        <input type="hidden" name="contactUser" id="contactUser" value='${contactUser!}'>
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
                var flag=checktitle() && checkcontent() && checkname() && checktelephone() && checkaddress();
                if (flag){
                    alert("投诉成功")
                }else{
                    alert("投诉失败")
                }
                return flag;
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
            $("input[name='address']").blur(function () {
                checkaddress();
            });


        });


        //检验标题
        function checktitle() {
            var title = $("input[name='title']").val();
            var reg_title = /^.{1,20}$/;
            var flag = reg_title.test(title)
            if (title != null && title != '' && flag) {
                $("#sp_title3").hide();
                $("#sp_title2").show();
                $("#sp_title").hide();
                return true;
            }else{
                $("#sp_title").show();
                $("#sp_title2").hide();
                $("#sp_title3").show();
                return false;
            }
        }

        //检验内容
        function checkcontent() {
            var content = $("input[name='description']").val();
            var reg_content = /^.{1,50}$/;
            var flag = reg_content.test(content);
            if (content != null && content != '' && flag) {
                $("#sp_description3").hide();
                $("#sp_description2").show();
                $("#sp_description").hide();
                return true;
            }else{
                $("#sp_description").show();
                $("#sp_description2").hide();
                $("#sp_description3").show();
                return false;
            }
        }

        //检验联系人
        function checkname() {
            /*var name = $("input[name='contact']").val();
            var reg_name = /^.{1,20}$/;
            var flag = reg_name.test(name);
            if (flag) {
                $("#sp_contact2").show();
                $("#sp_contact").hide();
                return true;
            }else{
                $("#sp_contact").show();
                $("#sp_contact2").hide();
                return false;
            }*/
            return true;
        }

        //检查手机号
        function checktelephone() {
            var telephone = $("input[name='phone']").val();
            var reg_telephonr = /^(((13|14|15|18|17)\d{9}))$/;
            var flag = reg_telephonr.test(telephone);
            if (flag) {
                $("#sp_phone2").show();
                $("#sp_phone").hide();
                return true;
            }else{
                $("#sp_phone").show();
                $("#sp_phone2").hide();
                return false;
            }
        }

        //检查地址
        function checkaddress() {
            var address = $("input[name='address']").val();
            var reg_address = /^.{1,20}$/;
            var flag = reg_address.test(address);
            if (flag) {
                $("#sp_address3").hide();
                $("#sp_address2").show();
                $("#sp_address").hide();
                return true;
            }else{
                $("#sp_address").show();
                $("#sp_address2").hide();
                $("#sp_address3").show();
                return false;
            }
        }

        function goIndex() {
            window.location.href = '/mm/news/index';
        }

        var sys_url=window.location.host;
        var tp="#xg_rar";
        var tpgs="bmp,jpg,png,gif,jpeg";

        var yy="#yy";
        var yygs="mp3";

        var sp="#sp";
        var spgs="mp4";

        $(function () {
            $("#xg_rar").html('上传图片附件');
            $("#fileShowName").html("<br>");

            $("#yy").html('上传语音附件');
            $("#yyfileShowName").html("<br>");

            $("#sp").html('上传视频附件');
            $("#spfileShowName").html("<br>");

            $("#attachIdss").val('');
            //初始化上传工具
            initUpload(tp,tpgs,3,1*1024*1024);
            initUpload(yy,yygs,2,5*1024*1024);
            initUpload(sp,spgs,2,10*1024*1024);
        });
        function initUpload(dz,gs,num,singleSize) {
            var uploader = WebUploader.create({
                //上传数量限制
                fileNumLimit: num,

                //限制上传单个文件大小
                fileSingleSizeLimit: singleSize,

                // swf文件路径
                swf: '/css/third/Uploader.swf',
                auto: true,
                // 文件接收服务端。
                server: '/uploadOfGuest/custom',

                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: dz,

                // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
                resize: false,
                //重复上传
                duplicate: true,
                accept: {
                    extensions: gs,
                    title: 'file',
                    mimeTypes: '*/*'
                }
            });
            uploader.on('uploadSuccess', function (file, response) {
                //;
                var name = file.name;
                var fileurl = response.data;
                var jw = fileurl.substring(fileurl.lastIndexOf('.'));
                if (jw == '.bmp' || jw == '.jpg' || jw == '.gif' || jw == '.jpeg' || jw == '.png') {
                    $("#fileShowName").append("<p>" +
                        "<img src='" + fileurl + "' height='100px' width='50' > " +
                        "<input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                        "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                        "<input type='hidden' name='attachPaths' value='" + fileurl + "'>" +
                        "<input type='hidden' name='attachNames' value='" + name + "'>" +
                        "</p>");
                } else if (jw == '.mp3') {
                    $("#yyfileShowName").append("<p>" +
                        "<audio controls>" +
                        "<source src='" + fileurl + "' type='audio/mpeg'>" +
                        "</audio>" +
                        "<input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                        "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                        "<input type='hidden' name='attachPaths' value='" + fileurl + "'>" +
                        "<input type='hidden' name='attachNames' value='" + name + "'>" +
                        "</p>");
                } else if (jw == '.mp4') {
                    $("#spfileShowName").append("<p>" +
                        "<video  width='150' height='100' controls='controls' >" +
                        "<source  src='" + fileurl + "' type='video/mp4' />" +
                        "</video>" +
                        "<input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                        "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                        "<input type='hidden' name='attachPaths' value='" + fileurl + "'>" +
                        "<input type='hidden' name='attachNames' value='" + name + "'>" +
                        "</p>");
                }
            });

            uploader.on("error", function (type) {
                if (type == "Q_TYPE_DENIED") {
                    alert("请上传" + gs + "格式文件");
                } else if (type == "F_EXCEED_SIZE") {
                    alert("单个文件大小不能超过" + singleSize / 1024 / 1024 + "M");
                } else if (type == "Q_EXCEED_NUM_LIMIT") {
                    alert("超出最大上传数量" + num - 1);
                } else {
                    alert("上传错误" + type)
                }
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