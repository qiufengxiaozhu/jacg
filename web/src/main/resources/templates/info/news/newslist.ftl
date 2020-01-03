<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新闻管理</title>
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
    <#--<link href="/css/third/bootstrap-select.css" rel="stylesheet">-->

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
                            <input type='text' name='search' id='search_name' placeholder='请输入标题' class='form-control search-input'>
                            <input type="text" name="startTime" id="startTime" startDate placeholder="发布开始时间" class="form-control">
                            <input type="text" name="endTime" id="endTime" endDate placeholder="发布终止时间" class="form-control">

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
                            <th>新闻正文</th>
                            <th>发布状态</th>
                            <th>发布时间</th>
                            <th>点击量</th>
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
<div class="modal inmodal fade modal-form " id="myModal5" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">新建新闻</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body fix-height" id="newsTable">
                <#--表单-->
                    <form class="form-horizontal" id="post_form">
                        <input type="hidden" name="id" id="id">
                        <!-- 附件上传 隐藏传值  开始 -->
                        <input id="attachIdss" type="hidden" />
                        <!-- 附件上传 隐藏传值  结束 -->
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">新闻标题：</label>
                            <div class="col-sm-6">
                                <input type="text" name="title" maxlength="64" id="title" placeholder="新闻标题" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                        <div class="form-group" id="publicDate">
                            <label class="col-sm-3 control-label my-control-label " id = "publicTime">发布时间：</label>
                            <div class="col-sm-6">
                                <input type="text" name="newsDate" maxlength="64" id="newsDate" placeholder="发布时间" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">所在时区：</label>
                            <div class="col-sm-6">
                                <select id="timeZone" name="timeZone" class="form-control">
                                    <option value="1" selected>吉安市</option>
                                    <option value="2">吉州区</option>
                                    <option value="3">青原区</option>
                                    <option value="4">庐陵新区</option>
                                    <option value="5">井开区</option>
                                </select>
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <#--<div class="form-group">-->
                            <#--<label class="col-sm-3 control-label my-control-label">发布时间：</label>-->
                            <#--<div class="col-sm-6">-->

                                <#--&lt;#&ndash;日历控件&ndash;&gt;-->
                                <#--<input type="text" id="newsDate" name="newsDate" class="form-control"/>-->
                                <#--<img id="calendar_btn" src="/lhgcalendar/images/date.gif"-->
                                     <#--title="选择日期" onclick="J.calendar.get({id:'newsDate'});"/>-->
                            <#--</div>-->
                        <#--</div>-->
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">新闻类别：</label>
                            <div class="col-sm-6">
                                <select id="category" name="fk_categoryid" class="form-control"></select>
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                        <#--<div class="form-group">-->
                            <#--<label class="col-sm-3 control-label my-control-label">新闻封面：</label>-->
                            <#--<div class="col-sm-6">-->
                                <#--<div class="col-sm-9 big-photo">-->
                                    <#--<div id="preview">-->
                                        <#--<img id="imghead" border="0" src="/img/photo_icon.png" width="90" height="90" onclick="$('#previewImg').click();">-->
                                    <#--</div>-->
                                    <#--<input type="file" onchange="previewImage(this)" style="display: none;" id="previewImg" weblitRelativePath>-->
                                <#--</div>-->
                            <#--</div>-->
                        <#--</div>-->
                        <div class="form-group" id="newsContent">
                            <label class="col-sm-3 control-label my-control-label">新闻正文：</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" rows="5" cols="" name="content" id="content"></textarea>
                            </div>
                        </div>

                        <div class="form-group" style="" id="disClick">
                            <label class="col-sm-3 control-label my-control-label">封面图片：</label>
                            <div style="width:80;height: 35px;position: relative;margin:0 auto">
                                <div id="xg_rar">上传封面</div>
                            </div>
                            <div id="fileShowName" style="text-align: center;margin:0 auto"></div>
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
<script src="/js/third/layer/layer.min.js"></script>
<script src="/js/third/icheck.min.js"></script>
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script src="/js/third/laydate/laydate.js"></script>
<script src="/js/pluginInit/dataecho.js"></script>
<script src="/js/third/laydate/laydate.js"></script>
<script src="/js/pluginInit/laydateInit.js"></script>
<script src="/js/zudp.js"></script>
<script type="text/javascript" src="/js/third/jquery.ztree.all.js"></script>
<script src="/js/third/bootstrap-suggest.min.js"></script>
<script src="/js/sys/avatar.js"></script>
<script src="/js/third/webuploader.js"></script>
<script src="/js/rest.js"></script>

