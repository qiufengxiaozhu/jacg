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
    <div class="content-box container-app">
        <div class="top flex flex-c-c">
            <div class="top-return"></div>
            <div class="return" onclick="goIndex()">返回</div>
            <div class="advince">公众投诉</div>
        </div>
        <div class="header-img">
            <div class="ts-table">
                <div class="put">
                    <div class="theme">
                        <div class="port flex flex-c-c"><span>主题&nbsp;:</span><input type="text" class="tab-input flex-1"
                                                                                     placeholder="请输入您的来信主题(20字以内)"></div>
                    </div>
                    <div class="theme">
                        <div class="port flex flex-c-c"><span>内容&nbsp;:</span><input type="text" class="tab-input flex-1"
                                                                                     placeholder="请输入您的诉求内容(500字以内)"></div>
                    </div>
                    <div class="theme">
                        <div class="port flex flex-c-c"><span>联系人&nbsp;:</span><input type="text" class="tab-input flex-1"
                                                                                     placeholder="请输入您的姓名(20字以内)"></div>
                    </div>
                    <div class="theme">
                        <div class="port flex flex-c-c"><span>联系电话&nbsp;:</span><input type="text" class="tab-input flex-1"
                                                                                     placeholder="请输入您的电话(20字以内)"></div>
                    </div>
                    <div class="theme">
                        <div class="type">
                            <div class="select-left flex flex-c-c">
                                <span>反应类型&nbsp;:</span>
                                &nbsp;&nbsp;
                                <select class="selected">
                                    <option value="0">咨询</option>
                                    <option value="1">投诉</option>
                                    <option value="2">建议</option>
                                </select>
                            </div>

                        </div>
                    </div>

                    <div class="theme">
                        <div class="port flex flex-c-c"><span>填写地址&nbsp;:</span><input type="text" class="tab-input flex-1"></div>
                    </div>
                    <div class="theme">
                        <div class="port">添加附件&nbsp;:</div>
                        <div class="enclosure port flex">
                            <a href="#"><img src="/mm/img/file.png" alt=""></a>
                            <a href="#"><img src="/mm/img/music.png" alt=""></a>
                            <a href="#"><img src="/mm/img/arr15.png" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <input class="sq-btn" type="submit" value="提交">
    </div>
    <script>
        function goIndex(){
            window.location.href='/mm/news/mytousu';
        }
    </script>
</body>
</html>