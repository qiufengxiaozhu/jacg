$(document).ready(function () {
    $("#loginName").focus();
    $("button[type='button']").click(function () {
        if ($("#registerForm").valid()) {
            var data = zudp.util.formData2json("#registerForm");
            zudp.ajax("/api/user/userRegister")
                .post(data)
                .then(function (value, data) {
                    if (zudp.util.isBoolean(value)) {
                        if (value) {
                            swals("邮件已发送请及时激活, 正在为你跳转到登录...");
                        } else {
                            swals("邮件发送失败, 正在为你跳转到登录...");
                        }
                    } else {
                        swals("邮件未发送！！")
                    }
                    window.setTimeout(function () {
                        window.location.href = "/login";
                    }, 3000);
                });
        }
    });

    $("#registerForm").validate({
        rules: {
            loginName: {
                isLoginName: true,
                required: true,
                remote: {
                    url: "/api/user/checkLoginName",
                    type: "get",
                    data: {
                        "loginName": function () {
                            return $("#user_loginName").val();
                        }
                    },
                    dataFilter: function (data, type) {
                        var da = JSON.parse(data).data;
                        if (zudp.util.isBoolean(da)) {
                            return da;
                        } else {
                            return false;
                        }
                    }
                }
            },
            name: "required",
            email: {
                required: true,
                email: true,
                remote: {
                    url: "/api/user/checkEmail",
                    type: "get",
                    data: {
                        "email": function () {
                            return $("input[name='email']").val();
                        }
                    },
                    dataFilter: function (data, type) {
                        var da = JSON.parse(data).data;
                        if (zudp.util.isBoolean(da)) {
                            return da;
                        } else {
                            return false;
                        }
                    }
                }
            },
            password1: {
                required: true,
                equalTo: "#user_password"
            },
            password:{
                required: true,
                passwordLength: true
            }
        },
        messages: {
            loginName: {
                required: "请输入您的登录名",
                remote: "用户名已存在"
            },
            name: "请输入您的名字",
            email: {
                required: "请填写邮箱",
                email: "请输入正确邮箱格式",
                remote: "该邮箱已被注册"
            },

            password1: {
                required: "请再次输入密码",
                equalTo: "两次输入密码不一致"
            },
            password: {
                required: "请输入密码"
            }
        }
    });

    var config = {
        submitHandler: function (form) {
            form.submit();
        }
    };
});

function checkRegister() {
    zudp.ajax("/api/user/registerCheck")
        .get()
        .then(function (value, data) {
            if (zudp.util.isBoolean(value)) {
                if (value) {
                    $("#loginForm").hide();
                    $("#forgetPassword").hide();
                    $("#register").show();
                } else {
                    swals("注册未开放！！");
                }
            } else {
                swals("系统发生未知错误");
            }
        })
}

function submit() {
    var username = $("#loginNames").val();
    if (!username) {
        swals("请输入账号");
    } else {
        var data = {
            "username": username
        };
        zudp.ajax("/api/user/forgetPassword")
            .get(data)
            .then({
                success: function () {
                    swals("邮件已发送，请注意接收");
                },
                fail: function (data) {
                    swals(data.msg);
                },
                error: function (data) {
                    swals("邮件发送失败,服务器发生未知错误");
                }
            });
    }
}

$(".showForgetPassword").click(function showForgetPassword() {
    $("#loginForm").hide();
    $("#forgetPassword").show();
    $("#register").hide();
})

$(".showLogin").click(function showLogin() {
    $("#loginForm").show();
    $("#forgetPassword").hide();
    $("#register").hide();
})

function swals(a) {
    swal({
        title: a,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "确定",
    });
}

jQuery.validator.addMethod("isLoginName", function (value, element, param) {
    var length = value.length;
    var loginName = /^[a-zA-Z][a-zA-Z0-9_]*$/;
    return this.optional(element) || (length <= 16 && loginName.test(value));
}, "请输入至多16位的以字母开头只能包含大小写字母数字下划线的用户名");

jQuery.validator.addMethod("passwordLength", function (value, element, param) {
    var length = value.length;
    return this.optional(element) || (length <= 32 && length >= 6);
}, "请输入6到16位密码");

$(".user-register").on("click", function () {
    $(".login_title").css("left", "0");
    $(".logo-name").css({"font-size": "80px", "letter-spacing": "0"});
    $(".loginscreen.middle-box").css({"width": "350px"});
});
$(".show-login").on("click", function () {
    $(".login_title").css("left", "-90px");
    $(".logo-name").css({"font-size": "180px", "letter-spacing": "10px"});
    $(".loginscreen.middle-box").css({"width": "300px"});
});
