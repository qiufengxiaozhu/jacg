<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>市民评论管理</title>
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
                            <#--<th>评论id</th>-->
                            <th>评论状态</th>
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

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label ">附件：</label>
                            <div class="col-sm-6" id="fj">

                            </div>
                        </div>

                        <#--评论存放位置-->
                        <div id="commentText">

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
    var urlstr="/api/comment";
    var formIdStr="#kind_form";
    var sys_url=window.location.host;
    $(document).ready(function () {




        findList();

        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}评论",
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
        zudp.ajax("/api/comment/"+id).get("").then(function (data){
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
        zudp.ajax("/api/comment/getFj?id="+id).get().then(function (value){
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
        $(".modal .modal-title").text("市民评论");
    };

    /**
     * 获取评论
     */
    function getComment(obj) {
        var id = $(obj).val();

        //保存
        // var temp=$("#commentText");
        //删除
        // var content=document.getElementsByClassName("tempText");
        // var i ;
        // for ( i = 0; i <content.length ; i++) {
        //
        //     content[i].remove();
        // }
        // alert("总共有"+i+"个评论")
        //恢复
        $("#commentText").empty();  //清空该div中的内容

        zudp.ajax("/api/comment/getComment?id="+id).get().then(function (value){

            var arr=value;
            for(var i=0;i<value.length;i++){
                var name=arr[i].name;
                var content=arr[i].content;
                var time=arr[i].publicTime;

                $("#commentText").append(
                    "<hr />"+
                    "<div class='form-group' id='tempText' >" +
                        "<label class='col-sm-3 control-label my-control-label '>"+"回 复 者 ："+"</label>"+
                        "<div class='col-sm-6'>"+
                            "<input type='text' maxlength='64' class='form-control' readonly value='"+name+"' id='textName' >"+
                        "</div>" +
                    "</div>"+

                    "<div class='form-group' id='tempText' >" +
                        "<label class='col-sm-3 control-label my-control-label '>"+"回复内容："+"</label>"+
                        "<div class='col-sm-6'>"+
                            "<input type='text' maxlength='64' class='form-control' readonly value='"+content+"' id='textContent'>"+
                        "</div>" +
                    "</div>"+

                    "<div class='form-group' id='tempText' >" +
                        "<label class='col-sm-3 control-label my-control-label '>"+"回复时间："+"</label>"+
                        "<div class='col-sm-6'>"+
                            "<input type='text' maxlength='64' class='form-control' readonly value='"+time+"' id='textTime'>"+
                        "</div>" +
                    "</div>"
                );

//                $("#textName").val(name);
//                $("#textContent").val(content);
//                $("#textTime").val(time);

            }



//            if (commentList!=null) {
//                for (var i = 0; i < commentList.length; i++) {
//
//                    var name = commentList.name[i];
//                    alert(name);
//
////                    $("#commentText").append(
////
////                        "<label class=\"col-sm-3 control-label my-control-label \">评论者：</label>\n" +
////                            "  <div class=\"col-sm-6\">\n" +
////                            "       <input  type=\"text\" name=\"replyUserId\" maxlength=\"64\" id=\"replyUserId\" value='value.get(i).name' class=\"form-control\" >\n" +
////                            "  </div>"
////                    )
//                }
//            }


        })


    }

    //列表数据初始化方法
    function findList() {

        var urls="/api/comment";
        dataTable=zudp.plugin.table('#post-list-table')
                .url(urls)
                .search(function () {
                    return {
                        "title":$("#search_name").val(),
                        "issueQuestionType":$("#category_select").val(),

                    }
                })
                .columns( [
                    {data: 'replyId', visible: false},
                    {data:'title'},
                    {data:'issueQuestionType'},/*问题类型*/
                    {data:'complainDate'},/*投诉时间*/
                    {data:'replyDate'},/*回复时间*/
                    {
                        render: function (data, type, row) {
                                if(data.replyStatus == '0' ){ // 未回复
                                        return "未回复";
                                }else{ // 已回复
                                    return "已回复";
                                }
                        }
                    },
//                    {data:'id'},
//                    {data:'commentType'},
                    {
                        render: function (data, type, row) {
                            if(data.commentType == null){ //未评论
                                return "未评论";
                            }else{ // 已评论
                                return "已评论";
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
                            editstr='<button class="btn btn-info btn-sm " <i class="fa fa-pencil"></i>未评论</button>&nbsp;&nbsp;&nbsp;';
                           // 详情
                            detailStr='<button onclick="img2(this),getComment(this)" class="btn btn-success btn-sm row-detail" value="{replyId}"><i class="fa fa-pencil"></i>详情</button>';

                            // btn += editstr+detailStr;
                            btn02 += detailStr;
                            // if(data.commentType == null){ // 未评论
                            //     return zudp.util.render(btn, row);
                            // }else{ // 已评论
                                return zudp.util.render(btn02, row);
                            // }

                        }
                    }
                ])
                .then();

    }

</script>
</body>
</html>
