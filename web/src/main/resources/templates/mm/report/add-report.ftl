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
    <script src="/js/third/webuploader.js"></script>
    <title>公众上报</title>
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
    <script>
        $(function () {
            $("form").submit(function () {
                return checktitle()&&checkcontent()&&checkname()&&checktelephone();
            })
            $("input[name='title']").blur(function () {
                        checktitle();
            });

            $("input[name='content']").blur(function () {
                checkcontent();
            });

            $("input[name='name']").blur(function () {
                checkname();
            });
            $("input[name='telephone']").blur(function () {
                checktelephone();
            });
        });

        //检验标题
        function checktitle(){
            var title=$("input[name='title']").val();
            var reg_title= /^.{1,20}$/;
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
            var content=$("input[name='content']").val();
            var reg_content= /^.{1,50}$/;
            var flag=reg_content.test(content);
            if(content!=null && content!='' &&flag){
                $("#sp_content").css("color","green").html("√");
                return true;
            }else{
                $("#sp_content").css("color","red").html("×");
                return false;
            }
        }

        //检验联系人
        function checkname(){
            var name=$("input[name='name']").val();
            var reg_name=/^([\u4e00-\u9fa5]){2,7}$/;
            var flag=reg_name.test(name);
            if (flag){
                $("#sp_name").css("color","green").html("√");
                return true;
            }else{
                $("#sp_name").css("color","red").html("×");
                return false;
            }
        }

        //检查手机号
        function checktelephone(){
            var telephone=$("input[name='telephone']").val();
            var reg_telephonr= /^(((13|14|15|18|17)\d{9}))$/;
            var flag=reg_telephonr.test(telephone);
            if (flag){
                $("#sp_telephone").css("color","green").html("√");
                return true;
            }else{
                $("#sp_telephone").css("color","red").html("×");
                return false;
            }
        }
    </script>
</head>

<body>
<div class="content-app">
    <div class="content-box container-app">

        <div class="top flex flex-c-c">
            <div class="top-return"></div>
            <div class="return" onclick="goIndex()">返回</div>
            <div class="advince">公众上报</div>
        </div>
    <form id="addadvisory" action="/consult/addadvisory" method="post">
        <div class="header-img">
            <div class="ts-table">
                <div class="put">

                    <!-- 附件上传 隐藏传值  开始 -->
                    <input id="attachIdss" type="hidden" />
                    <!-- 附件上传 隐藏传值  结束 -->

                    <div class="theme">
                        <div class="port flex flex-c-c"><span>标题&nbsp;:</span>
                            <input type="text"  name="title" class="tab-input flex-1" placeholder="请输入您的来信标题(20字以内)">
                            <span id="sp_title"></span>
                        </div>
                    </div>

                    <div class="theme">
                        <div class="port flex flex-c-c"><span>案发事件位置&nbsp;:</span><br>
                            <input type="text" name="content" class="tab-input flex-1" placeholder="请输入您的咨询内容(500字以内)">
                            <span id="sp_content"></span>
                        </div>
                    </div>



                    <div class="theme">
                        <div class="port flex flex-c-c"><span>案发描述&nbsp;:</span><br>
                            <input type="text" name="content" class="tab-input flex-1" placeholder="请输入您的咨询内容(500字以内)">
                            <span id="sp_content"></span>
                        </div>
                    </div>

                    <div class="theme">
                        <div class="port flex flex-c-c"><span>类型&nbsp;:</span>
                            <select>
                                <option>垃圾</option>
                                <option>广告乱贴</option>
                                <option>摊位乱摆</option>
                                <option>车辆乱停</option>
                                <option>工地乱象</option>
                                <option>河道乱污</option>
                                <option>违法构筑乱</option>
                            </select>
                            <span id="sp_title"></span>
                        </div>
                    </div>

                    <div class="theme">
                        <div class="port flex flex-c-c"><span>联系人&nbsp;:</span>
                        <input type="text" name="name" class="tab-input flex-1" placeholder="请输入您的真实姓名">
                        <span id="sp_name"></span>
                        </div>
                    </div>

                    <div class="theme">
                        <div class="port flex flex-c-c"><span>联系电话&nbsp;:</span>
                        <input type="text" name="telephone" class="tab-input flex-1" placeholder="请输入您的电话(11位数字)">
                        <span id="sp_telephone"></span>
                        </div>
                    </div>

                    <#--<div class="theme">
                        <div class="port">添加附件&nbsp;:</div>
                        <div class="enclosure port flex">
                            <div ><a href="#"><img src="/mm/img/file.png" alt=""></a></div>
                            <div ><a href="#"><img src="/mm/img/music.png" alt=""></a></div>
                            <div ><img src="/mm/img/arr15.png" alt=""></div>
                        </div>
                    </div>-->

                    <div class="form-group" style="">
                        <div style="width:80;height: 35px;position: relative;margin:0 auto">
                            <div id="xg_rar">上传附件</div>
                        </div>
                        <div id="fileShowName" style="text-align: center;margin:0 auto"></div>
                    </div>

                </div>
            </div>
        </div>
        <input class="sq-btn" type="submit" value="提交">
    </form>
    </div>
</div>
    <script>
        var sys_url=window.location.host;
        $(function () {
            $("#xg_rar").html('上传附件');
            $("#fileShowName").html('');
            $("#attachIdss").val('');
            //初始化上传工具
            initUpload();
        })
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
                    extensions: 'bmp,jpg,png,rar,gif,zip,xls,xlsx,doc,docx,mp4',
                    title: 'file',
                    mimeTypes: '*/*'
                }
            });
            uploader.on('uploadSuccess', function (file, response) {
                //debugger;
                var name = file.name;
                var fileurl = response.data;
                $("#fileShowName").append("<p>" +
                        "<a href='//" + sys_url + "/" + fileurl + "' download='" + name + "'>" + name + "</a>" +
                        "<input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                        "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                        "<input type='hidden' name='attachPaths' value='" + fileurl + "'>" +
                        "<input type='hidden' name='attachNames' value='" + name + "'>" +
                        "</p>");
            });
        }
        function goIndex() {
            window.location.href = '/mm/news/index';
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

        //获取在节点上的文件路径
        function getAttachPath() {
            var tempAttachPath = [];
            var $attachPath = $("input[name='attachPath']");
            $.each($attachPath, function (k, v) {
                tempAttachPath.push($(v).val());
            })
            return tempAttachPath;
        }
        //获取在节点上的文件路名称
        function getAttachName() {
            var tempAttachName = [];
            var $attachName = $("input[name='attachName']");
            $.each($attachName, function (k, v) {
                tempAttachName.push($(v).val());
            })
            return tempAttachName;
        }

        //获取所有附件Ids
        function getAttachIdss() {
            var tempAttachIdss = [];
            var $attachIdss = $("#attachIdss").val().split(",");
            $.each($attachIdss, function (k, v) {
                tempAttachIdss.push(v);
            })
            return tempAttachIdss;
        }
    </script>
</body>
</html>