<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>税务数据申请</title>
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link href="/css/third/bootstrap.min.css" rel="stylesheet">
    <link href="/css/third/font-awesome.min.css" rel="stylesheet">
    <link href="/css/third/custom.css" rel="stylesheet">
    <link href="/css/third/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/third/animate.min.css" rel="stylesheet">
    <link href="/css/third/sweetalert.css" rel="stylesheet"/>
    <link href="/css/third/toastr.min.css" rel="stylesheet"/>
    <link href="/css/style.min.css" rel="stylesheet">
    <link href="/css/third/webuploader.css" rel="stylesheet">
    <style>
        a.no_cshow {
            color: #707477;
        }

        .form-detail .control-label {
            padding-top: 0
        }
    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="ibox-content form-inline z-relative">
                    <div class='col-sm-12'>

                        <@hasPermission name="taxdataMenu:taxdataApply:create">
                            <button class='btn btn-success' data-toggle='modal' id="add-btn">
                                新增
                            </button>
                        </@hasPermission>


                        <input class="123" type="hidden" value="1">
                        <input class="123" type="hidden" value="2">
                        <div class='querybtn my-querybtn' style="margin-top: 3px">
                            <select class="form-control"  id="infoStatus"
                                    onchange="dataTable.ajax.reload();">
                                <option value="">全部</option>
                                <option value="1">审查中</option>
                                <option value="2">申请通过</option>
                                <option value="3">申请不通过</option>
                            </select>

                            <input type='text' name='enterprisenameStr' id="enterprisenameStr" placeholder='企业名称'
                                   class='form-control search-input'>
                            <input type='text' name='uniformCodeStr' id="uniformCodeStr" placeholder='信用代码'
                                   class='form-control search-input'>
                            <button class='btn btn-primary mgl my-mgl research-btn'>
                                搜索
                            </button>
                        </div>
                    </div>
                    <table id="info-list-table" class="table my-table table-bordered dataTables-example">
                        <#--<colgroup>-->
                        <#--<col width="20%"/>-->
                        <#--<col width="20%"/>-->
                        <#--<col width="20%"/>-->
                        <#--<col width="20%"/>-->
                        <#--<col width="20%"/>-->
                        <#--</colgroup>-->
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>企业名称</th>
                            <th>统一信用代码</th>
                            <th>查看有效时间</th>
                            <th>申请人</th>
                            <th>申请时间</th>
                            <th>授权人</th>
                            <th>授权时间</th>
                            <th>申请状态</th>
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
<div class="modal inmodal fade modal-form" id="myModal" tabindex="-1" role="dialog" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <small class="font-bold">

                <div class="modal-body">
                    <#--表单-->
                    <form class="form-horizontal" id="form">
                        <input type="hidden" name="id" id="info_id">

                        <#-- <div class="form-group">
                             <label class="col-sm-3 control-label my-control-label">申请企业名称：</label>
                             <div class="col-sm-6">
 &lt;#&ndash;
                                 <select id="build_area_select" style="display: none" class="form-control"></select>
 &ndash;&gt;

                                 <div class="input-group">
                                     <input type="text" class="form-control" name="enterprisename2" style="display: none" id="enterprisename2">
                                     <input type="text" class="form-control" placeholder="申请企业名称" id="enterprisename" autocomplete="off">
                                     <div class="input-group-btn">
                                         <button type="button" style="margin: 0px;padding:14px 10px;" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                             <span class="caret"></span>
                                         </button>
                                         <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                         </ul>
                                     </div>
                                 </div>
                             </div>
                             <div>
                                 <i class="i_context my-i_context">*</i>
                             </div>
                         </div>-->


                        <table>
                            <thead>
                            <tr>

                                <th>申请企业名称</th>
                                <th>统一社会信用代码</th>
                                <th>税收起始日期</th>
                                <th>税收截止日期</th>
                                <th>
                                    <button type="button" class="btn btn-primary" id="tianJia">
                                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                    </button>

                                </th>
                            </tr>
                            </thead>
                            <tbody id="sqbody">
                            <tr id="trOne">
                                <td>
                                    <div class="input-group" style="margin-right: 4px;"><input type="text" class="form-control"
                                                                    name="enterprisename2" style="display: none"
                                                                    id="enterprisename2">
                                        <input type="text" class="form-control enterprisename" name="enterprisename"
                                               placeholder="申请企业名称" autocomplete="off">
                                        <div class="input-group-btn">
                                            <button type="button" style="margin: 0px;padding:7px 10px;"
                                                    class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                            </ul>
                                        </div>
                                    </div>
                                </td>
                                <td><div style="margin-right: 4px;"><input type="text" name="uniformCode" readonly maxlength="50" id="uniformCode"
                                           placeholder="统一社会信用代码" class="form-control"></div></td>
                                <td><div style="margin-right: 4px;"><input type='text' name='paymentStart' id='paymentStart' class='form-control '
                                           placeholder='税收起始日期'></div></td>
                                <td><div style="margin-right: 4px;"><input type='text' name='paymentEnd' id='paymentEnd' class='form-control '
                                           placeholder='税收截止日期'></div></td>
                                <td>
                                    <div class="closeTr" onclick='closeTr(this)'>x</div>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">查看有效时间：</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="validDays" id="validDays">
                                    <option value="">请选择</option>
                                    <option value="3">3天</option>
                                    <option value="7">7天</option>
                                    <option value="15">15天</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">申请原因：</label>
                            <div class="col-sm-6">
                                <input type="text" name="applyReason" maxlength="50" id="applyReason" placeholder="申请原因"
                                       class="form-control">

                            </div>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">

                    <input type="hidden" id="add-type">
                    <button type="button" class="btn btn-primary" id="save-btn">保存</button>

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
<div class="modal inmodal fade modal-form" id="xiangqing" tabindex="-1" role="dialog" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                <h4>详情</h4>
            </div>
            <small class="font-bold">
                <!-- 详情步骤1-->
                <input type="hidden" name="detail_entity" id="detail_entity">
                <iframe id="enterInfo_detail_iframe" width="100%" height="500px" frameborder="0"></iframe>
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

