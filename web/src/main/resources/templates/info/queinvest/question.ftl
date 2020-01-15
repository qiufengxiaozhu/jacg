<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>问题</title>
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
        ::-webkit-scrollbar-track {
            background-color: #f7f7f7;
            border: 1px solid #efefef;
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
                        <button onclick="getAllType()" class='btn btn-success' data-toggle='modal' id="add-btn">
                            新建
                        </button>&nbsp;&nbsp;
                    <@hasPermission name="oaManager:post:batchDelete">
                        <button class='btn btn-success btn-danger' id="delete-items">
                            批量删除
                        </button>
                    </@hasPermission>
                        <div class='querybtn my-querybtn'>
                            <input type='text' name='search' id='search_name' placeholder='请输入题目名称' class='form-control search-input'>
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
                            <th>题目名称</th>
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
                <div class="modal-body fix-height" style="height: 350px">
                <#--表单-->
                    <form class="form-horizontal" id="post_form">
                        <input type="hidden" name="id" id="id">

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">题目名称：</label>
                            <div class="col-sm-6">
                                <input type="text" name="contents" maxlength="64" id="contents" placeholder="题目名称" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">题目类型：</label>
                            <div class="col-sm-6">
                                <select id="category" name="questionType" class="form-control" ><select>
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>


                        <div class="form-group" id="ct1">
                            <label class="col-sm-3 control-label my-control-label ">选项一：</label>
                            <div class="col-sm-6">
                                <input type="text" name="choiceText01" maxlength="64" id="choiceText011" placeholder="选项一" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>


                        <div class="form-group" id="ct2">
                            <label class="col-sm-3 control-label my-control-label ">选项二：</label>
                            <div class="col-sm-6">
                                <input type="text" name="choiceText02" maxlength="64" id="choiceText021" placeholder="选项二" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group" id="ct3">
                            <label class="col-sm-3 control-label my-control-label ">选项三：</label>
                            <div class="col-sm-6">
                                <input type="text" name="choiceText03" maxlength="64" id="choiceText031" placeholder="选项三" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>


                        <div class="form-group" id="ct4">
                            <label class="col-sm-3 control-label my-control-label ">选项四：</label>
                            <div class="col-sm-6">
                                <input type="text" name="choiceText04" maxlength="64" id="choiceText041" placeholder="选项四" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
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



<#--添加选项模态框-->
<div class="modal inmodal fade modal-form-content" id="addOption" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
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
                    <form class="form-horizontal" id="form-addOption">
                        <#--<input type="hidden" class="testId" name="id" id="id">-->


                        <#--<div class="form-group">-->
                            <#--<label class="col-sm-3 control-label my-control-label ">题目名称：</label>-->
                            <#--<div class="col-sm-6">-->
                                <#--<input type="text" name="contents" maxlength="64" id="contents02" placeholder="题目名称" class="form-control">-->
                            <#--</div>-->
                            <#--<div>-->
                                <#--<i class="i_context my-i_context">*</i>-->
                            <#--</div>-->
                        <#--</div>-->

                        <#--<div class="form-group">-->
                            <#--<label class="col-sm-3 control-label my-control-label ">题目类型：</label>-->
                            <#--<div class="col-sm-6">-->
                                <#--<select id="category" name="questionType" class="form-control" ><select>-->
                            <#--</div>-->
                            <#--<div>-->
                                <#--<i class="i_context my-i_context">*</i>-->
                            <#--</div>-->
                        <#--</div>-->



                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">选项一：</label>
                            <div class="col-sm-6">
                                <input type="text" name="opt01"   maxlength="64" id="choiceText01" placeholder="选项一" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">选项二：</label>
                            <div class="col-sm-6">
                                <input type="text" name="opt02" maxlength="64" id="choiceText02" placeholder="选项二" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">选项三：</label>
                            <div class="col-sm-6">
                                <input type="text" name="opt03" maxlength="64" id="choiceText03" placeholder="选项三" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">选项四：</label>
                            <div class="col-sm-6">
                                <input type="text" name="opt04" maxlength="64" id="choiceText04" placeholder="选项四" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                    </form>
                </div>

                <div class="modal-footer">
                    <input type="hidden" id="add-type">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary " id="test-save-btn">保存</button>
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

    var id;
    var dataTable;
    var urlstr="/api/question";
    var formIdStr="#post_form";
    var sys_url=window.location.host;
    $(document).ready(function () {


        // 新建  验证
        $("#post_form").validate({
            rules: {
                // 必填项
                contents: "required",
                questionType:"required"
            },

            // 提示信息
            messages: {
                contents: {
                    required: "请输入题目内容",
                    remote: "题目已存在"
                },
                questionType: "请选择题目类型"
            }
        });


        findList();

        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}题目",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value','type02'],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"]

        };
        //初始化增删改查参数
        initForm(obj);




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
        dataTable=zudp.plugin.table('#post-list-table')
                .url(urls)
                .search(function () {
                    return {
                        "contents":$("#search_name").val()

                    }
                })
                .columns( [
                    {data: 'id', visible: false},

                    {data: 'contents'},
//                    {data: 'identification'},
                    { // 题目类型
                        render: function (data, type, row) {
                            if(data.questionType == '0'){ //选择题
                                return "单选题";
                            }else if(data.questionType == '1'){ //多选题
                                return "多选题";
                            }else if(data.questionType == '2'){// 判断题
                                return "判断题";
                            }
                        }
                    },
//                    {data: 'questionType'},
                    { // 操作 按钮
                        render: function (data, type, row) {
                            var btn = "";
                            var editStr = "";
                            var delStr = "";
                            var detailStr = "";

                            var addOptionStr="";


                                editStr= '<button onclick="getAllType(this)" class="btn btn-info btn-sm row-edit updateOpBtn" value="{id}" id="edit"><i class="fa fa-pencil"></i>编辑</button>';

                                delStr = zudp.template.delBtn;
//                                detailStr = zudp.template.detailBtn;
                            detailStr = '<button class="btn btn-info btn-sm row-detail" value="{id}" onclick="getAllType(this)" id="detail"><i class="fa fa-pencil"></i>详情</button>';

                                    //添加选项
                                addOptionStr='<button id="row-add-test" class="btn btn-info btn-sm " value="{id}"><i class="fa fa-pencil"></i>添加选项</button>';

                            if(data.status == '0'){ // 0->此题目没有选项的状态
                                btn += editStr +"&nbsp;" + delStr +"&nbsp;" + detailStr +"&nbsp;"+addOptionStr;
                                return zudp.util.render(btn, row);
                            }
                            else { // 有选项的状态
                                btn += editStr + "&nbsp;" + delStr + "&nbsp;" + detailStr ;
                                return zudp.util.render(btn, row);
                            }


                        }
                    }

                ])
                .then();

    }