<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>

<script>


    var dataTable;
    var urlstr="/api/news";
    var formIdStr="#post_form";
    var sys_url=window.location.host;

    //初始化百度富文本框  id='content'
    var ue = UE.getEditor('content',{

        // initialFrameWidth :800,//设置编辑器宽度

        initialFrameHeight:300,//设置编辑器高度

        scaleEnabled:true});

    UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
    UE.Editor.prototype.getActionUrl = function(action) {
        if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadimage' || action == 'uploadvideo' || action == 'uploadfile') {
            return '/Ueditors/uploadimage';//指定访问路径
        } else {
            return this._bkGetActionUrl.call(this, action);
        }


    }
    //获得编辑器带格式的内容
    function getContent() {
        return UE.getEditor('content').getContent();
    }
    //获得编辑器的纯文本内容
    function getContentTxt() {
        return UE.getEditor('content').getContentTxt();
    }
    /**
     * //初始化百度富文本框  id='content'  end
     */

    $(document).ready(function () {


        $("#post_form").validate({
            rules: {
               title:{
                   required:true,
                   rangelength:[0,15]
               },
                timeZone:"required",

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

                content:{
                    rangelength:[0,1000]
                }
            },
            messages: {
               title: {
                   required: "请输入新闻标题",
                   rangelength:"字符个数不能超过15"
                   // remote: "新闻标题已存在"
               },
                timeZone: "时区不能为空",
//                identification: {
//                    required: "请输入岗位标识",
//                    remote: "岗位标识已存在"
//                },
                content: {
                    rangelength:"字符个数不能超过1000"
                }
            },ignore: []
        });

        findList();

        //按钮隐藏
        getNewsCategory();
        //按钮显示
        detailsstrBtn();


        var setValFun = function () {
            $("#xg_rar").html('上传附件');
            $("#fileShowName").html('');
            $("#attachIdss").val('');
            //清空文本框内容
            UE.getEditor('content').setContent("");
            //初始化上传工具
            initUpload();
        };
        var setOtherVal = function () {
            var id = $(formIdStr).find("input[name='id']").eq(0).val();

            //取值回显
            zudp.ajax(urlstr + "/" + id).get("").then(function (data) {
                dataEcho(formIdStr, data);
                if(data.content!=null && data.content.length>0){
                    UE.getEditor('content').setContent(data.content);
                }else{
                    UE.getEditor('content').setContent("");
                }
                var d = data;
                console.info(data);
                var attachPaths = d.attachPaths;
                var attachNames = d.attachNames;
                var attachIds = d.attachIdss;
                var tmpAttachPath = "";
                if (attachPaths) {
                    for (var i = 0; i < attachPaths.length; i++) {
                        tmpAttachPath += "<p>" +
                                "<a href='//" + sys_url + "/" + attachPaths[i] + "' download='" + attachNames[i] + "'>" +
                                attachNames[i] + "</a>" +
                                "<input type='hidden' name='fid' value='" + attachIds[i] + "'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                                "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                                "<input type='hidden' name='attachPathed' value='" + attachPaths[i] + "'>" +
                                "<input type='hidden' name='attachNameed' value='" + attachNames[i] + "'>	" +
                                "</p>";
                    }
                }
                $("#fileShowName").html(tmpAttachPath);//附件赋值
            }, function (error) {
            });

            $("#xg_rar").html('上传附件');
            //附件控件
            initUpload();

        };
        var saveFormFun = function () {

            if ($(formIdStr).valid()) {

                var data = zudp.util.formData2json("form");
                data = $.parseJSON(data);
                var attachPaths = getAttachPath();//附件路径传参
                var attachNames = getAttachName();//附件名称 传参
                var attachIdss = getAttachIdss();//要删除掉的ids
                data.attachPaths = attachPaths;
                data.attachNames = attachNames;
                data.attachIdss = attachIdss;

                data.content=getContent();
                data.contentnohtml=getContentTxt();
                data = JSON.stringify(data);

                var mymesg = "新建";
                var id=$("#id").val();
                if ($("#id").val() != '') { //编辑的保存按钮
//                    alert("修改");
                    console.info(data);
                    mymesg = "修改";
                    zudp.ajax(urlstr +'/'+id).put(data).then(function (da) {

                        zudp.plugin.dialog("success").alert(mymesg + "成功" + "！", "提示");
                        dataTable.ajax.reload();
                        $(".modal-form").modal("hide");
                    });
                }else {     //新增的保存按钮
//                    alert("新建");
                    console.info(data);
                    zudp.ajax(urlstr + "/saveNews").post(data).then(function (da) {

                        zudp.plugin.dialog("success").alert(mymesg + "成功" + "！", "提示");
                        dataTable.ajax.reload();
                        $(".modal-form").modal("hide");
                    });
                }
            }



               /* zudp.ajax(urlstr + "/saveNews").post(data).then(function (da) {

                    zudp.plugin.dialog("success").alert(mymesg + "成功" + "！", "提示");
                    dataTable.ajax.reload();
                    $(".modal-form").modal("hide");
                });
            }*/
        };

        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}新闻",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value'],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"],

            //富文本框相关
            addBtnFun: setValFun,
            editBtnFun: setOtherVal,
            saveForm: saveFormFun

        };
        //初始化增删改查参数
        initForm01(obj);


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
                        "title":$("#search_name").val(),
                        "starTime": $("#starTime").val(),
                        "endTime": $("#endTime").val()
                    }
                })
                .columns( [
                    {data: 'id',visible: false},
                    {data: 'title',width: '16%',
                        render:function(data, type, row){
                            var suf="...";
                            if(data!=null && data.length<15){
                                suf="";
                            }
                            var ah="<a title='"+data+"'>"+data.substr(0,15)+suf+"</a>";
                            return ah;
                        }
                    },
                    {data: 'content',width: '32%',
                        render:function(data, type, row){
                        var suf="...";
                        if(data!=null && data.length<28){
                            suf="";
                        }
                            var ah="<a title='"+data+"'>"+data.substr(0,28)+suf+"</a>";
                            return ah;
                        }
                    },
                    {data: 'status', width: '8%'},
                    {width: '16%',
                        render: function (data, type, row) {
                            if(data.newsDate == null){
                                return "无";
                            }
                            else
                                return data.newsDate;
                        }
                    },
                    {data: 'clicks', width: '6%'},
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
                            var editstr=""; //编辑
                            var delstr="";  //删除
                            var detailsstr="";  //预览
                            var release=""; //发布
                            var cancel="";  //撤销发布

//                             自带详情框 onclick="getNewsCategory(this)"
                            detailsstr = '<button onclick="detailsstrBtn()" class="btn btn-success btn-sm row-detail" value="{id}" ><i class="fa fa-pencil"></i>详情</button>';
//                            detailsstr = '<button id = "detailsstrBtn" class="btn btn-success btn-sm " value="{id}" style="margin-left: 5px"><i class="fa fa-pencil"></i>详情</button>';
                            editstr = '<button onclick="getNewsCategory()" class="btn btn-info btn-sm row-edit updateOpBtn" value="{id}" style="margin-right: 5px"><i class="fa fa-pencil"></i>编辑</button>';
                            delstr = zudp.template.delBtn;


                            release = '<button onclick="releaseBtn(this)" class="btn btn-sm btn-success" id="release" style="margin-left: -5px" value="{id}"><i class="fa fa-pencil"></i>发布</button>';
                            cancel = '<button onclick="cancelBtn(this)" class="btn btn-danger btn-sm " id="cancel" style="margin-left: 5px" value="{id}"><i class="fa fa-close"></i>撤销发布</button>';

                            if(data.status == "编辑状态" || data.status == "未发布状态"){
                                btn += editstr+detailsstr+delstr+release;
                            }
                            else
                                btn += detailsstr + cancel;
                            return zudp.util.render(btn, row);

                        }
                    }
                ])
                .then();

    }

    //隐藏按钮（新建、编辑）
    function getNewsCategory() {

//        $("#publicTime").css("display","none");
//        $("#newsDate").css("display","none");
//        $("#publicDate").css("display","none");

//        ue.setEnabled();
    }

    //编辑按钮
    $(document).on("click", '.row-edit', function (e) {
        ue.setEnabled();
        $("#xg_rar").show();
    });
    //新建按钮
    $(document).on("click", '#add-btn', function (e) {
        ue.setEnabled();
        $("#xg_rar").show();
    });
    //详情按钮
    $(document).on("click", '.row-detail', function (e) {
        ue.setDisabled();
        $("#xg_rar").hide();
    });

    //详情
    function detailsstrBtn() {
//        $("#publicTime").css("display","block");
//        $("#newsDate").css("display","block");
        $("#publicDate").css("display","block");

//        ue.setDisabled();

//        $("#xg_rar").attr("disabled", "disabled");
//        $("#newsContent").attr("disabled", "disabled");
//        $("#newsTable").attr("disabled", "disabled");
//        document.getElementById("xg_rar").setAttribute("disabled", "disabled");
    }

    //发布
    $(document).on("click", '#release', function (e) {
        //清除冒泡
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }



    });

    /**
     * 保存方法
     */
    $(document).on("click", '#save-btn-test', function (e) {





    });
    //撤销发布
    $(document).on("click", '#cancel', function (e) {
        //清除冒泡
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }
    });
