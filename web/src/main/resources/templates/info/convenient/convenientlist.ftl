<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>便民服务</title>
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

        /*滚动条的设置*/
        ::-webkit-scrollbar-thumb {
            background-color:#dddddd;
        }

        /*去掉百度地图标志*/
        .BMap_cpyCtrl {
            display: none;
        }

        .anchorBL {
            display: none;
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

                <#--测试-->
                <div class="ibox float-e-margins">
                    <div class="ibox-content clearfix">
                        <div class="left_role group-left_role">
                            <div class="col-md-12 sidebar">

                                <h4 style="text-indent: 0.5em;    margin: 8px 0;">类型列表</h4>
                                <ul id="clunmcon" class="folder-list role-folder-list" style="padding: 0; margin-bottom:0px;overflow: auto;">
                                    <#list ListType! as list >
                                        <li class="channe-i role_li_check_background" onclick="nodeClick('${list.id!""}')">
                                            ${list.label!""}
                                        </li>
                                    </#list>
                                </ul>
                            </div>
                        </div>


                <div class="right_role_detail group-right_role_detail">
                    <div class="form-inline ">

                        <div class="ibox-content form-inline z-relative">
                            <div class='col-sm-12'>
                            <@hasPermission name="oaManager:post:create">
                                <button class='btn btn-success'  data-toggle='modal' id="add-btn" >
                                    新建
                                </button>&nbsp;&nbsp;
                            </@hasPermission>
                            <@hasPermission name="oaManager:post:batchDelete">
                                <button class='btn btn-success btn-danger' id="delete-items">
                                    批量删除
                                </button>
                            </@hasPermission>
                                <div class='querybtn my-querybtn'>
                                    <input id="categoryId_hidden_select" type="hidden">
                                    <#--<select id="category" name="fk_categoryid" class="form-control input-sm">-->
                                    <#--<option value=" ">选择类别</option>-->

                                    <#--</select>-->
                                    <input type='text' name='search' id='search_name' placeholder='请输入名称' class='form-control search-input'>
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
                                    <th>名称</th>
                                    <th>位置</th>
                                    <th>描述</th>
                                    <#--<th>类别</th>-->
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

                        <!-- 附件上传 隐藏传值  开始 -->
                        <input id="attachIdss" type="hidden" />
                        <!-- 附件上传 隐藏传值  结束 -->

                        <div id="left_div" style="float: left; width: 45% ;border: 0px solid blue;">

                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label ">名称：</label>
                                <div class="col-sm-6">
                                    <input type="text" name="name" maxlength="64" id="name" placeholder="名称" class="form-control">
                                </div>
                                <div>
                                    <i class="i_context my-i_context">*</i>
                                </div>
                            </div>

                            <#--<div class="form-group">-->
                                <#--<label class="col-sm-3 control-label my-control-label ">類別：</label>-->
                                <#--<div class="col-sm-6">-->
                                    <input type="hidden" name="category" maxlength="64" id="category" placeholder="類別" class="form-control">
                                <#--</div>-->
                            <#--</div>-->

                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label ">位置：</label>
                                <div class="col-sm-6">
                                    <textarea name="location" maxlength="64" id="location" placeholder="位置" class="form-control"></textarea>
                                </div>
                                <div>
                                    <i class="i_context my-i_context">*</i>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label ">经度：</label>
                                <div class="col-sm-6">
                                    <input type="text" name="longitude" readonly="readonly" maxlength="64" id="lng" placeholder="经度" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label ">纬度：</label>
                                <div class="col-sm-6">
                                    <input type="text" name="latitude" readonly="readonly" maxlength="64" id="lat" placeholder="纬度" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label ">描述：</label>
                                <div class="col-sm-6">
                                    <textarea class="form-control" rows="5" cols="" name="description" id="description"></textarea>
                                </div>
                                <div>
                                    <i class="i_context my-i_contdescriptionext">*</i>
                                </div>
                            </div>


                            <div class="form-group" style="">
                                <label class="col-sm-3 control-label my-control-label">附件：</label>
                                <div style="width:80;height: 35px;position: relative;margin:0 auto">
                                    <div id="xg_rar">上传附件</div>
                                </div>
                                <div id="fileShowName" style="text-align: center;margin:0 auto"></div>
                            </div>


                        </div>


                        <#--放置地图-->
                        <div id="right_div" style="float: right; width: 50%; height: 350px; border-color: #0aa6e0; border: 0px solid blue;">


                            <div class="main-div">
                                <div>
<#--                                    <input type="text" value="定位" name="定位">-->
                                    <label style="font-size: 20px" id="myLocation">点我定位</label>
                                </div>
                                <div id='allmap' style='width: 48%; height: 350px; position: absolute;'></div>
                            </div>

                        </div>


                    </form>
                </div>

                <div class="modal-footer" style="margin-top: 400px;">
                    <input type="hidden" id="add-type">
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="save-btn" onclick="typeId_btn()">保存</button>
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

<!-- 将百度地图API引入，设置好自己的key -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=7a6QKaIilZftIMmKGAFLG7QT1GLfIncg"></script>

<script>

    var typeId;//类别id

    var tpgs="bmp,jpg,png,gif,jpeg";//附件上传格式控制

    var dataTable;
    var urlstr="/api/convenient";
    var formIdStr="#post_form";
    var sys_url=window.location.host;
    $(document).ready(function () {

        // 新建  验证
        $("#post_form").validate({
            rules: {
                // 必填项
                name:{
                    required:true,
                    rangelength:[0,10]
                },
                location:{
                    required:true
                },
                description:{
                    required:true,
                    rangelength:[0,100]
                }
            },

            // 提示信息
            messages: {
                name: {
                    required: "请输入名称",
                    rangelength:"字符个数不能超过10"
                },
                location: {
                    required: "请输入位置"
                },
                description: {
                    required: "请输入描述",
                    rangelength:"字符个数不能超过100"
                }
            }
        });

        findList();

        //文件上下传
        var setValFun = function () {
            $("#xg_rar").html('上传附件');
            $("#fileShowName").html('');
            $("#attachIdss").val('');

            //初始化上传工具
            initUpload(tpgs);
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
            initUpload(tpgs);

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
//                data.attachIdss = attachIdss;

               /* data.content=getContent();
                data.contentnohtml=getContentTxt();*/
                data = JSON.stringify(data);
                console.info(data);
                var mymesg = "新建";
                if ($("#id").val() != '') {
                    mymesg = "修改";
                }

                zudp.ajax(urlstr).post(data).then(function (da) {

                    zudp.plugin.dialog("success").alert(mymesg + "成功" + "！", "提示");
                    dataTable.ajax.reload();
                    $(".modal-form").modal("hide");
                });
            }
        };
        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}便民服务",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value'],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"],
            addBtnFun: setValFun,
            editBtnFun: setOtherVal,
            saveForm: saveFormFun
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

    //点击保存按钮
    function typeId_btn() {

        $("#category").val(typeId); //给类型赋值

        var id = $("#category").val();  //若类型为空，赋一个默认值
        if(id == "") {
            id = "191216144540098121";//醫院類別
            $("#category").val(id);
        }
    }

    //点击类型列表查询该列表所有
    function nodeClick(id) {

        typeId = id;//给类型id赋值

        //把id赋值给查询语句
        $("#categoryId_hidden_select").val(id);
        dataTable.ajax.reload();
    }

    //列表数据初始化方法
    function findList() {

        var urls="/api/convenient";
        dataTable=zudp.plugin.table('#post-list-table')
                .url(urls)
                .search(function () {
                    return {
                        "name":$("#search_name").val(),
                        "category":$("#categoryId_hidden_select").val()
                    }
                })
                .columns( [
                    {data: 'id',visible: false},
                    {data: 'name',width: '25%'},
                    {data: 'location',width: '20%' },
                    {data: 'description',width: '20%' },
//                    {data: 'category',width: '8%' },
                    {
                        render: function (data, type, row) {
                            var btn = "";
                            var editstr="";
                            var delstr="";

                            editstr = zudp.template.editBtn;
                            delstr = zudp.template.delBtn;
                            btn += editstr+delstr;
                            return zudp.util.render(btn, row);
                        }
                    }
                ])
                .then();
    }


    function initUpload(tpgs){

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
                extensions: tpgs,
                title:'file',
                mimeTypes:'*/*'
            }
        });
        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on( 'uploadSuccess', function( file,response) {
            //;
            var name = file.name;
            var fileurl = response.data;
            $("#fileShowName").append("<p>" +
                    "<a href='//"+sys_url+"/"+fileurl+"' download='"+name+"'>"+name+"</a>" +
                    "<input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                    "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                    "<input type='hidden' name='attachPath' value='"+fileurl+"'>" +
                    "<input type='hidden' name='attachName' value='"+name+"'>" +
                    "</p>");

        });

        uploader.on("error", function (type) {
            if (type == "Q_TYPE_DENIED") {
                alert("请上传"+tpgs+"格式文件");
            }
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
        })
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
            tempAttachIdss.push(v);
        });
        return tempAttachIdss;
    }

    //***************************************************************************




    //百度地图
    function validate() {
        var sever_add = document.getElementsByName('sever_add')[0].value;
        if (isNull(sever_add)) {
            alert('请选择地址');
            return false;
        }
        return true;
    }
    //判断是否是空
    function isNull(a) {
        return (a == '' || typeof(a) == 'undefined' || a == null) ? true : false;
    }

    var map = new BMap.Map("allmap");
    var geoc = new BMap.Geocoder();  //地址解析对象
    var markersArray = [];
    var geolocation = new BMap.Geolocation();
    var point = new BMap.Point(114.67806931222913, 27.811967294005495);
    map.centerAndZoom(point, 12); // 中心点
    map.addEventListener("click", showInfo);


    //地图缩小放大
    geolocation.getCurrentPosition(function (r) {
        if (this.getStatus() == BMAP_STATUS_SUCCESS) {
            var mk = new BMap.Marker(r.point);
            map.addOverlay(mk);
            map.panTo(r.point);
            map.enableScrollWheelZoom(true);
        }
        else {
            alert('failed' + this.getStatus());
        }
    }, {enableHighAccuracy: true})

    //清除标识
    function clearOverlays() {
        if (markersArray) {
            for (i in markersArray) {
                map.removeOverlay(markersArray[i])
            }
        }
    }
    //地图上标注
    function addMarker(point) {
        var marker = new BMap.Marker(point);
        markersArray.push(marker);
        clearOverlays();
        map.addOverlay(marker);
    }
    //点击地图时间处理
    function showInfo(e) {
        document.getElementById('lng').value = e.point.lng;
        document.getElementById('lat').value = e.point.lat;
        geoc.getLocation(e.point, function (rs) {
            var addComp = rs.addressComponents;
            var address = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
            // if (confirm("确定要地址是" + address + "?")) {
                // document.getElementById('allmap').style.display = 'none';
                document.getElementById('location').value = address;
            // }
        });
        addMarker(e.point);
    }

    // 用经纬度设置地图中心点
    $(document).ready(function() {
        $("#myLocation").click(function() {
            if (document.getElementById("lng").value != "" && document.getElementById("lat").value != "") {
                map.clearOverlays();
                var new_point = new BMap.Point(document.getElementById("lng").value, document.getElementById("lat").value);
                var marker = new BMap.Marker(new_point); // 创建标注
                map.addOverlay(marker); // 将标注添加到地图中
                map.panTo(new_point);
            }
        });
    });

</script>
</body>
</html>