<#--以下是模态框-->
<div class="modal inmodal fade" id="ly_company" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog" style="width: 95%;">
        <div class="modal-content">
            <div class="modal-header" style="padding:10px;">
                <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                <h4 class="modal-title" id="titles">税收信息</h4>
            </div>
            <div class="modal-body role-modal-body no-padding" style="height:450px;overflow-y:hidden">
                <iframe id="company_member_iframe" width="100%" height="100%" frameborder="0"></iframe>
            </div>
        </div>
    </div>
</div>

<#--以下是详情模态框-->
<div class="modal inmodal fade modal-form" id="detail" tabindex="-1" role="dialog" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel22">详情</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body">
                    <#--表单-->
                    <form class="form-horizontal" id="form1">


                        <input type="hidden" name="taskId" id="taskId">
                        <input type="hidden" name="detail_id" id="detail_id">
                        <input type="hidden" name="taskDefKey" id="taskDefKey">

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">企业名称：</label>
                            <div class="col-sm-6">
                                <input type="text" name="enterprisename3" maxlength="120"
                                       readonly="readonly" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">统一社会信用代码：</label>
                            <div class="col-sm-6">
                                <input type="text" name="uniformCode3" maxlength="120"
                                       readonly="readonly" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">税收起始日期：</label>
                            <div class="col-sm-6">
                                <input type="text" name="paymentStarts" maxlength="120"
                                       readonly="readonly" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">税收截止日期：</label>
                            <div class="col-sm-6">
                                <input type="text" name="paymentEnds" maxlength="120"
                                       readonly="readonly" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">有效天数：</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="validDays" disabled="disabled" readonly>
                                    <option value="3">3天</option>
                                    <option value="7">7天</option>
                                    <option value="15">15天</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">申请人：</label>
                            <div class="col-sm-6">
                                <input type="text" name="applyMan" maxlength="120"
                                       readonly="readonly" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">申请状态：</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="infoStatus" disabled="disabled" readonly>
                                    <option value="1">审查中</option>
                                    <option value="2">申请通过</option>
                                    <option value="3">申请不通过</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">申请部门：</label>
                            <div class="col-sm-6">
                                <input type="text" name="applyDepart" maxlength="120" readonly="readonly"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">申请时间：</label>
                            <div class="col-sm-6">
                                <input type="text" name="applyDate" maxlength="120" readonly="readonly"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">申请原因：</label>
                            <div class="col-sm-6">
                                <textarea maxlength="1000" name="applyReason" readonly="readonly"
                                          class="form-control"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">授权人：</label>
                            <div class="col-sm-6">
                                <input type="text" name="authorizeMan" maxlength="120"
                                       readonly="readonly" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">授权时间：</label>
                            <div class="col-sm-6">
                                <input type="text" name="authorizeDate" maxlength="120"
                                       readonly="readonly" class="form-control">
                            </div>
                        </div>

                        <div class="form-group" id="idea1">
                            <label class="col-sm-3 control-label my-control-label">授权意见：</label>
                            <div class="col-sm-6">
                                <textarea maxlength="1000" name="authorizeIdea" readonly="readonly"
                                          class="form-control"></textarea>
                            </div>
                        </div>
                    </form>

                </div>

                <div class="modal-footer">

                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>


                    <input type="hidden" id="user_add_type">
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
<script src="/js/third/bootstrap-suggest.min.js"></script>
<script src="/js/third/bootstrap.min.js"></script>
<script src="/js/third/jquery.validate.min.js"></script>
<script src="/js/third/jquery.dataTables.min.js"></script>
<script src="/js/third/dataTables.bootstrap.js"></script>
<script src="/js/third/icheck.min.js"></script>
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script src="/js/third/laydate/laydate.js"></script>
<script src="/js/pluginInit/dataecho.js"></script>
<script src="/js/util.js"></script>
<script src="/js/util_list.js"></script>
<script src="/js/third/bootbox.js"></script>
<script src="/js/dialog.js"></script>
<script src="/js/ajaxFileImex.js"></script>

