<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人资料</title>
    <link href="/css/third/bootstrap.min.css" rel="stylesheet">
    <link href="/css/third/font-awesome.min.css" rel="stylesheet">
    <link href="/css/third/custom.css" rel="stylesheet">
    <link href="/css/third/sweetalert.css" rel="stylesheet"/>
    <link href="/css/third/toastr.min.css" rel="stylesheet"/>
    <link href="/css/third/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/third/animate.min.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
    <link href="/css/third/webuploader.css" rel="stylesheet">
    <link href="/css/third/webuploaderStyle.css" rel="stylesheet">
    <link href="/css/third/summernote.css" rel="stylesheet">

    <link href="/css/third/jquery.Jcrop.css" rel="stylesheet">
    <link href="/css/admin/avatar.css" rel="stylesheet">
    <link href="/css/third/webuploader.css" rel="stylesheet">


    <style>
        #crop_image{
            width: 64%;
        }
    </style>
</head>
<body>
<!--头像修改-->
<div style="display: none">
    <form id="image-form">
        <div id="xg_raraa"></div>
        <input type="hidden" name="file" id="file">
        <input type="hidden" name="width" id="width">
        <input type="hidden" name="height" id="height">
        <input type="hidden" name="windowHeight" id="windowHeight">
        <input type="hidden" name="windowWidth" id="windowWidth">
    </form>
</div>

<div class="modal inmodal fade" id="img" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
    <div id="crop_image">
        <div id="crop_image_top">
            <h4>编辑图片</h4>
        </div>
        <div id="crop_image_content">

            <img src="" class="jcrop-preview imga" id="target" alt="待裁剪图片" />
            <!-- 预览 -->
            <div id="preview-pane">
                <div class="preview-container">
                    <img src="" class="jcrop-preview" alt="Preview" />
                </div>
            </div>
        </div>

        <div id="crop_image_bottom">
            <input class="btn" type="button" value="取消" onclick="unsaveImage()">
            <input id="submitBtn" class="btn" type="button" value="确定" onclick="saveCropImage()">
        </div>
    </div>
</div>
<div class="wrapper wrapper-content">
    <div class="row animated fadeInRight">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content clearfix">
                    <div class="col-sm-8">
                        <h4>基本资料</h4>
                        <form class="form-horizontal" id="personData_form">
                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label">姓名：</label>
                                <div class="col-sm-7">
                                    <input type="text" maxlength="255" name="name" id="user_name" required placeholder="姓名" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label">年龄：</label>

                                <div class="col-sm-7">
                                    <input type="text" name="age" maxlength="3" id="user_age"  placeholder="年龄" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label">邮箱：</label>

                                <div class="col-sm-7">
                                    <input type="text" name="email"  maxlength="64" id="user_email" required placeholder="邮箱" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label">电话号码：</label>

                                <div class="col-sm-7">
                                    <input type="text" name="phone" maxlength="16" id="user_phone" placeholder="电话号码" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label">出生日期：</label>

                                <div class="col-sm-7">
                                    <input type="text" name="birthday" id="user_birthday"  placeholder="出生日期" class="form-control">
                                </div>
                            </div>
                            <div class="form-group" style="display: none">
                                <input type="text" name="avatar" id="user_avatar">
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label my-control-label">所属组织：</label>
                                <div class="col-sm-7">
                                    <h3 id="user_group"></h3>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-primary" id="save_profile" style="margin-left: 246px">
                                    修改资料
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-4" style="width:27.333333%">
                        <h4>头像</h4>
                        <div style="text-align: center;margin: 30px 0">
                            <img alt="image" id="user_image" class="img-circle" style="width: 200px;height: 200px">
                        </div>
                        <div class="form-group" style="text-align: center;">
                            <#--<button type="button" id="xg_rar" class="btn btn-primary">
                                修改头像
                            </button>-->
                            <div id="xg_rar">修改头像</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/js/third/jquery.min.js"></script>
