<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>系统日志</title>
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
                <div class="ibox-content form-inline">
                    <div class='col-sm-12'>
                        <div class='querybtn my-querybtn'>
                            <input type='text' name='search' id='searchinput' placeholder='操作用户' class='form-control search-input'>
                            <button class='btn btn-primary mgl my-mgl research-btn'>
                                搜索
                            </button>&nbsp;&nbsp;
                            <button class='btn btn-primary select-query' >
                                高级搜索
                            </button>&nbsp;&nbsp;
                        </div>
                    </div>
                    <div id='search' class='search-group' style='display:none;'>
                        <div class='form-group'>
                            <div class='col-sm-12'>
                                <label class='control-label my-control-label'>操作用户：</label>
                                <input type='text' name='labelName' id='searchUsername' placeholder='操作用户' class='form-control search-input'>
                            </div>
                        </div>
                        <div class='form-group'>
                            <div class='col-sm-12'>
                                <label class='control-label my-control-label'>开始日期：</label>
                                <input name="startTime" id="startTime" placeholder="开始日期" class="form-control">
                            </div>
                        </div>
                        <div class='form-group'>
                            <div class='col-sm-12'>
                                <label class='control-label my-control-label'>结束日期：</label>
                                <input name="startTime" id="endTime" placeholder="结束日期" class="form-control">
                            </div>
                        </div>

                        <button class='btn btn-primary mgl  my-mgl clear-input'>
                            清空
                        </button>&nbsp;&nbsp;
                    </div>
                    <table id="log-list-table" class="table my-table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>模块名</th>
                            <th>请求uri</th>
                            <th>操作用户</th>
                            <th>异常</th>
                            <th>请求参数</th>
                            <th>操作时间</th>
                            <th>客户端IP</th>
                            <th>操作系统</th>
                            <th>浏览器</th>
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
<div class="modal inmodal fade modal-form" id="logDetail" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">日志详情</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="log_form">
                    <div class="form-group">
                        <label class="col-sm-3 control-label my-control-label">模块名：</label>
                        <div class="col-sm-6">
                            <div id="moduleName" name="moduleName" class="form-control no-border"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label my-control-label">请求uri：</label>
                        <div class="col-sm-6">
                            <div id="requestUri" name="requestUri" class="form-control no-border"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label my-control-label">请求数据：</label>
                        <div class="col-sm-6">
                            <div id="requestParam" name="requestParam" class="form-control no-border"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label my-control-label">操作用户：</label>
                        <div class="col-sm-6">
                            <div id="username" name="username" class="form-control no-border"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label my-control-label">客户端IP：</label>
                        <div class="col-sm-6">
                            <div id="clientIp" name="clientIp" class="form-control no-border"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label my-control-label">操作系统：</label>
                        <div class="col-sm-6">
                            <div id="clientOS" name="clientOS" class="form-control no-border"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label my-control-label">浏览器：</label>
                        <div class="col-sm-6">
                            <div id="clientBrowser" name="clientBrowser" class="form-control no-border"></div>
                        </div>
                    </div>
                </form>
            </div>
                <div class="modal-footer">
                    <input type="hidden" id="dict_add_type">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                </div>

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
<script src="/js/third/icheck.min.js"></script>
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/third/laydate/laydate.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script src="/js/third/laydate/laydate.js"></script>
<script src="/js/pluginInit/dataecho.js"></script>
<script src="/js/zudp.js"></script>
<script>
    var dataTable;
    $(document).ready(function () {
        var now = new Date();
        var start = laydate.render({
               elem: '#startTime',
               type: 'date',
               btns: ['clear', 'confirm'],
               max: zudp.util.timeformater(Date.parse(now)),
               done: function (value, date) {
                   if (value !== '') {
                       end.config.min.year = date.year;
                       end.config.min.month = date.month - 1;
                       end.config.min.date = date.date + 1;
                   } else {
                       end.config.min.year = '2099';
                       end.config.min.month = '12';
                       end.config.min.date = '31';
                   }
               }
           });
        now.setDate(now.getDate() + 1);
        var end = laydate.render({
            elem: '#endTime',
            type: 'date',
            max: zudp.util.timeformater(Date.parse(now)),
            done: function (value, date) {
                if (value !== '') {
                    start.config.max.year = date.year;
                    start.config.max.month = date.month - 1;
                    start.config.max.date = date.date - 1;
                } else {
                    start.config.max.year = '2099';
                    start.config.max.month = '12';
                    start.config.max.date = '31';
                }
            }
        });


        //增删改查的参数
        var obj = {
            url: "/api/sysLog",
            formId: "#log_form",
            table: {
                // dataTable
                id: '#log-list-table',
                search: function () {
                    return {
                        "username": $("#searchUsername").val(),
                        "startTime": $("#startTime").val(),
                        "endTime": $("#endTime").val()
                    }
                },
                columns: [
                    {data: 'id', visible: false},
                    {
                        data: 'moduleName',
                        length: 20
                    },
                    {
                        data: 'requestUri',
                        length: 20
                    },
                    {
                        data: 'username',
                        length:20
                    },
                    {
                        render: function (value) {
                            return value.hasException ? "是" : "否";
                        }
                    },
                    {data: 'requestParam', visible: false},
                    {
                        render: function (value) {
                            return formatTime(value.requestTime);
                        }
                    },
                    {data: 'clientIp'},
                    {data: 'clientOS'},
                    {data: 'clientBrowser'},
                    {
                        render: function (data, type, row) {
                            return zudp.util.render(zudp.template.detailBtn,row);
                        }
                    }
                ]
            },
            title: "日志{type}",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: [],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"]
        };
        //初始化新建
        dataTable = zudp.component.initCURD(obj);
    });

    function formatTime(date) {
        date = new Date(date);
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        var D = date.getDate() + ' ';
        var h = (date.getHours() >= 10?date.getHours():('0'+date.getHours())) + ':';
        var m = (date.getMinutes() >= 10?date.getMinutes():('0'+date.getMinutes())) + ':';
        var s = date.getSeconds() >= 10?date.getSeconds():('0'+date.getSeconds());

        return Y + M + D + h + m + s;
    }

    // $('#log-list-table tbody').on('click', 'tr', function () {
    //     var data = zudp.plugin.table('#log-list-table').then().row(this).data();
    //     showDetail(data);
    //     $("#logDetail").modal();
    // });
    //
    // function showDetail(data) {
    //     $("#moduleName").text(data.moduleName);
    //     $("#requestUri").text(data.requestUri);
    //     $("#username").text(data.username);
    //     $("#requestParam").text(data.requestParam);
    //     $("#clientIp").text(data.clientIp);
    //     $("#clientOS").text(data.clientOS);
    //     $("#clientBrowser").text(data.clientBrowser);
    // }
</script>
</body>
</html>
