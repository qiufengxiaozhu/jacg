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
    <script src="/mm/js/JquerySession.js"></script>
    <link rel="stylesheet" href="/mm/css/index.css">
    <link rel="stylesheet" href="/mm/css/swiper.min.css">
    <style>
        .container {
            max-width: 800px;
            width: 100%;
            margin: 0 auto;
            font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
        }
        .inner-pic{width: 100%;height: auto;text-align: center}
        .inner-pic img{width: 60%;margin:auto}
    </style>
    <link rel="stylesheet" href="/mm/css/css-loader.css">
    <style>
        .thumbs{margin-top:0;border-bottom: 1px solid #efefef}
        .public>div{border-right: 1px solid #efefef;width: 25%;text-align: center}
        .public>div:last-child{border-right: none}
    </style>
</head>
<body>
<div class="container-app content">
    <div class="top">
        <div class="top-ret in-float"><img src="/mm/img/position.png" class="img-float img-1"><div  class="img-float img-font" id="address1">吉安</div><img src="/mm/img/pull.png" class="img-float img-2"></div>
        <div class="advince">首页</div>
        <div class="dex-float"><img src="/mm/img/around.png" class="img-float img-3"><a href="tel:12319"><img src="/mm/img/phone.png" class="img-float img-4"></a></div>
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
                <div class="nlist-item flex " onclick="goNewDetail('${news.id}')"  id="${news.timeZone!}">
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

        <div class="thumbs">
            <div class="thumbs-tit" onclick="goNewPage()" style="border:none">公众服务</div>
        </div>
        <div class="center">
            <div class="flex public">
                <div class="" onclick="goPage(6)"><div class="inner-pic"><img src="/mm/img/arr9.png" alt=""><p>公众调查</p></div></div>
                <div class="flex-1" onclick="goPage(4)"><div class="inner-pic"><img src="/mm/img/arr10.png" alt=""><p>公众上报</p></div></div>
                <div class="flex-1" onclick="goPage(3)"><div class="inner-pic"><img src="/mm/img/arr11.png" alt=""><p>公众投诉</p></div></div>
                <div class="flex-1" onclick="goPage(5)"><div class="inner-pic"><img src="/mm/img/arr12.png" alt=""><p>便民咨询</p></div></div>
            </div>
        </div>
        <div class="center">
            <div class="flex public">
                <div class="flex-1" onclick="goDianzan()"><div class="inner-pic"><img src="/mm/img/arr9.png" alt=""><p>我要点赞</p></div></div>
                <div class="flex-1" onclick="goPage(10)"><div class="inner-pic"><img src="/mm/img/arr10.png" alt=""><p>积分管理</p></div></div>
                <div class="flex-1" onclick="goPage(0)"><div class="inner-pic"><img src="/mm/img/arr11.png" alt=""><p>排行榜</p></div></div>
                <div class="flex-1" onclick="goCountManage()"><div class="inner-pic"><img src="/mm/img/arr12.png" alt=""><p>统计管理</p></div></div>
            </div>
        </div>

        <div class="thumbs">
            <div class="thumbs-tit" onclick="goNewPage()" style="border:none">我的案件</div>
        </div>
        <div class="center">
            <div class="flex public">
                <div class="" onclick="goPage(1)"><div class="inner-pic"><img src="/mm/img/arr9.png" alt=""><p>我的上报</p></div></div>
                <div class="" onclick="goPage(7)"><div class="inner-pic"><img src="/mm/img/arr10.png" alt=""><p>我的投诉</p></div></div>
                <div class="" onclick="goPage(2)"><div class="inner-pic"><img src="/mm/img/arr11.png" alt=""><p>我的咨询</p></div></div>
                <div class="" onclick="goPage(21)"><div class="inner-pic"><img src="/mm/img/arr11.png" alt=""><p>我的问题上报</p></div></div>
                <div class="" onclick="goPage(9)"><div class="inner-pic"><img src="/mm/img/arr10.png" alt=""><p>市民评论</p></div></div>
            </div>
        </div>

        <div class="thumbs">
            <div class="thumbs-tit" onclick="goNewPage()" style="border:none">我的案件</div>
        </div>
        <div class="center">
            <div class="flex public">
                <div class="flex-1" onclick="getSession()"><div class="inner-pic"><img src="/mm/img/arr9.png" alt=""><p>周边雷达</p></div></div>
                <div class="flex-1" onclick="goPage(2)"><div class="inner-pic"><img src="/mm/img/arr10.png" alt=""><p>地图服务</p></div></div>
                <div class="flex-1" onclick="goPage(8)"><div class="inner-pic"><img src="/mm/img/arr11.png" alt=""><p>便民服务</p></div></div>
                <div class="flex-1" onclick="goSystemCheck()"><div class="inner-pic"><img src="/mm/img/arr12.png" alt=""><p>系统自检</p></div></div>
                <div class="flex-1" onclick="goPage(20)"><div class="inner-pic"><img src="/mm/img/arr12.png" alt=""><p>问题上报</p></div></div>
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
        <div class="flex-1" onclick="goCountManage()">
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
            <div class="city-pos" id="address">吉安</div>
        </div>
        <div>
            <div class="city-place">其他市区</div>
            <div class="place-float clearfix">
                <div class="city-pos city-selected" id="1">吉安市</div>
                <div class="city-pos" id="2">吉州区</div>
                <div class="city-pos" id="3">青原区</div>
                <div class="city-pos" id="4">庐陵新区</div>
                <div class="city-pos" id="5">井开区</div>
            </div>
        </div>

    </div>
</div>
<!-- Loader -->
<div class="loader loader-smartphone is-active" data-screen="检测中..." id="checkIng"></div>
</body>
<script>
    var timeZone;//当前时区
    $(function(){
        $("#checkIng").hide();
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
        });
        $(".mask").on("click",function(){
            $(".slt-city").hide();
            timeZone = $(".place-float .city-selected").attr("id");
            alert("timeZone:"+timeZone)
        });
        $(".place-float .city-pos").on("click",function(){
            var index = $(".place-float .city-pos").index($(this));
            console.log(index);
            $("#address").html("");
            $(".place-float .city-pos").removeClass("city-selected").eq(index).addClass("city-selected");
          var address =  $(".city-selected").text();
            console.log(address);
            $("#address").text(address);
            $("#address").addClass("city-selected");
            $("#address1").text(address);
        });
    });

    function goPage(a){
        if(a==1){
            //我的上报
            var name ='${Session.userName}';
            var phone = '${Session.userPhone}';
            window.location.href='/mm/news/report?name='+name+"&phone="+phone;
        }
        if(a==4){
            //公众上报
            window.location.href='/mm/news/addreport';
        }
        if(a==2){
            var userName ='${Session.userName}';
            var userPhone = '${Session.userPhone}';
            //我的咨询
            window.location.href='/mm/news/advisory?userName='+userName+"&userPhone="+userPhone;
        }
        if(a==5){
            //公众咨询
            window.location.href='/mm/news/addadvisory';
        }
        if(a==7){
            //我的投诉
            window.location.href='/mm/news/myComplain?phone='+'${Session.userPhone}';
        }
        if(a==3){
            //公众投诉
            window.location.href='/mm/news/addComplain';
        }
        if (a == 0) {
            //排行榜
            window.location.href='/mm/rank/ranklist/?phone='+'${Session.userPhone}';
        }
        if(a==6){
            //公众调查
            window.location.href='/mm/queinvest/survey';
        }
        if(a==10){
            //积分管理
            window.location.href='/mm/integrate/integrateList';
        }
        if(a==8){
            //便民服务
            window.location.href='/mm/news/conven';
        }
        if(a==20){
            //问题上报
            window.location.href='/mm/issueReport/toMyIndex';
        }

        if(a==21){
            // 校验用户名和电话号码
            var reportName ='${Session.userName}';
            var reportPhone = '${Session.userPhone}';
            //我的问题上报
            window.location.href='/mm/issueReport/toMyReportList?reportName='+reportName+"&reportPhone="+reportPhone;
        }
        if(a==9) {
            //市民评论
            window.location.href = '/mm/comment/selectAll/';
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
    /*
  * 进入系统自检
  * */
    function goSystemCheck(){
        $("#checkIng").show();
        $.ajax({
            url: "/xtCheckOut/isConnect",
            type: "post",
            dataType: 'json',
            contentType: 'application/json',
            success: function (data) {
                console.log(data);
                $("#checkIng").hide();
                var msg = data.data;
                if(msg.connect){
                    alert("网络无比畅通，尽情使用");
                }else{
                    alert("网络有点小问题哦，请检查");

                }
            }
        });
    }

    /**
     * 进入统计管理
     */
    function goCountManage(){
        window.location.href='/mm/dz/cmanage';
    }
    /*
     获取session传入的值
    * */
    function getSession(){
        var userName =  ""+${Session.userName};
        var userPhone = ${Session.userPhone};
        console.log("userName:"+userName+"---userPhone:"+userPhone);
    /*   var userName =  "<%=session.getAttribute("userName")%>";
       var userPhone =  "<%=session.getAttribute("userPhone")%>";
       alert("userName:"+userName+"---userPhone:"+userPhone);*/
    }
</script>
</html>