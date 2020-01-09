<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>投诉/建议</title>

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
    <!-- Bootstrap -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
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
<body>
<h1 class="text-center text-primary"> 我是投诉/建议界面 </h1>
<!--${Request.number!"default failure"}-->
<div class="align-content-sm-center">
    <form class="form-horizontal" id="post_form">
        <input type="hidden" name="id" id="id">
        <div class="form-group">
            <label class="col-sm-4 control-label">投诉部门：</label>

            <div class="col-sm-4">
                <select id="department" name="department" class="form-control">
                    <#if deptList?exists && deptList??>
                        <#list deptList as list>
                            <option value="${list.department}">${list.department}</option>
                        </#list>
                    </#if>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label my-control-label ">问题主题：</label>
            <div class="col-sm-4">
                <input type="text" name="topic" maxlength="64" id="topic" placeholder="问题主题" class="form-control">
            </div>
            <!--<div>-->
            <!--<i class="i_context my-i_context">*</i>-->
            <!--</div>-->
        </div>
        <div class="form-group"><!-- 投诉/建议 分类 -->
            <label class="col-sm-4 control-label my-control-label ">投诉类别：</label>
            <div class="col-sm-4">
                <label class="checkbox-inline col-sm-3">
                    <input type="radio" name="type" id="optionsRadios3" value="0" checked> <b class="text-danger">投诉</b>
                </label>
                <label class="checkbox-inline col-sm-3">
                    <input type="radio" name="type" id="optionsRadios4" value="1"> <b class="text-danger">建议</b>
                </label>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-4 control-label my-control-label">姓名：</label>
            <div class="col-sm-4">
                <input type="text" name="username" maxlength="64" id="username" placeholder="姓名" class="form-control">
            </div>

        </div>

        <div class="form-group">
            <label class="col-sm-4 control-label my-control-label">电话：</label>
            <div class="col-sm-4">
                <input type="text" name="tel" maxlength="64" id="tel" placeholder="电话" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label my-control-label">详细问题：</label>
            <div class="col-sm-4">
                <!--<input type="text" name="comment" maxlength="64" id="comment" placeholder="详细问题" class="form-control">-->
                <textarea name="comment" id="comment" placeholder="详细问题" class="form-control"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label my-control-label"></label>
            <div class="col-md-4 col-lg-4 col-sm-4 ">
                <button type="submit" class="btn btn-primary btn-block">提交</button>
            </div>
        </div>
    </form>
</div>


<script type="text/javascript">
    $(document).ready(function () {
        alert("dfafd");
    });

    function readyDept() {
        $("#department").find("option").remove();
        zudp.ajax("/api/dept/deptList").get().then(function (value) {
            for (var k = 0; k < value.length; k++) {

                if (value[k].department == null) {
                    value[k].department = "";
                }
                else {
                    $("#department").append("<option value='" + value[k].department + "'>" + value[k].department + "</option>");
                }
            }
            //  gettypemin();
        }, function (reason) {
            zudp.plugin.dialog("error").alert("获取用户列表失败！", "提示");
        });
    }
</script>
<!--&lt;!&ndash; jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) &ndash;&gt;-->
<!--<script src="/static/js/jquery-3.3.1.js"></script>-->
<!--&lt;!&ndash; 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 &ndash;&gt;-->
<!--<script src="/static/js/bootstrap.min.js"></script>-->
</body>
</html>