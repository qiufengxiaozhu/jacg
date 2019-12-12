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

        <div class="top flex flex-c-c">
            <div class="top-return"></div>
            <div class="return" onclick="goIndex()">返回</div>
            <div class="advince">公众新闻</div>
        </div>

		<div class="wrapper wrapper03" id="wrapper01">
			<div class="scroller">
				<ul class="clearfix">
					<li data="0"><a href="javascript:void(0)">新闻列表</a></li>
				</ul>
			</div>
		</div>

		<div class="fb-time">
            <input type="text" class="demo-input" placeholder="请选择日期" id="test1" style="border: 1px ;height:20px">
            <input type="button" id="date" onclick="selectDate()" style="color: blue;background-color: whitesmoke;border: #fafffa;margin-right: 10px" value="查询">
        </div>

        <div class="new-list">
            <#list Newslist! as news >

                <div class="nlist-item flex " >
                    <div class="nli-left" onclick="goNewDetail('${news.id}')">
                        <img src='${news.path!"/mm/img/login-top.png"}' alt="" class="">
                    </div>
                    <div class="nli-right flex-1" >
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
                        <div class="nli-fx" onclick="getNews('${news.id}','${news.title!}','${news.category!}','${news.path!}')"></div>
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
                        <img src="/mm/img/pyq.png" alt="" class="" >
                        <p class="">  朋友圈 </p>
                    </div>
                    <div class="fx-item" style="float: left" id="weibo">
                        <img src="/mm/img/LOGO_48x48.png" alt="" class="" >
                        <p class="">新浪微博</p>
                    </div>
                    <div class="fx-item" style="float: left" id="cancel-btn">
                        <img src="/mm/img/adv-close.png" alt="" class="" >
                        <p class="">取消分享</p>
                    </div>

                </div>
            </div>
        </div>

	</div>
	<script type="text/javascript" src="/mm/js/iscroll.js"></script>
	<script type="text/javascript" src="/mm/js/navbarscroll.js"></script>
    <script type="text/javascript" src="/laydate/laydate.js"></script>
	<script>

        //定义全局变量 新闻id、标题、正文、图片路径
        var myId = "";
        var myTitle = "";
        var myHref = "";
        var myUrl = "";
        var myIp = '${ResultIP!}' + ':8080';

        //分享内容的链接,链接一定要用encodeURIComponent处理一下，不然分享之后的链接会没有参数
//        window.shareUrl = encodeURIComponent(location.href);
//        alert(window.shareUrl);
//        alert(location.href);


        //日历控件
        lay('#version').html('-v'+ laydate.v);
        //执行一个laydate实例
        laydate.render({
            elem: '#test1' //指定元素
        });

        /**
         *  新闻分享单击事件
         */
        function getNews(id,title, url, picurl) {

            <#--alert("title : " + title+"   "+'${ResultIP!}');-->
//            alert(myPicurl);
            $(".fx-fixed").show();
            myId = id;
            myTitle = title;
            myUrl = url;
            myPicurl = myIp + picurl;
            window.shareUrl = '/mm/news/newsDetail/'+myId+'?type=1';
        }

        /**
         * 微信分享
         */
        $("#weixin").on("click",function(){
            alert("微信分享");

        });

        /**
         *  微博分享
         */
        $("#weibo").on("click",function(){
            var d= window;
//            alert(myTitle + myUrl + myPicurl);    //http://service.weibo.com/share/share.php? //http://v.t.sina.com.cn/share/share.php?
                var sharesinastring='http://service.weibo.com/share/share.php?' +
                        'title='+myTitle+
                        '&url='+d.+
                        '&content=utf-8' +
                        '&sourceUrl='+myUrl+
                        '&pic='+myPicurl;
                window.open(sharesinastring,'newwindow','height=400,width=400,top=100,left=100');

        });

        /**
         *  取消分享
         */
        $("#cancel-btn").on("click",function(){
            $(".fx-fixed").hide();
        });

        /**
         * 根据时间查询
         */
        $(document).ready(function(){

            $("#date").click(function () {
                var date = $("#test1").val();
//                alert("日期为：  "+date);
                window.location.href='/mm/news/queryNews?newsDate='+date;
            });
        });


        /**
         * 返回新闻首页
         */
        function goIndex() {
            window.location.href='/mm/news/index';
        }

        /**
         * 进入新闻详情页面
         */
        function goNewDetail(obj){

//            alert(obj);

            window.location.href='/mm/news/newsDetail/'+obj+'?type=1';

        }
	</script>

</body>
</html>