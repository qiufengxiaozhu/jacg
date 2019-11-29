<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>岗位管理</title>
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
                    <@hasPermission name="oaManager:post:create">
                        <button class='btn btn-success' data-toggle='modal' id="add-btn" onclick="getNewsCategory()">
                            新建
                        </button>&nbsp;&nbsp;
                    </@hasPermission>
                    <@hasPermission name="oaManager:post:batchDelete">
                        <button class='btn btn-success btn-danger' id="delete-items">
                            批量删除
                        </button>
                    </@hasPermission>
                        <div class='querybtn my-querybtn'>

                            <#--<select id="category" name="fk_categoryid" class="form-control input-sm">-->
                            <#--<option value=" ">选择类别</option>-->

                            <#--</select>-->
                            <input type='text' name='search' id='search_name' placeholder='请输入标题' class='form-control search-input'>
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
                            <th>新闻标题</th>
                            <#--<th>新闻类别</th>-->
                            <th>新闻摘要</th>
                            <th>新闻状态</th>
                            <th>发布时间</th>
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
                <h4 class="modal-title">添加</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body fix-height" >
                <#--表单-->
                    <form class="form-horizontal" id="post_form">
                        <input type="hidden" name="id" id="id">

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">新闻标题：</label>
                            <div class="col-sm-6">
                                <input type="text" name="title" maxlength="64" id="title" placeholder="新闻标题" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">新闻摘要：</label>
                            <div class="col-sm-6">
                                <input type="text" name="summary" maxlength="64" id="summary" placeholder="新闻摘要" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">发布时间：</label>
                            <div class="col-sm-6">

                                <#--日历控件-->
                                <input type="text" id="newsDate" name="newsDate" class="form-control"/>
                                <img id="calendar_btn" src="/lhgcalendar/images/date.gif"
                                     title="选择日期" onclick="J.calendar.get({id:'newsDate'});"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">新闻类别：</label>
                            <div class="col-sm-6">
                            <#--<select name="post-list-table_length" id="selector" maxlength="64" aria-controls="post-list-table" class="form-control input-sm">-->
                            <#--<option value=" "><a href="api/news/selector">选择类别</a> </option>-->
                            <#--<option value="110">政法新闻</option>-->
                            <#--<option value="111">经济新闻</option>-->
                            <#--<option value="112">社会新闻</option>-->
                            <#--</select>-->
                                <select id="category" name="fk_categoryid" class="form-control"></select>
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">新闻正文：</label>
                            <div class="col-sm-6">
                                <textarea id="editor_id" name="content" class="form-control"style="height:500px;">
                                    &lt;strong&gt;HTML内容&lt;/strong&gt;
                                </textarea>
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

<#--以下是 预览  模态框-->
<#--<div class="modal inmodal fade modal-form-content" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">-->
    <#--<div class="modal-dialog modal-lg">-->
        <#--<div class="modal-content">-->
            <#--<div class="modal-header">-->
                <#--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span-->
                        <#--class="sr-only">Close</span></button>-->
                <#--<h4 class="modal-title">添加</h4>-->
            <#--</div>-->
            <#--<small class="font-bold">-->
                <#--<div class="modal-body fix-height" >-->
                <#--&lt;#&ndash;表单&ndash;&gt;-->
                    <#--<form class="form-horizontal" id="form">-->
                        <#--<input type="hidden" name="id" id="id">-->

                        <#--<div class="form-group">-->
                            <#--<label class="col-sm-3 control-label my-control-label ">新闻标题：</label>-->
                            <#--<div class="col-sm-6">-->
                                <#--<input type="text" name="title" maxlength="64" id="title" placeholder="新闻标题" class="form-control">-->
                            <#--</div>-->
                            <#--<div>-->
                                <#--<i class="i_context my-i_context">*</i>-->
                            <#--</div>-->
                        <#--</div>-->


                        <#--<div class="form-group">-->
                            <#--<label class="col-sm-3 control-label my-control-label ">新闻摘要：</label>-->
                            <#--<div class="col-sm-6">-->
                                <#--<input type="text" name="summary" maxlength="64" id="summary" placeholder="新闻摘要" class="form-control">-->
                            <#--</div>-->
                            <#--<div>-->
                                <#--<i class="i_context my-i_context">*</i>-->
                            <#--</div>-->
                        <#--</div>-->

                        <#--<div class="form-group">-->
                            <#--<label class="col-sm-3 control-label my-control-label">发布时间：</label>-->
                            <#--<div class="col-sm-6">-->
                                <#--<input type="text" id="newsDate" name="newsDate" class="form-control"/>-->
                                <#--<img id="calendar_btn" src="/lhgcalendar/images/date.gif"-->
                                     <#--title="选择日期" onclick="J.calendar.get({id:'newsDate'});"/>-->
                            <#--</div>-->
                        <#--</div>-->
                        <#--<div class="form-group">-->
                            <#--<label class="col-sm-3 control-label my-control-label ">新闻类别：</label>-->
                            <#--<div class="col-sm-6">-->
                            <#--&lt;#&ndash;<select name="post-list-table_length" id="selector" maxlength="64" aria-controls="post-list-table" class="form-control input-sm">&ndash;&gt;-->
                            <#--&lt;#&ndash;<option value=" "><a href="api/news/selector">选择类别</a> </option>&ndash;&gt;-->
                            <#--&lt;#&ndash;<option value="110">政法新闻</option>&ndash;&gt;-->
                            <#--&lt;#&ndash;<option value="111">经济新闻</option>&ndash;&gt;-->
                            <#--&lt;#&ndash;<option value="112">社会新闻</option>&ndash;&gt;-->
                            <#--&lt;#&ndash;</select>&ndash;&gt;-->
                                <#--<select id="category" name="fk_categoryid" class="form-control"></select>-->
                            <#--</div>-->
                            <#--<div>-->
                                <#--<i class="i_context my-i_context">*</i>-->
                            <#--</div>-->
                        <#--</div>-->
                        <#--<div class="form-group">-->
                            <#--<label class="col-sm-3 control-label my-control-label">新闻正文：</label>-->
                            <#--<div class="col-sm-6">-->
                                <#--<textarea id="editor_id" name="content" class="form-control"style="height:500px;">-->
                                    <#--&lt;strong&gt;HTML内容&lt;/strong&gt;-->
                                <#--</textarea>-->
                            <#--</div>-->
                        <#--</div>-->


                    <#--</form>-->
                <#--</div>-->

                <#--<div class="modal-footer">-->
                    <#--<input type="hidden" id="add-type">-->
                    <#--<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>-->
                    <#--<button type="button" class="btn btn-primary" id="save-btn">保存</button>-->
                <#--</div>-->
            <#--</small>-->
        <#--</div>-->
        <#--<small class="font-bold">-->
        <#--</small>-->
    <#--</div>-->
    <#--<small class="font-bold">-->
    <#--</small>-->
