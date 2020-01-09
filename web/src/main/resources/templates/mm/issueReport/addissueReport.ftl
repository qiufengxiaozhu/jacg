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
    <title>问题上报</title>
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
        .webuploader-container div {width: 86px;  height: 35px;line-height: 35px;}
        .fx-img{width: 32%;height: 2rem;margin:0.1rem 0.5%}
        .fx-img img{width: 100%;height: 100%}
    </style>
    <script>
        $(function () {
            $("form").submit(function () {
                if(checktitle()&&checkcontent()&&checkname()&&checktelephone()&&checkplace()){
                    alert("上报成功！！");
                    return true;
                }
                else {
                    alert("请完善上报信息!!!");
                    return false;
                }
//                return checktitle()&&checkcontent()&&checkname()&&checktelephone()&&checkplace();
            })
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
//
        });

        //检验标题
        function checktitle(){
            var title=$("input[name='title']").val();
            var reg_title= /^.{1,20}$/;
            var flag=reg_title.test(title)
            if(title!=null && title!='' &&flag){
                $("#sp_title2").show();
                $("#sp_title").hide();
                return true;
            }else{
                $("#sp_title").show();
                $("#sp_title2").hide();
                return false;
            }
        }

        //检验内容
        function checkcontent(){
            var content=$("input[name='description']").val();
            var reg_content= /^.{1,50}$/;
            var flag=reg_content.test(content);
            if(content!=null && content!='' &&flag){
                $("#sp_content2").show();
                $("#sp_content").hide();
                return true;
            }else{
                $("#sp_content").show();
                $("#sp_content2").hide();
                return false;
            }
        }

        //检验联系人
        function checkname(){
            var name=$("input[name='contact']").val();
            var reg_name=/^.{2,7}$/;
            var flag=reg_name.test(name);
            if (flag){
                $("#sp_name2").show();
                $("#sp_name").hide();
                return true;
            }else{
                $("#sp_name").show();
                $("#sp_name2").hide();
                return false;
            }
            return true;
        }

        //检查手机号
        function checktelephone(){
            var telephone=$("input[name='phone']").val();
            var reg_telephonr= /^(((13|14|15|18|17)\d{9}))$/;
            var flag=reg_telephonr.test(telephone);
            if (flag){
                $("#sp_telephone2").show();
                $("#sp_telephone").hide();
                return true;
            }else{
                $("#sp_telephone").show();
                $("#sp_telephone2").hide();
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
            <div class="advince">问题上报</div>
        </div>
    <form id="addadvisory" action="/mm/issueReport/addIssueReport" method="post" >
        <div class="header-img">
            <div class="ts-table">
                <div class="put">

                    <#--用户名称和电话号码-->
                    <#--<input id="userName" type="hidden" value="${Session.userName}" />-->
                    <#--<input id="userPhone" type="hidden" value="${Session.userPhone}" />-->
                    <!-- 附件上传 隐藏传值  开始 -->
                    <#--<input id="attachIdss" type="hidden" />-->
                    <!-- 附件上传 隐藏传值  结束 -->

                    <div class="theme">
                        <div class="port flex flex-c-c"><span>标题&nbsp;:</span>
                            <input type="text"  name="title" class="tab-input flex-1" placeholder="请输入您的来信标题(20字以内)">
                            <span class="sp-span2" id="sp_title2" style="color:green">√</span>
                        </div>
                        <span class="sp-span" id="sp_title">字符个数应在1-20个</span>
                    </div>



                    <div class="theme">
                        <div class="port flex flex-c-c">
                            <span style="width: auto;">文本内容描述&nbsp;:</span>
                            <input type="text" name="description" class="tab-input flex-1" placeholder="请输入文本内容描述(50字以内)">
                            <span class="sp-span2" id="sp_content2" style="color:green">√</span>
                        </div>
                        <span class="sp-span" id="sp_content">请输入11位数字</span>
                    </div>

                    <div class="theme">
                        <div class="port flex flex-c-c"><span>类型&nbsp;:</span>
                            <select name="issueQuestionType">
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
                            <input type="text" name="contact" class="tab-input flex-1" placeholder="请输入您的真实姓名" value="">
                            <span class="sp-span2" id="sp_name2" style="color:green">√</span>
                        </div>
                        <span class="sp-span" id="sp_name">请输入2-7个字符</span>
                    </div>

                    <div class="theme">
                        <div class="port flex flex-c-c"><span>联系电话&nbsp;:</span>
                        <input type="text" name="phone" class="tab-input flex-1" placeholder="请输入您的电话(11位数字)" value="${Session.userName!}">
                            <span class="sp-span2" id="sp_telephone2" style="color:green">√</span>
                        </div>
                        <span class="sp-span" id="sp_telephone">请输入11位数字</span>
                    </div>


                    <div class="form-group" style="min-height: 2rem;margin-top: 0.3rem">
                        <div style="width:100px;height: 35px;position: relative;">
                            <div id="xg_rar">上传图片附件</div>
                        </div>
                        <div id="fileShowName" style="text-align: center;margin:0 auto"></div>
                    </div>

                    <div class="form-group" style="min-height: 2rem">
                        <div style="width:100px;height: 35px;position: relative;">
                            <div id="yy">上传语音附件</div>
                        </div>
                        <div id="yyfileShowName" style="text-align: center;margin:0 auto"></div>
                    </div>

                    <div class="form-group" style="min-height: 2rem">
                        <div style="width:100px;height: 35px;position: relative;">
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
        // 定义图片、语音、视频文件的格式
        var tp="#xg_rar";
        var tpgs="bmp,jpg,png,gif,jpeg";

        var yy="#yy";
        var yygs="mp3";

        var sp="#sp";
        var spgs="mp4";

        // 页面加载即执行
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
        //            dz:文件类型  gs:文件格式 num：上传文件数量:num  单个文件大小:singleSize
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
                // 截取后缀名
                var jw=fileurl.substring(fileurl.lastIndexOf('.'));
                if(jw=='.bmp' || jw=='.jpg' || jw=='.gif'|| jw=='.jpeg'||jw=='.png'){
                    $("#fileShowName").append("<div class='flex'>" +
                            "<div class='fx-img'>"+
                            "<img src='"+fileurl+"' > "+
                            "<input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                            "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                            "<input type='hidden' name='attachPaths' value='" + fileurl + "'>" +
                            "<input type='hidden' name='attachNames' value='" + name + "'>" +
                            "</div>"+
                            "</div>");
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
            window.location.href = '/mm/wxindex/index';
        }

        //删除，删除节点
        function deleteFile(obj) {
            //
            var fid = $(obj).parent().find("input[name='fid']").eq(0).val();
            // 附件id不为空  则先判断是否是要去除第一个 ','
            if (fid != '') {
                // 前面定义了附件的id为空字符串
                var str = $("#attachIdss").val() + "," + fid;
                // 如果 ','处于第一位(第一次添加附件)，那么就新的字符串从一开始截取
                if (str.indexOf(",") == 0) {
                    str = str.substr(1);
                }
                // 不是第一次添加，，就不需要去除第一个 开始的 ','
                $("#attachIdss").val(str);
            }
            // 为空  则不需要进行判断
            $(obj).parent().remove();
        }

        // 问题上报成功提示语
//        function check() {
//            if(checktitle()){
//                alert("成功");
//            }else {
//                alert("上报成功！！");
//            }
//        }
    </script>
</body>
</html>