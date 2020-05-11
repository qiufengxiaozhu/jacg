<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册页面</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="/mm/css/index.css">
    <script src="/js/zudp.js"></script>
    <style>
        #msg-show{float: left;color: red}
    </style>
</head>
<body>

<form class="new_new_user gl-show-field-errors" aria-live="assertive" id="new_new_user" action="/users" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="rKUSQsQMeMUMsblZTlwz1Gt2aaq5gLcjxXuQKH/AF1LYfeFzeEoo6OQ5n1s/pG8jqNIdrTlbigSNzmvszacnkQ=="><div class="devise-errors">
    <input type="hidden" id="name_error_flag">
    <input type="hidden" id="pwd_error_flag">
    <div class="container-app">
        <div class="ja-login">
            <div class="ja-login-top flex flex-r-c">
                <img src="img/ja-logo.png" alt="" class="ja-logo">
            </div>
            <div class="login-box">
            <div class="login-group flex flex-c-c">
                    <div class="lg-user"></div>
                <input type="text" id="new_user_name" class="login-input flex-1" placeholder="请输入姓名">
            </div>
            <div class="login-group flex flex-c-c">
                    <div class="lg-user"></div>
                <input type="text" id="new_user_username" class="login-input flex-1" placeholder="请输入手机号">
            </div>

            <div class="login-group flex flex-c-c">
            <div class="lg-pwd"></div>
                <input type="password" id="new_user_password" class="login-input flex-1" placeholder="请输入密码">
            </div>
            <div class="submit-container">
                <div class="btn login-btn" id ="loginId" onclick="saveReg()">注册</div>
            </div>
            <div class="regist-user">
                <span id="msg-show" style="margin-left: 25px;"></span>
            </div>
            </div>
        </div>
    </div>
</form>
<script>


    $(document).on("click","#loginId",function () {
        var name = $("#new_user_name").val();
        var tel =  $("#new_user_username").val();
        var password = $("#new_user_password").val();
        if(name == null || name == ''){
            alert("请输入姓名");
        }else if(tel == null || tel == ''){
            alert("请输入电话号码");
        }else if(password == null || password == ''){
            alert("请输入密码");
        }

    })


    $('#new_user_username').on('input propertychange', function() {
        var val=$(this).val();

        if(val==''){
            $("#name_error_flag").val("1");
        }else{
            var reg = /^(13|18|14|17|15)[0-9]{9}$/;
            var r = val.match(reg);
            if(r==null){
                $("#msg-show").html('手机号格式不正确');
                $("#name_error_flag").val("1");
            }else{
                $("#msg-show").html('');
                searchUsername(val);
            }


        }
    });
    $('#new_user_password').on('input propertychange', function() {
        var val=$(this).val();
        if(val==''){
            $("#pwd_error_flag").val("");
        }else{
            var reg = /^(\w){6,15}$/;
            var r = val.match(reg);
            if(r==null){
                $("#msg-show").html('密码长度6-15位');
                $("#pwd_error_flag").val("1");
            }else{
                $("#msg-show").html('');
                $("#pwd_error_flag").val("");
            }
        }
    });
    function searchUsername(username) {
        var date= new Date();
        var param={loginName:username,time:date.getTime()};
        zudp.ajax("/api/user/checkLoginName").get(param).then(function (da) {
            if(da==false){
                $("#msg-show").html('手机号已经被使用');
                $("#name_error_flag").val("1");
            }else{
                $("#msg-show").html('');
                $("#name_error_flag").val("");
            }
        });
    }
    function saveReg(){
        // ;
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
                    window.location.href='/mm/news/tologin';
                }
            });
        }

    }
</script>
</body>
</html>