<#--</div>-->

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
<script type="text/javascript" src="/lhgcalendar/lhgcore.js"></script>
<script type="text/javascript" src="/lhgcalendar/lhgcalendar.js"></script>

<script>

    var dataTable;
    var urlstr="/api/news";
    var formIdStr="#post_form";
    var sys_url=window.location.host;
    $(document).ready(function () {

//        $("#post_form").validate({
//            rules: {
//                name:{
//                    required:true,
//                    remote: {
//                        url:"/api/post/checkName",
//                        type:"get",
//                        data: {
//                            "name":function () {
//                                return $("#name").val();
//                            },
//                            "id":function () {
//                                return $("#id").val();
//                            }
//                        },
//                        dataFilter: function(data, type) {
//                            var da=JSON.parse(data).data;
//                            if(zudp.util.isBoolean(da)){
//                                return da;
//                            }else{
//                                return false;
//                            }
//                        }
//                    }
//                },
//                identification:{
//                    required:true,
//                    rangelength:[0,64],
//                    remote: {
//                        url:"/api/post/checkIdenty",
//                        type:"get",
//                        data: {
//                            "identy":function () {
//                                return $("#identification").val();
//                            },
//                            "id":function () {
//                                return $("#id").val();
//                            }
//                        },
//                        dataFilter: function(data, type) {
//                            var da=JSON.parse(data).data;
//                            if(zudp.util.isBoolean(da)){
//                                return da;
//                            }else{
//                                return false;
//                            }
//                        }
//                    }
//                },
//
//                mark:{
//                    rangelength:[0,1000]
//                }
//            },
//            messages: {
//                name: {
//                    required: "请输入岗位名称",
//                    remote: "岗位名称已存在"
//                },
//                identification: {
//                    required: "请输入岗位标识",
//                    remote: "岗位标识已存在"
//                },
//                mark: {
//                    rangelength:"字符个数不能超过1000"
//                }
//            },ignore: []
//        });

        findList();

        getNewsCategory(obj);

        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}新闻",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value'],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"]

        };
        //初始化增删改查参数
        initForm(obj);


    });


    //提示
    function swalFunction(a,b,c) {
        swal({
            title: a,
            showCancelButton: true,
            cancelButtonText: "取消",
            confirmButtonColor: "#DD6B55",
            confirmButtonText: c,
        },b);
    }


    //列表数据初始化方法
    function findList() {

        var urls="/api/news";
        dataTable=zudp.plugin.table('#post-list-table')
                .url(urls)
                .search(function () {
                    return {
                        "title":$("#search_name").val()
//                        "fk_categoryid": $("#category").val()

                    }
                })
                .columns( [
                    {data: 'id',visible: false},
                    {data: 'title',width: '25%'},
                    {data: 'summary',width: '40%',
                        render:function(data, type, row){
                        var suf="...";
                        if(data!=null && data.length<30){
                            suf="";
                        }
                            var ah="<a title='"+data+"'>"+data.substr(0,30)+suf+"</a>";
                            return ah;
                        }
                    },
                    {data: 'status', width: '8%'},
                    {
                        data: 'newsDate', width: '10%'
//                        render: function (data, type, row) {
//                            if (data != null && data != '') {
//                                return formatDate(data);
//                            } else {
//                                return "";
//                            }
//
//                        }
                    },
//                    {data: 'mark',render:function(data, type, row){
//                        var suf="...";
//                        if(data!=null && data.length<30){
//                            suf="";
//                        }
//                            var ah="<a title='"+data+"'>"+data.substr(0,20)+suf+"</a>";
//                        return ah;
//                     }
//
//                    },
                    {
                        render: function (data, type, row) {
                            var btn = "";
                            var editstr="";
                            var delstr="";
                            var addstr="";

                            addstr = '<button class="btn btn-success btn-sm row-detail" value="{id}" style="margin-right: 5px"><i class="fa fa-pencil"></i>预览</button>';
                            editstr = '<button onclick="getNewsCategory(this)" class="btn btn-info btn-sm row-edit updateOpBtn" value="{id}"><i class="fa fa-pencil"></i>编辑</button>';
                            delstr = zudp.template.delBtn;
//                          addstr = '<button class="btn btn-sm btn-success" id="btn-overview">预览</button>';
                            btn += addstr+editstr+delstr;
                            return zudp.util.render(btn, row);

                        }
                    }
                ])
                .then();

    }

    $(document).on("click", '.row-detail', function () {

        $("#calendar_btn").css("display","none");	//隐藏日历控件

    });


    <!--   动态获取新闻种类 -->
    function getNewsCategory(obj) {

        $("#calendar_btn").css("display","inline");	//显示日历控件

        //获取列表上此列字段
        var str = $(obj).parent().prev().prev().text();

        //获取此行id值
        var idstr = $(obj).val();

        //接收读取出来的本张表外键，也就是类别表主键
        var categoryId = "";

        //如果列表上此字段不为空
        if (str != "") {
            zudp.ajax("/api/news/get?id=" + idstr).get().then(function (value) {

                //通过此行id读取出本表外键
                categoryId = value.fk_categoryid;
            });
        }

        //读出类别表所有的类别字段
        $("#category").find("option").remove();
        zudp.ajax("/api/category/clist").get().then(function (value) {

            //循环读出
            for (var k = 0; k < value.length; k++) {

                //如果类别表的类别字段为空，就置为空
                if (value[k].category  == null) {
                    value[k].category = "";
                }else{
                    //如果读取出本表外键，就与类别表主键进行匹配
                    if (categoryId != "") {
                        if (value[k].id == categoryId) {

                            //成功匹配则将此类别标记为选中
                            $("#category").append("<option value='" + value[k].id + "' selected='selected'>" + value[k].category + "</option>");
                        } else {

                            //否则就按读取顺序将类别排列在下拉框中
                            $("#category").append("<option value='" + value[k].id+ "'>" + value[k].category  + "</option>");
                        }
                    } else {

                        //未匹配就按读取顺序将类别排列在下拉框中
                        $("#category").append("<option value='" + value[k].id+ "'>" + value[k].category  + "</option>");
                    }
                }
            }
        }, function (reason) {
            zudp.plugin.dialog("error").alert("获取用户列表失败！", "提示");
        });
    };

    //新建时获取种类
