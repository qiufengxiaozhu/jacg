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
    <script src="/mm/bigscreen/js/rem.js"></script>
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
        .page-list div{
            float: left;
            padding: 0 0.1rem;
            border: 1px solid #CEC2E5;
            box-shadow: 0px 0px 10px rgba(206,194,229,0.4);
            margin-left: 0.5rem;
            margin-top: 0.3rem;
        }
    </style>

    <style>
        .yt-main{max-height: 100%;}
        .yt-tab-cnt{width: 100%;padding-top: 3rem}
        .modal-content{background: transparent}
        .inmodal .modal-body { background: transparent;  }
        .modal-title, .my-control-label{color: #fff}
        .page-li{
            height: 0.6rem;
            width: 1.2rem;
            color: #fff;
            font-size: 0.25rem;
            text-align: center;
            line-height: 0.6rem;
            margin-left: ;
        }
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
        <div class="page-list flex">
            <div onclick="firstPage()" class="page-li page-prev">首页</div>
            <div  onclick="uppers()" class="page-li on">上一页</div>
            <div onclick="lowers()" class="page-li">下一页</div>
            <div onclick="endpage()" class="page-li page-next">尾页</div>
        </div>
    </div>
</div>
<#--以下是模态框-->
<div class="mess" id="myModal5" style="display: none;">
    <div class="close me-close"><img src="/zhizui/img/close.png"></div>
    <div class="me-relative">
        <div class="be-center">案件详情</div>
        <div class="me-first">
            <div class="me-high">
                <#--<div class="me-fl-left" id ="name">案件名称:&nbsp;XXXXX</div>-->
                <div class="me-fl-right flex" >
                    <div>案件类型: <span id="MAINTYPENAME"></span></div>
                </div>
            </div>
            <div class="me-high" id="addressId">地址:&nbsp;<span id="ADDRESS"></span></div>
            <div class="me-high">
                <div class="me-fl-left" id="deadTimeId">案件截止时间: <span id="DEADLINE"></span></div>
                <div class="me-fl-right" id="endTimeId">案件结束时间: <span id="ENDTIME"></span></div>
            </div>
            <div class="me-high">
                <div class="me-fl-left" id="departmentId">处理部门:&nbsp;<span id="DISPOSEDEPARTNAME"></span></div>
                <div class="me-fl-right" id="dealTimeId">部门处理时间:&nbsp;<span id="DEALTIME"></span></div>
            </div>
            <div class="me-resolve me-line">
                <div class="me-getres" id="advId">处理意见:</div>
                <div class="deep"><span id="DISPOSEOPINION"></span></div>
            </div>
            <div class="me-resolve">
                <div class="me-getres" id="descriptionId">问题描述:</div>
                <div class="put-tex"><span id="EVENTDESC"></span></div>
            </div>
        </div>
    </div>
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
    $('.close').on('click',function(){
        $('.mess').hide();
    })

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
                var pubstr= "<button class=\"btns btn-info btn-sm\" onclick=\"pubBtn('"+data.RECID+"')\">查看</button>";
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
            $("#DISTRICTNAME").html(value.DISTRICTNAME);
            $("#STREETNAME").html(value.STREETNAME);
            $("#EVENTSRCNAME").html(value.EVENTSRCNAME);
            $("#MAINTYPENAME").html(value.MAINTYPENAME);
            $("#SUBTYPENAME").html(value.SUBTYPENAME);
            $("#EVENTDESC").html(value.EVENTDESC);
            $("#ADDRESS").html(value.ADDRESS);
            $("#DEADLINE").html(value.DEADLINE);
            $("#ENDTIME").html(value.ENDTIME);
            $("#DISPOSEOPINION").html(value.DISPOSEOPINION);
            $("#DISPOSEDEPARTNAME").html(value.DISPOSEDEPARTNAME);
            $("#DEALTIME").html(value.DEALTIME);
//            ;
            $("#myModal5").modal("show");//显示div


        },function (reason) {
            zudp.plugin.dialog("error").alert("查询失败！", "提示");
        });


    }

</script>
</body>
</html>
