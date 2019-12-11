<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>内容列表</title>
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link href="/css/third/bootstrap.min.css" rel="stylesheet">
    <link href="/css/third/font-awesome.min.css" rel="stylesheet">
    <link href="/css/third/custom.css" rel="stylesheet">
    <link href="/css/third/layers/default/layer.css" rel="stylesheet">
    <link href="/css/third/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/third/animate.min.css" rel="stylesheet">
    <link href="/css/third/sweetalert.css" rel="stylesheet"/>
    <link href="/css/third/toastr.min.css" rel="stylesheet"/>
    <link href="/css/style.min.css" rel="stylesheet">
    <link href="/css/third/zTree/zTreeStyle/zTreeStyle.css" rel="stylesheet">
    <link href="/css/third/webuploader.css" rel="stylesheet">
    <link href="/css/admin/avatar.css" rel="stylesheet">
    <link href="/css/third/bootstrap-select.css" rel="stylesheet">

    <style>
        .webuploader-container div {
            width:80px;
        }
        .dropdown-menu.open .inner.open{height:200px}
        .dropdown-menu.open{width: 100%;}
    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="ibox-content form-inline z-relative">
                    <div class='col-sm-12'>
                    <@hasPermission name="likeMenu:like:create">
                        <button class='btn btn-success' data-toggle='modal' id="add-btn">
                            新建
                        </button>&nbsp;&nbsp;
                    </@hasPermission>
                    <@hasPermission name="likeMenu:like:batchDelete">
                        <button class='btn btn-success btn-danger' id="delete-items">
                            批量删除
                        </button>
                    </@hasPermission>
                        <div class='querybtn my-querybtn'>
                            <input type='text' name='search' id='search_name' placeholder='请输入标题' class='form-control search-input'>
                            <input type="text" name="validStartTime" maxlength="64" id="validStartTime" placeholder="有效开始时间" class="form-control search-input">
                            <input type="text" name="validStopTime" maxlength="64" id="validStopTime" placeholder="有效结束时间" class="form-control search-input">
                            <#--<input type="text" name="likeStratTime" maxlength="64" id="likeStratTime" placeholder="开始点赞时间" class="form-control search-input">-->
                            <#--<input type="text" name="likeStopTime" maxlength="64" id="likeStopTime" placeholder="结束点赞时间" class="form-control search-input">-->
                            <button class='btn btn-primary mgl my-mgl research-btn' >
                                搜索
                            </button>&nbsp;&nbsp;
                        </div>
                    </div>
                    <div id='search' class='search-group' style='display:none;'>


                    </div>
                    <table id="post-list-table" class="table my-table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>标题</th>
                            <#--<th>内容</th>-->
                            <th>发布状态</th>
                            <th>有效时间</th>
                            <th>点赞数</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<#--以下是模态框-->
<div class="modal inmodal fade modal-form" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">添加</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body fix-height" >
                <#--表单-->
                    <form class="form-horizontal" id="post_form">
                        <input type="hidden" name="id" id="id">
                        <!-- 附件上传 隐藏传值  开始 -->
                        <input id="attachIdss" type="hidden" />
                        <!-- 附件上传 隐藏传值  结束 -->
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">标题：</label>
                            <div class="col-sm-6">
                                <input type="text" name="title" maxlength="64" id="title" placeholder="标题" class="form-control" autocomplete="off">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">有效时间：</label>
                            <div class="col-sm-6">
                                <input type="text" name="validTime" maxlength="64" id="validTime" placeholder="有效时间" class="form-control search-input" autocomplete="off">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">内容：</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" rows="5" cols="" name="content" id="content"></textarea>
                            </div>
                        </div>
                        <div class="form-group" style="">
                            <label class="col-sm-3 control-label my-control-label">附件：</label>
                            <div id="fileList" class="uploader-list"></div>
                            <div style="width:80;height: 35px;position: relative;margin:0 auto">
                               <p id="">附件只支持jpg,png,gif,mp4,MP3,(mp4文件大小请<80MB)</p>
                                <div id="xg_rar">上传附件</div>
                            </div>
                            <div id="fileShowName" style="text-align: center;margin:0 auto"></div>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <input type="hidden" id="add-type">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="save-btn">保存</button>
                </div>
            </small>
        </div>
        <small class="font-bold">
        </small>
    </div>
    <small class="font-bold">
    </small>
</div>


<script src="/js/third/jquery.min.js"></script>
<script src="/js/pluginInit/animation.js"></script>
<script src="/js/third/bootstrap.min.js"></script>
<script src="/js/third/jquery.validate.min.js"></script>
<script src="/js/third/jquery.dataTables.min.js"></script>
<script src="/js/third/dataTables.bootstrap.js"></script>
<script src="/js/third/layer/layer.min.js"></script>
<script src="/js/third/icheck.min.js"></script>
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script src="/js/third/laydate/laydate.js"></script>
<script src="/js/pluginInit/dataecho.js"></script>
<script src="/js/third/laydate/laydate.js"></script>
<script src="/js/zudp.js"></script>
<script type="text/javascript" src="/js/third/jquery.ztree.all.js"></script>
<script src="/js/third/bootstrap-suggest.min.js"></script>
<script src="/js/sys/avatar.js"></script>
<script src="/js/third/webuploader.js"></script>
<script src="/js/rest.js"></script>


