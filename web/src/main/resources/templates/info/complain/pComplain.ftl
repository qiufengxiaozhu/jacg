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
                        <div class='querybtn my-querybtn'>
                            <input type='text' name='search' id='search_title' placeholder='请输入标题' class='form-control'>
                            <button class='btn btn-primary mgl my-mgl research-btn' >
                                搜索
                            </button>&nbsp;&nbsp;
                            <button class="btn btn-success select-query">高级搜索</button>
                        </div>
                    </div>
                    <div id="search" class="search-group" style="display:none;">
                        <div class="form-group z-group">
                            <div class="col-sm-12 z-group-pane">
                                <label class="control-label my-control-label">联系人：</label>
                                <input type='text' name='search' id='search_contact' placeholder='请输入联系人' class='form-control search-input'>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-12">
                                <label class="control-label my-control-label">联系人手机：</label>
                                <input type='text' name='search' id='search_phone' placeholder='请输入联系人手机' class='form-control search-input'>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-12">
                                <label class="control-label my-control-label">开始时间：</label>
                                <input type='text' name='search' id='start_time' placeholder="开始时间" startDate onfocus="this.blur()" class='form-control search-input'>
                                <label class="control-label my-control-label">结束世间：</label>
                                <input type='text' name='search' id='end_time' placeholder="结束时间" endDate onfocus="this.blur()" class='form-control search-input'>
                            </div>
                        </div>
                        <button class="btn btn-primary mgl my-mgl clear-input" >清空</button>&nbsp;&nbsp;
                    </div>
                    <table id="public-list-table" class="table my-table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>标题</th>
                            <th>类型</th>
                            <th>创建时间</th>
                            <th>回复状态</th>
                            <th>回复时间</th>
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
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">标题：</label>
                            <div class="col-sm-6">
                                <input type="text" name="title" maxlength="64" id="title" placeholder="标题" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">问题描述：</label>
                            <div class="col-sm-6">
                                <textarea name="description" maxlength="64" id="description" placeholder="问题描述" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group"><!-- 投诉/建议 分类 -->
                            <label class="col-sm-3 control-label my-control-label ">投诉类别：</label>
                            <div class="col-sm-6">
                                <label class="checkbox-inline col-sm-3">
                                    <input type="radio" name="type" id="optionsRadios3" value="0" checked> <b>投诉</b>
                                </label>
                                <label class="checkbox-inline col-sm-3">
                                    <input type="radio" name="type" id="optionsRadios4" value="1"> <b>建议</b>
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">联系人：</label>
                            <div class="col-sm-6">
                                <input type="text" name="contact" maxlength="64" id="contact" placeholder="联系人" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">联系电话：</label>
                            <div class="col-sm-6">
                                <input type="text" name="phone" maxlength="64" id="phone" placeholder="联系电话" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">创建时间：</label>
                            <div class="col-sm-6">
                                <input type="text" name="complainDate" id="complainDate" placeholder="创建时间" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label" id="label-reply-status">回复状态：</label>
                            <div class="col-sm-6">
                                <input type="text" name="replyStatus" id="replyStatus" placeholder="回复状态" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label" id="label-reply-date">回复时间：</label>
                            <div class="col-sm-6">
                                <input type="text" name="replyDate" id="replyDate" placeholder="回复时间" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label" id="label-reply-content">回复内容：</label>
                            <div class="col-sm-6">
                                <textarea name="replyContent" id="replyContent" placeholder="回复内容" class="form-control"></textarea>
                            </div>
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
<script src="/js/pluginInit/laydateInit.js"></script>
<script>

    var dataTable;
    var urlstr="/api/p";
    var formIdStr="#post_form";
    var sys_url=window.location.host;
    $(document).ready(function () {
        //校验
        findList();

        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: [],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"]
        };

        //初始化增删改查参数
        initForm(obj);
    });

    function disabledInput(obj) {
        var id = $(obj).val();
        zudp.ajax("/api/p/" + id).get("").then(function (data) {
            $(".modal").find("*[name]").prop("disabled", false);
            //当未回复时，id， replyContent， replyStatus 不设置禁用
            //当已回复时，大多数字段禁用
            //设置禁用
            var disabledList = $(".modal").find("*[name]");
            var noDisabled = new Array("id");//不禁用字段
            if (data.replyStatus == "未回复") {
                noDisabled.push("replyStatus", "replyContent");
                //设置readonly
                $(".modal").find("[name = 'replyStatus']").attr("readonly", "readonly");
                $(".modal #save-btn").show();
            }
            if (data.replyStatus == '已回复') {

                $(".modal #save-btn").hide();
            }
            for (var i = 0; i < disabledList.length; i++) {
                if (noDisabled.indexOf($(disabledList[i]).attr("name")) == -1)
                    $(".modal form").find("[name=" + $(disabledList[i]).attr("name") + "]").attr("disabled", true);
            }
        });
    }

    Date.prototype.format = function(fmt) {
        var o = {
            "M+" : this.getMonth()+1, //月份
            "d+" : this.getDate(), //日
            "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时
            "H+" : this.getHours(), //小时
            "m+" : this.getMinutes(), //分
            "s+" : this.getSeconds(), //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S" : this.getMilliseconds() //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    };

    //列表数据初始化方法
    function findList() {
        var urls="/api/p";
        dataTable=zudp.plugin.table('#public-list-table')
                .url(urls)
                .search(function () {
                    return {
                        "title": $("#search_title").val(),
                        "phone": $("#search_phone").val(),
                        "contact": $("#search_contact").val(),
                        "startTime": $("#start_time").val(),
                        "endTime": $("#end_time").val()
                    }
                })
                .columns( [
                    {data: 'id', visible: false},
                    {data: 'title'},
                    {data: 'type',
                        render: function (data, type, row) {
                            var temp="";
                            if(data == '0'){
                                temp = "投诉";
                            }
                            if(data == '1'){
                                temp = "建议";
                            }
                            return temp;
                        }
                    },
                    {data: 'complainDate'},
                    {data: 'replyStatus'},
                    {data: 'replyDate',
                        render: function (data, type, row) {
                            var temp = data;
                            if (typeof (temp) === "number") {
                                temp = new Date(data).format("yyyy-MM-dd HH:mm:ss");
                            }
                            return temp;
                        }},
                    {
                        render: function (data, type, row) {
                            var btn = "";
                            var editstr = "";
                            var detailstr = "";
//                            var detailstr = "";

//                            detailstr = '<button onclick="getDepartment(this)" class="btn btn-info btn-sm row-detail" value="{id}"><i class="fa fa-pencil"></i>详情</button>&nbsp;&nbsp;';

                            detailstr = '<button class="btn btn-success btn-sm row-detail" value="{id}"><i class="fa fa-pencil"></i>详情</button>&nbsp;&nbsp;';

                            editstr='<button onclick="disabledInput(this)" class="btn btn-danger btn-sm row-edit updateOpBtn" value="{id}"><i class="fa fa-pencil"></i>回复</button>';

                            btn +=  detailstr + editstr ;
                            return zudp.util.render(btn, row);
                            //return "";
                        }
                    }
                ])
                .then();
    }

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
            $("#fileShowName").append("<p><a href='//"+sys_url+"/"+fileurl+"' download='"+name+"'>"+name+"</a><input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;<span style='color:red' onclick='deleteFile(this)'>删除</span><input type='hidden' name='attachPath' value='"+fileurl+"'><input type='hidden' name='attachName' value='"+name+"'>	</p>");

            //change(response);
        });
    }

</script>
</body>
</html>
