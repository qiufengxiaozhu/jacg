<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户</title>
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link href="/css/third/bootstrap.min.css" rel="stylesheet">
    <link href="/css/third/font-awesome.min.css" rel="stylesheet">
    <link href="/css/third/custom.css" rel="stylesheet">
    <link href="/css/third/sweetalert.css" rel="stylesheet"/>
    <link href="/css/third/toastr.min.css" rel="stylesheet"/>
    <link href="/css/third/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/third/animate.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="ibox-content form-inline ">
                    <div class=" col-sm-12">
                        <@hasPermission name="sys:groupSetting:user:create">
                        <button class="btn btn-success" data-toggle="modal" id="add-btn" >新增</button>&nbsp;&nbsp;
                        </@hasPermission>
                        <@hasPermission name="sys:groupSetting:user:batchDelete">
                        <button class="btn btn-success btn-danger" id="delete-items" >批量删除</button>
                        </@hasPermission>
                        <div class="querybtn my-querybtn">
                            <label id="click"></label>
                            <input type="text" name="search" maxlength="255" id="user_loginName_select_first"  placeholder="用户名" class="form-control search-input">
                            <input type="text" name="name" maxlength="255" id="user_name_select" placeholder="姓名" class="form-control">
                            <input type="text" name="phone" id="user_phone_select" placeholder="电话号码" class="form-control">
                            <button class="btn btn-primary mgl my-mgl research-btn" >搜索</button>
                            <button class="btn btn-primary mgl my-mgl clear-input" >清空</button>&nbsp;&nbsp;
                        </div>
                    </div>
                   <#-- <div id="search" class="search-group" style="display:none;">

                    </div>-->
                    <table id="user-list-table" class="table my-table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>用户名</th>
                            <th>姓名</th>
                            <th>年龄</th>
                            <th>生日</th>
                            <th>电话号码</th>
                            <th>电子邮箱</th>
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
                <h4 class="modal-title" id="modelTitle">用户添加</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body">
                <#--表单-->
                    <form class="form-horizontal" id="user_form">
                        <input type="hidden" name="id" id="user_id">
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">用户名：</label>
                            <div class="col-sm-6">
                                <input type="text" maxlength="255" name="loginName" id="user_loginName" placeholder="用户名" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                        <div class="form-group">

                            <label class="col-sm-3 control-label my-control-label">姓名：</label>

                            <div class="col-sm-6">
                                <input type="text" name="name" maxlength="255" id="user_name" placeholder="姓名" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">出生日期：</label>

                            <div class="col-sm-6">
                                <input type="text" name="birthday" id="user_birthday" startDate placeholder="出生日期" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">性别：</label>
                            <div class="col-sm-6">
                                <div class="radio i-checks">
                                    <label class="control-label">
                                        <input type="radio" value="1" name="gender" checked=""> <i></i> 男</label>
                                    <label class="control-label">
                                        <input type="radio" value="0" name="gender"> <i></i> 女</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">年龄：</label>

                            <div class="col-sm-6">
                                <input type="text" name="age" id="user_age" placeholder="年龄" class="form-control">
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">联系电话：</label>

                            <div class="col-sm-6">
                                <input type="text" name="phone" id="user_phone" placeholder="电话" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">电子邮箱：</label>

                            <div class="col-sm-6">
                                <input type="text" name="email" id="user_email" placeholder="电子邮箱" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">登录密码：</label>
                            <div class="col-sm-6">
                                <input type="password" name="password" maxlength="255" id="user_password" placeholder="登录密码" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">确认密码：</label>

                            <div class="col-sm-6">
                                <input type="password" maxlength="255" name="password1" id="user_password1"  placeholder="确认密码" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <input type="hidden" id="user_add_type">
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
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script src="/js/third/jquery.dataTables.min.js"></script>
<script src="/js/third/dataTables.bootstrap.js"></script>
<script src="/js/third/icheck.min.js"></script>
<script src="/js/third/laydate/laydate.js"></script>
<script src="/js/pluginInit/laydateInit.js"></script>
<script src="/js/pluginInit/dataecho.js"></script>
<script src="/js/zudp.js"></script>
<script>
    var dataTable;
    $(document).ready(function () {
        $("#user_form").validate({
            rules: {
                loginName: {
                    required:true,
                    isLoginName:true,
                    remote: {
                        url:"/api/user/checkLoginName",
                        type:"get",
                        data: {
                            "loginName":function () {
                                return $("#user_loginName").val();
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
                name: "required",
                age: {
                    digits:true,
                    range:[0,200]
                },
                birthday: {
                    date:true,
                    required: true
                },
                phone: {
                    required: true
                },
                email: {
                    required:true,
                    email:true,
                    remote: {
                        url:"/api/user/checkEmail",
                        type:"get",
                        data:{
                            "email":function() {
                                return $("#user_email").val();
                            },
                            "userId":function() {
                                return $("#user_id").val();
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
                password:{
                    required:true,
                    passwordLength:true
                },
                password1: {

                    required:true,
                    equalTo: "#user_password"
                }
            },
            messages: {
                loginName: {
                   required: "请输入你的用户名",
                   remote: "用户名已存在"
                },
                name: "请输入你的姓名",
                birthday: {
                    date: "请输入正确的时间格式",
                    required:"请填写出生日期"
                },
                age:{
                    digits: "请输入正确的类型",
                    range: "请输入正确年龄范围(0~200)"
                },
                email: {
                    required:"请填写邮箱",
                    email:"请输入正确邮箱格式",
                    remote:"该邮箱已经被注册"
                },
                phone: {
                    required:"请填写联系电话"
                },
                password:{
                  required:"请输入密码",
                  length:"请输入6到32位密码"
                },
                password1:{
                    required:"请再次输入密码",
                    equalTo:"密码不匹配"
                }
            }
        });

        $(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});

        //增删改查的参数
        var obj = {
            url: "/api/user",
            formId: "#user_form",
            table: {
                id: '#user-list-table',
                search: function () {
                    return {
                        "loginName":$("#user_loginName_select_first").val(),
                        "name":$("#user_name_select").val(),
                        "phone":$("#user_phone_select").val()
                    }
                },
                columns: [
                    {data: 'id', visible: false, searchable: false},
                    {data: 'loginName'},
                    {data: 'name'},
                    {data: 'age'},
                    {
                        render: function (data, type, row) {
                            return zudp.util.timeformater(data.birthday);
                        }
                    },
                    {data: 'phone'},
                    {data: 'email'},
                    {
                        render: function (data, type, row) {
                            return data.status == '1' ? "已激活" : "未激活";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            var update_btn = <@hasPermission name="sys:groupSetting:user:update">zudp.template.editBtn</@hasPermission>+"";
                            var delete_btn =   <@hasPermission name="sys:groupSetting:user:delete">zudp.template.delBtn</@hasPermission>+"";
                            var updatePassword_btn = <@hasPermission name="sys:groupSetting:user:updatePassword"> "<button class=\"btn btn-info btn-sm  btn-img\" onclick=\"updatePassword('" + row.id + "')\" title='修改密码'>修改密码</button>"</@hasPermission>+"";
                            var updateUserStatus_btn = "";
                            if(data.status == '1'){
                                updateUserStatus_btn =  <@hasPermission name="sys:groupSetting:user:updateUserStatus"> "&nbsp;<button class=\"btn btn-success btn-sm  btn-img\" onclick=\"translateNo('" + row.id + "')\" title='禁用'>禁用</button>"</@hasPermission>+"";
                            }else{
                                updateUserStatus_btn =  <@hasPermission name="sys:groupSetting:user:updateUserStatus"> "&nbsp;<button class=\"btn btn-warning btn-sm  btn-img\" onclick=\"translates('" + row.id + "')\" title='激活'>激活</button>"</@hasPermission>+"";
                            }
                            return zeroToSpace(update_btn)+zeroToSpace(delete_btn)+zeroToSpace(updatePassword_btn)+zeroToSpace(updateUserStatus_btn);                        }
                        }
                    }
                ]
            },
            title: "用户{type}",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["loginName"],
            hideInputName:['password','password1'],
            search: [".clear-input", "#search",".search-input"]
        };

        //初始化新建
        dataTable = zudp.component.initCURD(obj);

    });

    //jquery 手机号码验证
    jQuery.validator.addMethod("isPhoneNum",function (value, element, param) {
        var length = value.length;
        return this.optional(element) || (length == 11 && zudp.util.checkStr(value, "phone"));
    }, "请正确填写您的手机号码");

    jQuery.validator.addMethod("isLoginName",function (value, element, param) {
        var length = value.length;
        var login_name = /^[a-zA-Z][a-zA-Z0-9_]*$/;
        return this.optional(element) || (length <= 16  && login_name.test(value));
    }, "请输入至多16位的以字母开头只能包含大小写字母数字下划线的用户名。");

    jQuery.validator.addMethod("passwordLength",function (value, element, param) {
        var length = value.length;
        return this.optional(element) || (length <= 32  && length >= 6);
    }, "请输入6到16位密码");

</script>
<script>
    function clearOther(){
        $("#user_loginName_select_first").val('');
        $("#user_name_select").val('');
        $("#user_phone_select").val('');
        dataTable.ajax.reload();
    }

    /**  修改密码 js 开始 */
    function updatePassword(id) {
        document.getElementById("pwd").reset();
        $("#pwId").val(id);
        $('#role_member2').modal({show: true, backdrop: 'static'});
    }

    function upwordpass(){
        $("#pwdspan").html("");
        $("#rewppwdspan").html("");
        var gid = $("#pwId").val();
        var pwd = $("#uppwd").val();
        var reuppwd = $("#reuppwd").val();
        if(pwd == null || pwd == "" ){
            $("#pwdspan").html("请输入密码");

            return "";
        }
        if(reuppwd != pwd){
            $("#rewppwdspan").html("两次密码不一致");
            return "";
        }
        var da = {id: gid,password:pwd};
        zudp.ajax("/api/user/updatePassword").get(da).then(function (value) {
            zudp.plugin.dialog("success").alert("修改成功！", "提示");
            $("#role_member2").modal("hide");
        }, function (reason) {
            zudp.plugin.dialog("error").alert("修改失败！", "提示");
            $("#role_member2").modal("hide");
        });
    }
    /**  修改密码 js 结束 */

    /** 禁用 启动  开始 */
    function translates(id) {
        debugger;
        var da = {id: id,status:1};
        zudp.ajax("/api/user/updateUserStatus").get(da).then(function (value) {
            zudp.plugin.dialog("success").alert("激活成功！", "提示");
            zudp.plugin.table("#user-list-table").then().ajax.reload();
        }, function (reason) {
            zudp.plugin.dialog("error").alert("修改失败！", "提示");
            zudp.plugin.table("#user-list-table").then().ajax.reload();
        });
    }

    function translateNo(id) {
        var da = {id: id,status:0};
        zudp.ajax("/api/user/updateUserStatus").get(da).then(function (value) {
            zudp.plugin.dialog("success").alert("禁用成功！", "提示");
            zudp.plugin.table("#user-list-table").then().ajax.reload();
        }, function (reason) {
            zudp.plugin.dialog("error").alert("禁用失败！", "提示");
        });
    }
    /** 禁用 启动  结束 */

</script>
</body>
</html>
