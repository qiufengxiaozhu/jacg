<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>种类管理</title>
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
                        <#--<@hasPermission name="oaManager:post:create">
                            <button class='btn btn-success' data-toggle='modal'  id="add-btn" onclick="hidden1(),typescenter()">
                                新建
                            </button>&nbsp;&nbsp;
                        </@hasPermission>-->
                        <#--<@hasPermission name="oaManager:post:batchDelete">
                            <button class='btn btn-success btn-danger' id="delete-items">
                                批量删除
                            </button>
                        </@hasPermission>-->
                        <div  class='querybtn my-querybtn '>
                            <#--<input type="text" maxlength="255" name="serch"  placeholder="标题" class="form-control search-input">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="text" maxlength="255" name="telephone" id="telephone_select" placeholder="联系电话" class="form-control search-input">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="text" maxlength="255" name="name" id="name_select" placeholder="联系人" class="form-control search-input">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="text" maxlength="255" name="startDate" id="startDate_select" onfocus="this.blur()" startDate  placeholder="查询回复开始时间(起)" class="form-control search-input ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="text" maxlength="255" name="endDate" id="endDate_select" endDate  placeholder="查询回复时间(止)" class="form-control search-input ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->
                            <input type='text' name='search' id='search_name' placeholder='标题' class='form-control search-input'>
                            <button class='btn btn-primary mgl my-mgl research-btn' >搜索</button>
                            <#--<button class="btn btn-primary mgl my-mgl clear-input" >清空</button>-->
                            <button class="btn btn-primary select-query"  >高级搜索</button>
                        </div>
                    </div>

                   <div id='search' class='search-group' style='display:none;'>
                        <div class="form-group z-group">
                            <div class="col-sm-12 z-group-pane">
                                <label class="control-label my-control-label">标题：</label>
                                <input type="text" maxlength="255" name="title" id="title_select" placeholder="联系电话" class="form-control search-input">
                            </div>
                        </div>

                        <div class="form-group z-group">
                            <div class="col-sm-12 z-group-pane">
                                <label class="control-label my-control-label">联系电话：</label>
                                <input type="text" maxlength="255" name="telephone" id="telephone_select" placeholder="联系电话" class="form-control ">
                            </div>
                        </div>

                        <div class="form-group z-group">
                            <div class="col-sm-12 z-group-pane">
                                <label class="control-label my-control-label">联系人：</label>
                                <input type="text" maxlength="255" name="name" id="name_select" placeholder="联系人" class="form-control ">
                            </div>
                        </div>

                        <div class="form-group z-group">
                            <div class="col-sm-12 z-group-pane">
                                <label class="control-label my-control-label">开始时间：</label>
                                <input type="text" maxlength="255" name="startDate" id="startDate_select" onfocus="this.blur()" startDate  placeholder="开始时间" class="form-control  ">
                            </div>
                        </div>

                        <div class="form-group z-group">
                            <div class="col-sm-12 z-group-pane">
                                <label class="control-label my-control-label">结束时间：</label>
                                <input type="text" maxlength="255" name="endDate" id="endDate_select" endDate  placeholder="结束时间" class="form-control  ">
                            </div>
                        </div>
                    <button class="btn btn-danger mgl my-mgl clear-input" >清空</button>&nbsp;&nbsp;
                    </div>

                    <table id="post-list-table" class="table my-table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>标题</th>
                            <th>咨询时间</th>
                            <th>回复时间</th>
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
                            <label class="col-sm-3 control-label my-control-label ">联系人：</label>
                            <div class="col-sm-6">
                                <input  type="text" name="name" maxlength="64" id="name" placeholder="咨询人姓名" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">联系电话：</label>
                            <div class="col-sm-6">
                                <input  type="text" name="telephone" maxlength="64" id="telephone" placeholder="咨询人电话" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">标题：</label>
                            <div class="col-sm-6">
                                <input  type="text" name="title" maxlength="64" id="title" placeholder="咨询人电话" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">咨询内容：</label>
                            <div class="col-sm-6">
                                <textarea placeholder="咨询内容" class="form-control" rows="2" cols="" name="content" id="content"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">咨询时间：</label>
                            <div class="col-sm-6">
                                <input  type="text" name="consultDate" maxlength="64" id="consultDate" placeholder="咨询人电话" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">回复内容：</label>
                            <div class="col-sm-6">
                                <textarea placeholder="回复内容" class="form-control" rows="2" cols="" name="reply" id="reply"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">回复时间：</label>
                            <div class="col-sm-6">
                                <input  type="text" name="replyDate" maxlength="64" id="replyDate" placeholder="回复时间" class="form-control">
                            </div>
                        </div>



                        <#--<div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">咨询种类：</label>
                            <div class="col-sm-6">
                                <select class="form-control" id="categoryId" name="categoryId">

                                </select>
                            </div>
                        </div>-->

                        <div class="form-group">
                            <div class="col-sm-6">
                                <a href="" class="col-sm-3 control-label my-control-label " id="picture" name="picture" target="_blank" >附件图片</a>
                            </div>
                        </div>

                       <div class="form-group">
                            <div class="col-sm-6">
                                <a href="" class="col-sm-3 control-label my-control-label " id="voice" name="voice" target="_blank" >附件语音</a>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-6">
                                <a href="" class="col-sm-3 control-label my-control-label " id="video" name="video" target="_blank" >附件视频</a>
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
    var urlstr="/api/consult";
    var formIdStr="#kind_form";
    var sys_url=window.location.host;
    var startDate = new Date();
    $(document).ready(function () {




        findList();

        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}咨询",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value'],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"]

        };
        //初始化增删改查参数
        //dataTable = zudp.component.initCURD(obj);
        //initForm(obj);

        initForm(obj);




    });
    function hiddensave(obj){
        var id=$(obj).val();
        zudp.ajax("/api/consult/"+id).get("").then(function (data){
        if(data.reply!=null && data.reply!=""){
              $("#save-btn").hide();
            }else {
                $("#save-btn").show();
            }
        })
       /* $.ajax({
            type:"get",
            url:"/api/consult/"+id,
            success:function(data){
                alert(data);
                if(data.reply!=null && data.reply!=""){
                    $("#save-btn").hide();
                }else {
                    $("#save-btn").show();
                }
            }
        })*/
    }

    function hidden1() {
        $(".modal form").find("#picture").hide();
        $(".modal form").find("#voice").hide();
        $(".modal form").find("#video").hide();
        $(".modal form").find("[name='name'],[name='telephone'],[name='content']").attr("disabled",false);
    }

    function show1() {
        $(".modal form").find("#picture").show();
        $(".modal form").find("#voice").show();
        $(".modal form").find("#video").show();

        $(".modal form").find("[name='name'],[name='telephone'],[name='content'],[name='consultDate'],[name='replyDate'],[name='title']").attr("disabled",true);
    }



   function img(obj){
       var id=$(obj).val();
        zudp.ajax("/api/consult/"+id).get().then(function (value){
     if (value.picture==null || value.picture=='') {
         //$("#picture").attr("href","javascript:void(0);");
         //$("#picture").removeAttr("href");
             $("#picture").prop("href", "#");
             $("#picture").click(function (event) {
             // 如果<a>定义了 target="_blank" 需要这句来阻止打开新页面
             event.preventDefault();
         });}else {
         $("#picture").attr("href",value.picture);
         }

      if (value.voice==null || value.voice=='')  {
          $("#voice").prop("href", "#");
          $("#voice").click(function (event) {
              event.preventDefault();
          });
      }else{
          $("#voice").attr("href",value.voice);
      }


        if (value.video==null || value.video=='')  {
            $("#video").prop("href", "#");
            $("#video").click(function (event) {
                event.preventDefault();
            });
        }else{
            $("#video").attr("href",value.video);
        }
    });
    }

    function replytitle(){
        $(".modal .modal-title").text("回复咨询");
    }

    //时间格式转换
    function formatDate(date) {
        if (date == null) return "";
        date = new Date(date);
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
        var h=(date.getHours()< 10 ?'0'+(date.getHours()):date.getHours())+":";//获取时
        var m=(date.getMinutes()<10?'0'+(date.getMinutes()):date.getMinutes())+":";//获取分
        var s=(date.getSeconds()<10?'0'+(date.getSeconds()):date.getSeconds());//获取秒
        return Y + M + D + h + m + s ;
    };

    //种类下拉框
    function typescenter(obj) {
        var ca=$(obj).parent().prev().prev().html();
        //$("#categoryId").find("option").remove();
        $("#categoryId").html("");
        zudp.ajax("/api/consultCategory/clist").get().then(function (value) {

            $("#categoryId").append("<option value='"+ "'>"+ "全部"+"</option>");
            for (var k = 0; k < value.length; k++) {

                if (value[k].name == null) {
                    value[k].name = "";
                }else{
                    if (value[k].name==ca) {
                        $("#categoryId").append("<option selected='selected' value='"+ value[k].id+"'>"+ value[k].name+"</option>");
                    }else{
                        $("#categoryId").append("<option value='"+ value[k].id+"'>"+ value[k].name+"</option>");
                    }
                }
            }


            //  gettypemin();
        }, function (reason) {
            zudp.plugin.dialog("error").alert("获取用户列表失败！", "提示");
        });
    }




    //列表数据初始化方法
    function findList() {

        var urls="/api/consult";
        dataTable=zudp.plugin.table('#post-list-table')
            .url(urls)
            .search(function () {
                return {
                    "title":$("#title_select").val(),
                    "name":$("#name_select").val(),
                    "telephone":$("#telephone_select").val(),
                    "startDate":$("#startDate_select").val(),
                    "endDate":$("#endDate_select").val()
                }
            })
            .columns( [
                {data: 'id', visible: false},
                {data:'title'},
                {data:'consultDate',
                    render: function (data, type, row) {
                        if (data != null && data != '') {
                            return formatDate(data);
                        } else {
                            return "";
                        }

                    }},
                {data:'replyDate',
                    render: function (data, type, row) {
                        if (data != null && data != '') {
                            return formatDate(data);
                        } else {
                            return "";
                        }

                    }},
                /*{data: 'name'},

                {data: 'telephone'},

                {data: 'content',render:function(data, type, row){
                        var suf="...";
                        if(data!=null && data.length<20){
                            suf="";
                        }
                        /!*if(data!=null){
                            data=data.substr(0,20);
                        }*!/
                        var ah="<a title='"+data+"'>"+data.substr(0,20);+suf+"</a>";
                        return ah;
                    }

                },

                {data: 'category.name'},

                {data: 'reply',render:function(data, type, row){
                        var suf="...";
                        if(data!=null && data.length<20){
                            suf="";
                        }
                        /!*if(data!=null){
                            data=data.substr(0,20)
                        }*!/
                        var ah="<a title='"+data+"'>"+data.substr(0,20)+suf+"</a>";
                        return ah;
                    }

                },*/

                {
                    render: function (data, type, row) {
                        var btn = "";
                        var editstr="";
                        var  delstr="";
                       <#--<@hasPermission name="oaManager:post:update">
                        editstr=zudp.template.editBtn;
                        </@hasPermission>-->
                        editstr='<button onclick="show1(),hiddensave(this),img(this),replytitle()"  class="btn btn-info btn-sm row-edit updateOpBtn" value="{id}"><i class="fa fa-pencil"></i>回复</button>&nbsp;&nbsp;&nbsp;';

                        <#--<@hasPermission name="oaManager:post:delete">
                        delstr=zudp.template.delBtn;
                        </@hasPermission>-->

                       var detailStr='<button onclick="img(this)"  class="btn btn-success btn-sm row-detail" value="{id}"><i class="fa fa-pencil"></i>详情</button>';


                        btn += editstr+detailStr;
                        return zudp.util.render(btn, row);
                        //return "";
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
