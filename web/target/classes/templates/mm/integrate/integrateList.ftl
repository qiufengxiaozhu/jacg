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
    <title>积分管理</title>
</head>
<body>
<div class="content-box container-app">

    <div class="top flex flex-c-c">
        <div class="top-return"></div>
        <div class="return" onclick="goIndex()">返回</div>
        <div class="advince">积分管理</div>
    </div>
    <div>


        <table id="post-list-table" class="table my-table table-bordered dataTables-example">
            <thead>
            <tr>
                <th>上报人手机号</th>
                <th>上报标题</th>
                <th>上报时间</th>
                <th>积分数</th>
            </tr>
        <#list integrateList! as integrate>
            <tr>
            <th>${integrate.telephone!}</th>
            <th>${integrate.title!}</th>
            <th>${integrate.reportDate!}</th>
            <th>${integrate.points!}</th>
            </tr>
        </#list>


            </thead>
            <tbody>
            </tbody>
        </table>


    </div>

</div>
<form id="ret_my_complain_form" action="" method="post">
    <!--<input type="hidden" name="_method" value="DELETE"/>-->
    <input type="hidden" name="contactUser" id="contactUser" value='${contactUser!}'>
</form>
<script>
    function goIndex() {
        window.location.href='/mm/news/index';
    }
</script>
</body>
</html>