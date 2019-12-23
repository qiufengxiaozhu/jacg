<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">

    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="/mm/css/index.css">

    <script src="/js/zudp.js"></script>
    <style>
        #msg-show{float: left;color: red}
        p.hide{display: none}
    </style>
</head>
<body>

<form class="new_new_user gl-show-field-errors" aria-live="assertive" id="new_new_user" action="/users" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="rKUSQsQMeMUMsblZTlwz1Gt2aaq5gLcjxXuQKH/AF1LYfeFzeEoo6OQ5n1s/pG8jqNIdrTlbigSNzmvszacnkQ=="><div class="devise-errors">

    <input type="hidden" id="name_error_flag">
    <input type="hidden" id="pwd_error_flag">
    <div class="form-group">
        <label for="new_user_name">姓名</label>
        <input type="text" id="new_user_name" class="login-input flex-1" placeholder="">

    </div>
    <div class="username form-group">
        <label for="new_user_username">用户名/手机号</label>
        <input type="text" id="new_user_username" class="login-input flex-1" placeholder="">
        <p class="validation-error hide">用户名已经被使用。</p>
        <p class="validation-success hide">用户名有效。</p>
        <p class="validation-pending hide">正在检查用户名有效性...</p>
    </div>

    <div class="form-group append-bottom-20" id="password-strength">
        <label for="new_user_password">密码</label>
        <input type="password" id="new_user_password" class="login-input flex-1" placeholder="">

        <p class="gl-field-hint">最小长度为 6 字符。</p>
    </div>
    <div><span id="msg-show"></span></div>

    <div class="submit-container">
        <div class="btn login-btn" onclick="saveReg()">注册</div>
    </div>
</form>

<script>

    $('#new_user_username').on('input propertychange', function() {
        var val=$(this).val();

        if(val==''){
            $("#name_error_flag").val("1");
        }else{
            var reg = /^(13|18|14|17|15)[0-9]{9}$/;
            var r = val.match(reg);
            if(r==null){
                $(".validation-error").show();
                $("#name_error_flag").val("1");
            }else{
                searchUsername(val);
            }


        }
    });
    $('#new_user_password').on('input propertychange', function() {
        var val=$(this).val();

        if(val==''){
            $("#pwd_error_flag").val("");
        }else{
            var reg = /^(\w){5,10}$/;
            var r = val.match(reg);
            if(r==null){
                $("#pwd_error_flag").val("1");
            }else{
                $("#pwd_error_flag").val("");
            }
        }
    });
    function searchUsername(username) {
        var date= new Date();
        var param={loginName:username,time:date.getTime()};
        zudp.ajax("/api/user/checkLoginName").get(param).then(function (da) {
            console.log(da);
            if(da==false){
                $(".validation-error").show();
                $("#name_error_flag").val("1");
            }else{
                $("#name_error_flag").val("");
                $(".validation-error").hide();
            }
        });
    }
    function saveReg(){
        debugger;
        var flag1=$("#name_error_flag").val();
        var flag2=$("#pwd_error_flag").val();
        var name=$("#new_user_name").val();
        var loginName=$("#new_user_username").val();
        var pwd = $("#new_user_password").val();
        var data={name:name,loginName:loginName,password:pwd};
        data = JSON.stringify(data);
        if(name!="" && loginName!="" && pwd!="" && flag1=="" && flag2==""){
            $("#msg-show").html("正在保存中...");
            zudp.ajax("/mm/news/regsave").post(data).then(function (da) {

                if(da=='ok'){
                    $("#msg-show").html("注册成功");
                    ///mm/wxindex/index
                <#--window.location.href='${laterurl!""}';-->
                    window.location.href='/mm/news/tologin';
                }
            });
        }

    }
</script>
</body>
</html>