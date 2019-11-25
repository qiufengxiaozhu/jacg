//被选中的角色的id
var role_id = "";
//tab切换页的下标 默认选中第一个切换页
var tabIndex = 1;

var funTree;

var groupTree;

$(document).ready(function () {
    maintainFunctionTree();
    maintainGroupTree();
    findAllRole();

    $('#list-table-member tbody').on('click', 'tr', function () {
    });
    $('#list-table-resources tbody').on('click', 'tr', function () {
    });
    //新增角色
    $(".role_add").bind("click", function () {
        $('form input[type=radio]:first').iCheck('check');
        cleanRoleModel();
        $("#roleInsertOrUpdate").val("1");
    });

    //保存角色
    $("#addRole").bind("click", function () {
        if ($("#role_form").valid()) {
            var data = zudp.util.formData2json("#role_modal form");
            if ($("#roleInsertOrUpdate").val() == 1) {
                zudp.ajax("/api/role")
                    .post(data)
                    .then(function (data) {
                        findAllRole();
                        zudp.plugin.dialog("success").alert("操作成功！", "提示");
                        $("#role_modal").modal("hide");
                    }, function (error) {
                        zudp.plugin.dialog("warning").alert("操作失败！", "警告");
                    });
            } else {
                zudp.ajax("/api/role/" + $("#role_id").val())
                    .put(data)
                    .then(function (data) {
                        $("#role_modal").modal("hide");
                        zudp.plugin.dialog("success").alert("操作成功！", "提示");
                        findAllRole();
                        getRoleDetailById(role_id);
                    }, function (error) {
                        zudp.plugin.dialog("warning").alert("操作失败！", "警告");
                    });
            }
        }
    });

    //修改角色
    $(".role_update").bind("click", function () {
        zudp.plugin.form("#role_form").reset();
        $("#role_form_name").html("角色修改");
        $("#role_role").attr("readonly", "readonly");
        zudp.ajax("/api/role/" + role_id)
            .get()
            .then(function (data) {
                $("#roleInsertOrUpdate").val("0");
                $("#role_id").val(data.id);
                $("#role_name").val(data.name);
                $("#role_role").val(data.role);
                $("#role_description").val(data.description);
                if (data.actived == "1") {
                    $('form input[type=radio]:first').iCheck('check');
                } else {
                    $('form input[type=radio]:last').iCheck('check');
                }
            }, function (error) {

            });
    });

    //删除角色
    $(".role_delete").bind("click", function () {
        swalFunction("确认删除", function () {
            zudp.ajax("/api/role/" + role_id)
                .del()
                .then(function (da) {
                    findAllRole();
                    $(".role_update").hide();
                    $(".role_delete").hide();
                    role_id = "";
                    $("#role tbody").html("");
                    zudp.plugin.dialog("success").alert("删除成功！", "提示");
                }, function (error) {
                    zudp.plugin.dialog("warning").alert("删除失败！", "警告");
                });
        }, "删除");
    });
});

//资源的查询
function resources_select() {
    zudp.plugin.table("#list-table-resources").then().ajax.reload();
}

//成员的查询
function member_select() {
    zudp.plugin.table("#list-table-member").then().ajax.reload();
}

//维护一颗功能节点树
function maintainFunctionTree() {
    var setting = {
        data: {
            simpleData: {
                pIdKey: "parentId",
                enable: true
            }
        },
        view: {
            selectedMulti: false
        }
    };
    zudp.ajax("/api/role/showAllFunItems")
        .get()
        .then({
            success: function (data) {
                funTree = $.fn.zTree.init($("#fun-tree"), setting, data);

            }
        });
}

function maintainGroupTree() {
    var setting = {
        data: {
            simpleData: {
                pIdKey: "parentId",
                enable: true
            }
        },
        view: {
            selectedMulti: false
        }
    };
    zudp.ajax("/api/role/showAllValGroup")
        .get()
        .then({
            success: function (data) {
                groupTree = $.fn.zTree.init($("#group-tree"), setting, data);
            }
        });
}