<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
<script>


    findList();

    var dataTable;
    var urlstr="/api/like";
    var formIdStr="#post_form";
    var sys_url=window.location.host;

    //时间插件
    //执行一个laydate实例



    //初始化百度富文本框  id='content'
    var ue = UE.getEditor('content',{

        // initialFrameWidth :800,//设置编辑器宽度

        initialFrameHeight:300,//设置编辑器高度

        scaleEnabled:true});

    UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
    UE.Editor.prototype.getActionUrl = function(action) {
        if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadimage' || action == 'uploadvideo' || action == 'uploadfile') {
            return '/Ueditors/uploadimage';//指定访问路径
        } else {
            return this._bkGetActionUrl.call(this, action);
        }


    }
    //获得编辑器带格式的内容
    function getContent() {
        return UE.getEditor('content').getContent();
    }
    //获得编辑器的纯文本内容
    function getContentTxt() {
        return UE.getEditor('content').getContentTxt();
    }
    /**
     * //初始化百度富文本框  id='content'  end
     */

    $(document).ready(function () {
        laydate.render({
            elem: '#validTime' //指定元素
            ,change: function(value){
                $('#validTime').val(value);
            }
        });
        //开始有效时间  搜索框
        laydate.render({
            elem: '#validStartTime' //指定元素
            ,format: 'yyyy/MM/dd'
            ,done: function(value, date, endDate){
                $("#validStartTime").val(value);
            }
        });
        //结束有效时间  搜索框
        laydate.render({
            elem: '#validStopTime' //指定元素
            ,format: 'yyyy/MM/dd'
            ,done: function(value, date, endDate){
                $("#validStopTime").val(value);
            }
        });
        //点赞时间  搜索框
        laydate.render({
            elem: '#likeTime' //指定元素
            ,range: true
            ,change: function(value){
                $('#likeTime').val(value);
            }
        });
        $("#post_form").validate({
            rules: {
                name:{
                    required:true,
                    remote: {
                        url:"/api/like",
                        type:"post",
                        data: {
                            "title":function () {
                                return $("#title").val();
                            },
                            "id":function () {
                                return $("#id").val();
                            }

                        },
                        dataFilter: function(data, type) {
                            var da=JSON.parse(data).data;
                            if(zudp.util.isBoolean(da)){
                                return da;
                            }else{
                                return false;
                            }

                        }
                    }
                },


                mark:{
                    rangelength:[0,1000]
                }
            },
            messages: {
                name: {
                    required: "请输入标题",
                    remote: "标题已存在"
                },
//                identification: {
//                    required: "请输入岗位标识",
//                    remote: "岗位标识已存在"
//                },
                mark: {
                    rangelength:"字符个数不能超过1000"
                }
            },ignore: []
        });

        findList();
        var setValFun = function () {
            $("#xg_rar").html('上传附件');
            $("#fileShowName").html('');
            $("#attachIdss").val('');
            //清空文本框内容
            UE.getEditor('content').setContent("");
            //初始化上传工具
            initUpload();
        };
        var setOtherVal = function () {

            var id = $(formIdStr).find("input[name='id']").eq(0).val();
            //取值回显
            zudp.ajax(urlstr + "/" + id).get("").then(function (data) {
                dataEcho(formIdStr, data);
                if(data.content!=null && data.content.length>0){
                    UE.getEditor('content').setContent(data.content);
                }else{
                    UE.getEditor('content').setContent("");
                }

                var d = data;
                var attachPaths = d.attachPaths;
                var attachNames = d.attachNames;
                var attachIds = d.attachIdss;
                var tmpAttachPath = "";
                if (attachPaths) {
                    for (var i = 0; i < attachPaths.length; i++) {
                        tmpAttachPath += "<p>" +
                                "<a href='//" + sys_url + "/" + attachPaths[i] + "' download='" + attachNames[i] + "'>" +
                                attachNames[i] + "</a>" +
                                "<input type='hidden' name='fid' value='" + attachIds[i] + "'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                                "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                                "<input type='hidden' name='attachPathed' value='" + attachPaths[i] + "'>" +
                                "<input type='hidden' name='attachNameed' value='" + attachNames[i] + "'>	" +
                                "</p>";
                    }
                }
                var date = new Date(data.validTime);
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
                $("#validTime").val(y + '-' + m + '-' + d);
                $("#fileShowName").html(tmpAttachPath);//附件赋值
            }, function (error) {
            });

            $("#xg_rar").html('上传附件');
            //附件控件
            initUpload();

        };
        var saveFormFun = function () {
            if ($(formIdStr).valid()) {
                var data = zudp.util.formData2json("form");
                data = $.parseJSON(data);
                var attachPaths = getAttachPath();//附件路径传参
                var attachNames = getAttachName();//附件名称 传参
                var attachIdss = getAttachIdss();//要删除掉的ids
                data.attachPaths = attachPaths;
                data.attachNames = attachNames;
                data.attachIdss = attachIdss;
                data.content=getContent();
                data.contentnohtml=getContentTxt();
                data = JSON.stringify(data);
                var mymesg = "新建";
                if ($("#id").val() != '') {
                    mymesg = "修改";
                }

                zudp.ajax(urlstr).post(data).then(function (da) {

                    zudp.plugin.dialog("success").alert(mymesg + "成功" + "！", "提示");
                    dataTable.ajax.reload();
                    $(".modal-form").modal("hide");
                });
            }
        };
        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}内容",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value'],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"],
            addBtnFun: setValFun,
            editBtnFun: setOtherVal,
            saveForm: saveFormFun,

        };


        //初始化增删改查参数
        initForm(obj);

    });

    //提示
    function swalFunction(a,b,c) {
        swal({
            title: a,
            showCancelButton: true,
            cancelButtonText: "取消",
            confirmButtonColor: "#DD6B55",
            confirmButtonText: c,
        },b);
    }

    // 发布  改变状态为发布状态
    $(document).on("click", '#publishStr', function (e) {

        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }
        //获取到id
        var id = $("#publishStr").val();
        zudp.ajax("/api/like/updatePublish").post(id).then(function (value) {
            // 刷新页面
            document.location.reload();
        });
    });

    // 撤销发布
    $(document).on("click", '#noPublishStr', function (e) {

        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }
        //获取到id
        var id = $("#noPublishStr").val();
        zudp.ajax("/api/like/updateNoPublish").post(id).then(function (value) {
            document.location.reload();
        });
    });

    //列表数据初始化方法
    function findList() {

        var urls="/api/like";
        dataTable=zudp.plugin.table('#post-list-table')
                .url(urls)
                .search(function () {
                    return {
                        "title":$("#search_name").val(),
                        "validStartTime":$("#validStartTime").val(),
                        "validStopTime":$("#validStopTime").val()
                    }
                })
                .columns( [
                    {data: 'id',visible: false},
                    {data: 'title'},
                   // {data: 'content'},
                    {
                        render: function (data, type, row) {
                            if(data.publishStatus == "0"){ // 报警
                                return "未发布";
                            }
                            else if(data.publishStatus == "1"){
                                return "已发布";
                            }
                        }
                    },
                    {
                        render: function (data, type, row) {
                            var date = new Date(data.validTime);
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
                            return y + '-' + m + '-' + d;
                        }
                    },
                    {data: 'likeNum'},
                    {
                        render: function (data, type, row) {
                            var btn = "";
                            var editstr="";
                            var  delstr="";
                            var publish = "";
                            if(data.publishStatus == "0"){ // 报警
                                editstr=zudp.template.editBtn;
                                delstr=zudp.template.delBtn;
                                publish = '<button id= "publishStr" class="btn btn-info btn-sm "  value="{id}"><i class="fa fa-pencil"></i>发布</button>';
                                btn += editstr+delstr+publish;
                                return zudp.util.render(btn, row);
                            }
                            else if(data.publishStatus == "1"){
                                editstr=zudp.template.editBtn;
                                delstr=zudp.template.delBtn;
                                publish = '<button id= "noPublishStr" class="btn btn-info btn-sm "  value="{id}"><i class="fa fa-pencil"></i>取消发布</button>';
                                btn += editstr+delstr+publish;
                                return zudp.util.render(btn, row);
                            }


                        }
                    }
                ])
                .then();

    }

    function initUpload(){
        var uploader = WebUploader.create({
            // swf文件路径
            swf: '/css/third/Uploader.swf',
            auto: true,
            // 文件接收服务端。
            server: '/upload/custom',

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#xg_rar',

            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false,
            //重复上传
            duplicate :true,
            accept:{
                extensions:'jpg,png,gif,mp4,MP3',
                title:'file',
                mimeTypes:'*/*'
            }
        });

        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on( 'uploadSuccess', function( file,response) {
            //debugger;
            var name = file.name;
            var fileurl = response.data;
            $("#fileShowName").append("<p>" +
                    "<a  src='//"+sys_url+"/"+fileurl+"' download='"+name+"'>"+name+"</a>" +
                    "<input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                    "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                    "<input type='hidden' name='attachPath' value='"+fileurl+"'>" +
                    "<input type='hidden' name='attachName' value='"+name+"'>" +
                    "</p>");
            //change(response);
        });


        uploader.on( 'uploadError', function( file ) {
            var name = file.name;
            $("#fileShowName").append("<p>上传失败</p>"); //change(response);
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