<script>
    laydate.render({
        elem: '#paymentStart' //指定元素
        , type: 'date'
    });
    laydate.render({
        elem: '#paymentEnd' //指定元素
        , type: 'date'
    });


    var dataTable;
    $(document).ready(function () {
        findCompanyList();
        $("#form").validate({
            rules: {
                enterprisename: {
                    required: true
                },

                uniformCode: {
                    required: true
                },


                validDays: {
                    required: true
                },
                paymentStart: {
                    required: true
                },
                paymentEnd: {
                    required: true
                }
            },
            messages: {
                enterprisename: {
                    required: "请输入企业名称"
                },

                uniformCode: {
                    required: "请输入信用代码"
                },
                validDays: {
                    required: "请输入查看有效时间"
                },
                paymentStart: {
                    required: "请输入税收起始日期"
                },
                paymentEnd: {
                    required: "请输入税收截止日期"
                }
            }
        });
        //增删改查的参数
        var obj = {
            url: "/api/taxdataApply",
            table: {
                id: '#info-list-table',
                search: function () {
                    return {
                        "enterprisename": $("#enterprisenameStr").val(),
                        "uniformCode": $("#uniformCodeStr").val(),
                        "infoStatus": $("#infoStatus").val()
                    }
                },
                columns: [
                    {data: 'id', visible: false},
                    {data: 'enterprisename', width: '15%'},

                    {data: 'uniformCode', width: '15%'},
                    {data: 'validDays', width: '11%'},
                    {data: 'applyMan', width: '11%'},
                    {
                        data: 'applyDate', width: '11%',
                        render: function (data, type, row) {
                            if (data != null && data != '') {
                                return formatDate(data);
                            } else {
                                return "";
                            }

                        }
                    },

                    {data: 'authorizeMan', width: '11%'},
                    {data: 'authorizeDate', width: '11%',
                        render: function (data, type, row) {
                            if (data != null && data != '') {
                                return formatDate(data);
                            } else {
                                return "";
                            }

                        }
                    },

                    {
                        render: function (data, type, row) {
                            var infoStatus = "";
                            if (data.infoStatus == '0' || !data.infoStatus) {
                                infoStatus = "临时";
                            } else if (data.infoStatus == '1') {
                                infoStatus = "审查中";
                            } else if (data.infoStatus == '2') {
                                infoStatus = "通过";
                            } else if (data.infoStatus == '3') {
                                infoStatus = "不通过";
                            }
                            return infoStatus;
                        }, width: '6%'
                    },
                    {
                        render: function (data, type, row) {

                            var btn = "";

                            <#--var info1 = <@hasPermission name="taxdataMenu:taxdataApply:get">
                                "<button class='btn btn-info btn-img row-detail1' value='" + row.id + "' title='详情' ><img src='/iconImg/detail.png' alt='' class=''></button>"
                                </@hasPermission> +"";-->
                            var info1 =  "<button class='btn btn-info btn-img row-detail1' value='" + row.id + "' title='详情' ><img src='/iconImg/detail.png' alt='' class=''></button>";
                            var ssxx = <@hasPermission name="taxdataMenu:taxinfo_auth">
                                "<button title='税收信息' class=\"btn btn-success btn-sm btn-img\" onclick=\"ssxx('" + row.uniformCode + "','" + row.paymentStart + "','" + row.paymentEnd + "')\"><img src='/iconImg/tax.png' alt='' class=''></button>" + "&nbsp;&nbsp;"
                            </@hasPermission> +"";

                            if (info1 == "0") {
                                info1 = "";
                            }
                            if(ssxx=="0"){
                                ssxx = "";
                            }
                            if (row.infoStatus != '2') {
                                ssxx = "";
                            }else if(!isshow(formatDate(row.authorizeDate),row.validDays)){
                                ssxx = "";
                            }
                            btn += info1 + "&nbsp;" + ssxx;

                            /* if(data.infoStatus != "0"){
                                 btn += "&nbsp;<button class='btn btn-warning btn-img audit-log'  value='"+ row.procinsid  +"' title='审查记录'><img src='/iconImg/audit-log.png' alt='' class=''> </button>";
                             }
                             if(btn=="0"){
                                 btn="";
                             }*/
                            return btn;
                        }
                    }
                ]
            },
            disabledName: ["type", 'value'],
            hideInputName: [],
            search: [".clear-input", "#search", ".search-input"]
        };

        //初始化新建
        dataTable = zudp.component.initCURD(obj);
    });

    //点击新增

    $("#add-btn").click(function () {
        $("#save-btn").show();
        //  zudp.plugin.form("#form").reset();
        document.getElementById("form").reset();
        $("#trOne").siblings().remove();
        _zudp.addBtn();
        $("#myModalLabel").text("新增");
    })

    //保存数据方法
    $("#save-btn").click(function () {
        var flag = true;
        var sqtr = $("#sqbody").children();
        if (sqtr != undefined && sqtr.length > 0) {
            $.each(sqtr, function (index, va) {
                var name = $(va).find("input[name=enterprisename]").val();
                var code = $(va).find("input[name=uniformCode]").val();
                var startTime = $(va).find("input[name=paymentStart]").val();
                var endTime = $(va).find("input[name=paymentEnd]").val();
                if (name == '' || code == '' || startTime == '' || endTime == '') {
                    zudp.plugin.dialog("warning").alert("表单未填写完成", "警告");
                    flag = false;
                }
            });
        } else {
            zudp.plugin.dialog("warning").alert("表单未填写完成", "警告");
            flag = false;
        }
        if (flag == false) {
            return;
        }

        var taxdataApplys = [];
        if ($("#form").valid()) {
            // var data = zudp.util.formData2json("form");
            $.each(sqtr, function (index, va) {
                var taxdataApply = {};
                var name = $(va).find("input[name=enterprisename]").val();
                var code = $(va).find("input[name=uniformCode]").val();
                var startTime = $(va).find("input[name=paymentStart]").val();
                var endTime = $(va).find("input[name=paymentEnd]").val();

                taxdataApply.enterprisename = name;
                taxdataApply.uniformCode = code;
                taxdataApply.paymentStart = startTime;
                taxdataApply.paymentEnd = endTime;
                taxdataApply.validDays = $("#validDays").val();
                taxdataApply.applyReason = $("#applyReason").val();
                taxdataApplys.push(taxdataApply);
            });
            console.log(taxdataApplys);
            $.ajax({
                url: "api/taxdataApply/saveAll",
                type: "post",
                data: JSON.stringify(taxdataApplys),
                dataType: 'json',
                contentType: 'application/json',
                success: function (data, textStatus, xhr) {
                    zudp.plugin.dialog("success").alert("保存成功" + "！", "提示");

                    dataTable.ajax.reload();
                    $("#myModal").modal('hide');
                }, error: function (e) {
                    zudp.plugin.dialog("error").alert("操作失败！", "错误");
                }
            });


        }

    });

    /*$(".closeTr").click(function(){

    })*/
    function closeTr(obj) {
        var sqtr = $("#sqbody").children();
        if(sqtr.length<=1){
            return;
        }
        $(obj).parent().parent().remove();
    }

    $("#tianJia").click(function () {

        var sqtr = $("#sqbody").children();
        if(sqtr.length>=10){
            return;
        }

        var startid = "";
        for(var i=1;i<=10;i++){
             startid = "paymentStart"+i;
            if($("#"+startid).length>0){
            }else{
                break;
            }
        }
        var endid = "";
        for(var i=1;i<=10;i++){
            endid = "paymentEnd"+i;
            if($("#"+endid).length>0){
            }else{
                break;
            }
        }

   //     var startid = 'paymentStart' + sqtr.length;
        // startid = 'paymentStart';
     //   var endid = 'paymentEnd' + sqtr.length;
        // endid =   'paymentEnd';
        $("#sqbody").append(
            " <tr>\n" +
            "                                <td>\n" +
            "                                    <div class=\"input-group\" style=\"margin-right: 4px;\"><input type=\"text\" class=\"form-control\" name=\"enterprisename2\" style=\"display: none\" id=\"enterprisename2\">\n" +
            "                                    <input type=\"text\" class=\"form-control enterprisename valid\" name=\"enterprisename\" placeholder=\"申请企业名称\" id=\"enterprisename\" autocomplete=\"off\">\n" +
            "                                    <div class=\"input-group-btn\">\n" +
            "                                        <button type=\"button\" style=\"margin: 0px;padding:7px 10px;\" class=\"btn btn-white dropdown-toggle\" data-toggle=\"dropdown\">\n" +
            "                                            <span class=\"caret\"></span>\n" +
            "                                        </button>\n" +
            "                                        <ul class=\"dropdown-menu dropdown-menu-right\" role=\"menu\">\n" +
            "                                        </ul>\n" +
            "                                    </div>\n" +
            "                                    </div>\n" +
            "                                </td>\n" +
            "                                <td ><div style=\"margin-right: 4px;\"><input type=\"text\" name=\"uniformCode\" readonly  maxlength=\"50\" id=\"uniformCode\" placeholder=\"统一社会信用代码\" class=\"form-control\"></div></td>\n" +
            "                                <td ><div style=\"margin-right: 4px;\"><input type='text' name='paymentStart'  id='" + startid + "' class='form-control '  placeholder='税收起始日期'></div></td>\n" +
            "                                <td ><div style=\"margin-right: 4px;\"><input type='text' name='paymentEnd'  id='" + endid + "' class='form-control '  placeholder='税收截止日期'></div></td>\n" +
            "                                <td><div  style=\"margin-right: 4px;\" class='closeTr' onclick='closeTr(this)'>x</div></td>\n" +
            "                            </tr>"
        );


        findCompanyList();

        laydate.render({
            elem: '#paymentStart1' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentEnd1' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentStart2' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentEnd2' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentStart3' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentEnd3' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentStart4' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentEnd4' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentStart5' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentEnd5' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentStart6' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentEnd6' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentStart7' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentEnd7' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentStart8' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentEnd8' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentStart9' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentEnd9' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentStart10' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#paymentEnd10' //指定元素
            , type: 'date'
        });
    })


    //详情
    $(document).on("click", '.row-detail1', function (e) {

        if ($(this).val() != '') {
            zudp.ajax("/api/taxdataApply/" + $(this).val()).get("").then(function (data) {
                data.enterprisename3 = data.enterprisename;
                data.uniformCode3 = data.uniformCode;
                data.applyDate = formatTime(data.applyDate);
                data.authorizeDate = formatTime(data.authorizeDate);
                data.paymentStarts = formatTime(data.paymentStart);
                data.paymentEnds = formatTime(data.paymentEnd);
                dataEcho("#form1", data);
            });
        }

        $("#detail").modal("show");
    });

    //点击删除
    $(document).on("click", '.row-delete', function (e) {
        var id = $(this).val();
        _zudp.del("api/communityInfo1/" + id, id);
    })

    function saveForm(url, type) {
        if ($("#form").valid()) {
            $.ajax({
                url: url,
                type: type,
                data: zudp.util.formData2json("form"),
                dataType: 'json',
                contentType: 'application/json',
                success: function (data, textStatus, xhr) {
                    if ("post" == type) {
                        zudp.plugin.dialog("success").alert("保存成功" + "！", "提示");
                    } else {
                        zudp.plugin.dialog("success").alert("编辑成功" + "！", "提示");
                    }
                    dataTable.ajax.reload();
                    $("#myModal").modal('hide');
                }, error: function (e) {
                    zudp.plugin.dialog("error").alert("操作失败！", "错误");
                }
            });
        }
    };


    //提示
    function swalFunction(a, b, c) {
        swal({
            title: a,
            showCancelButton: true,
            cancelButtonText: "取消",
            confirmButtonColor: "#DD6B55",
            confirmButtonText: c
        }, b);
    }

    /**
     * 时间格式化
     * */
    function formatTime(date) {
        if (date == null || date == "") {
            return "";
        }
        date = new Date(date);
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var D = date.getDate() + ' ';
        return Y + M + D;
    }

    function formatDate(date) {
        if (date == null) return "";
        date = new Date(date);
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
        return Y + M + D;
    }

    function formatDate2(date) {
        if (date == null) return "";
    //    date = new Date(date);
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
        return Y + M + D;
    }
