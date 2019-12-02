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
                        <button class='btn btn-success' data-toggle='modal' id="add-btn" onclick="getDepartment(), hiddenInput()">
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
                    <table id="public-list-table" class="table my-table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>问题</th>
                            <th>部门</th>
                            <th>类别</th>
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
                        <input type="hidden" name="replyStatus" id="replyStatus"/>
                        <input type="hidden" name="total" id="total">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">投诉部门：</label>
                            <div class="col-sm-6">
                                <select id="department" name="department" class="form-control">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">问题主题：</label>
                            <div class="col-sm-6">
                                <input type="text" name="topic" maxlength="64" id="topic" placeholder="问题主题" class="form-control">
                            </div>
                            <!--<div>-->
                                <!--<i class="i_context my-i_context">*</i>-->
                            <!--</div>-->
                        </div>
                        <div class="form-group"><!-- 投诉/建议 分类 -->
                            <label class="col-sm-3 control-label my-control-label ">投诉类别：</label>
                            <div class="col-sm-6">
                                <label class="checkbox-inline col-sm-3">
                                    <input type="radio" name="type" id="optionsRadios3" value="0" checked> <b class="text-danger">投诉</b>
                                </label>
                                <label class="checkbox-inline col-sm-3">
                                    <input type="radio" name="type" id="optionsRadios4" value="1"> <b class="text-danger">建议</b>
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">姓名：</label>
                            <div class="col-sm-6">
                                <input type="text" name="username" maxlength="64" id="username" placeholder="姓名" class="form-control">
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">电话：</label>
                            <div class="col-sm-6">
                                <input type="text" name="tel" maxlength="64" id="tel" placeholder="电话" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">详细问题：</label>
                            <div class="col-sm-6">
                                <!--<input type="text" name="comment" maxlength="64" id="comment" placeholder="详细问题" class="form-control">-->
                                <textarea name="comment" id="comment" placeholder="详细问题" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label" id="label-reply">回复：</label>
                            <div class="col-sm-6">
                                <!--<input type="text" name="comment" maxlength="64" id="comment" placeholder="详细问题" class="form-control">-->
                                <textarea name="reply" rows="6" id="reply" placeholder="回复" class="form-control"></textarea>
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
<script>
 
    var dataTable;
    var urlstr="/api/p";
    var formIdStr="#post_form";
    var sys_url=window.location.host;
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
//                identification:{
//                    required:true,
//                    rangelength:[0,64],
//                    remote: {
//                        url:"/api/post/checkIdenty",
//                        type:"get",
//                        data: {
//                            "identy":function () {
//                                return $("#identification").val();
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

        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value'],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"]

        };
        //初始化增删改查参数
        init(obj);
//
    });



    function hiddenInput() {
        $(".modal").find("#label-reply").hide();
        $(".modal").find("#reply").hide();

        $(".modal").find("*[name]").prop("disabled", false);
        $(".modal").find("[name = 'tel']").removeAttr("readonly");
    }
