<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>问卷调查管理</title>
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
                    <@hasPermission name="oaManager:riverManager:river:create">
                    <button onclick='getAllType()' class='btn btn-success' data-toggle='modal' id="add-btn">
                    新建
                    </button>&nbsp;&nbsp;
                    </@hasPermission>

                    <@hasPermission name="oaManager:riverManager:river:batchDelete">
                    <button class='btn btn-success btn-danger' id="delete-items">
                    批量删除
                    </button>
                    </@hasPermission>

                    <#--搜索条件(用于模糊查询)  名称 标题 上报人  -->
                        <div class='querybtn my-querybtn'>
                            <input type='text' name='name' id='search_name' placeholder='请输入问卷名称' class='form-control search-input'>


                            <input type="text" name="startTime" id="startTime" startDate placeholder="发布开始时间" class="form-control">
                            <input type="text" name="endTime" id="endTime" endDate placeholder="发布结束时间" class="form-control">

                            <button class='btn btn-primary mgl my-mgl research-btn' >
                                搜索
                            </button>&nbsp;&nbsp;

                        </div>
                    </div>
                    <div id='search' class='search-group' style='display:none;'>


                    </div>
                    <table id="list-table" class="table my-table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>问卷名称</th>
                            <th>问卷描述</th>
                            <th>问卷发布时间</th>
                            <th>问卷有效期</th>
                            <th>问卷类型</th>
                            <th>问卷状态</th>
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




<#--以下是模态框  新建问卷-->
<div class="modal inmodal fade modal-form" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">添加</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body fix-height" style="height: 350px" id ="myForm">
                <#--表单-->
                    <form class="form-horizontal" id="post_form">
                        <input type="hidden" name="id" id="id" value="id" class = "testId002">

                        <div class="form-group" id ="nameDiv">
                            <label class="col-sm-3 control-label my-control-label id= "qname" ">问卷名称：</label>
                            <div class="col-sm-6">
                                <input id="title" type="text" name="title" maxlength="64" placeholder="问卷名称" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context " id = "label">*</i>
                            </div>
                        </div>

                        <div class="form-group" id = "descDiv">
                            <label class="col-sm-3 control-label my-control-label ">问卷描述：</label>
                            <div class="col-sm-6">
                                <input id="description" type="text" name="description" maxlength="64" placeholder="问卷描述" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>



                        <div class="form-group" id = "validDiv">
                            <label class="col-sm-3 control-label my-control-label ">问卷有效期：</label>
                            <div class="col-sm-6">
                                <input type="text" name="valid" id="valid" startDate placeholder="问卷有效期" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group" id = "statusDiv">
                            <label class="col-sm-3 control-label my-control-label ">问卷状态：</label>
                            <div class="col-sm-6">
                                <input id="status" type="text" name="status" maxlength="64" placeholder="问卷状态" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group" id = "timeDiv">
                            <label class="col-sm-3 control-label my-control-label ">问卷发布时间：</label>
                            <div class="col-sm-6" id ="timeDiv">
                                <input id="pubdate" type="text" name="pubdate" maxlength="64" placeholder="问卷发布时间" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>


                        <div class="form-group" id = "typeDiv">
                            <label class="col-sm-3 control-label my-control-label ">问卷类型：</label>
                            <div class="col-sm-6">
                                <select id="category" name="queinvestType" class="form-control"><select>
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>


                    </form>
                </div>

                <div class="modal-footer">
                <#--<input type="hidden" id="add-type">-->
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

<#--往问卷中添加题目 模态框-->
<div class="modal inmodal fade modal-form-content" id="my" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
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
                    <input type="hidden" id="add-type" class ="test001">
                    <table id="dataList" class="table my-table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th ># </th>
                            <th >题目名称</th>
                            <th >题目类型</th>
                        </tr>
                        <thead>
                </div>

                <div class="modal-footer">

                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="test-save-btn">保存</button>
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

    var queId;
    var dataTable;
    var urlstr="/api/queinvest";
    var formIdStr="#post_form";
    var sys_url=window.location.host;
    $(document).ready(function () {

        // 新建  验证
        $("#post_form").validate({
            rules: {
                // 必填项
                title: "required",
                description: "required",
                queinvestType: "required",
                valid: "required"
            },

                // 提示信息
            messages: {
                title: {
                    required: "请输入问卷名称",
                    remote: "问卷名称已存在"
                },
                description: "请输入问卷描述信息",
                queinvestType: "请选择问卷类型",
                valid: "请选择问卷有效期"
            }
        });

        findList();

        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}问卷",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value'],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"]

        };
        //初始化增删改查参数
        initForm(obj);