//成员的批量删除
function member_delete() {
    var data = dataTable.rows('.evenSelect').data();
    var ids = [];
    for (var k = 0; k < data.length; k++) {
        ids.push(data[k].id);
    }
    if (ids.length == 0) {
        zudp.plugin.dialog('error').confirm("数据未被选中", "确定");
        return;
    }
    swalFunction("确认删除", function () {
        if (role_id != null && role_id != "") {
            zudp.ajax("/api/member/" + role_id).del(JSON.stringify(ids)).then(function (da) {
                zudp.plugin.dialog("success").alert("删除成功！", "提示");
                zudp.plugin.table("#list-table-member").then().ajax.reload();
            }, function (error) {
                zudp.plugin.dialog("warning").alert("删除失败！", "警告");
            });
        }
    }, "删除");
}

//资源的批量删除
function resources_delete() {
    var data = dataTable.rows('.evenSelect').data();
    var ids = [];
    for (var k = 0; k < data.length; k++) {
        ids.push(data[k].id);
    }
    if (ids.length == 0) {
        zudp.plugin.dialog('error').confirm("数据未被选中", "确定");
        return;
    }
    swalFunction("确认删除", function () {
        if (role_id != null && role_id != "") {
            zudp.ajax("/api/resource/batch/" + role_id).del(JSON.stringify(ids))
                .then(function (da) {
                    zudp.plugin.table("#list-table-resources").then().ajax.reload();
                    zudp.plugin.dialog("success").alert("删除成功！", "提示");
                }, function (error) {
                    zudp.plugin.dialog("warning").alert("删除失败！", "警告");
                });
        }
    }, "删除");
}

//资源的添加
function resources_insert(a, type) {
    console.log($(a).attr("id"));
    console.log(type);
    $("#insert_resources").val(type);
    var frameSrc = "/sys/" + $(a).attr("id");

    $("#role_resources_iframe").attr("src", frameSrc);
    $('#role_resources').modal({show: true, backdrop: 'static'});
}

//成员的添加
function member_insert(a, type) {
    $("#insert_member").val(type);
    var frameSrc = "/sys/" + $(a).attr("id");
    $("#role_member_iframe").attr("src", frameSrc);
    $('#role_member').modal({show: true, backdrop: 'static'});
}

//清空角色模态框中form表单的数据
function cleanRoleModel() {
    zudp.plugin.form("#role_form").reset();
    $("#role_form_name").html("角色新增");
    $("#role_id").val("");
    $("#role_role").removeAttrs("readonly");
    $("#role_name").val("");
    $("#role_role").val("");
    $("#role_description").val("");
    $(".role_actived").eq(0).prop("checked", "checked")
}

//查询出所有角色
function findAllRole() {
    zudp.ajax("/api/role").get("").then(function (data) {
        var da = data.result;
        var html = "";
        $(".left_role ul").html("");
        for (var k = 0; k < da.length; k++) {
            html +=
                "<li onclick='left_role_li_click(this)' id='" + da[k].id + "'>" + da[k].name
                + "</li>";
        }
        $(".left_role ul").html(html);
        $("#" + role_id).toggleClass('role_li_check_background');
    }, function (error) {

    });
}

//某角色被选择
function left_role_li_click(a) {
    //被选中就修改全局变量
    role_id = $(a).attr("id");
    $("#span_id").val(role_id);
    $(".role_update").show();
    $(".role_delete").show();
    change_role_li_coloe(a);
    //当选中第一个tab切换页的时候刷新第一个tab切换页中的信息 其他就刷新其他信息
    if (tabIndex == 1) {
        getRoleDetailById(role_id);
    } else if (tabIndex == 2) {
        zudp.plugin.table("#list-table-member").then().ajax.reload();
    } else if (tabIndex == 3) {
        zudp.plugin.table("#list-table-resources").then().ajax.reload();
    } else {
        alert("其他tab切换页");
    }
}

//备选中的角色变换颜色
function change_role_li_coloe(a) {
    $(".left_role li").each(function (i, d) {
        $(this).removeClass("role_li_check_background");
    });
    $(a).addClass("role_li_check_background");
}

//根据角色id获取角色详情list-table-role
function getRoleDetailById(id) {
    zudp.ajax("/api/role/" + id)
        .get()
        .then({
                  success: function (data) {
                      var context = [
                          { key: '名称', value: data.name},
                          { key: '角色名', value: data.role},
                          { key: '描述', value: data.description},
                          { key: '是否激活', value: data.actived ? '是' : '否'}
                      ];

                      var template = '<tr><td class="role_td">{key}</td><td>{value}</td></tr>';
                      $("#role tbody").html(zudp.util.renderArray(template, context));
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
