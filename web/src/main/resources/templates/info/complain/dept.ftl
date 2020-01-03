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
            width: 80px;
        }

        .dropdown-menu.open .inner.open {
            height: 200px
        }

        .dropdown-menu.open {
            width: 100%;
        }
    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="ibox-content form-inline z-relative">
                    <div class='col-sm-12'>
                        <button class='btn btn-success' data-toggle='modal' id="add-btn">
                            新建
                        </button>&nbsp;&nbsp;
                    <button class='btn btn-success btn-danger' id="delete-items">
                        批量删除
                    </button>
                <div class='querybtn my-querybtn'>
                    <input type='text' name='search' id='search_name' placeholder='请输入名称'
                           class='form-control search-input'>
                    <button class='btn btn-primary mgl my-mgl research-btn'>
                        搜索
                    </button>&nbsp;&nbsp;
                </div>
            </div>
            <div id='search' class='search-group' style='display:none;'>
            </div>
            <table id="dept-list-table" class="table my-table table-bordered dataTables-example">
                <thead>
                <tr>
                    <th>id</th>
                    <th>部门名称</th>
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
<!--以下是模态框-->
<div class="modal inmodal fade modal-form" id="myModal5" tabindex="-1" role="dialog"
     aria-hidden="true" style="display: none;">
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
                        <form class="form-horizontal" id="dept_form">
                            <input type="hidden" name="id" id="id">

                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label ">部门名称：</label>
                                <div class="col-sm-6">
                                    <input type="text" name="department" id="department" placeholder="部门名称"
                                           class="form-control">
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

<!--我的模态框-->
<div class="modal inmodal fade test-modal" id="myModal6" tabindex="-1" role="dialog"
     aria-hidden="true" style="display: none;">
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
                        <form class="form-horizontal" id="test_form">
                            <input type="hidden" name="uid" id="uid">

                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label ">username：</label>
                                <div class="col-sm-6">
                                    <input type="text" name="username" id="username" placeholder="username"
                                           class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label ">username：</label>
                                <div class="col-sm-6">
                                    <input type="text" name="password" id="password" placeholder="password"
                                           class="form-control">
                                </div>
                            </div>
                        </form>
                </div>

                <div class="modal-footer">
                    <input type="hidden" id="test-add-type">
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
    var urlStr = "/api/dept";
    var formIdStr = "#dept_form";
    var sys_url = window.location.host;
    $(document).ready(function () {

        $("#dept_form").validate({
            rules: {
                department: {
                    required: true,
                    remote: {
                        url: "/api/dept/checkDept",
                        type: "get",
                        data: {
                            "department": function () {
                                return $("#department").val();
                            },
                            "id": function () {
                                return $("#id").val();
                            }
                        },
                        dataFilter: function (data, type) {
                            var da = JSON.parse(data).data;
                            if (zudp.util.isBoolean(da)) {
                                return da;
                            } else {
                                return false;
                            }
                        }
                    }
                }
            },
            messages: {
                department: {
                    required: "请输入 部门名称",
                    remote: "部门名称 已存在"
                }
            }, ignore: []
        });

        findList();

        var obj = {
            url: urlStr,
            formId: formIdStr,
            title: "{type}部门",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value'],
            hideInputName: [],
            search: [".clear-input", "#search", ".search-input"]

        };

//        zudp.component.initCURD.Init(obj);
        //初始化增删改查参数
        initForm(obj);

        myModal(obj);
    });

    function myModal(obj) { //test-modal myModal5 test_form test-save-btn
        //弹窗 row-temp
        $(document).on("click", ".row-temp", function () {
            $(".test-modal").modal("show");
            $(".test-modal").addClass("create-test").removeClass("edit-test detail-test");
            $(".create-test").find("#test-save-btn").show();
            $(".create-test").find(".my-i_context").show();
            zudp.plugin.form("#test_form").reset();

            if(obj.addBtnFun!=undefined){
                obj.addBtnFun();
            }

            //修改标题
            var titleText = zudp.util.render(obj.title, {"type": "新建"});
            $(".modal .modal-title").text(titleText);
            //取消禁用
            for (var i = 0; i < obj.disabledName.length; i++) {
                $(".modal form").find("*[name=" + obj.disabledName[i] + "]")
                    .attr("disabled", false);
            }
            //设置隐藏组件
            for (var i = 0; i < obj.hideInputName.length; i++) {
                $(".modal form").find("*[name=" + obj.hideInputName[i] + "]").parents('.form-group').css("display", 'block');
            }
            //    如果页面中有radio button 点击
            if($(".modal-form input[type=radio]").length != 0) {
                $(".modal-form input[type=radio]:first").prop("checked","checked");
            }
        });
    }


    //提示
    function swalFunction(a, b, c) {
        swal({
            title: a,
            showCancelButton: true,
            cancelButtonText: "取消",
            confirmButtonColor: "#DD6B55",
            confirmButtonText: c,
        }, b);
    }



    //列表数据初始化方法
    function findList() {

        var urls = "/api/dept";
        dataTable = zudp.plugin.table('#dept-list-table')
            .url(urls)
            .search(function () {
                return {
                    "department": $("#search_name").val() //department 模糊查询，两个字段同时
                }
            })
            .columns([
                {data: 'id', visible: false},
                {data: 'department'},
                {
                    render: function (data, type, row) {
                        var btn = "";
                        var editstr = "";
                        var delstr = "";
                        var temp = "";

                        editstr = '<button class="btn btn-info btn-sm row-edit updateOpBtn" value="{id}"><i class="fa fa-pencil"></i>编辑</button>&nbsp;&nbsp;';

                        delstr = '<button class="btn btn-danger btn-sm row-delete mgl my-mgl" value="{id}"><i class="fa fa-close"></i>删除</button>&nbsp;&nbsp;';

                        temp = '<button class="btn btn-info btn-sm row-temp updateOpBtn" value="{id}"><i class="fa fa-close"></i>测试按钮</button>&nbsp;&nbsp;';
                        btn += editstr + delstr + temp;
                        return zudp.util.render(btn, row);
                    }
                }
            ])
            .then();

    }

    function tempFunc() {

    }

    function initUpload() {

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
            duplicate: true,
            accept: {
                extensions: 'bmp,jpg,png,rar,gif,zip,xls,xlsx,doc,docx',
                title: 'file',
                mimeTypes: '*/*'
            }
        });
        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on('uploadSuccess', function (file, response) {
            //;
            var name = file.name;
            var fileurl = response.data;
            $("#fileShowName").append("<p><a href='//" + sys_url + "/" + fileurl + "' download='" + name + "'>" + name + "</a><input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;<span style='color:red' onclick='deleteFile(this)'>删除</span><input type='hidden' name='attachPath' value='" + fileurl + "'><input type='hidden' name='attachName' value='" + name + "'>	</p>");

            //change(response);
        });
    }

</script>
</body>
</html>
