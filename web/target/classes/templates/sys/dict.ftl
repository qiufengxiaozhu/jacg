<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>数据字典</title>
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
                <div class="ibox-content form-inline z-relative">
                    <div class='col-sm-12'>
                        <@hasPermission name="sys:sysSetting:dict:create">
                        <button class='btn btn-success' data-toggle='modal' id="add-btn">
                            新增
                        </button>&nbsp;&nbsp;
                        </@hasPermission>
                        <@hasPermission name="sys:sysSetting:dict:batchDelete">
                        <button class='btn btn-success btn-danger' id="delete-items">
                            批量删除
                        </button>
                        </@hasPermission>
                        <div class='querybtn my-querybtn'>
                            <input type='text' name='search' placeholder='标签' class='form-control search-input'>
                            <button class='btn btn-primary mgl my-mgl research-btn' >
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
                                <label class='control-label my-control-label'>类型：</label>
                                <select id="searchTypes" class="form-control" style="">
                                </select>
                            <#--<input type='text' name='typeName' id='search_type_name' placeholder='类型名' class='form-control'>-->
                            </div>
                        </div>
                        <div class='form-group'>
                            <div class='col-sm-12'>
                                <label class='control-label my-control-label'>标签：</label>
                                <input type='text' name='labelName' placeholder='标签' id='search_label_name' class='form-control search-input'>
                            </div>
                        </div>

                        <button class='btn btn-primary mgl my-mgl clear-input'>
                            清空
                        </button>&nbsp;&nbsp;
                    </div>
                    <table id="dict-list-table" class="table my-table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>类型</th>
                            <th>标签</th>
                            <th>属性值</th>
                            <th>描述</th>
                            <th>排序</th>
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
                <h4 class="modal-title">字典添加</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body">
                <#--表单-->
                    <form class="form-horizontal" id="dict_form">
                        <input type="hidden" name="id" id="dict_id">
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">类型：</label>
                            <div class="col-sm-6">
                                <input type="text" name="type"   maxlength="64" id="dict_type" placeholder="类型" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">标签：</label>

                            <div class="col-sm-6">
                                <input type="text" name="label"  maxlength="64" id="dict_label" placeholder="标签" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">属性值：</label>

                            <div class="col-sm-6">
                                <input type="text" name="value" id="dict_value" maxlength="64" placeholder="属性值" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">描述：</label>

                            <div class="col-sm-6">
                                <input type="text" name="mark" maxlength="255" id="dict_mark" placeholder="描述" class="form-control">
                            </div>

                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">排序：</label>

                            <div class="col-sm-6">
                                <input type="text" name="weight" id="dict_order" placeholder="排序" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <input type="hidden" id="add-type">
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
<script src="/js/third/jquery.dataTables.min.js"></script>
<script src="/js/third/dataTables.bootstrap.js"></script>
<script src="/js/third/icheck.min.js"></script>
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script src="/js/third/laydate/laydate.js"></script>
<script src="/js/pluginInit/dataecho.js"></script>
<script src="/js/zudp.js"></script>
<script>

    var dataTable;
    $(document).ready(function () {
        refreshType();

        $("#dict_form").validate({
            rules: {
                type: {
                    required:true,
                    isType:true
                },
                label: {
                    required:true
                },
                value: {
                    required:true,
                    isValue:true,
                    remote:{
                        url:"/api/dict/checkValue",
                        type:"get",
                        data:{
                            "type":function() {
                                return $("#dict_type").val();
                            },
                            "value":function () {
                                return $("#dict_value").val();
                            },
                            "id":function() {
                                return $("#dict_id").val();
                            }
                        },
                        dataFilter:function(data, type) {
                            return JSON.parse(data).data;
                        }

                    }
                },
                weight: {
                    required:true,
                    digits:true
                }
            },
            messages: {
                type: {
                    required: "请输入类型"
                },
                label: {
                    required: "请输入标签"
                },
                value:{
                    required: "请输入属性值",
                    remote:"类型的属性值已存在"
                },
                weight: {
                    digits: "请输入正确的类型",
                    required:"请输入排序"
                }
            }
        });

        $(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green"});

        //增删改查的参数
        var obj = {
            url: "/api/dict",
            formId: "#dict_form",
            table: {
                // dataTable
                id: '#dict-list-table',
                search: function () {
                    return {
                        "label": $("#search_label_name").val(),
                        "type": $("#searchTypes").val()
                    }
                },
                columns: [
                    {data: 'id', visible: false},
                    {data: 'type'},
                    {data: 'label'},
                    {data: 'value'},
                    {data: 'mark'},
                    {data: 'weight'},
                    {
                        render: function (data, type, row) {
                            var btn = <@hasPermission name="sys:sysSetting:dict:update">zudp.template.editBtn</@hasPermission><@hasPermission name="sys:sysSetting:dict:delete"> + zudp.template.delBtn</@hasPermission>
                            return zudp.util.render(btn, row);
                        }
                    }
                ]
            },
            title: "字典{type}",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value'],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"]
        };
        //初始化新建
        dataTable = zudp.component.initCURD(obj);
    });
    function getTypes(value) {
        var res = value.result;
        var types = "";
        for (var i = 0; i < res.length; i++) {
            var o =  res[i];
            if(types.indexOf(o.type) == -1) {
                types+=(res[i].type+",");
            }
        }

        types = types.substring(0, types.length-1);
        return types.split(",");
    }

    function refreshType() {
        zudp.ajax("/api/dict").get().then(function (value) {
            var string = getTypes(value);
            var $searchTypes = $("#searchTypes");
            $searchTypes.empty();
            $searchTypes.append("<option value=''>请选择</option>");
            for (var i = 0; i < string.length; i++) {
                $searchTypes.append("<option>" + string[i] + "</option>");
            }
        })
    }
    jQuery.validator.addMethod("isType",function (value, element, param) {
        var length = value.length;
        var login_name = /^[a-zA-Z][a-zA-Z0-9_]*$/;
        return this.optional(element) || (length <= 64  && login_name.test(value));
    }, "请填写1-64位类型名且只能包含大小写字母数字下划线");

    jQuery.validator.addMethod("isValue",function (value, element, param) {
        var login_name = /^[0-9a-zA-Z_]{1,}$/;
        return this.optional(element) || (login_name.test(value));
    }, "属性值只能由大小写字母数字下划线组成");
</script>
</body>
</html>
