<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>组织管理</title>
    <link href="/css/third/bootstrap.min.css" rel="stylesheet">
    <link href="/css/third/font-awesome.min.css" rel="stylesheet">
    <link href="/css/third/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/third/animate.min.css" rel="stylesheet">
    <link href="/css/third/sweetalert.css" rel="stylesheet"/>
    <link href="/css/third/toastr.min.css" rel="stylesheet"/>
    <link href="/css/third/zTree/zTreeStyle/zTreeStyle.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">

</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content clearfix">
                    <div class="left_role group-left_role">
                        <div class="col-md-12 sidebar">
                            <div class="row">
                                <div style="position: relative;">
                                    <input type="text"  id="key" class="empty form-control" placeholder="搜索..." onkeyup="callNumber()">
                                    <div class="key-right group-key-right">
                                        <label id="number"></label>
                                        <a id="clickUp" class="glyphicon glyphicon-menu-up" onclick="clickUp()"></a>
                                        <a id="clickDown" class="glyphicon glyphicon-menu-down" onclick="clickDown()"></a>
                                    </div>
                                </div>
                            </div>
                            <ul id="tree" class="ztree"></ul>
                        </div>
                    </div>

                    <div class="right_role_detail group-right_role_detail">
                        <div class="col-sm-12">
                            <div class="tabs-container">
                                <ul class="nav nav-tabs" id="myTab">
                                    <li class="active"><a href="#organiz-info" data-toggle="tab">组织信息</a></li>
                                    <li><a href="#organiz-details" data-toggle="tab">组织成员</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div id="organiz-info" class="fade in active tab-pane">
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <div class='col-sm-12' id="btns">
                                                    <#--<button class='btn btn-primary role_add' data-toggle='modal' style="display: none" data-target='#org_modal' id="addBtn">新增子节点</button>&nbsp;&nbsp;-->
                                                    <@hasPermission name="sys:group:groupInsert">
                                                    <div class="btn-group" id="insert-select-div">
                                                        <button class="btn btn-success dropdown-toggle" data-toggle="dropdown">新增<span class="caret" style="margin-left:4px;"></span>
                                                        </button>
                                                        <ul class="dropdown-menu" id="insert-select">
                                                            <li ><a data-toggle='modal' id="addBroNode" data-target='#org_modal'>顶级节点</a>
                                                            </li>
                                                        </ul>
                                                    </div>&nbsp;&nbsp;
                                                    </@hasPermission>
                                                    <@hasPermission name="sys:group:update">
                                                    <button class='btn btn-info role_update' style="display: none" data-toggle='modal' data-target='#org_modal' id="updateBtn">编辑</button>&nbsp;&nbsp;
                                                    </@hasPermission>
                                                    <@hasPermission name="sys:group:revokeId">
                                                    <button class='btn btn-warning role_delete' style="display: none" id="revoke">撤销</button>
                                                    </@hasPermission>
                                                    <@hasPermission name="sys:group:enableGroup">
                                                    <button class='btn btn-success role_delete' style="display: none" id="enable-btn">启用</button>
                                                    </@hasPermission>
                                                    <@hasPermission name="sys:group:cascadeId">
                                                    <button class='btn btn-danger role_delete' style="display: none" id="deleteBtn">删除</button>
                                                    </@hasPermission>
                                                </div>
                                            </div>
                                            <div class="form-group" style="display:none;" id="list-table-role-div">
                                                <div class='col-sm-12'>
                                                    <table id="list-table-role" class="table table-striped table-bordered table-hover dataTables-example" style="width:100%;margin-top: 5px">
                                                        <tbody>
                                                          <tr>
                                                              <td class='group_td'>组织编号</td>
                                                              <td id="group_no"></td>
                                                          </tr>
                                                          <tr>
                                                              <td class='group_td'>组织名称</td>
                                                              <td id="group_name"></td>
                                                          </tr>
                                                          <tr>
                                                              <td class='group_td'>组织描述</td>
                                                              <td id="group_desc"></td>
                                                          </tr>
                                                          <tr>
                                                              <td class='group_td'>负责人</td>
                                                              <td id="group_charge"></td>
                                                          </tr>
                                                          <tr>
                                                              <td class='group_td'>创建时间</td>
                                                              <td id="group_create_date"></td>
                                                          </tr>
                                                          <tr>
                                                              <td class='group_td'>组织状态</td>
                                                              <td id="group_status"></td>
                                                          </tr>
                                                        <#--  <tr>
                                                              <td class='group_td'>排序</td>
                                                              <td id="group_weight"></td>
                                                          </tr>-->
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="organiz-details" class="tab-pane">
                                        <div class="panel-body">
                                            <div class="ibox float-e-margins">
                                                <div class="form-inline ">
                                                    <div class='col-sm-12'>
                                                        <div class='form-group'>
                                                            <div class='col-sm-12'>
                                                                <label class='control-label'>姓名：</label>
                                                                <input class='form-control' id='primaryUser_name'>
                                                                </input>
                                                            </div>
                                                        </div>
                                                        <div class='form-group' style='float: right'>
                                                            <div class='col-sm-12'>
                                                                <@hasPermission name="sys:group:groupUserList">
                                                                <button class='btn btn-primary mgl' id="select_group_details">搜索</button>&nbsp;&nbsp;
                                                                </@hasPermission>
                                                                <@hasPermission name="sys:group:updateUserGroup">
                                                                <button class='btn btn-success' id="update_group_insert">新增</button>&nbsp;&nbsp;
                                                                </@hasPermission>
                                                                <@hasPermission name="sys:group:deleteUserGroup">
                                                                <button class='btn btn-danger' id="update_group_details">批量删除</button>
                                                                </@hasPermission>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <table id="list-details" class="table table-bordered dataTables-example" style="width:100%">
                                                        <thead>
                                                            <th>id</th>
                                                            <th>姓名</th>
                                                            <th>年龄</th>
                                                            <th>邮箱</th>
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
<div class="modal inmodal fade" id="details_modal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" onclick="closeMemberModel()" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">组织成员添加</h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content form-inline ">
                    <div class='col-sm-12'>
                        <div class='form-group'>
                            <div class='col-sm-12'>
                                <label class='control-label'>姓名：</label>
                                <input class='form-control' id='primaryUser_name_insert' />
                            </div>
                        </div>
                        <div class='form-group' style='float: right'>
                            <div class='col-sm-12'>
                                <button class='btn btn-primary mgl' id="select_group_details_insert">搜索</button>
                                <button class='btn btn-success' id="update_group_details_insert">批量添加</button>
                            </div>
                        </div>
                    </div>
                    <table id="list-details-insert" class="table table-bordered dataTables-example" style="width:100%">
                        <thead>
                        <th>id</th>
                        <th>姓名</th>
                        <th>年龄</th>
                        <th>邮箱</th>
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
<#--组织结构 修改增加模态框-->
<div class="modal inmodal fade" id="org_modal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">组织新增</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body">
                <#--表单-->
                    <form class="form-horizontal" id="org_form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">组织编号：</label>
                            <div class="col-sm-6">
                                <input type="text" name="no" maxlength="32" id="org_no" placeholder="组织编号" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">组织名称：</label>
                            <div class="col-sm-6">
                                <input type="text" name="treeName" maxlength="72" id="org_name" placeholder="组织名称" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">组织描述：</label>
                            <div class="col-sm-6">
                                <textarea maxlength="512" rows="3" cols="20" type="text" name="describe" id="org_desc" placeholder="组织描述" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">负责人：</label>
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="primaryUser" style="display: none" id="org_charges">
                                    <input type="text" class="form-control" placeholder="负责人" id="org_charge">
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <#--<div class="form-group">
                            <label class="col-sm-3 control-label">排序：</label>
                            <div class="col-sm-6">
                                <input type="text" name="weight" id="org_weight" placeholder="排序" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>-->

                    </form>
                </div>

                <div class="modal-footer">
                    <input type="hidden" id="user_add_type">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="addItem">保存</button>
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
<script src="/js/third/bootstrap.min.js"></script>
<script src="/js/zudp.js"></script>
<script src="/js/third/bootstrap-suggest.min.js"></script>
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/third/jquery.dataTables.min.js"></script>
<script src="/js/third/dataTables.bootstrap.js"></script>
<script src="/js/third/jquery.validate.min.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script type="text/javascript" src="/js/third/jquery.ztree.all.js"></script>
<script src="/js/sys/group.js"></script>
<script>
    function listInsert() {
        datatableInsert = zudp.plugin
            .table('#list-details-insert')
            .url('/api/group/userList')
            .search(function () {
                return {
                    "name": $("#primaryUser_name_insert").val(),
                    "selectGroup": "false",
                    "id": checkId,
                }
            })
            .columns([
                         {data: 'id', visible: false},
                         {data: 'name'},
                         {data: 'age'},
                         {data: 'email'},
                         {
                             render: function (data, type, row) {
                                 var html =
                                     '<@hasPermission name="sys:user:update"><button class="btn btn-success btn-sm add-user-to-group" value="{id}">新增</button>&nbsp;&nbsp;</@hasPermission>';
                                 return zudp.util.render(html, row);
                             }
                         }
                     ])
            .then();
    }

    function List() {
        datetable = zudp.plugin
            .table('#list-details')
            .url('/api/group/userList')
            .search(function () {
                return {
                    "name": $("#primaryUser_name").val(),
                    "selectGroup": "true",
                    "id": checkId,
                }
            })
            .columns([
                         {data: 'id', visible: false},
                         {data: 'name'},
                         {data: 'age'},
                         {data: 'email'},
                         {
                             render: function (data, type, row) {
                                 var html =
                                     '<@hasPermission name="sys:group:deleteUserGroup"><button class="btn btn-danger btn-sm updateUserToGroup " value="{id}">删除</button>&nbsp;&nbsp;</@hasPermission>';
                                 return zudp.util.render(html, row);
                             }
                         }
                     ])
            .then();
    }
</script>
</body>
</html>
