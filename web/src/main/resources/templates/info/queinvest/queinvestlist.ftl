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
                    <button onclick='getAllType()' class='btn btn-success' data-toggle='modal' id="add-btn">
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
                            <input type='text' name='name' id='search_name' placeholder='请输入名称' class='form-control search-input'>

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
                            <th>问卷名称</th>
                            <th>问卷描述</th>
                            <th>问卷有效期</th>
                            <th>问卷类型</th>
                            <th>问卷状态</th>
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




<#--以下是模态框  新建问卷-->
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
                            <label class="col-sm-3 control-label my-control-label ">问卷名称：</label>
                            <div class="col-sm-6">
                                <input type="text" name="title" maxlength="64" placeholder="问卷名称" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">问卷描述：</label>
                            <div class="col-sm-6">
                                <input type="text" name="description" maxlength="64" placeholder="问卷描述" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">问卷类型：</label>
                            <div class="col-sm-6">
                                <select id="category" name="queinvestType" class="form-control"><select>
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
                    <#--<div class="form-group">-->
                    <#--<label class="col-sm-3 control-label my-control-label">描述：</label>-->
                    <#--<div class="col-sm-6">-->
                    <#--<textarea class="form-control" rows="5" cols="" name="mark" id="mark"></textarea>-->
                    <#--</div>-->

                    <#--</div>-->


                    </form>
                </div>

                <div class="modal-footer">
                <#--<input type="hidden" id="add-type">-->
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





<#--添加题目 模态框-->

<div class="modal inmodal fade modal-form-content" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <table id="list-table" class="table my-table table-bordered dataTables-example">
                    <thead>
                    <tr>

                        <th>题目内容</th>
                        <th>题目类型</th>
                        <th>选中</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
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
    var urlstr="/api/queinvest";
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

        var urls="/api/queinvest";
        dataTable=zudp.plugin.table('#list-table')
                .url(urls)
                .search(function () {
                    return {
                        //模糊查询的返回结果
                        "title":$("#search_name").val(),
                    }
                })
                .columns( [
                    // 名称  描述
                    {data:'id', visible: false},
                    {data:'title'},
                    {data:'description'},
                    {data:'valid'},
                    {data:'queinvestType'},

//                    {
//                        render: function (data, type, row) {
//                            if (data.queinvestType == '0') { //选择题
//                                return "行政类";
//                            } else if (data.queinvestType == '1') { //多选题
//                                return "生活类";
//                            } else if (data.queinvestType == '2') {// 判断题
//                                return "经济类";
//                            }
//                        }
//                    },

                    {
                        render: function (data, type, row) {
                            if (data.status == '0') {// 临时状态
                                return "临时状态";
                            } else if (data.status == '1') { //未发布
                                return "未发布";
                            } else if (data.status == '2') { //已发布
                                return "已发布";
                            }

                        }

                        },

                    { // 操作 按钮
                        render: function (data, type, row) {
                            var btn = "";
                            var editStr="";
                            var delStr="";
                            var addStr="";
                            var overviewStr="";
                            var publicStr="";
                            var unpublicStr="";

                                // 编辑
                            <#--<@hasPermission name="queManager:queinvestManager:queinvest:update">-->
                                <#--editStr=zudp.template.editBtn;-->
                            <#--</@hasPermission>-->
                                editStr= '<button onclick="getAllType(this)" class="btn btn-info btn-sm row-edit updateOpBtn" value="{id}"><i class="fa fa-pencil"></i>编辑</button>';


                        <@hasPermission name="queManager:queinvestManager:queinvest:delete ">
                            delStr=zudp.template.delBtn;
                        </@hasPermission>
                                //添加题目
                            addStr='<button id="addQuestion_btn" class="btn btn-info btn-sm " data-toggle="modal_hjm" onclick="addQuestion()" value="{id}"><i class="fa fa-pencil"></i>添加题目</button>';
                            overviewStr='<button class="btn btn-info btn-sm " data-toggle="modal_overview" onclick="overview()" value="{id}"><i class="fa fa-pencil"></i>预览</button>';
                            publicStr='<button class="btn btn-info btn-sm " data-toggle="modal_public" onclick="public()" value="{id}"><i class="fa fa-pencil"></i>发布</button>';
                            unpublicStr='<button class="btn btn-info btn-sm " data-toggle="modal_unpublic" onclick="unpublic()" value="{id}"><i class="fa fa-pencil"></i>撤销发布</button>';

                            btn+=editStr+delStr+addStr+overviewStr+publicStr+unpublicStr;
                            return zudp.util.render(btn, row);
                            }

                        }

                ])
                .then();

    }

