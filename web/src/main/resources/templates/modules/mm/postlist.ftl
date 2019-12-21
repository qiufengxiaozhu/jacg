<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>岗位管理</title>
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
                    <@hasPermission name="oaManager:post:create">
                        <button class='btn btn-success' data-toggle='modal' id="add-btn">
                            新建
                        </button>&nbsp;&nbsp;
                    </@hasPermission>
                    <@hasPermission name="oaManager:post:batchDelete">
                        <button class='btn btn-success btn-danger' id="delete-items">
                            批量删除
                        </button>
                    </@hasPermission>
                        <div class='querybtn my-querybtn'>
                            <input type='text' name='search' id='search_name' placeholder='请输入名称' class='form-control search-input'>
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
                            <th>岗位名称</th>
                            <#--<th>岗位标识</th>-->
                            <th>岗位描述</th>
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
                            <label class="col-sm-3 control-label my-control-label ">岗位名称：</label>
                            <div class="col-sm-6">
                                <input type="text" name="name" maxlength="64" id="name" placeholder="岗位名称" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                        <#--<div class="form-group">-->
                            <#--<label class="col-sm-3 control-label my-control-label ">岗位标识：</label>-->
                            <#--<div class="col-sm-6">-->
                                <#--<input type="text" name="identification" maxlength="64" id="identification" placeholder="岗位标识" class="form-control">-->
                            <#--</div>-->
                            <#--<div>-->
                                <#--<i class="i_context my-i_context">*</i>-->
                            <#--</div>-->
                        <#--</div>-->
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">内容：</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" rows="5" cols="" name="content" id="content"></textarea>
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">描述：</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" rows="5" cols="" name="mark" id="mark"></textarea>
                            </div>

                        </div>
                        <div class="form-group" style="">
                            <label class="col-sm-3 control-label my-control-label">附件：</label>
                            <div style="width:80;height: 35px;position: relative;margin:0 auto">
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
 
    var dataTable;
    var urlstr="/api/post";
    var formIdStr="#post_form";
    var sys_url=window.location.host;

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

        $("#post_form").validate({
            rules: {
                name:{
                    required:true,
                    remote: {
                        url:"/api/post/checkName",
                        type:"get",
                        data: {
                            "name":function () {
                                return $("#name").val();
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
                    required: "请输入岗位名称",
                    remote: "岗位名称已存在"
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
            title: "{type}岗位",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value'],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"],
            addBtnFun: setValFun,
            editBtnFun: setOtherVal,
            saveForm: saveFormFun

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

        var urls="/api/post";
        dataTable=zudp.plugin.table('#post-list-table')
                .url(urls)
                .search(function () {
                    return {
                        "name":$("#search_name").val()

                    }
                })
                .columns( [
                    {data: 'id', visible: false},

                    {data: 'name'},
//                    {data: 'identification'},
                    {data: 'mark',render:function(data, type, row){
                        if(data==null){
                            data="";
                        }
                        var suf="...";
                        if(data!=null && data.length<20){
                            suf="";
                        }
                            var ah="<a title='"+data+"'>"+data.substr(0,20)+suf+"</a>";
                        return ah;
                     }

                    },
                    {
                        render: function (data, type, row) {
                            var btn = "";
                            var editstr="";
                            var  delstr="";
                           <@hasPermission name="oaManager:post:update">
                                   editstr=zudp.template.editBtn;
                           </@hasPermission>
                          <@hasPermission name="oaManager:post:delete">
                              delstr=zudp.template.delBtn;
                          </@hasPermission>
                            btn += editstr+delstr;
                            return zudp.util.render(btn, row);
                            //return "";
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
                extensions:'bmp,jpg,png,rar,gif,zip,xls,xlsx,doc,docx',
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
                    "<a href='//"+sys_url+"/"+fileurl+"' download='"+name+"'>"+name+"</a>" +
                    "<input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                    "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                    "<input type='hidden' name='attachPath' value='"+fileurl+"'>" +
                    "<input type='hidden' name='attachName' value='"+name+"'>" +
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
        });
        return tempAttachName;
    }

    //获取所有附件Ids
    function getAttachIdss() {
        var tempAttachIdss = [];
        var fid = $("input[name='fid']");
        $.each(fid, function (k, v) {
            tempAttachIdss.push(v);
        });
        return tempAttachIdss;
    }

</script>
</body>
</html>
