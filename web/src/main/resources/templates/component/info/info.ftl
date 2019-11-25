<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>消息列表</title>
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link href="/css/third/bootstrap.min.css" rel="stylesheet">
    <link href="/css/third/font-awesome.min.css" rel="stylesheet">
    <link href="/css/third/custom.css" rel="stylesheet">
    <link href="/css/third/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/third/animate.min.css" rel="stylesheet">
    <link href="/css/third/sweetalert.css" rel="stylesheet"/>
    <link href="/css/third/toastr.min.css" rel="stylesheet"/>
    <link href="/css/style.min.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="ibox-content form-inline ">
                    <div class='col-sm-12'>
                        <button class='btn btn-success btn-danger' id="deleteItems">
                            批量删除
                        </button>
                        <div class='querybtn my-querybtn'>
                            <input type='text' name='message' id="sender-message" placeholder='内容' class='form-control search-input'>
                            <button class='btn btn-primary mgl my-mgl research-btn'>
                                搜索
                            </button>&nbsp;&nbsp;
                            <button class='btn btn-primary select-query'>
                                高级搜索
                            </button>&nbsp;&nbsp;
                        </div>
                    </div>
                    <div id='search' class='search-group' style='display:none;'>
                        <div class="input-group">
                            <label class="control-label my-control-label">发送人：</label>
                            <div class="input-group">
                                <input type="text" class="form-control"  style="display: none" id="senderIds">
                                <input type="text" class="form-control" placeholder="负责人" id="senderId">
                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown" id="userBtn">
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class='form-group'>
                            <div class='col-sm-12'>
                                <label class='control-label my-control-label'>已读未读：</label>
                                <select id="sys-info-status" class="form-control">

                                </select>
                            </div>
                        </div>
                        <div class='form-group'>
                            <div class='col-sm-12'>
                                <label class='control-label my-control-label'>轻重缓急：</label>
                                <select id="sys-info-level" class="form-control" >

                                </select>
                            </div>
                        </div>
                       <div class='form-group'>
                            <div class='col-sm-12'>
                                <label class='control-label my-control-label'>类型：</label>
                                <select id="sys-info-type" class="form-control">
                                </select>
                            </div>
                        </div>
                        <div class='form-group'>
                            <div class='col-sm-12'>
                                <label class='control-label my-control-label'>开始时间：</label>
                                <input  id="startDate" placeholder="开始时间" startDate="1"  class="form-control">
                            </div>
                        </div>
                        <div class='form-group'>
                            <div class='col-sm-12'>
                                <label class='control-label my-control-label'>结束时间：</label>
                                <input id="endDate" placeholder="结束时间" endDate="1" class="form-control">
                            </div>
                        </div>

                        <button class='btn btn-primary mgl my-mgl clear-input'>
                            清空
                        </button>&nbsp;&nbsp;
                    </div>
                    <table id="info-list-table" class="my-table table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>发送者</th>
                            <th>类型</th>
                            <th>内容</th>
                            <th>重要程度</th>
                            <th>已读未读</th>
                            <th>创建时间</th>
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
<div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                    class="sr-only">Close</span></button>
                <h4 class="modal-title">消息详情</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body">
                    <form class="form-horizontal" id="info-form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">发送者：</label>
                            <div class="col-sm-6">
                                <div id="sender-name" class="form-control no-border"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">类型：</label>
                            <div class="col-sm-6">
                                <div id="sender-type" class="form-control no-border"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">重要程度：</label>
                            <div class="col-sm-6">
                                <div id="sender-level" class="form-control no-border"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">内容：</label>
                            <div class="col-sm-6">
                                <div id="sender-messages" class="form-control no-border"></div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
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
<script src="/js/third/bootstrap-suggest.min.js"></script>
<script src="/js/third/jquery.validate.min.js"></script>
<script src="/js/third/jquery.dataTables.min.js"></script>
<script src="/js/third/dataTables.bootstrap.js"></script>
<script src="/js/third/icheck.min.js"></script>
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script src="/js/third/laydate/laydate.js"></script>
<script src="/js/zudp.js"></script>
<script src="/js/pluginInit/laydateInit.js"></script>
<script src="/js/pluginInit/dataecho.js"></script>
<script>
    var dataTable;
    //查询已读未读
    var sysInfoStatus;
    //查询轻重
    var sysInfoLevel;
    //详细类型
    var sysInfoType;

    $(document).ready(function () {
        getDictListByKey("sys_info_status");
        getDictListByKey("sys_info_level");
        getDictListByKey("sys_info_type");
        findUserList();
        //这里的时间一定要放在前面，这样会先触发
        $(document).on("click",".row-detail",function () {
            getMessage($(this));
            return false;
        });
        //关闭按钮刷新页面
        $(".closeBtn").click(function () {
            zudp.plugin.table("#info-list-table").then().ajax.reload();
        });
        //增删改查的参数
        var obj = {
            url: "/api/info",
            formId: "#info-form",
            table: {
                // dataTable
                id: '#info-list-table',
                search: function () {
                    var result = {
                        "status": $("#sys-info-status").val(),
                        "infoSender.level": $("#sys-info-level").val(),
                        "infoSender.type": $("#sys-info-type").val(),
                        "infoSender.sender.id": $("#senderIds").val(),
                        "infoSender.message": $("#sender-message").val(),
                        'infoSender.createDate': $("#startDate").val(),
                        'infoSender.updateDate': $("#endDate").val()
                    };

                    if (!result.status) {
                        result.status = undefined;
                    }

                    if (!result['infoSender.createDate']) {
                        result['infoSender.createDate'] = undefined;
                    }
                    if (!result['infoSender.updateDate']) {
                        result['infoSender.updateDate'] = undefined;
                    }

                    return result;
                },
                columns: [
                    {data: 'id', visible: false},
                    {
                        render: function (data, type, row) {
                            if (data.infoSender.sender.id == "1") {
                                return "系统";
                            }
                            return data.infoSender.sender.name;
                        }
                    },
                    {
                        render: function (data, type, row) {
                            for(var k=0;k<sysInfoType.length;k++){
                                if (sysInfoType[k].value == data.infoSender.type) {
                                    return sysInfoType[k].label;
                                }
                            }
                            return "";
                        }
                    },
                    {
                        data: "infoSender.message",
                        length: 12
                    },
                    {
                        render: function (data, type, row) {
                            for(var k=0;k<sysInfoLevel.length;k++){
                                if(sysInfoLevel[k].value==data.infoSender.level){
                                    return sysInfoLevel[k].label;
                                }
                            }
                            return "";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            for(var k=0;k<sysInfoStatus.length;k++){
                                if(sysInfoStatus[k].value==data.status){
                                    return sysInfoStatus[k].label;
                                }
                            }
                            return "";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            return zudp.util.timeformater(data.infoSender.createDate);
                        }
                    },
                    {
                        render: function (data, type, row) {
                            return zudp.util.render(zudp.template.detailBtn + zudp.template.delBtn, row);
                        }
                    }
                ]
            },
            title: "消息{type}",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: [],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"]
        };
        //初始化新建
        dataTable = zudp.component.initCURD(obj);

        $("#userBtn").css("height",$("#senderId").css("height"));
    });

    //根据key获取字典列表
    function getDictListByKey(key) {
        zudp.ajax("/api/dict").get({"type": key}).then(function (da) {
            var id;
            if (key == 'sys_info_status') {
                id = "sys-info-status";
                sysInfoStatus = da.result;
            } else if (key == 'sys_info_type') {
                id = "sys-info-type";
                sysInfoType = da.result;
            } else if (key == 'sys_info_level') {
                id = "sys-info-level";
                sysInfoLevel = da.result;
            }
            setSelect(da.result, id);
        }, function (error) {
            zudp.plugin.dialog("warning").alert("查询条件渲染失败！", "警告");
        });
    }

    //详情
    function getMessage(a) {
        zudp.ajax("/api/info/reader/" + $(a).val()).get().then(function (da) {
            var senderName = "";
            if (da.sender.id == "1") {
                senderName = "系统";
            } else {
                senderName = da.sender.name;
            }
            var senderLevel = "";
            for (var k = 0; k < sysInfoLevel.length; k++) {
                if (sysInfoLevel[k].value == da.level) {
                    senderLevel = sysInfoLevel[k].label;
                }
            }
            var senderType = "";
            for (var k = 0; k < sysInfoType.length; k++) {
                if (sysInfoType[k].value == da.type) {
                    senderType = sysInfoType[k].label;
                }
            }
            $("#sender-level").html(senderLevel);
            $("#sender-name").html(senderName);
            $("#sender-messages").html(da.message);
            $("#sender-type").html(senderType);
            $("#myModal5").modal("show");
        });
    }

    /**
     * 根据list 设置select id 为id的html
     * @param list 数据
     * @param id select id
     */
    function setSelect(list,id) {
        var html="<option value=''>请选择</option>";
        for(var k=0;k<list.length;k++){
            html+="<option value='"+list[k].value+"'>"+list[k].label+"</option>"
        }
        $("#" + id).html(html);
    }

    $(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});

    function findUserList() {
        zudp.ajax("/api/user/userList").get().then(function (value) {
            //假如有null的值就变为“”
            for (var k=0;k<value.length;k++) {
                if (value[k].id == null) {
                    value[k].id = "";
                }
                if (value[k].name == null) {
                    value[k].name = "";
                }
                if (value[k].loginName == null) {
                    value[k].loginName = "";
                }
                if (value[k].phone == null) {
                    value[k].phone = "";
                }
                //name 和loginName替换下位置 因为json没有顺序
                var b = value[k].name;
                value[k].name = value[k].loginName;
                value[k].loginName = b;
                if (value[k].id == 1) {
                    value[k].loginName = "系统";
                }
            }

            var data = {"value": value, "defaults": "没有搜索到"};

            $("#senderId").bsSuggest({
                   indexId: 0, //作为id的是下标为那个的字段
                   autoSelect: true,
                   indexKey: 1,//作为查询的是下标为那个
                   showHeader: true,//展示表头
                   effectiveFieldsAlias: { id: "用户编号",name:"所属组织",loginName:"用户名称",phone:"电话号码"},//表头
                   effectiveFields: ["loginName"], //显示那些字段
                   listStyle: {
                       'padding-top': 0,
                       'max-height': '200px',
                       'overflow': 'auto',
                       'width': 'auto',
                       'transition': '0.3s',
                       '-webkit-transition': '0.3s',
                       '-moz-transition': '0.3s',
                       '-o-transition': '0.3s'
                   },
                   data: data //json串  前台查询
               });

            $("#senderId").on('onSetSelectValue', function (e, keyword) {
                $("#senderIds").val(keyword.id);
            });
        }, function (reason) {
            zudp.plugin.dialog("error").alert("获取用户列表失败！","提示");
        });
    }
</script>
</body>
</html>