<script src="/js/third/bootstrap.min.js"></script>
<script src="/js/third/jquery.validate.min.js"></script>
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script src="/js/third/jquery.dataTables.min.js"></script>
<script src="/js/third/dataTables.bootstrap.js"></script>
<script src="/js/third/icheck.min.js"></script>
<script src="/js/third/laydate/laydate.js"></script>
<script src="/js/zudp.js"></script>
<script src="/js/pluginInit/dataecho.js"></script>
<script src="/js/third/jquery.Jcrop.js"></script>
<script src="/js/sys/avatar.js"></script>
<script src="/js/third/webuploader.js"></script>

<script>
    $(document).ready(function () {
        getUserProfile();
        laydate.render({
                           elem: '#user_birthday',
                           max: zudp.util.timeformater(Date.parse(new Date()))
                       });

        $("#personData_form").validate({
                                     rules: {
                                         name: {
                                             required:true,
                                         },
                                         age: {
                                             digits:true,
                                             range:[0,200]
                                         },
                                         aaa:{
                                             required:true,
                                             minlength:2
                                         },
                                         phone: {
                                             isPhoneNum:true
                                         },
                                         email: {
                                             required:true,
                                             email:true,
                                             checkEmail:true
                                         },
                                     },
                                     messages: {
                                         name: {
                                             required: "请输入你的姓名",
                                         },
                                         age:{
                                             digits: "请输入正确的类型",
                                             range: "请输入正确年龄范围(0~200)"
                                         },
                                         email: {
                                             required:"请填写邮箱",
                                             email:"请输入正确邮箱格式"
                                         },
                                     },ignore: []
                                 });
    });
    function getUserProfile() {
        zudp.ajax("/api/user/profile").get().then(function (da) {
            zudp.plugin.form("#personData_form").reset();
            $("#user_name").val(da.name);
            $("#user_age").val(da.age);
            $("#user_phone").val(da.phone);
            $("#user_email").val(da.email);
            $("#user_avatar").val(da.avatar);
            $("#user_birthday").val(zudp.util.timeformater(da.birthday));
            if(da.group!=null)
            $("#user_group").html(da.group.name);
            $("#user_image").attr("src",da.avatar);
        },function (error) {
            zudp.plugin.dialog("error").alert("系统发生未知异常", "提示");
        });
    }

    $("#save_profile").click(function () {
        if($("#personData_form").valid()){
            console.log($("#textareaValue").val());
            zudp.ajax("/api/user/profile").put(zudp.util.formData2json("#personData_form")).then(function (da,msg) {
                if(msg.success){
                    zudp.plugin.dialog("success").alert("修改成功","提示");
                    getUserProfile();
                }else {
                    zudp.plugin.dialog("error").alert("修改失败", "提示");
                }
            },function (error) {
                zudp.plugin.dialog("error").alert("系统异常","提示");
            });
        }
    });

    function checkEmail(data) {
        var result;
        zudp.ajax("/api/user/checkEmail").synch().get({"email":data}).then(function (da) {
            if(zudp.util.isBoolean(da)){
                result=da;
            }else{
                result=false;
            }
        },function (error) {
            result=false;
        });
        return result;
    }

    var uploader = WebUploader.create({
                                          // swf文件路径
                                          swf: '/css/third/Uploader.swf',
                                          auto: true,
                                          // 文件接收服务端。
                                          server: '/upload/custom',

                                          // 选择文件的按钮。可选。
                                          // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                                          pick: '#xg_rar',

                                          // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
                                          resize: false,
                                          //重复上传
                                          duplicate :true,
                                          accept:{
                                              extensions:'bmp,jpg,png,tiff,gif,pcx,fpx,svg,raw',
                                              title:'image',
                                              mimeTypes:'img/*'
                                          }
                                      });

    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
    uploader.on( 'uploadSuccess', function( file,response) {
        change(response);
    });
    /*修改头像*/
   /* $("#xg_rar").click(function () {
        $('.webuploader-pick').next().find("input").click();
        $('.webuploader-pick').next().find("object").click();
    });*/
    //jquery 手机号码验证
    jQuery.validator.addMethod("isPhoneNum",function (value, element, param) {
        var length = value.length;
        // var mm = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        return this.optional(element) || (length == 11 && zudp.util.checkStr(value, "phone"));
    }, "请正确填写您的手机号码");

    jQuery.validator.addMethod("checkEmail",function (value, element, param) {
        return checkEmail(value);
    }, "邮箱不唯一");


</script>
</html>