<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>问题答复管理</title>
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

                        <div  class='querybtn my-querybtn '>
                            问题标题：
                            <input type='text' name='search' id='search_name' placeholder='标题' class='form-control search-input'>&nbsp;&nbsp;&nbsp;&nbsp;
                            问题类型：
                            <select id="category_select" name="issueQuestionType" class='form-control search-input'>
                                <option value="">全部</option>
                                <option value="垃圾">垃圾</option>
                                <option value="广告乱贴">广告乱贴</option>
                                <option value="摊位乱摆">摊位乱摆</option>
                                <option value="车辆乱停">车辆乱停</option>
                                <option value="工地乱象">工地乱象</option>
                                <option value="河道乱污">河道乱污</option>
                                <option value="违法构筑乱">违法构筑乱</option>
                            </select>
                            <button class='btn btn-primary mgl my-mgl research-btn' >搜索</button>
                        </div>
                    </div>


                    <table id="post-list-table" class="table my-table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>标题</th>
                            <th>问题类型</th>
                            <th>上报时间</th>
                            <th>回复时间</th>
                            <th>回复状态</th>
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
                    <form class="form-horizontal" id="kind_form">
                        <input type="hidden" name="id" id="id">


                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">标题：</label>
                            <div class="col-sm-6">
                                <input  type="text" name="title" maxlength="64" id="title"  class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">问题内容描述：</label>
                            <div class="col-sm-6">
                                <textarea  class="form-control" rows="2" cols="" name="description" id="description"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">问题类型：</label>
                            <div class="col-sm-6">
                                <input  type="text" name="issueQuestionType" maxlength="64" id="issueQuestionType"  class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">联系人：</label>
                            <div class="col-sm-6">
                                <input  type="text" name="contact" maxlength="64" id="contact" placeholder="联系人" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">联系电话：</label>
                            <div class="col-sm-6">
                                <input  type="text" name="phone" maxlength="64" id="phone" placeholder="联系电话" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">上报时间：</label>
                            <div class="col-sm-6">
                                <input  type="text" name="complainDate" maxlength="64" id="complainDate" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">上报地点：</label>
                            <div class="col-sm-6">
                                <textarea  class="form-control" rows="2" cols="" name="address" id="address" value="吉安市某处"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">回复内容：</label>
                            <div class="col-sm-6">
                                <textarea placeholder="回复内容" class="form-control" rows="2" cols="" name="replyContent" id="replyContent"></textarea>
                            </div>
                        </div>

                        <div class="form-group" id ="replyDateId">
                            <label class="col-sm-3 control-label my-control-label ">回复时间：</label>
                            <div class="col-sm-6">
                                <input  type="text" name="replyDate" maxlength="64" id="replyDate" placeholder="回复时间" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">回复人：</label>
                            <div class="col-sm-6">
                                <input  type="text" name="replyUserId" maxlength="64" id="replyUserId" placeholder="回复人" class="form-control" >
                            </div>
                        </div>

                        <#--<div class="form-group">-->
                            <#--<label class="col-sm-3 control-label my-control-label ">回复单位：</label>-->
                            <#--<div class="col-sm-6">-->
                                <#--<input  type="text" name="replyDate" maxlength="64" id="replyDate" placeholder="回复单位" class="form-control" value="吉安城管办事处">-->
                            <#--</div>-->
                        <#--</div>-->




                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">附件：</label>
                            <div class="col-sm-6" id="fj">

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
<script src="/js/pluginInit/laydateInit.js"></script>
<script>

    var dataTable;
    var urlstr="/api/issueReply";
    var formIdStr="#kind_form";
    var sys_url=window.location.host;
//    var startDate = new Date();
    $(document).ready(function () {




        findList();

        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "回复",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value'],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"]

        };




        initForm(obj);




    });
    function hiddensave(obj){
        var id=$(obj).val();
        zudp.ajax("/api/report/"+id).get("").then(function (data){
            if(data.reply!=null && data.reply!=""){
                $("#save-btn").hide();
            }else {
                $("#save-btn").show();
            }
        })
    };


    function img2(obj){
        // 获取到按钮的id 记录的id
        var id=$(obj).val();
//        alert(id);
        $("#fj").html("");
        zudp.ajax("/api/issueReply/getFj?id="+id).get().then(function (value){
            var fjpath = value.attachPaths;
            var fjname=value.attachNames;
            if (value!=null) {
                for (var i = 0; i < (value.attachPaths).length; i++) {
                    $("#fj").append(
                            "<a href='//" + sys_url + "/" + fjpath[i] + "'  download='" + fjname[i] + "'>" + fjname[i]+ "</a>" + "<br>"
                    )
                }
            }
        })
    };

    function hidden1() {
        $(".modal form").find("[name='name'],[name='telephone'],[name='content']").attr("disabled",false);
    };

    function show1() {
        $(".modal form").find("[name='contact'],[name='phone'],[name='replyContent'],[name='consultDate'],[name='replyDate'],[name='title'],[name='address'],[name='issueQuestionType'],[name='description'],[name='complainDate']").attr("disabled",true);
        $(".modal form").find("[name='replyContent'],[name='replyUserId']").attr("disabled",false);
        // 隐藏回复时间输入框
        $("#replyDateId").hide();
    };



    function replytitle(){
        $(".modal .modal-title").text("回复咨询");
    };

    //时间格式转换
