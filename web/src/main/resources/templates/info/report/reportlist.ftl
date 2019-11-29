<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>公共上报列表</title>
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
                        <button class='btn btn-success btn-danger' id="delete-items">
                            批量删除
                        </button>

                        <div class='querybtn my-querybtn'>
                            <label class='control-label my-control-label'>案发位置：</label>
                            <input type='text' name='location' id="location_input" placeholder='案发位置' class='form-control search-input'>
                            <label class='control-label my-control-label'>案件类型：</label>
                            <select class="form-control" name="caseType" id="caseType_select">
                                <option value="">全部</option>
                                <option value="民事纠纷">民事纠纷</option>
                                <option value="刑事案件">刑事案件</option>
                                <option value="行政诉讼">行政诉讼</option>
                                <option value="经济纠纷">经济纠纷</option>
                            </select>
                            <button class='btn btn-primary mgl my-mgl research-btn'>
                                搜索
                            </button>&nbsp;&nbsp;
                            <#--<button class='btn btn-primary select-query'>
                                高级搜索
                            </button>&nbsp;&nbsp;-->
                        </div>
                    </div>
                    <div id='search' class='search-group' style='display:none;'>
                    </div>
                    <table id="landinfo-list-table" class="my-table table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>上报人呢称</th>
                            <th>案件类型</th>
                            <th>案发位置</th>
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
<#--以下是详情模态框-->
<div class="modal inmodal fade modal-form" id="detail" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel22">公众案件上报详情</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body">
                    <#--表单-->
                    <form class="form-horizontal" id="form">

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">上报人昵称：</label>
                            <div class="col-sm-6">
                                <input type="text" name="nickName"
                                       readonly="readonly" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">案件类型：</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="caseType" disabled="disabled">
                                    <option value="刑事案件">刑事案件</option>
                                    <option value="民事纠纷">民事纠纷</option>
                                    <option value="行政诉讼">行政诉讼</option>
                                    <option value="经济纠纷">经济纠纷</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">案发位置：</label>
                            <div class="col-sm-6">
                                <input type="text" name="location"
                                       readonly="readonly" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">坐标经纬度：</label>
                            <div class="col-sm-6">
                                <input type="text" name="coordinate"
                                       readonly="readonly" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">案件描述：</label>
                            <div class="col-sm-6">
                                <textarea maxlength="500" name="description" readonly="readonly" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">附件下载：</label>
                            <div class="col-sm-6">
                                <a href="#">附件下载</a>
                            </div>
                        </div>
                    </form>

                </div>

                <div class="modal-footer">
                    <input type="hidden" id="user_add_type">
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
<script src="/js/rest.js"></script>
<script src="/js/pluginInit/laydateInit.js"></script>
<script src="/js/pluginInit/dataecho.js"></script>
<script>

    var dataTable;
    var urlstr="/api/report";
    var formIdStr="#form";
    // var sys_url=window.location.host;

    $(document).ready(function () {
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

    //列表数据初始化方法
    function findList() {
        var urls="/api/report";
        dataTable=zudp.plugin.table('#landinfo-list-table')
            .url(urls)
            .search(function () {
                return {
                    "location":$("#location_input").val(),
                    "caseType":$("#caseType_select").val()
                }
            })
            .columns( [
                {data: 'id', visible: false},
                {data: 'nickName'},
                {data: 'caseType'},
                {data: 'location'},
                {
                    render: function (data, type, row) {
                        var btn = "";
                        var detailstr="";
                        var  delstr="";
                        <#--<@hasPermission name="oaManager:post:update">-->
                        detailstr=zudp.template.detailBtn;
                        <#--</@hasPermission>-->
                        <#--<@hasPermission name="oaManager:post:delete">-->
                        delstr=zudp.template.delBtn;
                        <#--</@hasPermission>-->
                        btn += detailstr+delstr;
                        return zudp.util.render(btn, row);
                        //return "";
                    }
                }
            ])
            .then();

    }
    // //详情
    // $(document).on("click", '.row-detail1', function (e) {
    //     if($(this).val()!=''){
    //         zudp.ajax("/api/landTransactionInfoController/"+$(this).val()).get("").then(function (data) {
    //             data.transferDate=formatTime(data.transferDate);
    //             data.commencementDate=formatTime(data.commencementDate);
    //             data.completionDate=formatTime(data.completionDate);
    //             data.fillingDate=formatTime(data.fillingDate);
    //             dataEcho("#form", data);
    //         });
    //     }
    //     $("#detail").modal("show");
    // });

    /**
     * 时间格式化
     * */
    function formatTime(date) {
        if(date==null || date==""){
            return "";
        }
        date = new Date(date);
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        var D = (date.getDate() <10 ? "0"+(date.getDate()) : date.getDate()) + ' ';
        var h = (date.getHours() >= 10?date.getHours():('0'+date.getHours())) + ':';
        var m = (date.getMinutes() >= 10?date.getMinutes():('0'+date.getMinutes())) + ':';
        var s = date.getSeconds() >= 10?date.getSeconds():('0'+date.getSeconds());

        return Y + M + D ;
    }
</script>

</body>
</html>
