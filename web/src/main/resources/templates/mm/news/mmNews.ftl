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
                <div class="nlist-item flex " onclick="goNewDetail('${news.id}')">
                    <div class="nli-left">
                        <img src='${news.path!"/mm/img/login-top.png"}' alt="" class="">
                    </div>
                    <div class="nli-right flex-1">
                        <p class="nli-tit">${news.title!""}</p>
                        <div class="nli-type flex flex-c-c">
                            <div class="nli-sp">${news.category!}</div>
                        </div>
                        <p class="nli-time">
                            <span>${news.clicks!}人观看</span>
                            <span>${news.newsDate!""}</span>
                        </p>
                    </div>
                </div>
            </#list>
        </div>


	</div>
	<script type="text/javascript" src="/mm/js/iscroll.js"></script>
	<script type="text/javascript" src="/mm/js/navbarscroll.js"></script>
    <script type="text/javascript" src="/laydate/laydate.js"></script>
	<script>

        //日历控件
        lay('#version').html('-v'+ laydate.v);
        //执行一个laydate实例
        laydate.render({
            elem: '#test1' //指定元素
        });

        //查询时间
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

            window.location.href='/mm/news/newsDetail/'+obj+'?type=1';

        }
	</script>

</body>
</html>