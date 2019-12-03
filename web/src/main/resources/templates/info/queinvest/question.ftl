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
                                <input type="text" name="contents" maxlength="64" id="name" placeholder="题目名称" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">题目类型：</label>
                            <div class="col-sm-6">
                                <select id="category" name="questionType" class="form-control"><select>
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
                        <input type="hidden" class="testId" name="id" id="id">

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">选项一：</label>
                            <div class="col-sm-6">
                                <input type="text" name="choiceText01"   maxlength="64" id="name" placeholder="选项一" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">选项二：</label>
                            <div class="col-sm-6">
                                <input type="text" name="choiceText02" maxlength="64" id="telephone" placeholder="选项二" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">选项三：</label>
                            <div class="col-sm-6">
                                <input type="text" name="choiceText03" maxlength="64" id="telephone" placeholder="选项三" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">选项四：</label>
                            <div class="col-sm-6">
                                <input type="text" name="choiceText04" maxlength="64" id="telephone" placeholder="选项四" class="form-control">
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
                    <button type="button" class="btn btn-primary" id="test-save-btn">保存</button>
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
            title: "{type}题目",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value'],
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
                        "name":$("#search_name").val()

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

                                editStr= '<button onclick="getAllType(this)" class="btn btn-info btn-sm row-edit updateOpBtn" value="{id}"><i class="fa fa-pencil"></i>编辑</button>';

                                delStr = zudp.template.delBtn;
                                detailStr = zudp.template.detailBtn;
                                //添加选项
                                addOptionStr='<button  id="row-add-test" class="btn btn-info btn-sm " value="{id}"><i class="fa fa-pencil"></i>添加选项</button>';

                                btn += editStr + delStr + detailStr+addOptionStr;
                                return zudp.util.render(btn, row);


                        }
                    }

                ])
                .then();

    }

        $(document).on("click", '#row-add-test', function (e) {
            // button -->id
            //清除冒泡
            if (e && e.stopPropagation) {
                e.stopPropagation();
            } else {
                window.e.cancelBubble = true;
            }
            var id = $("#row-add-test").val();
//            alert(id);
            // 模态框的弹出
            $(".modal-form-content").modal("show");
            $(".testId").val(id);

            /* $(".modal-form-content").addClass("test-form").removeClass("create-form detail-form");*/

            //修改标题
            var titleText = zudp.util.render(obj.title, {"type": "添加选项"});
            $(".modal .modal-title").text("添加选项");

            //取消禁用
            for (var i = 0; i < obj.disabledName.length; i++) {
                // 模态框的class ---> modal-form-content
                $(".modal-form-content").find("*[name=" + obj.disabledName[i] + "]")
                        .attr("disabled", false);
            }

            // 清空输入框的
            zudp.plugin.form("#form-addOption").reset();
        });

        /*
        zudp.ajax(updateUrl).get("").then(function (data) {
            dataEcho(obj.formId, data);
        }, function (error) {
        });*!/
        //设置禁用
        for (var i = 0; i < obj.disabledName.length; i++) {
            $(".modal form").find("*[name=" + obj.disabledName[i] + "]")
                .attr("disabled", true);
        }
    });*/
        //校验保存
        $(document).on("click", ".test-form #test-save-btn", function () {
            var data = zudp.util.formData2json("form-addOption");

            zudp.ajax("/api/option/addOption").post(data).then(function (value) {
//                    if (value.size >=0 ) {
//                        zudp.plugin.dialog("success").alert("更新成功 ");
                // 关闭模态框
                $(".modal-form-content").modal("hide");
//                    }
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
