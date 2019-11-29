<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>问卷调查管理</title>
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
                    <@hasPermission name="oaManager:riverManager:river:create">
                        <button class='btn btn-success' data-toggle='modal_a' id="add-btn">
                            新建
                        </button>&nbsp;&nbsp;
                    </@hasPermission>


                    <@hasPermission name="oaManager:riverManager:river:batchDelete">
                    <button class='btn btn-success btn-danger' id="delete-items">
                    批量删除
                    </button>
                    </@hasPermission>

                    <#--搜索条件(用于模糊查询)  名称 标题 上报人  -->
                        <div class='querybtn my-querybtn'>
                            <input type='text' name='name' id='search_name' placeholder='请输入题目内容' class='form-control search-input'>

                            <button class='btn btn-primary mgl my-mgl research-btn' >
                                搜索
                            </button>&nbsp;&nbsp;

                        </div>
                    </div>
                    <div id='search' class='search-group' style='display:none;'>


                    </div>
                    <table id="list-table" class="table my-table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>题目内容</th>
                            <th>题目类型</th>
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




<#--新增题目 模态框-->
<div class="modal_a inmodal fade modal-form" id="add-btn" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">添加</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body fix-height" style="height: 350px">
                <#--表单-->
                    <form class="form-horizontal" id="post_form">
                      <#--  <input type="hidden" name="id" id="id">-->

                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label ">题目内容：</label>
                                <div class="col-sm-6">
                                    <input type="text" name="contents" maxlength="64" placeholder="题目内容" class="form-control">
                                </div>
                                <div>
                                    <i class="i_context my-i_context">*</i>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label ">题目类型：</label>
                                <div class="col-sm-6">
                                    <input type="text" name="questionType" maxlength="64" placeholder="题目类型" class="form-control">
                                </div>
                                <div>
                                    <i class="i_context my-i_context">*</i>
                                </div>
                            </div>

                    </form>
                </div>

                <div class="modal-footer">
                <#--<input type="hidden" id="add-type">-->
                    <button type="button" class="btn btn-white" data-dismiss="modal_a">关闭</button>
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
<script>

    var dataTable;
    var urlstr="/api/question";
    var formIdStr="#post_form";
    var sys_url=window.location.host;
    $(document).ready(function () {

//        $("#post_form").validate({
//            rules: {
//                name:{
//                    required:true,
//                    remote: {
//                        url:"/api/post/checkName",
//                        type:"get",
//                        data: {
//                            "name":function () {
//                                return $("#name").val();
//                            },
//                            "id":function () {
//                                return $("#id").val();
//                            }
//                        },
//                        dataFilter: function(data, type) {
//                            var da=JSON.parse(data).data;
//                            if(zudp.util.isBoolean(da)){
//                                return da;
//                            }else{
//                                return false;
//                            }
//                        }
//                    }
//                },
////                identification:{
////                    required:true,
////                    rangelength:[0,64],
////                    remote: {
////                        url:"/api/post/checkIdenty",
////                        type:"get",
////                        data: {
////                            "identy":function () {
////                                return $("#identification").val();
////                            },
////                            "id":function () {
////                                return $("#id").val();
////                            }
////                        },
////                        dataFilter: function(data, type) {
////                            var da=JSON.parse(data).data;
////                            if(zudp.util.isBoolean(da)){
////                                return da;
////                            }else{
////                                return false;
////                            }
////                        }
////                    }
////                },
//
//                mark:{
//                    rangelength:[0,1000]
//                }
//            },
//            messages: {
//                name: {
//                    required: "请输入岗位名称",
//                    remote: "岗位名称已存在"
//                },
////                identification: {
////                    required: "请输入岗位标识",
////                    remote: "岗位标识已存在"
////                },
//                mark: {
//                    rangelength:"字符个数不能超过1000"
//                }
//            },ignore: []
//        });

        findList();

        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}岗位",
            success: "数据{msg}",
            error: "数据{msg}",
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

        var urls="/api/question";
        dataTable=zudp.plugin.table('#list-table')
                .url(urls)
                .search(function () {
                    return {
                        //模糊查询的返回结果
                        "contents":$("#search_name").val(),
                    }
                })
                .columns( [
                        // 题号  题干内容
                        {data:'id', visible: false},
                        {data:'contents'},
                        {data:'questionType'},

                        { // 操作 按钮
                        render: function (data, type, row) {
                            var btn = "";
                            var editStr = "";
                            var delStr = "";
                            var detailStr = "";

                            var addOptionStr="";
                            if (data.questionType == '选择题') { // 添加选项按钮
                            <@hasPermission name="queManager:questionManager:question:update">
                                editStr = zudp.template.editBtn;
                            </@hasPermission>

                            <@hasPermission name="queManager:questionManager:question:update ">
                                delStr = zudp.template.delBtn;
                            </@hasPermission>
                            <@hasPermission name="queManager:questionManager:question:get ">
                                detailStr = zudp.template.detailBtn;
                            </@hasPermission>
                                //添加选项
                                addOptionStr='<button  data-toggle="modal" class=" btn btn-info btn-sm "   onclick="addOption()" value="{id}"><i class="fa fa-pencil"></i>添加选项</button>';

                                btn += editStr + delStr + detailStr+addOptionStr;
                                return zudp.util.render(btn, row);
                            } else { //不添加 添加选项按钮

                                // 编辑
                            <@hasPermission name="queManager:questionManager:question:update">
                                editStr = zudp.template.editBtn;
                            </@hasPermission>

                            <@hasPermission name="queManager:questionManager:question:update ">
                                delStr = zudp.template.delBtn;
                            </@hasPermission>
                            <@hasPermission name="queManager:questionManager:question:get ">
                                detailStr = zudp.template.detailBtn;
                            </@hasPermission>
                                //添加题目
//                            addStr='<button class="btn btn-info btn-sm " data-toggle="modal_hjm" onclick="add()" value="{id}"><i class="fa fa-pencil"></i>添加题目</button>';

                                btn += editStr + delStr + detailStr;
                                return zudp.util.render(btn, row);
                            }
                        }
                        }

                ])
                .then();

    }

//    /function addOption(e){
//
//    //一般用在鼠标或键盘事件上
//    if(e && e.stopPropagation){
//        //W3C取消冒泡事件
//        e.stopPropagation();
//    }else{
//        //IE取消冒泡事件
//        window.event.cancelBubble = true;
//    }
//
//    $('#addOption').modal({show: true});
//    };/ 添加选项功能



//新建  简答题
//    function add01() {
//
//        $('#add01').modal({show: true, backdrop: 'static'});
//
//    }
    //新建  简答题
//    function addOption() {
//
//        $('#addOption').modal({show: true, backdrop: 'static'});

//    }

// 保存选择题
//    $("#saveContents").click(function () {
//
//
//        var contents =$("#contents").val();
//
//
//    $.ajax({
//        url: "../api/question/saveContents?contents="+$('#contents').val(),
//        type: "get",
//        dataType: 'json',
//        contentType: 'application/json',
//        success: function (data, textStatus, xhr) {
//            zudp.plugin.dialog("success").alert("保存成功" + "！", "提示");
//        }, error: function (e) {
//            zudp.plugin.dialog("error").alert("操作失败！", "错误");
//        }
//    });
//    })
//
//
//
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