//
    function showInput() {
        $(".modal").find("#label-reply").show();
        $(".modal").find("#reply").show();
//
        $(".modal").find("[name = 'department'], [name = 'topic'], [name = 'type'], [name = 'username'], [name = 'comment']").prop("disabled", true);
        $(".modal").find("[name = 'tel']").attr("readonly", "readonly");
//        $(".modal").find("#department").prop("disabled", true);
//        $(".modal").find("#department").prop("disabled", true);
//        $(".modal").find("#department").prop("disabled", true);
//        $(".modal").find("#department").prop("disabled", true);

    }

    //列表数据初始化方法
    function findList() {

        var urls="/api/p";
        dataTable=zudp.plugin.table('#public-list-table')
                .url(urls)
                .search(function () {
                    return {
                        "department":$("#search_name").val()

                    }
                })
                .columns( [
//                    <th>id</th>
//                    <th>问题</th>
//                    <th>部门</th>
//                    <th>类别</th>
//                    <th>操作</th>
                    {data: 'id', visible: false},
                    {data: 'topic',
                        render:function(data, type, row){
                            var suf="...";
                            var ah = "";
                            if(data!=null && data.length<20){
                                suf = "";
                                ah = "<a title='"+data+"'>"+data.substr(0,20)+suf+"</a>";
                            } else if (data!=null && data.length >= 20) {
                                ah = "<a title='"+data+"'>"+data.substr(0,20)+suf+"</a>";
                            }
                            return ah;
                        }
                    },
                    {data: 'department'},
                    {data: 'type',
                        render:function(data, type, row){
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
                    {
                        render: function (data, type, row) {
                            var btn = "";
                            var editstr = "";
                            var delstr = "";
//                            var detailstr = "";

//                            detailstr = '<button onclick="getDepartment(this)" class="btn btn-info btn-sm row-detail" value="{id}"><i class="fa fa-pencil"></i>详情</button>&nbsp;&nbsp;';

                            editstr='<button onclick="getDepartment(this), showInput()" class="btn btn-info btn-sm row-edit updateOpBtn" value="{id}"><i class="fa fa-pencil"></i>回复</button>';

                            delstr = '<button class="btn btn-danger btn-sm row-delete mgl my-mgl" value="{id}"><i class="fa fa-close"></i>删除</button>&nbsp;&nbsp;';

                            btn +=  editstr + delstr ;
                            return zudp.util.render(btn, row);
                            //return "";
                        }
                    }
                ])
                .then();

    }


    <!--   动态获取部门种类 -->
    function getDepartment(obj) {
        var str = $(obj).parent().prev().prev().text();

        $("#department").find("option").remove();
        zudp.ajax("/api/dept/deptList").get().then(function (value) {

//           $("#department").append("<option value='" + "'>" + "全部" + "</option>");
            for (var k = 0; k < value.length; k++) {

                if (value[k].department == null) {
                   value[k].department = "";
               } else {
                    if (value[k].department == str) {
                        $("#department").append("<option value='" + value[k].department + "' selected='selected'>" + value[k].department + "</option>");
                    } else {
                        $("#department").append("<option value='" + value[k].department+ "'>" + value[k].department + "</option>");
                    }
                }
            }
            //  gettypemin();
        }, function (reason) {
            zudp.plugin.dialog("error").alert("获取用户列表失败！", "提示");
        });
    }

    function init(obj){
        //弹窗
        $(document).on("click", "#add-btn", function () {
            $(".modal-form").modal("show");
            $(".modal-form").addClass("create-form").removeClass("edit-form detail-form");
            $(".create-form").find("#save-btn").show();
            $(".create-form").find(".my-i_context").show();
            zudp.plugin.form(obj.formId).reset();
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

        //修改提示
        var msgSuccess = zudp.util.render(obj.success, {"msg": "成功"});

        $(document).on("click", ".create-form #save-btn", function () {
            if(obj.saveForm!=undefined){
                obj.saveForm();
            }else{
                if ($(obj.formId).valid()) {
                    var data = zudp.util.formData2json("form");
                    zudp.ajax(obj.url).post(data).then(function () {
                        zudp.plugin.dialog("success").alert("新建" + msgSuccess + "！", "提示");
                        dataTable.ajax.reload();
                        $(".modal-form").modal("hide");
                    });
                    obj.callback.create(data);
                }
            }

        });

        //弹窗
        var updateUrl ='';
        $(document).on("click", '.row-edit', function (e) {
            //清除冒泡
            if (e && e.stopPropagation) {
                e.stopPropagation();
            } else {
                window.e.cancelBubble = true;
            }
            $(".modal-form").modal("show");
            $(".modal-form").addClass("edit-form").removeClass("create-form detail-form");
            $(".edit-form").find("#save-btn").show();
            $(".edit-form").find(".my-i_context").show();
            zudp.plugin.form(obj.formId).reset();
            updateUrl = obj.url + '/' + $(this).val();
            //修改标题
            var titleText = zudp.util.render(obj.title, {"type": "编辑"});
            $(".modal .modal-title").text(titleText);
            //设置隐藏组件
            for (var i = 0; i < obj.hideInputName.length; i++) {
                $(".modal form").find("*[name=" + obj.hideInputName[i] + "]").parents('.form-group').css("display", 'none');
            }
            $(obj.formId).find("input[name='id']").eq(0).val($(this).val());
            if(obj.editBtnFun!=undefined){
                obj.editBtnFun();
            }else{
                //取值回显
                zudp.ajax(updateUrl).get("").then(function (data) {
                    dataEcho(obj.formId, data);

                }, function (error) {
                });
            }

            //设置禁用
            for (var i = 0; i < obj.disabledName.length; i++) {
                $(".modal form").find("*[name=" + obj.disabledName[i] + "]")
                    .attr("disabled", true);
            }
        });
        //详情
        $(document).on("click", '.row-detail', function (e) {
            //清除冒泡
            if (e && e.stopPropagation) {
                e.stopPropagation();
            } else {
                window.e.cancelBubble = true;
            }
            $(".modal-form").modal("show");
            $(".modal-form").addClass("detail-form").removeClass("create-form edit-form");
            $(".detail-form").find("#save-btn").hide();
            $(".detail-form").find(".my-i_context").hide();
            updateUrl = obj.url + '/' + $(this).val();
            //修改标题
            var titleText = zudp.util.render(obj.title, {"type": "详情"});
            $(".modal .modal-title").text("详情");
            //设置隐藏组件
            for (var i = 0; i < obj.hideInputName.length; i++) {
                $(".modal form").find("*[name=" + obj.hideInputName[i] + "]").parents('.form-group').css("display", 'none');
            }
            $(obj.formId).find("input[name='id']").eq(0).val($(this).val());
            if(obj.editBtnFun!=undefined){
                obj.editBtnFun();
            }else{
                //取值回显
                zudp.ajax(updateUrl).get("").then(function (data) {
                    dataEcho(obj.formId, data);

                }, function (error) {
                });
            }
            $(".modal form").find("*[name]").prop("disabled", true);
            //设置禁用
            for (var i = 0; i < obj.disabledName.length; i++) {
                $(".modal form").find("*[name=" + obj.disabledName[i] + "]")
                    .attr("disabled", true);
            }
            $(document).on("click",".detail-form .btn[data-dismiss='modal'], .close[data-dismiss='modal'] ",function () {
                $(".modal-form").find("#save-btn").show();
                $(".detail-form").find(".my-i_context").show();
                $(".modal-form *[name]").prop("disabled",false);
            })
        });
        //校验保存
        var msgSuccess = zudp.util.render(obj.success, {"msg": "成功"});
        $(document).on("click", ".edit-form #save-btn", function () {
            if(obj.saveForm!=undefined){
                obj.saveForm();
            }else{
                if ($(obj.formId).valid()) {
                    var data = zudp.util.formData2json("form");
                    zudp.ajax("/api/p/reply").put(data).then(function () {
                        zudp.plugin.dialog("success").alert("更新" + msgSuccess + "！", "提示");
                        dataTable.ajax.reload();
                        $(".modal-form").modal("hide");
                    });
                    obj.callback.update(data);
                }
            }

        });

        $(document).on("click", '.row-delete', function (e) {
            //清除冒泡
            if (e && e.stopPropagation) {
                e.stopPropagation();
            } else {
                window.e.cancelBubble = true;
            }
            var msgSuccess = zudp.util.render(obj.success, {"msg": "删除成功"});
            var msgError = zudp.util.render(obj.error, {"msg": "删除失败"});
            var rowData = dataTable.row($(this).parents('tr')).data();
            var deleteUrl = obj.url + '/' + $(this).val();
            zudp.plugin.dialog("warning").confirm("确认要删除吗？", "确认", function () {
                zudp.ajax(deleteUrl).del('').then(function (da) {
                    zudp.plugin.dialog("success").alert(msgSuccess + "!", "提示");
                    dataTable.ajax.reload();
                }, function (error) {
                    zudp.plugin.dialog("warning").alert(msgError + "!", "警告");
                    dataTable.ajax.reload();
                });
            });
            obj.callback.delete(rowData);
        });

        $(document).on("click", "#delete-items", function () {
            var data = dataTable.rows('.evenSelect').data();
            var ids = [];
            for (var k = 0; k < data.length; k++) {
                ids.push(data[k].id);
            }
            if (ids.length == 0) {
                zudp.plugin.dialog("warning").confirm("数据未选中", "关闭")
                return;
            }
            var msgSuccess = zudp.util.render(obj.success, {"msg": "批量删除成功"});
            var msgError = zudp.util.render(obj.error, {"msg": "批量删除失败"});
            zudp.plugin.dialog("warning").confirm("确认要删除吗？", "确认", function () {
                zudp.ajax(obj.url).del(JSON.stringify(ids)).then(function (da) {
                    zudp.plugin.dialog("success").alert(msgSuccess + "!", "提示");
                    dataTable.ajax.reload();
                }, function (error) {
                    zudp.plugin.dialog("warning").alert(msgError + "!", "警告");
                    dataTable.ajax.reload();
                });
            });
            obj.callback.deleteMore(data);
        });

        var searchDom=''
        var searchInput=''
        if (obj.search.length == 3) {
            searchDom=obj.search[1];
            searchInput=obj.search[2];
            zudp.plugin.clearFormData(obj.search[0], obj.search[1]);
        }
        $(document).on("click", ".research-btn", function () {
            dataTable.ajax.reload();
            //$(searchDom).slideUp(300);
        });
        $(document).on('keydown', function (event) {
            if (event.keyCode == 13) {
                dataTable.ajax.reload();
                $(searchDom).slideUp(300);
                return false;
            }
        });
        $(".my-querybtn "+searchInput).on('keyup change',function() {
            var value = $(".my-querybtn "+searchInput).val();
            $(searchDom+" "+searchInput).val(value);
        });
        $(searchDom+" "+searchInput).on('keyup change',function() {
            $(".my-querybtn "+searchInput).val($(searchDom+" "+searchInput).val());
        });
        $(document).on("click", '.select-query', function () {
            $(searchDom).slideToggle("fast", function () {
            });
        });
        var rowData = dataTable.row($(this).parents('tr')).data();
        // obj.callback.search(rowData);
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
