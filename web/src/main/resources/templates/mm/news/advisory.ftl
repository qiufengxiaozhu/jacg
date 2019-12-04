<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">

    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="/mm/css/index.css">
</head>
<body>
<div class="container-app">
    <div class="container-app" style="background: #F6F6F6">
        <div class="top flex flex-c-c">
            <div class="top-return"></div>
            <div class="return" onclick="goIndex()">返回</div>
            <div class="advince">公众咨询</div>
        </div>
        <div class="adv-box">
            <div class="adv-info flex flex-c-c">
                <div class="adv-header"><img src="/mm/img/head.png" alt="" class=""></div>
                <div class="adv-speak">HI 请问你有什么能帮到你的</div>
            </div>
        </div>
        <div class="adv-footer">
            <div class="adv-bottom flex flex-c-c">
                <div class="adv-yy"><img src="/mm/img/yy.png" alt=""></div>
                <div class="adv-input flex flex-c-c flex-1">
                    <input type="text" class="flex-1">
                    <div class="adv-bq"><img src="/mm/img/xl.png" alt=""></div>
                </div>
                <div class="adv-close"><img src="/mm/img/adv-close.png" alt="" class=""></div>
            </div>
            <div class="adv-gn flex flex-wrap">
                <div class="adv-item">
                    <img src="/mm/img/myimg.png" alt="" class="" style="margin:0.1rem auto 0.2rem">
                    <p>相册</p>
                </div>
                <div class="adv-item">
                    <img src="/mm/img/myphone.png" alt="" class="">
                    <p>拍照</p>
                </div>
                <div class="adv-item">
                    <img src="/mm/img/vadio.png" alt="" class="">
                    <p>视频</p>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    function goIndex() {
        window.location.href='/mm/news/index';
    }
</script>
</body>
</html>