//    //详情
//    $(document).on("click", '#detailsstrBtn', function (obj) {
//        //清除冒泡
//        if (obj && obj.stopPropagation) {
//            obj.stopPropagation();
//        } else {
//            window.e.cancelBubble = true;
//        }
//
//        $(".modal-two").modal("show");
//
////        //设置隐藏组件
////        for (var i = 0; i < e.hideInputName.length; i++) {
////            $(".modal form").find("*[name=" + e.hideInputName[i] + "]").parents('.form-group').css("display", 'none');
////        }
//        var idstr = $(obj).val();
//        //取值回显
////            zudp.ajax("/api/news/get").post(idstr).then(function (obj) {
//        zudp.ajax("/api/news/get?id=" + idstr).get().then(function (data) {
//                dataEcho("myModal5", data);
//                }, function (error) {
//            });
//
//        //设置禁用
//        for (var i = 0; i < obj.disabledName.length; i++) {
//            $(".modal form").find("*[name=" + obj.disabledName[i] + "]")
//                    .attr("disabled", true);
//        }
//
//    });

    //发布
    function releaseBtn(obj){

        //获取此行id值
        var idstr = $(obj).val();

//        alert(idstr);

        //发布状态
        var status;
//        zudp.ajax("/api/news/get?id=" + idstr).get().then(function (value) {
//
//            //通过此行id读取出本表发布状态
//            status = value.status;
//
////            alert(status);
//        });
        zudp.ajax("/api/news/update_release?id=" + idstr).get().then(function (value) {
            document.location.reload();
        });


    }

    //撤销发布
    function cancelBtn(obj) {

        //获取此行id值
        var idstr = $(obj).val();

        zudp.ajax("/api/news/update_cancel?id=" + idstr).get().then(function (value) {
            document.location.reload();
        });

    }
    
    <!--   动态获取新闻种类 -->
    function getNewsCategory(obj) {

        $("#publicDate").css("display","none");//按钮隐藏

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

    function formatDate(date) {
        if (date == null) return "";
        date = new Date(date);
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
        return Y + M + D;
    };

    //初始化上传
    function initUpload(){

        var uploader = WebUploader.create({
            // swf文件路径
            swf: '/css/third/Uploader.swf',
            auto: true, //自动提交保存
            // 文件接收服务端。
            server: '/uploadOfGuest/custom',

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#xg_rar',

            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: true,

//            fileNumLimit: 1, 规定上传数量
            //重复上传
            duplicate :true,
            accept:{
//                extensions:'bmp,jpg,png,rar,gif,zip,xls,xlsx,doc,docx,mp4',
                extensions:'bmp,jpg,png,gif',
                title:'file',
                mimeTypes:'*/*'
            }
        });
        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on( 'uploadSuccess', function( file,response) {
            //debugger;

            var name = file.name;
            var fileurl = response.data;
            console.info(response);
            $("#fileShowName").append(
                "<p>" +
                    "<a href='//"+sys_url+"/"+fileurl+"' download='"+name+"'>"+name+"</a>" +
                    "<input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                    "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                    "<input type='hidden' name='attachPath' value='"+fileurl+"'>" +
                    "<input type='hidden' name='attachName' value='"+name+"'>" +
                "</p>");

            //change(response);



        });
    }

    //删除，删除节点
    function deleteFile(obj) {
        var fid = $(obj).parent().find("input[name='fid']").eq(0).val();
        if (fid != '') {
            var str = $("#attachIdss").val() + "," + fid;
            if (str.indexOf(",") == 0) {
                str = str.substr(1);
            }
            $("#attachIdss").val(str);
        }
        $(obj).parent().remove();
    }

    //获取在节点上的文件路径
    function getAttachPath() {
        var tempAttachPath = [];
        var $attachPath = $("input[name='attachPath']");
        $.each($attachPath, function (k, v) {
            tempAttachPath.push($(v).val());
        });
        return tempAttachPath;
    }
    //获取在节点上的文件路名称
    function getAttachName() {
        var tempAttachName = [];
        var $attachName = $("input[name='attachName']");
        $.each($attachName, function (k, v) {
            tempAttachName.push($(v).val());
        });
        return tempAttachName;
    }

    //获取所有附件Ids
    function getAttachIdss() {
        var tempAttachIdss = [];
        var fid = $("input[name='fid']");
        $.each(fid, function (k, v) {
            tempAttachIdss.push($(v).val());
        });
        return tempAttachIdss;
    }

    function initForm01(obj){
        //弹窗
        $(document).on("click", "#add-btn", function () {
            $(".modal-form").modal("show");
            $(".modal-form").addClass("create-form").removeClass("edit-form detail-form");
            $(".create-form").find("#save-btn").show();
            $(".create-form").find(".my-i_context").show();
            zudp.plugin.form(obj.formId).reset();
            if(obj.addBtnFun!=undefined){
                obj.addBtnFun();
            }
            //修改标题
            var titleText = zudp.util.render(obj.title, {"type": "新建"});
            $(".modal .modal-title").text(titleText);
            //取消禁用
            for (var i = 0; i < obj.disabledName.length; i++) {
                $(".modal form").find("*[name=" + obj.disabledName[i] + "]")
                        .attr("disabled", false);
            }
            //设置隐藏组件
            for (var i = 0; i < obj.hideInputName.length; i++) {
                $(".modal form").find("*[name=" + obj.hideInputName[i] + "]").parents('.form-group').css("display", 'block');
            }
            //    如果页面中有radio button 点击
            if($(".modal-form input[type=radio]").length != 0) {
                $(".modal-form input[type=radio]:first").prop("checked","checked");
            }
        });

        //修改提示
        var msgSuccess = zudp.util.render(obj.success, {"msg": "成功"});

        $(document).on("click", ".create-form #save-btn", function () {
            if(obj.saveForm!=undefined){
                obj.saveForm();
            }else{
                if ($(obj.formId).valid()) {
                    var data = zudp.util.formData2json("form");
                    console.info(data);
                    zudp.ajax(obj.url).post(data).then(function () {
                        zudp.plugin.dialog("success").alert("新建" + msgSuccess + "！", "提示");
                        dataTable.ajax.reload();
                        $(".modal-form").modal("hide");
                    });
                    obj.callback.create(data);
                }
            }

        });

        //弹窗
        var updateUrl ='';
        $(document).on("click", '.row-edit', function (e) {
            //清除冒泡
            if (e && e.stopPropagation) {
                e.stopPropagation();
            } else {
                window.e.cancelBubble = true;
            }
            $(".modal-form").modal("show");
            $(".modal-form").addClass("edit-form").removeClass("create-form detail-form");
            $(".edit-form").find("#save-btn").show();
            $(".edit-form").find(".my-i_context").show();
            zudp.plugin.form(obj.formId).reset();
            updateUrl = obj.url + '/' + $(this).val();
            //修改标题
            var titleText = zudp.util.render(obj.title, {"type": "编辑"});
            $(".modal .modal-title").text(titleText);
            //设置隐藏组件
            for (var i = 0; i < obj.hideInputName.length; i++) {
                $(".modal form").find("*[name=" + obj.hideInputName[i] + "]").parents('.form-group').css("display", 'none');
            }
            $(obj.formId).find("input[name='id']").eq(0).val($(this).val());
            if(obj.editBtnFun!=undefined){
                obj.editBtnFun();
            }else{
                //取值回显
                zudp.ajax(updateUrl).get("").then(function (data) {
                    dataEcho(obj.formId, data);

                }, function (error) {
                });
            }

            //设置禁用
            for (var i = 0; i < obj.disabledName.length; i++) {
                $(".modal form").find("*[name=" + obj.disabledName[i] + "]")
                        .attr("disabled", true);
                $("#calendar_btn").disabled=true;
            }
        });
        //详情
        $(document).on("click", '.row-detail', function (e) {
            //清除冒泡
            if (e && e.stopPropagation) {
                e.stopPropagation();
            } else {
                window.e.cancelBubble = true;
            }
            $(".modal-form").modal("show");
            $(".modal-form").addClass("detail-form").removeClass("create-form edit-form");
            $(".detail-form").find("#save-btn").hide();
            $(".detail-form").find(".my-i_context").hide();
            updateUrl = obj.url + '/' + $(this).val();
            //修改标题
            var titleText = zudp.util.render(obj.title, {"type": "详情"});
            $(".modal .modal-title").text("详情");
            //设置隐藏组件
            for (var i = 0; i < obj.hideInputName.length; i++) {
                $(".modal form").find("*[name=" + obj.hideInputName[i] + "]").parents('.form-group').css("display", 'none');
            }
            $(obj.formId).find("input[name='id']").eq(0).val($(this).val());
            if(obj.editBtnFun!=undefined){
                obj.editBtnFun();
            }else{
                //取值回显
                zudp.ajax(updateUrl).get("").then(function (data) {
                    dataEcho(obj.formId, data);

                }, function (error) {
                });
            }
            $(".modal form").find("*[name]").prop("disabled", true);
            //设置禁用
            for (var i = 0; i < obj.disabledName.length; i++) {
                $(".modal form").find("*[name=" + obj.disabledName[i] + "]")
                        .attr("disabled", true);
            }
            $(document).on("click",".detail-form .btn[data-dismiss='modal'], .close[data-dismiss='modal'] ",function () {
                $(".modal-form").find("#save-btn").show();
                $(".detail-form").find(".my-i_context").show();
                $(".modal-form *[name]").prop("disabled",false);
            })
        });
        //校验保存
        var msgSuccess = zudp.util.render(obj.success, {"msg": "成功"});
        $(document).on("click", ".edit-form #save-btn", function () {

            if(obj.saveForm!=undefined){
                obj.saveForm();
            }else{
                if ($(obj.formId).valid()) {
                    var data = zudp.util.formData2json("form");
                    zudp.ajax(updateUrl).put(data).then(function () {
                        zudp.plugin.dialog("success").alert("更新" + msgSuccess + "！", "提示");
                        dataTable.ajax.reload();
                        $(".modal-form").modal("hide");
                    });
                    obj.callback.update(data);
                }
            }

        });

        $(document).on("click", '.row-delete', function (e) {
            //清除冒泡
            if (e && e.stopPropagation) {
                e.stopPropagation();
            } else {
                window.e.cancelBubble = true;
            }
            var msgSuccess = zudp.util.render(obj.success, {"msg": "删除成功"});
            var msgError = zudp.util.render(obj.error, {"msg": "删除失败"});
            var rowData = dataTable.row($(this).parents('tr')).data();
            var deleteUrl = obj.url + '/' + $(this).val();
            zudp.plugin.dialog("warning").confirm("确认要删除吗？", "确认", function () {
                zudp.ajax(deleteUrl).del('').then(function (da) {
                    zudp.plugin.dialog("success").alert(msgSuccess + "!", "提示");
                    dataTable.ajax.reload();
                }, function (error) {
                    zudp.plugin.dialog("warning").alert(msgError + "!", "警告");
                    dataTable.ajax.reload();
                });
            });
            obj.callback.delete(rowData);
        });

        $(document).on("click", "#delete-items", function () {
            var data = dataTable.rows('.evenSelect').data();
            var ids = [];
            for (var k = 0; k < data.length; k++) {
                ids.push(data[k].id);
            }
            if (ids.length == 0) {
                zudp.plugin.dialog("warning").confirm("数据未选中", "关闭")
                return;
            }
            var msgSuccess = zudp.util.render(obj.success, {"msg": "批量删除成功"});
            var msgError = zudp.util.render(obj.error, {"msg": "批量删除失败"});
            zudp.plugin.dialog("warning").confirm("确认要删除吗？", "确认", function () {
                zudp.ajax(obj.url).del(JSON.stringify(ids)).then(function (da) {
                    zudp.plugin.dialog("success").alert(msgSuccess + "!", "提示");
                    dataTable.ajax.reload();
                }, function (error) {
                    zudp.plugin.dialog("warning").alert(msgError + "!", "警告");
                    dataTable.ajax.reload();
                });
            });
            obj.callback.deleteMore(data);
        });

        var searchDom=''
        var searchInput=''
        if (obj.search.length == 3) {
            searchDom=obj.search[1];
            searchInput=obj.search[2];
            zudp.plugin.clearFormData(obj.search[0], obj.search[1]);
        }
        $(document).on("click", ".research-btn", function () {
            dataTable.ajax.reload();
            //$(searchDom).slideUp(300);
        });
        $(document).on('keydown', function (event) {
            if (event.keyCode == 13) {
                dataTable.ajax.reload();
                $(searchDom).slideUp(300);
                return false;
            }
        });
        $(".my-querybtn "+searchInput).on('keyup change',function() {
            var value = $(".my-querybtn "+searchInput).val();
            $(searchDom+" "+searchInput).val(value);
        });
        $(searchDom+" "+searchInput).on('keyup change',function() {
            $(".my-querybtn "+searchInput).val($(searchDom+" "+searchInput).val());
        });
        $(document).on("click", '.select-query', function () {
            $(searchDom).slideToggle("fast", function () {
            });
        });
        var rowData = dataTable.row($(this).parents('tr')).data();
        // obj.callback.search(rowData);
    }

</script>
</body>
</html>
