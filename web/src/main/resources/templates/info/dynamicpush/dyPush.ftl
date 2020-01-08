<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>动态推送</title>
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
        /*滚动条的设置*/
        ::-webkit-scrollbar-thumb {
            background-color:#dddddd;
        }
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

                    <@hasPermission name="oaManager:riverManager:river:create">
                        <button class='btn btn-success' data-toggle='modal' id="add-btn">
                            新建
                        </button>&nbsp;&nbsp;
                    </@hasPermission>

                    <@hasPermission name="oaManager:riverManager:river:batchDelete">
                        <button class='btn btn-success btn-danger' id="delete-items">
                            批量删除
                        </button>
                    </@hasPermission>

                        <div class='querybtn my-querybtn'>
                            <input type='text' name='title' id='search_name' placeholder='请输入推送标题' class='form-control search-input'>
                            <input type="text" name="startTime" id="startTime" startDate placeholder="推送开始时间" class="form-control">
                            <input type="text" name="endTime" id="endTime" endDate placeholder="推送结束时间" class="form-control">

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
                            <th>推送标题</th>
                            <th>内容</th>
                            <th>推送时间</th>
                            <th>状态</th>
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
                    <form class="form-horizontal dyClass" id="dy_form">
                        <input type="hidden" name="id" id="id">

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">推送标题：</label>
                            <div class="col-sm-6">
                                <input type="text" name="title" maxlength="64" id="title" placeholder="推送标题" class="form-control"id="title">
                            </div>
                            <div>
                                <i class="i_context my-i_context" id="titId">*</i>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">内容：</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" rows="5" cols="" name="contents" id="contents"></textarea>
                            </div>
                            <div>
                                <i class="i_context my-i_context" id="conId">*</i>
                            </div>

                        </div>


                    </form>
                </div>

                <div class="modal-footer">

                <div class="modal-footer testSave02" style="float: right">
                    <button type="button" class="btn btn-primary" id="save-btn-test" style="float: right">保存</button>
                    </div>
                <div class="modal-footer testSave" style="float: right">
                    <button type="button" class="btn btn-primary" id="save-btn" style="float: right">保存</button>
                    </div>
                    <div class="modal-footer" style="float: right">
                        <button type="button" class="btn btn-white" data-dismiss="modal" style="float: right">关闭</button>
                    </div>
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

<script src="/js/pluginInit/laydateInit.js"></script>

<script src="/js/pluginInit/laydateInit.js"></script>

<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
<script>

    var dataTable;
    var urlstr="/api/dyPush";
    var formIdStr="#dy_form";
    var sys_url=window.location.host;

// 点击新建  隐藏自带的保存按钮
    $(document).on("click", '#add-btn', function (value) {
        // 恢复富文本框的编辑功能
        ue.setEnabled();
        // save-btn-test save-btn
        $(".testSave").css("display","none");
        $(".testSave02").css("display","block");

//        $("#save-btn").hide();
//        $("#save-btn-test").hide();
        UE.getEditor('contents').setContent("");
        dataTable.ajax.reload();


    });



    //初始化百度富文本框  开始  id='content'
    var ue = UE.getEditor('contents',{

        // initialFrameWidth :800,//设置编辑器宽度

        initialFrameHeight:300,//设置编辑器高度

        scaleEnabled:true});

    // 实现在新增的时候出现图片
    UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
    UE.Editor.prototype.getActionUrl = function(action) {
        if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadimage' || action == 'uploadvideo' || action == 'uploadfile') {
            return '/Ueditors/uploadimage';//指定访问路径
        } else {
            return this._bkGetActionUrl.call(this, action);
        }


    }

    /**
     * 初始化  富文本结束
     */

    //  新建     信息到数据库中 将带格式 和不带格式的数据都存储到数据库中
        $(document).on("click", '#save-btn-test', function (value) {
            $(".testSave").css("display","none");
            $(".testSave02").css("display","block");
        // 带格式的内容
        var contents = UE.getEditor('contents').getContent();
        // 纯文本内容
        var contentsText = UE.getEditor('contents').getContentTxt();
        // 获取到表单的数据
        var title = $("#title").val();
//        var contents = $("#contents").val();
        var data = {
            contents : contents,
        contentsText : contentsText,
                title: title
    };
        data = JSON.stringify(data);
        zudp.ajax("/api/dyPush/insert02").post(data).then(function (value) {
            dataTable.ajax.reload();
            $("#myModal5").modal("hide");

        });

    });


