<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>题目管理</title>
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
        /*滚动条的设置*/
        ::-webkit-scrollbar-thumb {
            background-color:#dddddd;
        }
        ::-webkit-scrollbar-track {
            background-color: #f7f7f7;
            border: 1px solid #efefef;
        }
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

                        <button class='btn btn-success btn-danger' id="add-items">
                            批量添加
                        </button>


                        <div class='querybtn my-querybtn'>
                            <div class="form-group">
                                <label class="control-label my-control-label" style="float: left;margin-top:7px">题目类别：</label>
                                <div class="col-sm-4">
                                    <div class="input-group">
                                        <input id="newsCategory" name="newsCategory" type="hidden" onchange="typescenter()"/>
                                        <input type="text" class="form-control"
                                               placeholder="题目类别" id="newsCategoryName" name="newsCategoryName">
                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-white dropdown-toggle bh34"
                                                    data-toggle="dropdown" id="userBtn">
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <#--<label for="content" class="col-sm-3 control-label">资讯中类：</label>-->
                                <div class="col-sm-4">
                                    <select id="typescenter" name="typesapply" invalid="false" class="form-control" onchange="getDepartment()" style="min-width: 135px">
                                    </select>
                                </div>
                            </div>
                            <input type='text' name='search' id='search_name' placeholder='请输入名称' class='form-control search-input'>
                            <button id="research" class='btn btn-primary mgl my-mgl research-btn' >
                                搜索
                            </button>&nbsp;&nbsp;

                        </div>
                    </div>
                    <div id='search' class='search-group' style='display:none;'>


                    </div>
                    <input type="hidden" name="testPaperId" id="testPaperId" value="${testPaperId}">
                    <table id="post-list-table" class="table my-table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>题目名称</th>
                            <th>题目代码</th>
                            <th>题目类型</th>

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
<script src="/js/menuTab.js"></script>
<script>

    var dataTable;
    var urlstr="/api/testPaperTopic/queryNoaddTopic";
    var formIdStr="#post_form";
    var sys_url=window.location.host;
    $(document).ready(function () {


        findList();
        findDictList2();
        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}题目",
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
//
        var urls="/api/testPaperTopic/queryNoaddTopic";
        dataTable=zudp.plugin.table('#post-list-table')
                .url(urls)
                .search(function () {
                    return {
                        "name":$("#search_name").val(),
                        "testPaperId":$("#testPaperId").val(),
                        "newsCategory":$("#newsCategory").val(),
                        "typesapply":$("#typescenter").val()

                    }
                })
                .columns( [
                    {data: 'id', visible: false},
                    {data: 'name'},
                    {data: 'code'},
                    {data: 'type'}

                ])
                .then();

    }


    $("#add-items").click(function(){
        var data = dataTable.rows('.evenSelect').data();

        var ids = [];
        console.log(ids);
        for (var k = 0; k < data.length; k++) {
            ids.push(data[k].id);
        }
        if (ids.length == 0) {
            zudp.plugin.dialog().confirm("数据未选中", "关闭")
            return;
        }
        ids = JSON.stringify(ids);
        var par = {"ids":ids,"testPaperId":$("#testPaperId").val()};
        console.log(par);
        $.ajax( {
            type : "POST",
            url : "/api/testPaperTopic/addTopic",
            dataType:"json",
           // contentType:"application/json",
            cache:false,
         //   async:false,
            data : par,
            success : function(data) {
                zudp.plugin.dialog("success").alert("添加成功!", "提示");
                dataTable.ajax.reload();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                /*错误信息处理*/
                zudp.plugin.dialog("success").alert("添加失败!", "提示");
            }

        })


    })

  /*  $("#research").click(function(){
        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}题目",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value'],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"]

        };
        //初始化增删改查参数
        initForm(obj);
    })*/

    function getDepartment(id) {
        $("#typescenter").find("option").remove();
        zudp.ajax("/api/typesApplyController/getList?id="+id).get().then(function (value) {

            $("#typescenter").append("<option value='" + "'>" + "全部" + "</option>");
            for (var k = 0; k < value.length; k++) {

                if (value[k].typescenter == null) {
                    value[k].typescenter = "";
                }else{
                    $("#typescenter").append("<option value='"+ value[k].id+"'>"+ value[k].typescenter+"</option>");
                }
            }


            //  gettypemin();
        }, function (reason) {
            zudp.plugin.dialog("error").alert("获取用户列表失败！", "提示");
        });
    }

    function findDictList2() {
        zudp.ajax("/api/dict/getnewstype").get().then(function (value) {
            //假如有null的值就变为“”
            for (var k = 0; k < value.length; k++) {
                if (value[k].id == null) {
                    value[k].id = "";
                }
                if (value[k].label == null) {
                    value[k].label = "";
                }
                if (value[k].value == null) {
                    value[k].value = "";
                }
            }
            console.log(value);
            var arry1 = [{id:"","label":"全部"}];
            var value = arry1.concat(value);
            var data = {"value": value, "defaults": "没有搜索到"};
            $("#newsCategoryName").bsSuggest({
                indexId: 0, //作为id的是下标为那个的字段
                autoSelect: true,
                indexKey: 8,//作为查询的是下标为那个
                showHeader: true,//展示表头
                effectiveFieldsAlias: {id: "编号", label: "名称"},//表头
                effectiveFields: ["label"],
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
            $("#newsCategoryName").on('onSetSelectValue', function (e, keyword) {

                console.log(keyword);

                $("#newsCategory").val(keyword.id);
                typescenter(keyword.id);
                // alert($("#newsCategory").val());
                if(keyword.key==''){
                    $("#newsCategoryName").val("全部");
                }
            });
        }, function (reason) {
            zudp.plugin.dialog("error").alert("获取用户列表失败！", "提示");
        });
    }
</script>
</body>
</html>
