<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>公众新闻</title>
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">

	<script type="text/javascript" src="/mm/js/rem.js"></script>
	<script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>

	<link rel="stylesheet" href="/mm/css/index.css">
	<style>
		.demo-input {
			height: 0.7rem;
			width: 84%;
			background: #FAFAFA;
		}

		.btn-s {
			height: 0.7rem;
			width: 10%;
			color: blue;
			font-size: 0.4rem;
			background: #fff;
			vertical-align: middle;
		}

		.fb-time {
			margin-top: 0.1rem;
		}
	</style>
</head>
<body>
<div class="container-app">

	<div class="top flex flex-c-c">
		<div class="top-return"></div>
		<div class="return" onclick="goIndex()">返回</div>
		<div class="advince">公众新闻</div>
	</div>

	<div class="wrapper wrapper03" id="wrapper01">
		<div>
            <#--				<ul class="clearfix">-->
            <#--					<li data="0"><a href="javascript:void(0)">新闻列表</a></li>-->
            <#--				</ul>-->
			<div class="fb-time">
				<input type="text" class="demo-input" placeholder="请选择日期" id="test1">
				<input type="hidden" value="${TimeZone}" id="timeText">
				<input type="button" id="date" class="btn-s" value="查询">
			</div>
		</div>
	</div>


	<div class="new-list">
        <#list Newslist! as news >

		<div class="nlist-item flex ">
			<div class="nli-left" onclick="goNewDetail('${news.id}')">
				<img src='${news.path!"/mm/img/login-top.png"}' alt="" class="">
			</div>
			<div class="nli-right flex-1">
				<div onclick="goNewDetail('${news.id}')"
				<p class="nli-tit">${news.title!""}</p>
				<div class="nli-type flex flex-c-c">
					<div class="nli-sp">${news.category!}</div>
				</div>
				<p class="nli-time">
					<span>${news.clicks!}人观看</span>
					<span>${news.newsDate!""}</span>
				</p>
			</div>
			<div class="nli-fx"
			     onclick="getNews('${news.id}','${news.title!}','${news.category!}','${news.path!}')"></div>
		</div>
	</div>


    </#list>
</div>
<div class="fx-fixed" style="display: none">
	<div class="mask"></div>
	<div class="fx-fbox">
		<p class="fx-ftit">分享</p>
		<div class="fx-cnt flex flex-wrap">
			<div class="fx-item" style="float: left" id="weixin">
				<img src="/mm/img/pyq.png" alt="" class="">
				<p class=""> 朋友圈 </p>
			</div>
			<div class="fx-item" style="float: left" id="weibo">
				<img src="/mm/img/LOGO_48x48.png" alt="" class="">
				<p class="">新浪微博</p>
			</div>
			<div class="fx-item" style="float: left" id="cancel-btn">
				<img src="/mm/img/adv-close.png" alt="" class="">
				<p class="">取消分享</p>
			</div>

            <#--<div class="bdsharebuttonbox">-->
            <#--<a href="#" class="bds_more" data-cmd="more"></a>-->
            <#--<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>-->
            <#--<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>-->
            <#--<a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>-->
            <#--<a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>-->
            <#--<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>-->
            <#--</div>-->

		</div>
	</div>
</div>

</div>