// 详情  富文本框的信息
        $(document).on("click", '#detailId', function (value) {
            $(".testSave02").css("display","none");
            $(".testSave").css("display","block");
        // 获取自带的按钮的id值时候，不需要转成json字符串，已经转了
        var id = $("#detailId").val();
//            id = JSON.stringify(id);
        zudp.ajax(urlstr + "/getDetail").post(id).then(function (data) {
            if (data.contents != null && data.contents.length > 0) {
                UE.getEditor('contents').setContent(data.contents);
            } else {
                UE.getEditor('contents').setContent("");
            }
           ue.setDisabled();

        });
    });


        // 编辑   获取到富文本框的信息
    $(document).on("click", '#editId', function (value) {
        ue.setEnabled();
        $(".testSave02").css("display","none");
        $(".testSave").css("display","block");
        // 获取自带的按钮的id值时候，不需要转成json字符串，已经转了
        var id = $("#editId").val();
//            id = JSON.stringify(id);
        zudp.ajax(urlstr + "/getDetail").post(id).then(function (data) {
            if (data.contents != null && data.contents.length > 0) {
                UE.getEditor('contents').setContent(data.contents);
            } else {
                UE.getEditor('contents').setContent("");
            }
//            ue.setDisabled();
//            location.reload();
        });
    });

    $(document).on("click", '#save-btn-test', function (e) {
        $("dy_form").submit(function () {
        if(checktitle() && checkcontents()){
            return true;
        }
        else {
            return false;
        }
        })
    });






    $(document).ready(function () {



        findList();

        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}",
            success: "{msg}",
            error: "{msg}",
            disabledName: ["type", 'value'],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"]

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


    //列表数据初始化方法
    function findList() {

        var urls="/api/dyPush";
        dataTable=zudp.plugin.table('#post-list-table')
                .url(urls)
                .search(function () {
                    return {
                        // 查询条件
                        "title":$("#search_name").val(),
                        "startTime" :$("#startTime").val(),
                        "endTime" :$("#endTime").val()

                    }
                })
                .columns( [
                    {data: 'id', visible: false},
                    {data: 'title',width:'20%'},
                    {data: 'contentsText',width:'37%'},
//                    {data: 'pushTime'},
                    {
                        data: 'pushTime',width:'15%',
                        render: function (data, type, row) {
                            if (data == null) { // 就是没有推送  也就不存在推送时间
                                return "无";
                            } else {
                                return data;
                            }
                        }
                    },

//                    {data: 'status'},
                    {
                        data: 'status',width:'5%',
                        render: function (data, type, row) {
                            if (data == '0') { // 未推送
                                return "未推送";
                            } else {
                                return "已推送";
                            }
                        }
                            },

                {
                    render: function (data, type, row) {
                        var btn = "";
                        var btn02 ="";
                        // 详情
                        var detailstr = "";
                        // 编辑
                        var editstr = "";
                        // 推送
                        var pushstr ="";
                        // 删除
                        var delstr = "";
                        // 撤销推送
                        var unpushstr="";

                       // 详情
                        detailstr= '<button class="btn btn-info btn-sm row-detail" value="{id}" onclick="editTest()" id ="detailId"><i class="fa fa-pencil"></i>详情</button>&nbsp;';
                        // 编辑
                        editstr= '<button class="btn btn-primary btn-sm row-edit updateOpBtn" value="{id}" id = "editId"><i class="fa fa-pencil"></i>编辑</button>&nbsp;';
                       // 删除
                        delstr =zudp.template.delBtn;
                        // 推送
                        pushstr = '<button class="btn btn-info btn-sm" value="{id}" id = "pushId"><i class="fa fa-pencil"></i>推送</button>&nbsp;';
                        // 撤销推送
                        unpushstr = '<button class="btn btn-info btn-sm  btn-danger " value="{id}" id = "unpushId"><i class="fa fa-pencil"></i>撤销推送</button>&nbsp;';
                          //    详情      编辑    删除   推送    撤销推送
                        // 未推送状态
                        btn += detailstr +editstr+delstr+pushstr;
                        // 推送状态
                        btn02 += detailstr+unpushstr;


                        if(data.status == '0'){ // 未推送
                            return zudp.util.render(btn, row);
                        }else {
                            // 推送状态
                            return zudp.util.render(btn02, row);
                        }
                    }
                }
                ])
                .then();

    }


    // 检验标题
    function checktitle(){
        var title=$("input[name='title']").val();
        var reg_title= /^.{1,20}$/;
        var flag=reg_title.test(title)
        if(title!=null && title!='' &&flag){
//            $("#sp_title").css("color","green").html("√");
            return true;
        }else{
            $("#titId").css("color","red").html("字符个数应在1-20个");
            return false;
        }
    }

    //检验内容
    function checkcontents(){
        var content=$("input[name='contents']").val();
        var reg_content= /^.{1,50}$/;
        var flag=reg_content.test(content);
        if(content!=null && content!='' &&flag){
//            $("#sp_content").css("color","green").html("√");
            return true;
        }else{
            $("#conId").css("color","red").html("字符个数应在1-50个");
            return false;
        }
    }


    // 推送
    $(document).on("click", '#pushId', function (e) {

        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }
        //获取到id  内置的按钮的id 不需要使用stringify。
        var id = $("#pushId").val();

        zudp.ajax("/api/dyPush/updateStatus").post(id).then(function (value) {
            // 刷新页面
//            document.location.reload();
            dataTable.ajax.reload();
        });
    });





    // 撤销推送
    $(document).on("click", '#unpushId', function (e) {

        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }
        //获取到id  内置的按钮的id 不需要使用stringify。
        var id = $("#unpushId").val();

        zudp.ajax("/api/dyPush/updateStatus02").post(id).then(function (value) {
            // 刷新页面
//            document.location.reload();
            dataTable.ajax.reload();
        });
    });








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
                extensions:'bmp,jpg,png,rar,gif,zip,xls,xlsx,doc,docx',
                title:'file',
                mimeTypes:'*/*'
            }
        });

        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on( 'uploadSuccess', function( file,response) {
            //;
            var name = file.name;
            var fileurl = response.data;
            $("#fileShowName").append("<p><a href='//"+sys_url+"/"+fileurl+"' download='"+name+"'>"+name+"</a><input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;<span style='color:red' onclick='deleteFile(this)'>删除</span><input type='hidden' name='attachPath' value='"+fileurl+"'><input type='hidden' name='attachName' value='"+name+"'>	</p>");

            //change(response);
        });
    }
</script>
</body>
</html>
