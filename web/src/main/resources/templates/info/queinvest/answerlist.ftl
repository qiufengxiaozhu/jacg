<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>答案列表</title>
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

                        <div class='querybtn my-querybtn'>
                            <input type='text' name='search' id='search_name' placeholder='请输入问卷名称' class='form-control search-input'>
                            <button class='btn btn-primary mgl my-mgl research-btn' >
                                搜索
                            </button>&nbsp;&nbsp;

                        </div>
                    </div>
                    <div id='search' class='search-group' style='display:none;'>


                    </div>
                    <table id="post-list-table" class="table my-table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>问卷名称</th>
                            <th>答题人</th>
                            <th>创建时间</th>
                            <th>答题时间</th>
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
                <h4 class="modal-title">详情</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body fix-height" style="height: 350px">
                    <table id="tableList" class="table my-table table-bordered dataTables-example">
                        <tr>
                            <th>题目内容</th>
                            <th>所选答案</th>
                        </tr>
                    </table>
                </div>

                <div class="modal-footer">
                    <input type="hidden" id="add-type">
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
    var urlstr="/api/answer";
    var formIdStr="#post_form";
    var sys_url=window.location.host;
    $(document).ready(function () {


        findList();

        var obj = {
            url: urlstr,
            formId: formIdStr,
            title: "{type}题目",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value', 'type02'],
            hideInputName: [],
            search: [".clear-input", "#search", ".search-input"]

        };
        //初始化增删改查参数
        initForm(obj);
    });


        //列表数据初始化方法
        function findList() {

            var urls = "/api/answer";
            dataTable = zudp.plugin.table('#post-list-table')
                    .url(urls)
                    .search(function () {
                        return {
                            "title": $("#search_name").val()

                        }
                    })
                    .columns([
                        {data: 'id', visible: false},
                        {data: 'title'},
                        {data: 'name'},
                        {data: 'pubdate'},
                        {data: 'answerTime'},
                    {
                        render: function (data, type, row) {
                             var btn = "";
                             var detailStr="";
                              detailStr='<button class="btn btn-info btn-sm" value="{id}" id="getDetail"><i class="fa fa-pencil"></i>详情</button>';

                            btn += detailStr;
                            return zudp.util.render(btn, row);
            }
        }
    ])
    .then();

    }



    // 详情
    $(document).on("click", '#getDetail', function (e) {
        // 清除模态框
        $(".list01").empty();
        // 弹出模态框
        $("#myModal5").modal("show");
        //清除冒泡
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }
        // 获取到这一行的答题人，用于查询详情
        var id = $(this).parent().prev().prev().prev().text();
//        id = JSON.stringify(id);
        var queName = $(this).parent().prev().prev().prev().prev().text();
        var objJson ={
          id:id,
          queName:queName
        };
        objJson =  JSON.stringify(objJson);
        console.log(id);
        // 发送ajax请求
        zudp.ajax("/api/answer/getDetail").post(objJson).then(function (value) {
                for(var i=0;i<value.length;i++){
                      var contents =  value[i]["contents"];
                      var optContext =  value[i]["optContext"];

                    var tr;
                    tr= '<td>'+contents+'</td>'+'<td>'+optContext+'</td>';
                    $("#tableList").append('<tr class="list01">'+tr+'</tr>');
                }
        })

    });


</script>
</body>
</html>
