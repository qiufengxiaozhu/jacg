<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="/mm/css/index.css">
    <link rel="stylesheet" href="/mm/css/main.css">

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
    <title>统计管理</title>
</head>
<body>
<div class="content-box container-app">

    <div class="top flex flex-c-c">
        <div class="top-return"></div>
        <div class="return" onclick="goIndex()">返回</div>
        <div class="advince">统计管理</div>
    </div>
    <div>
        <table id="post-list-table" class="table my-table table-bordered dataTables-example">
            <thead>
            <tr>
                <th>序号</th>
                <#--<th>单位名称</th>-->
                <th>公众上报数</th>
                <th>已回复数</th>
                <th>未回复数</th>
            </tr>

        <#--    <tr>
                <th>1</th>
                <th>${report.replyId!}</th>
                <th>${report.sbSum!}</th>
                <th>${report.replyYes!}</th>
                <th>${report.repleNo!}</th>
            </tr>-->


            </thead>
            <tbody id="title">

            </tbody>
        </table>
    </div>

</div>
<script>
    function goIndex() {
        window.location.href='/mm/news/index';
    }
    $(document).ready(function(){
      //更新数据
     init();
    });
    function init(){
        $.ajax({
            url: "/count/countManage",
            type: "get",
            dataType: 'json',
            contentType: 'application/json',
            success: function (data) {
                console.log(data);
                var list = data.data;
                var table = '';
                var j = 0;
                for (var i=0;i<list.length;i++){
                    j = j+1;
                    table +=' <tr>\n' +
                            '                <th>'+j+'</th>\n' +
                            // '                <th>'+list[i].replyId+'</th>\n' +
//                            '                <th>'+'吉安城管'+'</th>\n' +
                            '                <th>'+list[i].sbSum+'</th>\n' +
                            '                <th>'+list[i].replyYes+'</th>\n' +
                            '                <th>'+list[i].repleNo+'</th>\n' +
                            '            </tr>';
                }
                $("#title").html(table);
            }
        });
    }
</script>
</body>
</html>