//    function getNewsCategory2(){
//        var categoryId = "";
//        zudp.ajax("/api/category/findList").get().then(function (value) {
//
//            for (var k = 0; k < value.length; k++) {
//                $("#category").append("<option value='" + value[k].category+ "'>" + value[k].category  + "</option>");
//            }
//        });
//    };

    function formatDate(date) {
        if (date == null) return "";
        date = new Date(date);
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
        return Y + M + D;
    };

    function initUpload(){

        var uploader = WebUploader.create({
            // swf文件路径
            swf: '/css/third/Uploader.swf',
            auto: true,
            // 文件接收服务端。
            server: '/upload/custom',

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#xg_rar',

            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false,
            //重复上传
            duplicate :true,
            accept:{
                extensions:'bmp,jpg,png,rar,gif,zip,xls,xlsx,doc,docx',
                title:'file',
                mimeTypes:'*/*'
            }
        });
        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on( 'uploadSuccess', function( file,response) {
            //debugger;
            var name = file.name;
            var fileurl = response.data;
            $("#fileShowName").append("<p><a href='//"+sys_url+"/"+fileurl+"' download='"+name+"'>"+name+"</a><input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;<span style='color:red' onclick='deleteFile(this)'>删除</span><input type='hidden' name='attachPath' value='"+fileurl+"'><input type='hidden' name='attachName' value='"+name+"'>	</p>");

            //change(response);
        });
    }

</script>
</body>
</html>
