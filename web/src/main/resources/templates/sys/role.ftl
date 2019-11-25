<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>角色管理</title>
    <link href="/css/third/bootstrap.min.css" rel="stylesheet">
    <link href="/css/third/font-awesome.min.css" rel="stylesheet">
    <link href="/css/third/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/third/animate.min.css" rel="stylesheet">
    <link href="/css/third/sweetalert.css" rel="stylesheet"/>
    <link href="/css/third/toastr.min.css" rel="stylesheet"/>
    <link href="/css/third/iCheck/square/green.css" rel="stylesheet"/>
    <link href="/css/style.min.css" rel="stylesheet">
    <style>
        .role_td {
            text-align: right;
            width: 15%;
        }

        .role_li_check_background {
            background: #efefef;
            border-left: 2px solid #1c84c6;
        }
    </style>
</head>

<body class="gray-bg">
<div style="display: none">
    <ul id="fun-tree"></ul>
    <ul id="group-tree"></ul>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="role-pane-bg">
        <div class="role-pane-pd">
            <div class="row">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins ">
                        <div class="ibox-content clearfix">
                            <div class="left_role group-left_role">
                                <input type="hidden" id="span_id">
                                <input type="hidden" id="insert_member">
                                <input type="hidden" id="insert_resources">
                                <h4 style="text-indent: 0.5em;    margin: 8px 0;">角色</h4>
                                <ul class="folder-list role-folder-list"
                                    style="padding: 0; margin-bottom:0px;overflow: auto;">

                                </ul>
                            </div>
                            <div class="right_role_detail group-right_role_detail">
                                <div class="col-sm-12">
                                    <div class="tabs-container role-tabs-container">
                                        <ul class="nav nav-tabs" id="myTab">
                                            <li><a href="#role">角色信息</a></li>
                                            <li><a href="#member">成员信息</a></li>
                                            <li><a href="#resources">资源信息</a></li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="role">
                                                <div class="panel-body">
                                                    <div class="row">
                                                        <div class="form-group">
                                                            <div class='col-sm-12'>
                                                                <@hasPermission name="sys:role:create">
                                                                <button class='btn btn-success role_add'
                                                                        data-toggle='modal' data-target='#role_modal'>
                                                                    新增
                                                                </button>&nbsp;&nbsp;
                                                                </@hasPermission>
                                                                <@hasPermission name="sys:role:update">
                                                                <button class='btn btn-info role_update'
                                                                        style="display: none" data-toggle='modal'
                                                                        data-target='#role_modal'>
                                                                    编辑
                                                                </button>&nbsp;&nbsp;
                                                                </@hasPermission>
                                                                <@hasPermission name="sys:role:delete">
                                                                <button class='btn btn-danger role_delete'
                                                                        style="display: none">
                                                                    删除
                                                                </button>
                                                                </@hasPermission>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class='col-sm-12'>
                                                                <table id="list-table-role"
                                                                       class="table table-striped table-bordered table-hover dataTables-example"
                                                                       style="width:100%;margin-top: 5px">
                                                                    <tbody></tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="member">
                                                <div class="panel-body">
                                                    <div class="ibox float-e-margins role-float-e-margins">
                                                    <#--<div class="ibox-title">-->
                                                    <#--</div>-->
                                                        <div class=" form-inline ">
                                                            <div class='col-sm-12'>
                                                                <div class='form-group'>
                                                                    <div class='col-sm-12'>
                                                                        <label class='control-label'>类型：</label>
                                                                        <select class='form-control'
                                                                                id='member_type_select' name='account'>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class='form-group'>
                                                                    <div class='col-sm-12'>
                                                                        <label class='control-label'>名称：</label>
                                                                        <input type='text' id='member_name_select'
                                                                               class='form-control'>
                                                                    </div>
                                                                </div>
                                                                <div class='form-group' style='float: right'>
                                                                    <div class='col-sm-12'>
                                                                        <button class='btn btn-primary role-mr'
                                                                                onclick='member_select()'>
                                                                            搜索
                                                                        </button>
                                                                        <div class="input-group-btn role-mr"
                                                                             style="display: inline-block;width: 65px;">
                                                                            <@hasPermission name="sys:resource:batchInsert">
                                                                            <button data-toggle="dropdown"
                                                                                    class="btn btn-success dropdown-toggle"
                                                                                    type="button">新增 <span
                                                                                    class="caret"></span>
                                                                            </button>
                                                                            </@hasPermission>
                                                                            <ul class="dropdown-menu pull-right"
                                                                                id="insert_members">

                                                                            </ul>
                                                                        </div>

                                                                        <@hasPermission name="sys:member:batchDelete">
                                                                        <button class='btn btn-danger'
                                                                                onclick='member_delete();'>
                                                                            批量删除
                                                                        </button>
                                                                        </@hasPermission>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <table id="list-table-member"
                                                                   class="table role-table table-bordered dataTables-example"
                                                                   style="width:100%">
                                                                <thead>
                                                                <th>id</th>
                                                                <th>类型</th>
                                                                <th>名称</th>
                                                                <th>操作</th>
                                                                </thead>
                                                                <tbody>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="resources">
                                                <div class="panel-body">
                                                    <div class="ibox float-e-margins role-float-e-margins">
                                                        <div class='form-inline'>
                                                            <div class='col-sm-12'>
                                                                <div class='form-group'>
                                                                    <div class='col-sm-12'>
                                                                        <label class='control-label'>类型：</label>
                                                                        <select class='form-control' name='account'
                                                                                id='resources_type_select'>
                                                                            <option value=''>请选择</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class='form-group'>
                                                                    <div class='col-sm-12'>
                                                                        <label class='control-label'>名称：</label>
                                                                        <input type='text' class='form-control'
                                                                               id='resources_name_select'>
                                                                    </div>
                                                                </div>
                                                                <div class='form-group' style='float: right'>
                                                                    <div class='col-sm-12'>
                                                                        <button class='btn btn-primary role-mr'
                                                                                onclick='resources_select()'>
                                                                            搜索
                                                                        </button>
                                                                        <div class="input-group-btn role-mr"
                                                                             style="    display: inline-block;width: 65px;">
                                                                            <@hasPermission name="sys:resource:batchInsert">
                                                                            <button data-toggle="dropdown"
                                                                                    class="btn btn-success dropdown-toggle"
                                                                                    type="button">新增 <span
                                                                                    class="caret"></span>
                                                                            </button>
                                                                            </@hasPermission>
                                                                            <ul class="dropdown-menu pull-right"
                                                                                id="insert_resourcess">

                                                                            </ul>
                                                                        </div>
                                                                        <@hasPermission name="sys:resource:batchDelete">
                                                                        <button class='btn btn-danger'
                                                                                onclick='resources_delete();'>
                                                                            批量删除
                                                                        </button>
                                                                        </@hasPermission>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <table id="list-table-resources"
                                                                   class="table role-table table-bordered  dataTables-example"
                                                                   style="width:100%">
                                                                <thead>
                                                                <th>id</th>
                                                                <th>类型</th>
                                                                <th>名称</th>
                                                                <th>父节点</th>
                                                                <th>操作</th>
                                                                </thead>
                                                                <tbody>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal inmodal fade" id="role_modal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="role_form_name">角色添加</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body role-modal-body">
                    <form class="form-horizontal" id="role_form">
                        <input type="hidden" name="id" id="role_id" class="form-control">
                        <div class="form-group">
                            <label class="col-sm-3 control-label role-control-label">名称：</label>
                            <div class="col-sm-6">
                                <input type="text" name="name" id="role_name" placeholder="角色名称" maxlength="32"
                                       class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label role-control-label">标识：</label>
                            <div class="col-sm-6">
                                <input type="text" name="role" maxlength="32" id="role_role" placeholder="角色标识"
                                       class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label role-control-label">描述：</label>
                            <div class="col-sm-6">
                                <input type="text" name="description" maxlength="72" id="role_description"
                                       placeholder="角色描述" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label  role-control-label">是否激活：</label>
                            <div class="col-sm-6">
                                <div class="i-checks">
                                    <label class="control-label">
                                        <input type="radio" class="role_actived" value="true" name="actived" checked>
                                        <i></i> 激活&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <label class="control-label">
                                        <input type="radio" class="role_actived" value="false" name="actived"> <i></i>
                                        不激活</label>
                                </div>
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <input type="hidden" id="roleInsertOrUpdate">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="addRole">保存</button>
                </div>
            </small>
        </div>
        <small class="font-bold">
        </small>
    </div>
    <small class="font-bold">
    </small>
