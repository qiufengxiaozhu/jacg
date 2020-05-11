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
                    <table id="post-list-table" class="table my-table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>排名</th>
                            <th>姓名</th>
                            <th>电话</th>
                            <th>积分数</th>
<#--                            <th>操作</th>-->
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
<#--<div class="modal inmodal fade modal-form" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">-->
<#--    <div class="modal-dialog modal-lg">-->
<#--        <div class="modal-content">-->
<#--            <div class="modal-header">-->
<#--                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span-->
<#--                        class="sr-only">Close</span></button>-->
<#--                <h4 class="modal-title">添加</h4>-->
<#--            </div>-->
<#--            <small class="font-bold">-->
<#--                <div class="modal-body fix-height" >-->
<#--                &lt;#&ndash;表单&ndash;&gt;-->
<#--                    <form class="form-horizontal" id="post_form">-->
<#--                        <input type="hidden" name="id" id="id">-->
<#--                        <!-- 附件上传 隐藏传值  开始 &ndash;&gt;-->
<#--                        <input id="attachIdss" type="hidden" />-->
<#--                        <!-- 附件上传 隐藏传值  结束 &ndash;&gt;-->
<#--                        <div class="form-group">-->
<#--                            <label class="col-sm-3 control-label my-control-label ">岗位名称：</label>-->
<#--                            <div class="col-sm-6">-->
<#--                                <input type="text" name="name" maxlength="64" id="name" placeholder="岗位名称" class="form-control">-->
<#--                            </div>-->
<#--                            <div>-->
<#--                                <i class="i_context my-i_context">*</i>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                        &lt;#&ndash;<div class="form-group">&ndash;&gt;-->
<#--                            &lt;#&ndash;<label class="col-sm-3 control-label my-control-label ">岗位标识：</label>&ndash;&gt;-->
<#--                            &lt;#&ndash;<div class="col-sm-6">&ndash;&gt;-->
<#--                                &lt;#&ndash;<input type="text" name="identification" maxlength="64" id="identification" placeholder="岗位标识" class="form-control">&ndash;&gt;-->
<#--                            &lt;#&ndash;</div>&ndash;&gt;-->
<#--                            &lt;#&ndash;<div>&ndash;&gt;-->
<#--                                &lt;#&ndash;<i class="i_context my-i_context">*</i>&ndash;&gt;-->
<#--                            &lt;#&ndash;</div>&ndash;&gt;-->
<#--                        &lt;#&ndash;</div>&ndash;&gt;-->
<#--                        <div class="form-group">-->
<#--                            <label class="col-sm-3 control-label my-control-label">内容：</label>-->
<#--                            <div class="col-sm-6">-->
<#--                                <textarea class="form-control" rows="5" cols="" name="content" id="content"></textarea>-->
<#--                            </div>-->

<#--                        </div>-->
<#--                        <div class="form-group">-->
<#--                            <label class="col-sm-3 control-label my-control-label">描述：</label>-->
<#--                            <div class="col-sm-6">-->
<#--                                <textarea class="form-control" rows="5" cols="" name="mark" id="mark"></textarea>-->
<#--                            </div>-->

<#--                        </div>-->
<#--                        <div class="form-group" style="">-->
<#--                            <label class="col-sm-3 control-label my-control-label">附件：</label>-->
<#--                            <div style="width:80;height: 35px;position: relative;margin:0 auto">-->
<#--                                <div id="xg_rar">上传附件</div>-->
<#--                            </div>-->
<#--                            <div id="fileShowName" style="text-align: center;margin:0 auto"></div>-->
<#--                        </div>-->


<#--                    </form>-->
<#--                </div>-->

<#--                <div class="modal-footer">-->
<#--                    <input type="hidden" id="add-type">-->
<#--                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>-->
<#--                    <button type="button" class="btn btn-primary" id="save-btn">保存</button>-->
<#--                </div>-->
<#--            </small>-->
<#--        </div>-->
<#--        <small class="font-bold">-->
<#--        </small>-->
<#--    </div>-->
<#--    <small class="font-bold">-->
<#--    </small>-->
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

<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
<script>
 
    var dataTable;
    var urlstr="/api/rank";
    var formIdStr="#post_form";
    var sys_url=window.location.host;

    $(document).ready(function () {

        findList();

        // var obj={
        //     url: urlstr,
        //     formId: formIdStr,
        //     title: "{type}岗位",
        //     success: "数据{msg}",
        //     error: "数据{msg}",
        //     disabledName: ["type", 'value'],
        //     hideInputName:[],
        //     search: [".clear-input", "#search",".search-input"]
        //
        // };
        // //初始化增删改查参数
        // initForm(obj);

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

        var urls="/api/rank";
        dataTable=zudp.plugin.table('#post-list-table')
                .url(urls)
                .search(function () {
                    return {
                        "name":$("#search_name").val()

                    }
                })
                .columns( [
                    // <th>id</th>
                    // <th>积分数</th>
                    // <th>姓名</th>
                    // <th>电话</th>
                    // <th>排名</th>
                    // <th>操作</th>
                    {data: 'id', visible: false},
                    {data: 'rank'},

                    {data: 'name',
                        render: function (data, type, row) {
                            var temp = data;
                            if(data == null || data == ""){
                                temp = "姓名需对接";
                            }
                            return temp;
                        }
                    },
                    {data: 'telephone'},
                    {data: 'points'}

                    <#--{-->
                    <#--    render: function (data, type, row) {-->
                    <#--        var btn = "";-->
                    <#--        var editstr="";-->
                    <#--        var  delstr="";-->
                    <#--       <@hasPermission name="oaManager:post:update">-->
                    <#--               editstr=zudp.template.editBtn;-->
                    <#--       </@hasPermission>-->
                    <#--      <@hasPermission name="oaManager:post:delete">-->
                    <#--          delstr=zudp.template.delBtn;-->
                    <#--      </@hasPermission>-->
                    <#--        btn += editstr+delstr;-->
                    <#--        return zudp.util.render(btn, row);-->
                    <#--        //return "";-->
                    <#--    }-->
                    <#--}-->
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
            $("#fileShowName").append("<p>" +
                    "<a href='//"+sys_url+"/"+fileurl+"' download='"+name+"'>"+name+"</a>" +
                    "<input type='hidden' name='fid'>&nbsp;&nbsp;&nbsp;&nbsp;" +
                    "<span style='color:red' onclick='deleteFile(this)'>删除</span>" +
                    "<input type='hidden' name='attachPath' value='"+fileurl+"'>" +
                    "<input type='hidden' name='attachName' value='"+name+"'>" +
                    "</p>");

            //change(response);
        });
    }
</script>
</body>
</html>
