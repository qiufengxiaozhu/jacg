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
                return checktitle()&&checkcontent()&&checkname()&&checktelephone()&&checkplace();
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
            $("input[name='place']").blur(function () {
                checkplace();
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
        //检验案发地点
        function checkplace(){
            var place=$("input[name='place']").val();
            var reg_place= /^.{1,20}$/;
            var flag=reg_place.test(place)
            if(place!=null && place!='' &&flag){
                $("#sp_place").css("color","green").html("√");
                return true;
            }else{
                $("#sp_place").css("color","red").html("×");
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
          /*  var name=$("input[name='name']").val();
            var reg_name=/^([\u4e00-\u9fa5]){2,7}$/;
            var flag=reg_name.test(name);
            if (flag){
                $("#sp_name").css("color","green").html("√");
                return true;
            }else{
                $("#sp_name").css("color","red").html("×");
                return false;
            }*/
          return true;
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
    <form id="addadvisory" action="/report/addreport" method="post">
        <div class="header-img">
            <div class="ts-table">
                <div class="put">

                    <#--用户名称和电话号码-->
                    <#--<input id="userName" type="hidden" value="${Session.userName}" />-->
                    <#--<input id="userPhone" type="hidden" value="${Session.userPhone}" />-->
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
                            <input type="text" name="place" class="tab-input flex-1" placeholder="案发地点">
                            <span id="sp_place"></span>
                        </div>
                    </div>



                    <div class="theme">
                        <div class="port flex flex-c-c"><span>案发描述&nbsp;:</span><br>
                            <input type="text" name="content" class="tab-input flex-1" placeholder="请输入您的咨询内容(100字以内)">
                            <span id="sp_content"></span>
                        </div>
                    </div>

                    <div class="theme">
                        <div class="port flex flex-c-c"><span>类型&nbsp;:</span>
                            <select name="category">
                                <option value="垃圾">垃圾</option>
                                <option value="广告乱贴">广告乱贴</option>
                                <option value="摊位乱摆">摊位乱摆</option>
                                <option value="车辆乱停">车辆乱停</option>
                                <option value="工地乱象">工地乱象</option>
                                <option value="河道乱污">河道乱污</option>
                                <option value="违法构筑乱">违法构筑乱</option>
                            </select>
                        </div>
                    </div>

                    <div class="theme">
                        <div class="port flex flex-c-c"><span>联系人&nbsp;:</span>
                        <input type="text" name="name" class="tab-input flex-1" placeholder="请输入您的真实姓名" value="${Session.userName!}">
                        <span id="sp_name"></span>
                        </div>
                    </div>

                    <div class="theme">
                        <div class="port flex flex-c-c"><span>联系电话&nbsp;:</span>
                        <input type="text" name="telephone" class="tab-input flex-1" placeholder="请输入您的电话(11位数字)" value="${Session.userPhone!}">
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
                            <div id="xg_rar">上传图片附件</div>
                        </div>
                        <div id="fileShowName" style="text-align: center;margin:0 auto"></div>
                    </div>

                    <div class="form-group" style="">
                        <div style="width:80;height: 35px;position: relative;margin:0 auto">
                            <div id="yy">上传语音附件</div>
                        </div>
                        <div id="yyfileShowName" style="text-align: center;margin:0 auto"></div>
                    </div>

                    <div class="form-group" style="">
                        <div style="width:80;height: 35px;position: relative;margin:0 auto">
                            <div id="sp">上传视频附件</div>
                        </div>
                        <div id="spfileShowName" style="text-align: center;margin:0 auto"></div>
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
        })
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
                //debugger;
                var name = file.name;
                var fileurl = response.data;
                var jw=fileurl.substring(fileurl.lastIndexOf('.'));
                if(jw=='.bmp' || jw=='.jpg' || jw=='.gif'|| jw=='.jpeg'||jw=='.png'){
                    $("#fileShowName").append("<p>" +
                            "<img src='"+fileurl+"' height='100px' width='50' > "+
                            "<input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                            "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                            "<input type='hidden' name='attachPaths' value='" + fileurl + "'>" +
                            "<input type='hidden' name='attachNames' value='" + name + "'>" +
                            "</p>");
                }else if(jw=='.mp3'){
                    $("#yyfileShowName").append("<p>" +
                            "<audio controls>"+
                            "<source src='"+fileurl+"' type='audio/mpeg'>"+
                            "</audio>"+
                            "<input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                            "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                            "<input type='hidden' name='attachPaths' value='" + fileurl + "'>" +
                            "<input type='hidden' name='attachNames' value='" + name + "'>" +
                            "</p>");
                }else if(jw=='.mp4'){
                    $("#spfileShowName").append("<p>" +
                            "<video  width='150' height='100' controls='controls' >"+
                            "<source  src='"+fileurl+"' type='video/mp4' />"+
                            "</video>"+
                            "<input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                            "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                            "<input type='hidden' name='attachPaths' value='" + fileurl + "'>" +
                            "<input type='hidden' name='attachNames' value='" + name + "'>" +
                            "</p>");
                }
            });

            uploader.on("error", function (type) {
                if (type == "Q_TYPE_DENIED") {
                    alert("请上传"+gs+"格式文件");
                } else if (type == "F_EXCEED_SIZE") {
                    alert("单个文件大小不能超过"+singleSize/1024/1024+"M");
                }else if(type=="Q_EXCEED_NUM_LIMIT"){
                    alert("超出最大上传数量"+num-1);
                }else {
                    alert("上传错误"+type)
                }
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