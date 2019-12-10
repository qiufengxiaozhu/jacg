<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="/mm/js/swiper.min.js"></script>
    <script src="/mm/js/zudp.js"></script>
    <script src="/mm/js/toastr.min.js"></script>

    <link rel="stylesheet" href="/mm/css/index.css">
    <link rel="stylesheet" href="/mm/css/swiper.min.css">
    <style>
        .thumbs{margin-top:0;border-bottom: 1px solid #efefef}
        .public>div{border-right: 1px solid #efefef;width: 25%;text-align: center}
        .public>div:last-child{border-right: none}
    </style>
</head>
<body>
<div class="container-app content">
    <div class="top">
        <div class="top-ret in-float"><img src="/mm/img/position.png" class="img-float img-1"><div  class="img-float img-font">吉安</div><img src="/mm/img/pull.png" class="img-float img-2"></div>
        <div class="advince">首页</div>
        <div class="dex-float"><img src="/mm/img/around.png" class="img-float img-3"><img src="/mm/img/phone.png" class="img-float img-4"></div>
    </div>
    <div class="in-center">

        <#--<div class="center">

            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" onclick="goPage(6)"><img src="/mm/img/swiper.png" alt=""></div>
                    <div class="swiper-slide" onclick="goPage(6)"><img src="/mm/img/swiper.png" alt=""></div>
                    <div class="swiper-slide" onclick="goPage(6)"><img src="/mm/img/swiper.png" alt=""></div>
                    <div class="swiper-slide" onclick="goPage(6)"><img src="/mm/img/swiper.png" alt=""></div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>-->

        <div class="thumbs">
            <div class="thumbs-tit" onclick="goNewPage()" style="border:none">公众新闻</div>
            <div class="thumbs-right flex flex-c-c"><div class="" onclick="goNewPage()">更多</div><img src="/mm/img/right.png" onclick="goNewPage()" class="thumbs-img3"></div>
        </div>

        <#--//新闻列表，展示，取前三条-->

        <div class="new-list">
            <#list Newslist! as news >
                <div class="nlist-item flex " onclick="goNewDetail('${news.id}')">
                    <div class="nli-left">
                        <img src="/mm/img/login-top.png" alt="" class="">
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

        <div class="thumbs">
            <div class="thumbs-tit" onclick="goNewPage()" style="border:none">公众服务</div>
        </div>
        <div class="center">
            <div class="flex public">
                <div class="" onclick="goPage(1)"><div class="inner-pic"><img src="/mm/img/arr9.png" alt=""><p>公众调查</p></div></div>
                <div class="flex-1" onclick="goPage(2)"><div class="inner-pic"><img src="/mm/img/arr10.png" alt=""><p>公众上报</p></div></div>
                <div class="flex-1" onclick="goPage(3)"><div class="inner-pic"><img src="/mm/img/arr11.png" alt=""><p>公众投诉</p></div></div>
                <div class="flex-1" onclick="goPage(4)"><div class="inner-pic"><img src="/mm/img/arr12.png" alt=""><p>便民咨询</p></div></div>
            </div>
        </div>
        <div class="center">
            <div class="flex public">
                <div class="flex-1" onclick="goPage(1)"><div class="inner-pic"><img src="/mm/img/arr9.png" alt=""><p>我要点赞</p></div></div>
                <div class="flex-1" onclick="goPage(2)"><div class="inner-pic"><img src="/mm/img/arr10.png" alt=""><p>积分管理</p></div></div>
                <div class="flex-1" onclick="goPage(3)"><div class="inner-pic"><img src="/mm/img/arr11.png" alt=""><p>排行榜</p></div></div>
                <div class="flex-1" onclick="goPage(4)"><div class="inner-pic"><img src="/mm/img/arr12.png" alt=""><p>统计管理</p></div></div>
            </div>
        </div>

        <div class="thumbs">
            <div class="thumbs-tit" onclick="goNewPage()" style="border:none">我的案件</div>
        </div>
        <div class="center">
            <div class="flex public">
                <div class="" onclick="goPage(1)"><div class="inner-pic"><img src="/mm/img/arr9.png" alt=""><p>我的上报</p></div></div>
                <div class="" onclick="goPage(2)"><div class="inner-pic"><img src="/mm/img/arr10.png" alt=""><p>我的投诉</p></div></div>
                <div class="" onclick="goPage(3)"><div class="inner-pic"><img src="/mm/img/arr11.png" alt=""><p>我的咨询</p></div></div>
            </div>
        </div>

        <div class="thumbs">
            <div class="thumbs-tit" onclick="goNewPage()" style="border:none">我的案件</div>
        </div>
        <div class="center">
            <div class="flex public">
                <div class="flex-1" onclick="goPage(1)"><div class="inner-pic"><img src="/mm/img/arr9.png" alt=""><p>周边雷达</p></div></div>
                <div class="flex-1" onclick="goPage(2)"><div class="inner-pic"><img src="/mm/img/arr10.png" alt=""><p>地图服务</p></div></div>
                <div class="flex-1" onclick="goPage(3)"><div class="inner-pic"><img src="/mm/img/arr11.png" alt=""><p>便民服务</p></div></div>
                <div class="flex-1" onclick="goPage(4)"><div class="inner-pic"><img src="/mm/img/arr12.png" alt=""><p>系统自检</p></div></div>
            </div>
        </div>
    </div>
    <div class="in-bottom flex">
        <div class="flex-1">
            <div class="bot-mess on">
                <div class="bot-img bot-img1"></div>
                <p>首页</p>
            </div>
        </div>
        <div class="flex-1">
            <div class="bot-mess">
                <div class="bot-img bot-img2"></div>
                <p>我的案件</p>
            </div>
        </div>
        <div class="flex-1">
            <div class="bot-mess">
                <div class="bot-img bot-img3"></div>
                <p>地图功能</p>
            </div>
        </div>
        <div class="flex-1">
            <div class="bot-mess">
                <div class="bot-img bot-img4"></div>
                <p>统计管理</p>
            </div>
        </div>
        <div class="flex-1" onclick="goCenter()">
            <div class="bot-mess">
                <div class="bot-img bot-img5"></div>
                <p>个人中心</p>
            </div>
        </div>
    </div>
</div>
<div class="slt-city" style="display: none">
    <div class="mask"></div>
    <div class="alert">
        <div class="this-city">
            <div class="city-place">当前定位城市</div>
            <div class="city-pos city-selected">吉安</div>
        </div>
        <div>
            <div class="city-place">热门城市</div>
            <div class="place-float clearfix">
                <div class="city-pos">北京</div>
                <div class="city-pos city-selected">上海</div>
                <div class="city-pos">北京</div>
                <div class="city-pos">上海</div>
                <div class="city-pos">北京</div>
                <div class="city-pos">上海</div>
                <div class="city-pos">北京</div>
                <div class="city-pos">上海</div>
                <div class="city-pos">上海</div>
                <div class="city-pos">北京</div>
                <div class="city-pos">上海</div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function(){

        var mySwiper = new Swiper('.swiper-container',{
            direction: 'horizontal',
            loop: true,
            speed:1000,
            autoplay: {
                delay: 3000,
            },
            scrollbar: {
                el: '.swiper-scrollbar',
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            }
        });
        $(".top-ret").on("click",function(){
            $(".slt-city").toggle()
        })
        $(".place-float .city-pos").on("click",function(){
            var index = $(".place-float .city-pos").index($(this));
            $(".place-float .city-pos").removeClass("city-selected").eq(index).addClass("city-selected");
        })
    })

    function goPage(a){
        if(a==1){
            //公众上报
            window.location.href='/mm/news/index';
        }
        if(a==2){
            //公众投诉
            window.location.href='/mm/news/mytousu';
        }
        if(a==3){
            //公众咨询
            window.location.href='/mm/news/advisory';
        }
        if(a==4){
            //便民服务
            window.location.href='/mm/news/conven';
        }
        if(a==6){
            //公众调查
            window.location.href='/mm/news/survey';
        }
    }

    /**
     * 个人中心
     */
    function goCenter(){
        window.location.href='/mm/news/pcenter';
    }
    function goDianzan() {
        window.location.href='/mm/dz/dzlist';
    }

    /**
     * 所有已发布新闻列表
    */
    function goNewPage(){
        window.location.href='/mm/news/mmNews';
    }

    /**
     * 进入新闻详情页面
     */
    function goNewDetail(obj){
        window.location.href='/mm/news/newsDetail/'+obj;
    }
</script>
</html>