// 添加选项
        $(document).on("click", '#row-add-test', function (e) {
            //清除冒泡
            if (e && e.stopPropagation) {
                e.stopPropagation();
            } else {
                window.e.cancelBubble = true;
            }
             id = $(this).val();
            // 模态框的弹出
            $(".modal-form-content").modal("show");
            $(".testId").val(id);

            //修改标题
            var titleText = zudp.util.render(obj.title, {"type02": "添加选项"});
            $(".modal .modal-title").text("添加选项");

            // 全部解除禁用
            $("#addOption").find("*[name]").prop("disabled", false);

        });


        //校验保存
        $(document).on("click", "#test-save-btn", function () {

           var choiceText01= $("#choiceText01").val();
           var choiceText02= $("#choiceText02").val();
           var choiceText03= $("#choiceText03").val();
           var choiceText04= $("#choiceText04").val();
            var idJson = id;
            var contents = $("#contents02").val();
            var questionType = $("#category").val();

            var obj = {
                choiceText01:choiceText01,
                choiceText02:choiceText02,
                choiceText03:choiceText03,
                choiceText04:choiceText04,
                idJson:idJson,
                contents:contents,
                questionType:questionType
            };

            console.log(idJson);
            var objJson = JSON.stringify(obj);

            // 添加题目 并且更新题目状态
            zudp.ajax("/api/option/addOption").post(objJson).then(function (value) {


                    // 关闭模态框
                $(".modal-form-content").modal("hide");
                // 清空输入框的
                zudp.plugin.form("#form-addOption").reset();

                location.reload();
//                    zudp.ajax.reload();
                })




    });


    });


    // 获取问卷类型的下拉框
    function getAllType(obj) {
        // 获取到问卷类型
        var str = $(obj).parent().prev().text();
        // 本条记录的id值
        var idstr = $(obj).val();

        var typeId = "";

        if (str != "") {
            // 查询单个
            zudp.ajax("/api/question/getOneType?id=" + idstr).get().then(function (value) {
                typeId = value.questionType;
            });
        }
        // 下拉的id -->categor
        $("#category").find("option").remove();
        zudp.ajax("/api/question/getAllType").get().then(function (value) {

//           $("#department").append("<option value='" + "'>" + "全部" + "</option>");
            for (var k = 0; k < value.length; k++) {

                if (value[k].label  == null) {
                    value[k].label = "";
                }else{
                    if (typeId != "") {
                        if (value[k].value == typeId) {
                            $("#category").append("<option value='" + value[k].value + "' selected='selected'>" + value[k].label+ "</option>");
                        } else {
                            $("#category").append("<option value='" + value[k].value+ "'>" + value[k].label  + "</option>");
                        }
                    } else {
                        $("#category").append("<option value='" + value[k].value+ "'>" + value[k].label  + "</option>");
                    }
                }
            }
        },function (reason) {
            zudp.plugin.dialog("error").alert("获取用户列表失败！", "提示");
        });
    };

    // 隐藏选项输入框  新建
    $(document).on("click", '#add-btn', function () {
        $("#ct1").css("display","none");	//隐藏选项
        $("#ct2").css("display","none");	//隐藏选项
        $("#ct3").css("display","none");	//隐藏选项
        $("#ct4").css("display","none");	//隐藏选项

    });


    // 隐藏选项输入框  编辑
    $(document).on("click", '#edit', function () {
        $("#ct1").css("display","block");	//隐藏选项
        $("#ct2").css("display","block");	//隐藏选项
        $("#ct3").css("display","block");	//隐藏选项
        $("#ct4").css("display","block");	//隐藏选项

    });
    // 隐藏选项输入框  详情
    $(document).on("click", '#detail', function () {
        $("#ct1").css("display","block");	//隐藏选项
        $("#ct2").css("display","block");	//隐藏选项
        $("#ct3").css("display","block");	//隐藏选项
        $("#ct4").css("display","block");	//隐藏选项

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
