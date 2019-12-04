<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="/css/third/webuploader.css" rel="stylesheet">
    <link rel="stylesheet" href="/mm/css/index.css">


    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
    <script src="/mm/js/rem.js"></script>
    <script src="/js/zudp.js"></script>
    <title>公众投诉</title>
    <style>
        .port span{width:1.9rem;display: inline-block}
        .icon-img{width:25;height:25}
    </style>
</head>

<body>
<div class="content-app">
    <div class="top flex flex-c-c">
        <div class="top-ret"></div>
        <div class="return" onclick="goIndex()">返回</div>
        <div class="advince">公众投诉</div>
    </div>
    <div class="header-img">
        <div class="table">
            <div class="put">
                <div class="theme">
                    <div class="port flex flex-c-c"><span>主题&nbsp;:</span>
                        <input type="text" id="title" class="tab-input flex-1" maxlength="30"  placeholder="请输入您的来信主题(30字以内)"></div>
                </div>
                <div class="theme">
                    <div class="port flex flex-c-c"><span>内容&nbsp;:</span>
                        <input type="text" id="content" class="tab-input flex-1" maxlength="300" placeholder="请输入您的诉求内容(300字以内)"></div>
                </div>
                <div class="theme">
                    <div class="port flex flex-c-c"><span>投诉人&nbsp;:</span>
                        <input type="text" id="personName" class="tab-input flex-1" maxlength="10"  placeholder="请输入您的姓名"></div>
                </div>
                <div class="theme">
                    <div class="port flex flex-c-c"><span>联系电话&nbsp;:</span>
                        <input type="text" id="personPhone" class="tab-input flex-1"  placeholder="请输入您的联系电话"></div>
                </div>
                <div class="theme">
                    <div class="type">
                        <div class="select-left flex flex-c-c">
                            <span>反应类型&nbsp;:</span>
                            &nbsp;&nbsp;
                            <select class="selected" id="reftype">
                                <option value="0">咨询</option>
                                <option value="1">投诉</option>
                                <option value="2">建议</option>
                            </select>
                        </div>
                    </div>
                </div>

            <#if h5enabledCaptcha??>
                <div class="theme flex flex-c-c">
                    <div class="yzm-d flex-1"><input type="text" name="captcha" id="sub_captcha" class="form-control login_captcha" placeholder="验证码" required="" style="height: 1rem;"/></div>
                    <div class="yzm-img"><img class="" id="captcha"  src="/img/h5captcha" title="点击更换验证码" /></div>
                <#--<div class="yzm-d">看不清换一种</div>-->
                </div>
            </#if>
                <div class="theme">
                    <div class="port">添加附件&nbsp;:</div>
                    <div class="enclosure port flex">
                        <a id="xg_rar" href="#"><img src="/img/phone.png" alt=""></a>
                        <a href="#" onclick="recreq()"><img src="/img/music.png" alt=""></a>
                    <#--<a href="#"><img src="/img/phone.png" alt="">-->
                    <#--<input type="file" name="camera-file" accept="image/*;capture=camera" class="uld-phone"/></a>-->
                    </div>
                    <div id='listFile'></div>
                    <div id="fileShowName"></div>
                </div>
            </div>
        </div>
    </div>


    <input class="btn" type="submit" id="save-btn" value="提交">
</div>


</body>
</html>