<script type="text/javascript" src="/mm/js/iscroll.js"></script>
<script type="text/javascript" src="/mm/js/navbarscroll.js"></script>
<script type="text/javascript" src="/laydate/laydate.js"></script>
<script src="https://cdn.bootcss.com/jquery.qrcode/1.0/jquery.qrcode.min.js"></script>
<script>

	//定义全局变量，使点击了时间查询后，选中的时间仍在输入框中
	<#if NewsDate??>
	    var newsDate = '${NewsDate!}';
	    // alert(newsDate);
	    $("#test1").val(newsDate);
	</#if>

    window._bd_share_config = {
        "common": {
            "bdSnsKey": {},
            "bdText": "",
            "bdMini": "2",
            "bdMiniList": false,
            "bdPic": "",
            "bdStyle": "0",
            "bdSize": "16"
        },
        "share": {},
        "image": {"viewList": ["qzone", "tsina", "tqq", "renren", "weixin"], "viewText": "分享到：", "viewSize": "16"},
        "selectShare": {"bdContainerClass": null, "bdSelectMiniList": ["qzone", "tsina", "tqq", "renren", "weixin"]}
    };

    with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src =
        'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];

    //定义全局变量 新闻id、标题、正文、图片路径
    var myId = "";
    var myTitle = "";
    var myHref = "";
    var myUrl = "";
    var myIp = '${ResultIP!}' + ':8080';

    //日历控件
    lay('#version').html('-v' + laydate.v);
    //执行一个laydate实例
    laydate.render({
        elem: '#test1' //指定元素
        // ,min: 0
        , max: 0
    });
    //前后若干天可选，这里以7天为例
    // laydate.render({
    //       elem: '#test1'
    //  ,min: 0
    //  ,max: 7
    // });


    /**
     *  新闻分享单击事件
     */
    function getNews(id, title, url, picurl) {

        $(".fx-fixed").show();
        myId = id;
        myTitle = title;
        myUrl = url;
        myPicurl = myIp + picurl;
        myHref = 'http://' + myIp + '/mm/news/newsDetail/' + myId + '?type=1';
    }


    /**
     * 微信分享
     */
    $("#weixin").on("click", function () {
        alert("微信分享");

//            var fg = true; //防止微信二维码重复生成的bug
//            var path = window.document.location.href;
//            $('.new_qrcode').fadeIn(500);
//            if(fg){
//                $("#qrcode").qrcode({
//                    text: path,
//                    //设置二维码内容
//                     pic: "https://lenzetech.com/public/static/upload/image/aboutUs/news-01.png",
//                     render: "table", //设置渲染方式
//                     width: 200,    // 设置宽度,默认生成的二维码大小是 256×256
//                     height: 200,      // 设置高度
//                     argin: "auto",
//                     typeNumber: -1,   //计算模式
//                     background: "#fff", //背景颜色
//                     foreground: "#000" //前景颜色
//                     });
//            }
//            fg = false;

        function weixinShareTimeline(title, desc, link, imgUrl) {
            WeixinJSBridge.invoke('shareTimeline', {
                "img_url": imgUrl,
                //"img_width":"640",
                //"img_height":"640",
                "link": link,
                "desc": desc,
                "title": title
            });
        }


    });


    /**
     *  微博分享
     */
    $("#weibo").on("click", function () {
        var d = window;
//            alert(myTitle + myUrl + myPicurl);    //http://service.weibo.com/share/share.php? //http://v.t.sina.com.cn/share/share.php?
        var sharesinastring = 'http://service.weibo.com/share/share.php?' +
            'title=' + myTitle +
            '&url=' + d.myHref +
            '&content=utf-8' +
            '&sourceUrl=' + myUrl +
            '&pic=' + myPicurl;
        window.open(sharesinastring, 'newwindow', 'height=400,width=400,top=100,left=100');

    });

    /**
     *  取消分享
     */
    $("#cancel-btn").on("click", function () {
        $(".fx-fixed").hide();
    });

    /**
     * 根据时间查询
     */
    $(document).ready(function () {

        $("#date").click(function () {
            var date = $("#test1").val();
            var time = $("#timeText").val();
//                alert("时区为：  "+time);
            window.location.href = '/mm/news/queryNews?newsDate=' + date + '&TimeZone=' + time;
        });
    });


    /**
     * 返回新闻首页
     */
    function goIndex() {
        window.location.href = '/mm/news/index?TimeZone=' +${TimeZone};
    }

    /**
     * 进入新闻详情页面
     */
    function goNewDetail(obj) {
        window.location.href = '/mm/news/newsDetail/' + obj + '?type=1';

    }
</script>

</body>
</html>