// 添加题目
    $(document).on("click", '#addQuestion_btn', function (e) {  // addQuestion_btn --->btn id
        //清除冒泡
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }
        // 模态框的弹出
        $(".modal-form-content").modal("show");  //  modal-form-content -->模态框  class
        // 给模态框添加class --->add-form
        $(".modal-form-content").addClass("add-form").removeClass("create-form detail-form");
        // 清空输入框的
//        zudp.plugin.form("#form").reset();

        // 发送ajax请求  查询出所有的题目
        zudp.ajax("/api/question/findList").post().then(function (value) {
                alert(value);
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
    //校验保存  指向模态框的保存按钮   #test-save-btn-->保存按钮的id
    $(document).on("click", ".add-form #test-save-btn", function () {
//        alert(1);
//        var data = zudp.util.formData2json("form");
//        alert(data + (typeof data));

        //将字符串转成json格式的字符串
        alert(JSON.stringify(data));

        zudp.ajax("/api/question/addQuestion").post(data).then(function (value) {
//                    if (value.size >=0 ) {
//                        zudp.plugin.dialog("success").alert("更新成功 ");
            // 关闭模态框
            $(".modal-form-content").modal("hide");
//                    }
        })
    });

    });


    // 添加题目
//    function addQuestion(obj) {
//        //弹窗 模态框的弹出
//        $(document).on("click", '#add_btn', function (e) { // button -->id
//            //清除冒泡
//            if (e && e.stopPropagation) {
//                e.stopPropagation();
//            } else {
//                window.e.cancelBubble = true;
//            }
//            // 模态框的弹出
//            $(".modal-form-content").modal("show");
//            $(".modal-form-content").addClass("edit-form").removeClass("create-form detail-form");
//
//            /*
//            zudp.ajax(updateUrl).get("").then(function (data) {
//                dataEcho(obj.formId, data);
//            }, function (error) {
//            });*!/
//            //设置禁用
//            for (var i = 0; i < obj.disabledName.length; i++) {
//                $(".modal form").find("*[name=" + obj.disabledName[i] + "]")
//                    .attr("disabled", true);
//            }
//        });*/
//            //校验保存
//            /*var msgSuccess = zudp.util.render(obj.success, {"msg": "成功"});*/
//            $(document).on("click", ".edit-form #save-btn", function () {
//
////                var data = zudp.util.formData2json("form");
//                zudp.ajax("/api/queinvest/findList").get().then(function (value) {
//                    if (value == 1) {
////                        zudp.plugin.dialog("success").alert("更新成功 ");
//                        $(".modal-form-content").modal("hide");
//                    }
//                })
//            })
//
//        });
//        return this;
//    };
//
//


    // 审核功能
//    function check(e){
//        //清除冒泡
//        if (e && e.stopPropagation) {
//            e.stopPropagation();
//        } else {
//            window.e.cancelBubble = true;
//        }
//        // 跳出浮态框
//
//    }

    // 获取问卷类型的下拉框
    function getAllType(obj) {
        var str = $(obj).parent().prev().prev().text();
//        alert(str);
        var idstr = $(obj).val();

        var typeId = "";

//        alert(idstr);
//        alert(str);
        if (str != "") {
            // 查询单个
            zudp.ajax("/api/queinvest/getOneType?id=" + idstr).get().then(function (value) {
                typeId = value.queinvestType;
//                alert(categoryId);
            });
        }
        // 下拉的id -->categor
        $("#category").find("option").remove();
        zudp.ajax("/api/queinvest/getAllType").get().then(function (value) {

//           $("#department").append("<option value='" + "'>" + "全部" + "</option>");
            for (var k = 0; k < value.length; k++) {

                if (value[k].queinvestType  == null) {
                    value[k].queinvestType = "";
                }else{
                    if (typeId != "") {
                        if (value[k].id == typeId) {
                            $("#category").append("<option value='" + value[k].id + "' selected='selected'>" + value[k].queinvestType+ "</option>");
                        } else {
                            $("#category").append("<option value='" + value[k].id+ "'>" + value[k].queinvestType  + "</option>");
                        }
                    } else {
                        $("#category").append("<option value='" + value[k].id+ "'>" + value[k].queinvestType  + "</option>");
                    }
                }
            }
        }, function (reason) {
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
