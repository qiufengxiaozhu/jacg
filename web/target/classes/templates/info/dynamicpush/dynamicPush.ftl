<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>动态推送列表</title>
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link href="/css/third/bootstrap.min.css" rel="stylesheet">
    <link href="/css/third/font-awesome.min.css" rel="stylesheet">
    <link href="/css/third/custom.css" rel="stylesheet">
    <link href="/css/third/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/third/animate.min.css" rel="stylesheet">
    <link href="/css/third/sweetalert.css" rel="stylesheet"/>
    <link href="/css/third/toastr.min.css" rel="stylesheet"/>
    <link href="/css/style.min.css" rel="stylesheet">
    <style>
        /*滚动条的设置*/
        ::-webkit-scrollbar-thumb {
            background-color:#dddddd;
        }
        ::-webkit-scrollbar-track {
            background-color: #f7f7f7;
            border: 1px solid #efefef;
        }
    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="ibox-content form-inline ">
                    <div class='col-sm-12'>
                        <button class="btn btn-success" data-toggle="modal" id="add-btn" >新增</button>&nbsp;&nbsp;
                        <button class='btn btn-success btn-danger' id="delete-items">
                            批量删除
                        </button>

                        <div class='querybtn my-querybtn'>
                            <label class='control-label my-control-label'>推送标题：</label>
                            <input type='text' name='title' id="title" placeholder='推送标题' class='form-control search-input'>
                            <label class='control-label my-control-label'>推送类型：</label>
                            <select class="form-control" name="pushType" id="pushType">
                                <option value="">全部</option>
                                <option value="城市治安">城市治安</option>
                                <option value="环境保护">环境保护</option>
                                <option value="交通秩序">交通秩序</option>
                                <option value="社区通告">社区通告</option>
                            </select>
                            <button class='btn btn-primary mgl my-mgl research-btn'>
                                搜索
                            </button>&nbsp;&nbsp;
                            <#--<button class='btn btn-primary select-query'>
                                高级搜索
                            </button>&nbsp;&nbsp;-->
                        </div>
                    </div>
                    <div id='search' class='search-group' style='display:none;'>
                    </div>
                    <table id="landinfo-list-table" class="my-table table table-bordered dataTables-example">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>推送类型</th>
                            <th>推送标题</th>
                            <th>推送作者</th>
                            <th>推送状态</th>
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
                <h4 class="modal-title ModalTitle">添加</h4>
            </div>
            <small class="font-bold">
                <div class="modal-body fix-height" >
                    <#--表单-->
                    <form class="form-horizontal" id="form">
                        <input type="hidden" name="id">
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">推送标题：</label>
                            <div class="col-sm-6">
                                <input type="text" name="title" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">推送类型：</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="pushType">
                                    <option value="城市治安">城市治安</option>
                                    <option value="环境保护">环境保护</option>
                                    <option value="交通秩序">交通秩序</option>
                                    <option value="社区通告">社区通告</option>
                                </select>
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">推送方：</label>
                            <div class="col-sm-6">
                                <input type="text" name="author" class="form-control">
                            </div>
                            <div>
                                <i class="i_context my-i_context">*</i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">推送状态：</label>
                            <div class="col-sm-6">
                            <select class="form-control" name="pushStatus">
                                <option value="0">临时</option>
                                <option value="1">已发布</option>
                                <option value="2">下架</option>
                            </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label my-control-label">推送内容：</label><br><br>
                            <textarea name="content" id="text1"  class="form-control" style="width:100%; height:200px; display: none"></textarea>
                            <div id="editor">
                                <p id="contents"></p>
                            </div>
                        </div>

                    </form>
                </div>

                <div class="modal-footer">
                    <input type="hidden" id="user_add_type">
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
<script src="/js/third/bootstrap-suggest.min.js"></script>
<script src="/js/third/jquery.validate.min.js"></script>
<script src="/js/third/jquery.dataTables.min.js"></script>
<script src="/js/third/dataTables.bootstrap.js"></script>
<script src="/js/third/icheck.min.js"></script>
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script src="/js/third/laydate/laydate.js"></script>
<script src="/js/zudp.js"></script>
<script src="/js/rest.js"></script>
<script src="/js/pluginInit/laydateInit.js"></script>
<script src="/js/pluginInit/dataecho.js"></script>
<script src="/js/third/wangEditor.min.js"></script>
<script>
    var E = window.wangEditor;
    var editor = new E('#editor');
    // 或者 var editor = new E( document.getElementById('editor') )
    // editor.create();

    var $text1 = $('#text1');
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $text1.val(html);
    };
    editor.create();
    // 初始化 textarea 的值
    $text1.val(editor.txt.html());
    // editor.txt.html('<p>用 JS 设置的内容</p>');
    editor.txt.html('<p>就啊是第几啊是否可见大幅扩建哈尽快发货圣诞节风口浪尖上的离开房间是的路口附近九分快乐圣诞节分厘卡圣诞节分厘卡圣诞节雷锋精神独立开发集散地立刻解放空手道解放了考深大发速度，放假啦空手道粉红色的开发函数的积分和可接受的回复会计师大后方会计核算雕刻技法和卡死的回复快速导航会计法合适的客户发速度合法化弗兰克爱发牢骚的回复客户迪斯科解放和萨达空间回复库换烦得很封建时代和福克斯的话反馈说的返回的话flak是法律卡霍夫卡是发获得丰厚说的话反馈及时答复客户速度放缓萨达空间回复可接受的回复框上的看法和考深大核辐射的尽快发货扣税的计划反馈说的反抗集散地和付款时间很多反馈说的开发还是的看法和绿卡发哈合法化的身份和萨达空间回复卡死的回复可记得回访客户收到返回ihfi文化覅节食减肥合适的客户发肯定会反馈看回家撒的很快就会释放空间还是雕刻技法和上岛咖啡可接受的和附件是肯定和房价快速导航反抗集散地和反抗集散地和反抗集散地和发会计师的付款计划维科技孵化维科技孵化科技示范客家文化的反抗绝望和反抗绝望和反馈即位后付款计划</p>');





    var dataTable;
    var urlstr="/api/dynamicPush";
    var formIdStr="#form";
    // var sys_url=window.location.host;

    $(document).ready(function () {
        findList();

        var obj={
            url: urlstr,
            formId: formIdStr,
            title: "{type}岗位",
            success: "数据{msg}",
            error: "数据{msg}",
            disabledName: ["type", 'value'],
            hideInputName:[],
            search: [".clear-input", "#search",".search-input"]

        };
        //初始化增删改查参数
        initForm(obj);
    });

    //列表数据初始化方法
    function findList() {
        var urls="/api/dynamicPush";
        dataTable=zudp.plugin.table('#landinfo-list-table')
            .url(urls)
            .search(function () {
                return {
                    "title":$("#title").val(),
                    "pushType":$("#pushType").val()
                }
            })
            .columns( [
                {data: 'id', visible: false},
                {data: 'pushType'},
                {data: 'title'},
                {data: 'author'},
                {
                    render:function (data, type, row) {
                        if(data.pushStatus==0){
                            return "临时";
                        }else if(data.pushStatus==1){
                            return "已发布";
                        }else if(data.pushStatus==2){
                            return "下架";
                        }
                    }
                },
                {
                    render: function (data, type, row) {
                        var btn = "";
                        var detailstr="";
                        var  delstr="";
                        var  editstr="";

                        editstr=zudp.template.editBtn+'&nbsp;';
                        <#--<@hasPermission name="oaManager:post:update">-->
                        detailstr=zudp.template.detailBtn;
                        <#--</@hasPermission>-->
                        <#--<@hasPermission name="oaManager:post:delete">-->
                        delstr=zudp.template.delBtn;
                        <#--</@hasPermission>-->
                        btn += editstr+detailstr+delstr;
                        return zudp.util.render(btn, row);
                        //return "";
                    }
                }
            ])
            .then();

    }



    /**
     * 时间格式化
     * */
    function formatTime(date) {
        if(date==null || date==""){
            return "";
        }
        date = new Date(date);
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        var D = (date.getDate() <10 ? "0"+(date.getDate()) : date.getDate()) + ' ';
        var h = (date.getHours() >= 10?date.getHours():('0'+date.getHours())) + ':';
        var m = (date.getMinutes() >= 10?date.getMinutes():('0'+date.getMinutes())) + ':';
        var s = date.getSeconds() >= 10?date.getSeconds():('0'+date.getSeconds());

        return Y + M + D ;
    }
</script>

</body>
</html>