//        dataTable = zudp.component.initCURD(obj);

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

        var urls="/api/queinvest";
        dataTable=zudp.plugin.table('#list-table')
                .url(urls)
                .search(function () {
                    return {
                        //模糊查询的返回结果
                        "title":$("#search_name").val(),
                        "startTime" :$("#startTime").val(),
                        "endTime" :$("#endTime").val()
                    }
                })
                .columns( [
                    // 名称  描述
                    {data:'id', visible: false},
                    {data:'title'},
                    {data:'description'},
                    {
                        render: function (data, type, row) {
                            if (data.status == '2') {// 发布状态
                                return data.pubdate;
                            } else { //未发布
                                return "无";
                            }

                        }

                    },
//                    {data:'valid'},
                    {
                        data: 'valid', width: '11%',
                        render: function (data, type, row) {
                            if (data != null && data != '') {
                                return formatDate(data);
                            } else {
                                return "";
                            }

                        }
                    },
                    {data:'queinvestType'},




        {
                        render: function (data, type, row) {
                            if (data.status == '0') {// 未发布
                                return "未发布";
                            } else if (data.status == '1') { //未发布
                                return "未发布";
                            } else if (data.status == '2') { //已发布
                                return "已发布";
                            }

                        }

                        },

                    { // 操作 按钮
                        render: function (data, type, row) {
                            var btn = "";
                            var editStr="";
                            var delStr="";
                            var addStr="";
                            var overviewStr="";
                            var publicStr="";
                            var unpublicStr="";
                            // 判断状态来实现对按钮的隐藏和显示
                            if(data.status == '0' || data.status == '1'){// 临时状态 未发布状态
                                // 编辑
                                editStr= '<button onclick="getAllType(this)" class="btn btn-info btn-sm row-edit updateOpBtn" value="{id}"><i class="fa fa-pencil"></i>编辑</button>';
                                // 详情
//                                    detailStr= zudp.template.detailBtn;
                                detailStr = '<button onclick="getAllType(this)" class="btn btn-info btn-sm row-detail" value="{id}"><i class="fa fa-pencil"></i>详情</button>';

                                        // 删除
                                delStr=zudp.template.delBtn;
                                //添加题目
                                addStr='<button id="addStr" class="btn btn-success btn-sm " data-toggle="modal_hjm" value="{id}"><i class="fa fa-pencil"></i>添加题目</button>';
                                // 发布
                                publicStr= '<button id= "publishStr" class="btn btn-info btn-sm "  value="{id}"><i class="fa fa-pencil"></i>发布</button>';
                                // 预览
//                                overviewStr='<button id="overview" class="btn btn-info btn-sm " data-toggle="modal_overview" onclick="overview()" value="{id}"><i class="fa fa-pencil"></i>预览</button>';
                                    // 编辑   删除   添加题目  预览     发布
                                btn+=editStr+ "&nbsp;"+delStr + "&nbsp;"+addStr + "&nbsp;"+overviewStr + "&nbsp;"+publicStr +"&nbsp;"+detailStr ;
                                return zudp.util.render(btn, row);
                            }else { // 发布状态
                                // 预览
//                                overviewStr='<button class="btn btn-info btn-sm " data-toggle="modal_overview" onclick="overview()" value="{id}"><i class="fa fa-pencil"></i>预览</button>';
                                // 撤销发布
                                unpublicStr= '<button id= "unpublishStr" class="btn btn-danger btn-sm "  value="{id}"><i class="fa fa-pencil"></i>撤销发布</button>';
                                // 详情
//                                detailStr= zudp.template.detailBtn;
                                detailStr = '<button onclick="getAllType(this)" class="btn btn-info btn-sm row-detail" value="{id}"><i class="fa fa-pencil"></i>详情</button>';

                                // 预览        撤销发布
                                btn+= overviewStr + "&nbsp;"+ unpublicStr + "&nbsp;"+ detailStr;
                                return zudp.util.render(btn, row);

                            }


                            }

                        }

                ])
                .then();

    }



    // 获取问卷类型的下拉框
    function getAllType(obj) {
        // 获取到问卷类型
        var str = $(obj).parent().prev().prev().text();
        // 本条记录的id值
        var idstr = $(obj).val();

        var typeId = "";

        if (str != "") {
            // 查询单个
            zudp.ajax("/api/queinvest/getOneType?id=" + idstr).get().then(function (value) {
                typeId = value.queinvestType;
            });
        }
        // 下拉的id -->categor
        $("#category").find("option").remove();
        zudp.ajax("/api/queinvest/getAllType").get().then(function (value) {

//           $("#department").append("<option value='" + "'>" + "全部" + "</option>");
            for (var k = 0; k < value.length; k++) {

                if (value[k].label  == null) {
                    value[k].label = "";
                }else{
                    if (typeId != "") {
                        if (value[k].value == typeId) {
                            $("#category").append("<option value='" + value[k].value + "' selected='selected'>" + value[k].label+ "</option>");
                        } else {
                            $("#category").append("<option value='" + value[k].value+ "'>" + value[k].label  + "</option>");
                        }
                    } else {
                        $("#category").append("<option value='" + value[k].value+ "'>" + value[k].label  + "</option>");
                    }
                }
            }
        },function (reason) {
            zudp.plugin.dialog("error").alert("获取用户列表失败！", "提示");
        });
    };

    //添加题目到问卷中       弹出可以选择题目的页面
    $(document).on("click", '#addStr', function (e) {

        // 获取到问卷的id
        queId =  $(this).val();
        //清除冒泡
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }
//        var id = $("#row-add-test").val();
        $("#dataList").empty();
        // 模态框的弹出
        $(".modal-form-content").modal("show");

//        var titleText = zudp.util.render(obj.title, {"type": "添加题目"});
        $(".modal .modal-title").text("添加题目");
//

        // 查询出所有的题目
        zudp.ajax("/api/queinvest/addQuestion").post().then(function (value) {

//
            //获取到table
            // 获取到所有的题目id值
            var table = $("#dataList");//获取需要显示数据的table
            for(var i=0;i<value.length ;i++){ //遍历数据
                table.append(
                        "<tr>"+
                        '<td>'+'<input id="selall" type="checkbox" name ="checkBtn" class= "myChecked"  />' + '</td>'+
                        "<td>"+value[i].contents+"</td>" +
                        "<td>"+value[i].label+"</td>"
                        +"<tr/>");
            }

            // 在模态框中，点击添加按钮，完成题目的导入，其实就是修改外键的值为问卷的id匹配上
            $(document).on("click", '#test-save-btn', function (e) { // 模态框中的保存按钮
                var idJson = queId; // 获取到id值  问卷的id值
                alert("问卷id"+idJson);
                // 遍历所有的复选框
                var checks = document.getElementsByName("checkBtn");
                // 所有被选中的复选框的对应的问题的id值
//                var idsJson = [];
                var idsJson = [];
                for(var m = 0; m < value.length; m++){
                    if(checks[m].checked){ //如果被选中
                        // 往数组中添加被选中的问题的id值
                        idsJson.push(value[m].id);
                    }

                }
                var dataObject = {
                    "idsJson":idsJson,
                    "idJson":idJson
                };

                dataJson = JSON.stringify(dataObject);

//
                //将id值传入到后端  实现问卷中添加题目的效果
                zudp.ajax("/api/queinvest/updateQuestion").post(dataJson).then(function (value) {
                    // 关闭模态框
                    $(".modal-form-content").modal("hide");
                });



            });

        });


    });

    // 发布  改变状态为发布状态
    $(document).on("click", '#publishStr', function (e) {

        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }
        //获取到id
        var id = $(this).val();
//        alert(id);
        console.log(id);

        zudp.ajax("/api/queinvest/updateStatus").post(id).then(function (value) {
            // 刷新页面
//            document.location.reload();
            dataTable.ajax.reload();
        });
    });

    // 撤销发布
    $(document).on("click", '#unpublishStr', function (e) {

        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }
        //获取到id
        var id = $(this).val();
        console.log(id);


        zudp.ajax("/api/queinvest/updateStatus02").post(id).then(function (value) {
//            document.location.reload();
            dataTable.ajax.reload();
        });
    });

    // 隐藏
    $(document).on("click", '#add-btn', function () {

        $("#timeDiv").css("display","none");	//隐藏时间
        $("#statusDiv").css("display","none");	//隐藏状态

    });

    // 隐藏
    $(document).on("click", '.row-edit', function () {

        $("#timeDiv").css("display","none");	//隐藏时间
        $("#statusDiv").css("display","none");	//隐藏状态

    });
    // 隐藏
    $(document).on("click", '.row-detail', function () {

        $("#timeDiv").css("display","block");	//出现时间
        $("#statusDiv").css("display","block");	//出现状态

    });

// 转换时间
    function formatDate(date) {
        if (date == null) return "";
        date = new Date(date);
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
        return Y + M + D;
    };


     // 初始化上传
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