//获取两个时间相差的天数
    function  getDaysBetween(dateString1,dateString2){
        var  startDate = Date.parse(dateString1);
        var  endDate = Date.parse(dateString2);
        var days=(endDate - startDate)/(1*24*60*60*1000);
        // alert(days);
        return  days;
    }
    function isshow(dateString,ts){
        var now = new Date($.ajax({async: false}).getResponseHeader("Date"));
        var dateString2 = formatDate2(now);
       var days = getDaysBetween(dateString,dateString2);
        if(days<=ts){
            return true;
        }else{
            return false;
        }
    }
  //  12 13 14 15
   // isshow("11");
    //alert(getDaysBetween("2019-11-12","2019-11-14"));

    //点击批量删除
    $("#delete-items").click(function () {
        var data = dataTable.rows('.evenSelect').data();
        var ids = [];
        var infoStatusArray = [];
        for (var k = 0; k < data.length; k++) {
            ids.push(data[k].id);
            if (data[k].infoStatus == "1" || data[k].infoStatus == "3") {
                infoStatusArray.push(data[k].infoStatus);
            }
        }
        if (infoStatusArray.length > 0) {
            zudp.plugin.dialog("warning").alert("选中的数据有状态为审查中和通过，不可以删除", "警告")
            return false;
        }
        _zudp.delMore("api/communityInfo1/", ids);
    })

    //查询企业列表
    function findCompanyList() {
        zudp.ajax("/api/taxdataApply/queryCompanyList").get().then(function (value) {
            //假如有null的值就变为“”

            for (var k = 0; k < value.length; k++) {
                if (value[k].id == null) {
                    value[k].id = "";
                }
                if (value[k].enterprisename == null) {
                    value[k].enterprisename = "";
                }
                if (value[k].uniformCode == null) {
                    value[k].uniformCode = "";
                }

            }
            var data = {"value": value, "defaults": "没有搜索到"};
            $(".enterprisename").bsSuggest({
                indexId: 0, //作为id的是下标为那个的字段
                autoSelect: true,
                indexKey: 8,//作为查询的是下标为那个
                showHeader: true,//展示表头
                effectiveFieldsAlias: {id: "企业编号", enterprisename: "企业名称"},//表头
                effectiveFields: ["enterprisename"],
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
            $(".enterprisename").on('onSetSelectValue', function (e, keyword) {

                for (var k = 0; k < value.length; k++) {
                    if (value[k].id == keyword.id) {
                        $(this).parent().parent().parent().find("input[name=uniformCode]").val(value[k].uniformCode);
                    }

                }

            });
            $(".enterprisename").blur(function () {
                var id = $(this).attr("data-id");
                var alt = $(this).attr("alt");
                if (id == '' && alt != '') {
                    $(this).val("");
                    $(this).prop("alt", "");
                    $(this).prev().val("");
                    zudp.plugin.toastr.warning("提示", "没有该数据,请从新输入");
                }
            });
        }, function (reason) {
            zudp.plugin.dialog("error").alert("获取用户列表失败！", "提示");
        });
    }

    /*
        税收信息
     */
    function ssxx(id, paymentStart, paymentEnd) {


        paymentStart = formatDate(parseInt(paymentStart));
        paymentEnd = formatDate(parseInt(paymentEnd));
        var h1 = document.getElementById('titles');
        h1.innerHTML = '税收信息';
        var frameSrc = '/taxinfo_auth?id=' + id + '&paymentStart=' + paymentStart + '&paymentEnd=' + paymentEnd;
        $("#company_member_iframe").attr("src", frameSrc);
        $('#ly_company').modal({show: true, backdrop: 'static'});

    }
</script>


</body>
</html>
