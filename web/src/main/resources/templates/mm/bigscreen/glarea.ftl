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

    <style>
        .page-list{text-align: center}
        .page-list .page-li.prev{font-family: SimHei}
        .page-list .page-li.next{font-family: SimHei}
        .page-list .page-li.on{color:#000000}
        .page-list .page-li{    color: #808080;
            padding: 0.6rem 1rem;
            font-size: 1.5rem;
            background: rgba(255,255,255,0.2);
            margin: 0 0.3rem;
            border-radius: 50%;}
        .yt-main{max-height: 100%;}
        .yt-tab-cnt{width: 100%;padding-top: 3rem}
        .gray-bg, .ibox-content, .table-bordered>thead>tr>th {
            background-color: transparent;
            border: none;
        }
        .bs-table>tbody>tr>td, .bs-table>thead>tr>th{border: 1px solid #00fcff;color:#fff}
        .bs-table{ border: 1px solid #00fcff;   border-collapse: collapse;box-shadow: 0px 0px 12px #00fcff;}
    </style>


</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox">
                <div class="ibox-content form-inline z-relative">
                    <table id="post-list-table" class="table my-table  dataTables-example bs-table">
                        <thead>
                        <tr>
                            <th>季度</th>
                            <th>区名</th>

                            <th>大类名称</th>
                            <th>案件量</th>


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

    search();
    function search() {
        debugger;
        var s="${name}";
        zudp.ajax("/mm/screen/glareaList?name="+s).get().then(function (value) {
            debugger;
            for(var i=0;i<value.length;i++){
                var data  =value[i];
                var div ='<tr>';

                div=div +'   <td>'+s+'</td>';
                div=div +'   <td>'+data.name+'</td>';
                div=div +'   <td>'+data.type+'</td>';
                div=div +'   <td>'+data.num+'</td>';


                $('#post-list-table').append(div)


            }


        },function (reason) {
            zudp.plugin.dialog("error").alert("查询失败！", "提示");
        });

    }



</script>
</body>
</html>