</div>
<div class="modal inmodal fade" id="role_member" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" onclick="closeMemberModel()" data-dismiss="modal"><span
                        aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">成员添加</h4>
            </div>
            <div class="modal-body role-modal-body no-padding" style="height:450px;overflow-y:hidden">
                <iframe id="role_member_iframe" width="100%" height="100%" frameborder="0"></iframe>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal fade" id="role_resources" tabindex="-1" role="dialog" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">资源添加</h4>
            </div>
            <div class="modal-body role-modal-body no-padding" style="height:400px;">
                <iframe id="role_resources_iframe" width="100%" height="100%" frameborder="0"></iframe>
            </div>
        </div>
    </div>
</div>
<script src="/js/third/jquery.min.js"></script>
<script src="/js/third/bootstrap.min.js"></script>
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script src="/js/third/jquery.dataTables.min.js"></script>
<script src="/js/third/dataTables.bootstrap.js"></script>
<script src="/js/third/jquery.validate.min.js"></script>
<script src="/js/third/icheck.min.js"></script>
<script src="/js/third/jquery.ztree.all.js"></script>
<script src="/js/zudp.js"></script>
<script src="/js/sys/role.js"></script>
<script>

    $(document).ready(function () {
        $('#myTab a:first').tab('show');
        $('#myTab a').click(function (e) {
            var href = $(this).attr("href");
            if (role_id == "" && href != '#role') {
                zudp.plugin.dialog('error').confirm('请选择一个角色', '确定');
                // swals("请选择一个角色");
                return;
            }

            e.preventDefault();

            switch (href) {
                case '#role':
                    tabIndex = 1;
                    if (role_id != '') {
                        getRoleDetailById(role_id);
                    }
                    break;
                case '#member':
                    tabIndex = 2;
                    list_table_member();
                    zudp.plugin.table("#list-table-member").then().ajax.reload();
                    break;
                case '#resources':
                    tabIndex = 3;
                    list_table_resources();
                    tableReload("#list-table-resources");
                    break;
                default:
                    throw '未知的操作' + href;
            }

            $(this).tab('show');
        });

        $(document).on('click', '.resource-del-btn', function (e) {
            // 清除冒泡
            if (e && e.stopPropagation) {
                e.stopPropagation();
            } else {
                window.e.cancelBubble = true;
            }

            var value = $(this).val();
            zudp.ajax("/api/resource/" + value + "/" + role_id)
                    .del()
                    .then(function (data) {
                        zudp.plugin.table("#list-table-resources").then().ajax.reload();
                        zudp.plugin.dialog("success").alert("删除成功！", "提示");
                    }, function (error) {
                        zudp.plugin.dialog("warning").alert("删除失败！", "警告");
                    });
        });

        $(document).on('click', '.member-del-btn', function (e) {
            if (e && e.stopPropagation) {
                e.stopPropagation();
            } else {
                window.e.cancelBubble = true;
            }

            zudp.ajax("/api/member/" + role_id + "/" + $(this).val())
                    .del()
                    .then(function (data) {
                        zudp.plugin.dialog("success").alert("删除成功！", "提示");
                        zudp.plugin.table("#list-table-member").then().ajax.reload();
                    }, function (error) {
                        zudp.plugin.dialog("warning").alert("删除失败！", "警告");
                    });
        });

        getMemberType();
        getResourceType();

        $("#role_form").validate({
            rules: {
                name: {
                    required: true
                },
                role: {
                    required: true,
                    is_roleName: true
                }
            },
            messages: {
                name: {
                    required: "请输入名称"
                },
                role: {
                    required: "请输入角色名"
                }
            }

        });
    });

    var dataTable;
    //成员的类型
    var memberType;
    //资源的类型
    var resourceType;

    function closeMemberModel() {
        this.closeAllModal();
        tableReload("#list-table-member");
    }

    //查询所有资源的类型
    function resource_type() {
        zudp.ajax("/api/resource/type")
                .get("")
                .then(function (data) {
                    $("#resources_type_select").html("");
                    var html = "<option value=''>请选择</option>";
                    for (var k = 0; k < data.length; k++) {
                        html += "<option value='" + data[k].type + "' id='" + data[k].url + "'>" + data[k].name + "</option>"
                    }
                    $("#resources_type_select").html(html);
                }, function (error) {
                });
    }

    //查询所有成员的类型 返回封装好了的option
    function member_type() {
        zudp.ajax("/api/member/type")
                .get()
                .then(function (data) {
                    var html = '<option value="">请选择</option>';
                    $("#member_type_select").html("");
                    html += zudp.util.renderArray('<option value="{type}" id="{url}">{name}</option>', data);
                    $("#member_type_select").html(html);
                });
    }

    //查询所有成员的类型 直接返回data
    function getMemberType() {
        zudp.ajax("/api/member/type").get().then(function (data) {
            memberType = data;
        });
    }

    //查询所有资源的类型 直接返回data
    function getResourceType() {
        zudp.ajax("/api/resource/type").get().then(function (data) {
            resourceType = data;
        });
    }

    function list_table_member() {
        dataTable = zudp.plugin
                .table('#list-table-member')
                .url('/api/member/list')
                .search(function () {
                    return {
                        role: role_id,
                        name: $("#member_name_select").val(),
                        type: $("#member_type_select").val(),
                    }
                })
                .columns([
                    {data: 'id', visible: false},
                    {
                        render: function (data, type, row) {
                            var html;
                            for (var k = 0; k < memberType.length; k++) {
                                if (row.type === memberType[k].type) {
                                    html = memberType[k].name;
                                }
                            }
                            return html;
                        }
                    },
                    {data: 'name'},
                    {
                        render: function (data, type, row) {
                            var html = '<@hasPermission name="sys:member:batchDelete"><button class="member-del-btn btn btn-danger btn-sm mgl" value="{id}">删除</button>&nbsp;&nbsp;</@hasPermission>';
                            return zudp.util.render(html, row);
                        }
                    }
                ])
                .then();
        set_member_type();
    }

    function set_member_type() {
        member_type();
        var html1 = "";
        for (var k = 0; k < memberType.length; k++) {
            html1 += "<li><a href='#' onclick=member_insert(this,'" + memberType[k].type + "') id=" + memberType[k].url + ">" + memberType[k].name + "</a></li>";
        }
        $("#insert_members").html("");
        $("#insert_members").html(html1);
    }

    function list_table_resources() {
        dataTable = zudp.plugin
                .table('#list-table-resources')
                .url('/api/resource/list')
                .search(function () {
                    return {
                        role: role_id,
                        name: $("#resources_name_select").val(),
                        type: $("#resources_type_select").val()
                    }
                })
                .columns([
                    {data: 'id', visible: false},
                    {
                        render: function (data, type, row) {
                            var html;
                            for (var k = 0; k < resourceType.length; k++) {
                                if (row.type === resourceType[k].type) {
                                    html = resourceType[k].name;
                                }
                            }
                            return html;
                        }
                    },
                    {data: 'name'},
                    {
                        render: function (data, type, row) {
                            var nodeId = data.resource;
                            if (data.type == "group") {
                                var target = groupTree.getNodesByFilter(function(groupNode) {
                                    var ids = nodeId.split(":");
                                    if(ids.length == 1 && ids[0] == groupNode.id) {
                                        return groupNode;
                                    }
                                    if(nodeId.indexOf("*") ==-1 && groupNode.id == ids[ids.length-1]) {
                                        return groupNode;
                                    } else if(ids[ids.length-2] == groupNode.id) {
                                        return groupNode;
                                    }
                                }, true);
                                return target.getParentNode() == null?"":target.getParentNode().treeName;
                            } else if (data.type == "function") {
                                var target = funTree.getNodesByFilter(function (node) {
                                    if (nodeId != "" && nodeId.indexOf(":") != -1) {
                                        var uniqueId = node.parentIds + ":" + node.id;
                                        if (nodeId == uniqueId) {
                                            return node;
                                        }
                                    }
                                    if (nodeId != "" && nodeId.indexOf(":") == -1) {
                                        if (nodeId == node.id) {
                                            return node;
                                        }
                                    }
                                }, true)

                                if(target == null) {
                                    return "";
                                }
                                return target.getParentNode() == null ? "" : target.getParentNode().name;
                            }
                        }

                    },
                    {
                        render: function (data, type, row) {
                            var template = '<@hasPermission name="sys:resource:delete"><button class="resource-del-btn btn btn-danger btn-sm mgl" value="{id}/{type}">删除</button>&nbsp;&nbsp;</@hasPermission>';
                            return zudp.util.render(template, row);
                        }
                    }
                ])
                .then();
        set_resource_type();
    }

    function set_resource_type() {
        resource_type();
        var html1 = "";
        for (var k = 0; k < resourceType.length; k++) {
            html1 += "<li><a href='#' onclick=resources_insert(this,'" + resourceType[k].type + "'); id=" + resourceType[k].url + ">" + resourceType[k].name + "</a></li>";
        }
        $("#insert_resourcess").html("");
        $("#insert_resourcess").html(html1);
    }

    $(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green"});

    function setTabWidth() {
        $("#list-table-role").css("width", "100%");
        $("#list-table-member").css("width", "100%");
        $("#list-table-resources").css("width", "100%");
    }
</script>

<script type="text/javascript">
    function tableReload(selector) {
        zudp.plugin.table(selector).then().ajax.reload();
    }

    function tableReloadForIfram(selector) {
        zudp.plugin.dialog("success").alert("新增成功", "提示");
        zudp.plugin.table(selector).then().ajax.reload();
    }

    function closeAllModal() {
        $(".modal").modal("hide");
    }

    jQuery.validator.addMethod("is_roleName", function (value, element, param) {
        var patrn = /^[0-9a-zA-Z_]{1,}$/;
        if (!patrn.exec(value)) {
            return false;
        }
        return true;
    }, "角色名只能由数字字母和下划线组成");


    function heightFill(obj, othersHeight) {  //othersHeight其余部分内容高度
        var availH = window.screen.availHeight,// 屏幕可用高度
                innerH = $(window.parent).height(),
                outerH = window.outerHeight;       //浏览器高度
        if (availH == outerH) {     //是否全屏
            scrollY = innerH - 140;    //iframe高度
            scrollY -= othersHeight;    //210是其他内容高度
        } else {
            var y = innerH - 140;
            if (y < 500) {
                y = 500;
            }
            scrollY = y - othersHeight;
        }
        obj.css("min-height", scrollY)
    }

    heightFill($(".ibox-content"), 40);
    $(window).resize(function () {
        heightFill($(".ibox-content"), 40);
    });
</script>
</body>
</html>