//    function formatDate(date) {
//        if (date == null) return "";
//        date = new Date(date);
//        var Y = date.getFullYear() + '-';
//        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
//        var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
//        var h=(date.getHours()< 10 ?'0'+(date.getHours()):date.getHours())+":";//获取时
//        var m=(date.getMinutes()<10?'0'+(date.getMinutes()):date.getMinutes())+":";//获取分
//        var s=(date.getSeconds()<10?'0'+(date.getSeconds()):date.getSeconds());//获取秒
//        return Y + M + D + h + m + s ;
//    };

    //种类下拉框
//    function typescenter(obj) {
//        var ca=$(obj).parent().prev().prev().html();
//        //$("#categoryId").find("option").remove();
//        $("#categoryId").html("");
//        zudp.ajax("/api/consultCategory/clist").get().then(function (value) {
//
//            $("#categoryId").append("<option value='"+ "'>"+ "全部"+"</option>");
//            for (var k = 0; k < value.length; k++) {
//
//                if (value[k].name == null) {
//                    value[k].name = "";
//                }else{
//                    if (value[k].name==ca) {
//                        $("#categoryId").append("<option selected='selected' value='"+ value[k].id+"'>"+ value[k].name+"</option>");
//                    }else{
//                        $("#categoryId").append("<option value='"+ value[k].id+"'>"+ value[k].name+"</option>");
//                    }
//                }
//            }
//
//
//            //  gettypemin();
//        }, function (reason) {
//            zudp.plugin.dialog("error").alert("获取用户列表失败！", "提示");
//        });
//    }


    //列表数据初始化方法
    function findList() {

        var urls="/api/issueReply";
        dataTable=zudp.plugin.table('#post-list-table')
                .url(urls)
                .search(function () {
                    return {
                        "title":$("#search_name").val(),
                        "issueQuestionType":$("#category_select").val(),

                    }
                })
                .columns( [
                    {data: 'id', visible: false},
                    {data:'title'},
                    {data:'issueQuestionType'},/*问题类型*/
                    {data:'complainDate'},/*投诉时间*/
                    {data:'replyDate'},/*回复时间*/
//                    {data:'replyStatus'},/*回复状态*/
                    {
                        render: function (data, type, row) {
                                if(data.replyStatus == '0'){ // 未回复
                                        return "未回复";
                                }else{ // 已回复
                                    return "已回复";
                                }
                        }
                    },
                    {
                        render: function (data, type, row) {
                            var btn = "";
                            var btn02 = "";
                            var editstr="";
                            var  detailStr="";

                            // 编辑(回复)
                            editstr='<button onclick="show1(),img2(this),hiddensave(this)"  class="btn btn-info btn-sm row-edit updateOpBtn" value="{id}"><i class="fa fa-pencil"></i>回复</button>&nbsp;&nbsp;&nbsp;';
                           // 详情
                            detailStr='<button onclick="img2(this)" class="btn btn-success btn-sm row-detail" value="{id}"><i class="fa fa-pencil"></i>详情</button>';

                            btn += editstr+detailStr;
                            btn02 += detailStr;
                            if(data.replyStatus == '0'){ // 未回复
                                return zudp.util.render(btn, row);
                            }else{ // 已回复
                                return zudp.util.render(btn02, row);
                            }

                        }
                    }
                ])
                .then();

    }



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
            //;
            var name = file.name;
            var fileurl = response.data;
            $("#fileShowName").append("<p><a href='//"+sys_url+"/"+fileurl+"' download='"+name+"'>"+name+"</a><input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;<span style='color:red' onclick='deleteFile(this)'>删除</span><input type='hidden' name='attachPath' value='"+fileurl+"'><input type='hidden' name='attachName' value='"+name+"'>	</p>");

            //change(response);
        });
    }

</script>
</body>
</html>
