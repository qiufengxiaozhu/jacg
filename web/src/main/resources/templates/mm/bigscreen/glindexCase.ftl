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
                            <th>区名</th>
                            <th>街道</th>
                            <th>大类名称</th>
                            <th>问题描述</th>
                            <th>案件截止时间</th>

                        </tr>
                        </thead>
                        <tbody id="tables">
                        </tbody>
                    </table>

                    <div class="page-list ">
                        <a onclick="firstPage()" class="page-li page-prev">首页</a>
                        <a  onclick="uppers()" class="page-li on">上一页</a>
                        <a onclick="lowers()" class="page-li">下一页</a>
                        <a onclick="endpage()" class="page-li page-next">尾页</a>
                    </div>



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
                div=div +'   <td>'+data.DEADLINE+'</td>';

                $('#post-list-table').append(div)


            }


        },function (reason) {
            zudp.plugin.dialog("error").alert("查询失败！", "提示");
        });

    }



</script>
</body>
</html>
