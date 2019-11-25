<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>主页</title>
    <link href="/css/third/bootstrap.min.css" rel="stylesheet">
    <link href="/css/third/font-awesome.min.css" rel="stylesheet">
    <link href="/css/third/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/third/animate.min.css" rel="stylesheet">
    <link href="/css/third/sweetalert.css" rel="stylesheet"/>
    <link href="/css/third/toastr.min.css" rel="stylesheet"/>
    <link href="/css/style.min.css" rel="stylesheet">
</head>
<body class="no-skin no-scoll">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="">
        <div class="col-sm-12">

            <div class="ibox ">
                <div class=" form-inline ">
                    <div class="col-sm-12">
                        <div class='form-group'>
                            <div class='col-sm-12'>
                                <label class='control-label'>登录名:</label>
                                <input type='text' name='loginName' id='user_loginName' placeholder='登录名' class='form-control'>
                            </div>
                        </div>

                        <div class='form-group'>
                            <div class='col-sm-12'>
                                <label class='control-label'>姓名:</label>
                                <input type='text' name='name' id='user_name' placeholder='用户名' class='form-control'>
                            </div>
                        </div>

                        <#--<div class='form-group'>-->
                            <#--<div class='col-sm-12'>-->
                                <#--<label class='control-label'>邮箱:</label>-->
                                <#--<input type='text' name='phone' id='user_email' placeholder='电话' class='form-control'>-->
                            <#--</div>-->
                        <#--</div>-->
                        <div class='form-group'>
                            <div class='col-sm-12'>
                                <button class='btn btn-primary'  onclick='select();'>搜索</button>&nbsp;&nbsp;
                                <button class='btn btn-success' onclick='addItems();' >批量新增</button>
                            </div>
                        </div>
                    </div>
                    <table id="user-list-table" class="table table-bordered dataTables-example">
                        <thead>
                            <th>id</th>
                            <th>登录名</th>
                            <th>姓名</th>
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
<script src="/js/third/jquery.min.js"></script>
<script src="/js/third/bootstrap.min.js"></script>
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/third/jquery.dataTables.min.js"></script>
<script src="/js/third/dataTables.bootstrap.js"></script>
<script src="/js/third/jquery.validate.min.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script src="/js/zudp.js"></script>
<script>
    var dataTable;
    var type = window.parent.document.getElementById("insert_member").value;
    var role = window.parent.document.getElementById("span_id").value;

    $(document).ready(function () {
        findList();


        $(document).on("click",".add-btn",function (e) {
            if (e && e.stopPropagation) {
                e.stopPropagation();
            } else {
                window.e.cancelBubble = true;
            }

            var member = $(this).parents("tr").find("td").eq(0).html();
            var name = $(this).parents("tr").find("td").eq(1).html();
            var data = {
                type: type,
                role: role,
                member: member,
                name: name
            };
            zudp.ajax("/api/member/")
                .post(JSON.stringify(data))
                .then(function (da) {
                    window.parent.zudp.plugin.dialog("success").alert("新增成功！", "提示");
                    zudp.plugin.table("#user-list-table").then().ajax.reload();
                }, function (error) {
                    window.parent.zudp.plugin.dialog("warning").alert("新增失败！", "警告");
                    zudp.plugin.table("#user-list-table").then().ajax.reload();
                });
        });
    });

    function select() {
        zudp.plugin.table("#user-list-table").then().ajax.reload();
    }
    function addItems(a) {
        var memberList=[];
        var data=dataTable.rows('.evenSelect').data();
        for(var k=0;k<data.length;k++){
            memberList[k] = {
                member:data[k].member,
                name:data[k].name,
                type:type
            };
        }
        if(memberList.length == 0){
            zudp.plugin.dialog("error").alert("数据未被选中！","警告");
            return;
        }
        zudp.ajax("/api/member/batch/"+role).post(JSON.stringify(memberList)).then(function (da) {
            window.parent.zudp.plugin.dialog("success").alert("新增成功！","提示");
            zudp.plugin.table("#user-list-table").then().ajax.reload();
        },function (error) {
            window.parent.zudp.plugin.dialog("warning").alert("新增失败！","警告");
            zudp.plugin.table("#user-list-table").then().ajax.reload();
        });
    }
    function findList() {
            var urls="/api/member/type/"+type;
        dataTable=zudp.plugin
                .table('#user-list-table')
                .url(urls)
                .search(function () {
                      return {
                          "role":role,
                          "loginName":$("#user_loginName").val(),
                          "name":$("#user_name").val(),
                          /*"email":$("#user_email").val(),*/
                      }
                })
                .columns([
                    {data: 'id', visible: false, searchable: false},
                    {data: 'member'},
                    {data: 'name'},
                    {data: 'parentId'},
                    {
                        render: function (data, type, row) {
                            var id = '"' + row.id + '"';
                            return "<button onclick='member_insert(this)' class='btn btn-sm btn-success add-btn'>新增</button>";
                        }
                    }
                ])
                .then();
    }
</script>
</body>
</html>