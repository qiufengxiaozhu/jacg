<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>大屏案件点击下钻</title>
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
        .gray-bg, .ibox-content, .table-bordered>thead>tr>th {
            background-color: transparent;
            border: none;
        }
        .bs-table>tbody>tr>td, .bs-table>thead>tr>th{border: 1px solid #00fcff;color:#fff}
        .bs-table{ border: 1px solid #00fcff;   border-collapse: collapse;box-shadow: 0px 0px 12px #00fcff;}
    </style>

    <style>
        .page-list{text-align: center}
        .page-list .page-li.prev{font-family: SimHei}
        .page-list .page-li.next{font-family: SimHei}
        .page-list .page-li.on{color:#000000}
        .page-list .page-li{    color: #808080;
            padding: 0.6rem 1rem;
            font-size: 1.5rem;
            background: rgba(255,255,255,0.2);
            margin: 0 0.3rem;
            border-radius: 50%;}
        .yt-main{max-height: 100%;}
        .yt-tab-cnt{width: 100%;padding-top: 3rem}
        .modal-content{background: transparent}
        .inmodal .modal-body { background: transparent;  }
        .modal-title, .my-control-label{color: #fff}
    </style>

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
                <div class="be-relative">
                    <table id="post-list-table" class="gridtable ge-put show-hide0">
                        <thead>
                        <tr>
                            <th class="faguang">区名</th>
                            <th class="faguang">街道</th>
                            <th class="faguang">大类名称</th>
                            <th class="faguang">问题描述</th>
                            <th class="faguang">案件截止时间</th>
                            <th class="faguang">操作</th>
                        </tr>
                        </thead>
                        <tbody id="tables">
                        </tbody>
                    </table>

<#--以下是模态框-->
<div class="modal inmodal fade modal-form" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog mbox modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                <h4 class="modal-title">查看</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body fix-height" >
                    <#--表单-->
                    <form class="form-horizontal" id="post_form">

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">区名：</label>
                            <div class="col-sm-6">
                                <input type="text" name="DISTRICTNAME" maxlength="64" id="DISTRICTNAME" placeholder="区名" class="form-control"  readonly="true" >
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">街道：</label>
                            <div class="col-sm-6">
                                <input type="text" name="STREETNAME" maxlength="64" id="STREETNAME" placeholder="街道" class="form-control"  readonly="true">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">问题来源：</label>
                            <div class="col-sm-6">
                                <input type="text" name="EVENTSRCNAME" maxlength="64" id="EVENTSRCNAME" placeholder="问题来源" class="form-control"  readonly="true">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">大类名称：</label>
                            <div class="col-sm-6">
                                <input type="text" name="MAINTYPENAME" maxlength="64" id="MAINTYPENAME" placeholder="大类名称" class="form-control"  readonly="true">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">小类名称：</label>
                            <div class="col-sm-6">
                                <input type="text" name="SUBTYPENAME" maxlength="64" id="SUBTYPENAME" placeholder="小类名称" class="form-control"  readonly="true">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">问题描述：</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" rows="5" cols="" name="EVENTDESC" id="EVENTDESC"  readonly="true"></textarea>
                            </div>

                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">地址：</label>
                            <div class="col-sm-6">
                                <input type="text" name="ADDRESS" maxlength="64" id="ADDRESS" placeholder="地址" class="form-control"  readonly="true">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">案件截止时间：</label>
                            <div class="col-sm-6">
                                <input type="text" name="DEADLINE" maxlength="64" id="DEADLINE" placeholder="案件截止时间" class="form-control"  readonly="true">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">案件结束时间：</label>
                            <div class="col-sm-6">
                                <input type="text" name="ENDTIME" maxlength="64" id="ENDTIME" placeholder="案件结束时间" class="form-control"  readonly="true">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">处理意见：</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" rows="5" cols="" name="DISPOSEOPINION" id="DISPOSEOPINION"  readonly="true"></textarea>
                            </div>

                        </div>




                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">处理部门：</label>
                            <div class="col-sm-6">
                                <input type="text" name="DISPOSEDEPARTNAME" maxlength="64" id="DISPOSEDEPARTNAME" placeholder="处理部门" class="form-control"  readonly="true">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">部门处理时间：</label>
                            <div class="col-sm-6">
                                <input type="text" name="DEALTIME" maxlength="64" id="DEALTIME" placeholder="部门处理时间" class="form-control" readonly="true">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>










                    </form>
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

    var page=1;
    var sumpage=${listsize};

    //尾页
    function endpage() {
        page=sumpage;
        search();
    }
    //首页
    function firstPage() {
        page=1;
        search();
    }

    //上一页
    function uppers() {
        if(page==1){
            alert("已经是首页哦")
        }else{
            page=page-1;
            search();
        }
    }

    //下一页
    function lowers() {
        if(sumpage==page){
            alert("已是尾页");
        }else {
            page=page+1;
            search();
        }
    }

    search();

    function search() {
        var main = $('#tables');
       main.empty();
        var s="${name}";
        zudp.ajax("/mm/screen/glindexCaseList?name="+s+"&page="+page ).get().then(function (value) {
            
            for(var i=0;i<value.length;i++){
                var data  =value[i];

                var  title=value[i].EVENTDESC;

                if (title.length>15){
                    title=title.substr(0,25)+"...";
                }

                var div ='<tr>';
                div=div +'   <td>'+data.DISTRICTNAME+'</td>';
                div=div +'   <td>'+data.STREETNAME+'</td>';
                div=div +'   <td>'+data.MAINTYPENAME+'</td>';
                div=div +'   <td>'+title+'</td>';
                if (data.DEADLINE!=null) {
                    div=div +'   <td>'+(data.DEADLINE)+'</td>';
                }else {
                    div=div +'   <td>'+""+'</td>';
                }
                var pubstr= "<button class=\"btn btn-info btn-sm\" onclick=\"pubBtn('"+data.RECID+"')\">查看</button>";
                div=div +'   <td>'+pubstr+'</td>';

                $('#post-list-table').append(div)


            }


        },function (reason) {
            zudp.plugin.dialog("error").alert("查询失败！", "提示");
        });

    }

    function pubBtn(id) {

        zudp.ajax("/mm/screen/glindexCaseid?id="+id ).get().then(function (value) {
//            ;
            $("#DISTRICTNAME").val(value.DISTRICTNAME);
            $("#STREETNAME").val(value.STREETNAME);
            $("#EVENTSRCNAME").val(value.EVENTSRCNAME);
            $("#MAINTYPENAME").val(value.MAINTYPENAME);
            $("#SUBTYPENAME").val(value.SUBTYPENAME);
            $("#EVENTDESC").val(value.EVENTDESC);
            $("#ADDRESS").val(value.ADDRESS);
            $("#DEADLINE").val(value.DEADLINE);
            $("#ENDTIME").val(value.ENDTIME);
            $("#DISPOSEOPINION").val(value.DISPOSEOPINION);
            $("#DISPOSEDEPARTNAME").val(value.DISPOSEDEPARTNAME);
            $("#DEALTIME").val(value.DEALTIME);
//            ;
            $("#myModal5").modal("show");//显示div


        },function (reason) {
            zudp.plugin.dialog("error").alert("查询失败！", "提示");
        });


    }

</script>
</body>
</html>
