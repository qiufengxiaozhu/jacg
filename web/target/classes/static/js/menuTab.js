var tname = [];//侧边栏名称集合,每点击一条名称存放里面
var count = 0; //tab个数
var nowCount=0;//当前显示tab的索引
var leftShow = true;//左边侧边栏默认为显示;
var onceTabWidth = 0; //当前tab宽度
var tabPstLeft = 0;   //当前索引tab页离左边的距离
var visibleW = 0;   //当前可见宽度
var slideLeft = 0; //实际位移距离
var maxSlideW = 0;  //当前可位移最大距离
var activeLiArr = []; //展开侧边栏
tabVisibleWidth();  //默认获取一次tab可见宽度
$(window).resize(function(){
    if($(window).width()<=768){
        leftShow = false;
    }
    tabVisibleWidth();
    maxSlideWidth();    //获取当前tab最大可位移距离
})
$(".navbar-minimalize").click(function(){
    leftShow = !leftShow;
    tabVisibleWidth();
    maxSlideWidth();
}) //侧边栏切换按钮

function changeIframe(hrefs, treeName, obj) {
    setNav(hrefs,treeName,obj);
}


$(document).on("contextmenu",".J_menuTab",function(e){
    e.preventDefault();
})   //去除浏览器默认右键
$(document).on("mousedown",".J_menuTab",function(e){     //tab点击
    e.stopPropagation();
    this.oncontextmenu=function(){
        e.preventDefault();
    }
    if(e.button == 0){
        $(".iframe-f5-pane").hide();
    }
    if(e.button == 2){
        $(this).find(".iframe-f5-pane").show().end().siblings("").find(".iframe-f5-pane").hide();
    }
    nowCount = $(this).index();
    tabChange(nowCount);
    slide();
})
$(document).on("mousedown",function(){
    $(".iframe-f5-pane").hide();
})
$(document).on("mousedown",".fa-times-circle",function(e){
    e.stopPropagation();
})
$(document).on("click",".fa-times-circle",function(e){   //tab删除
    e.stopPropagation();
    var _this = $(this).parent();
    var onceCount = _this.index();
    var name = _this.attr("data-name");
    var index = tname.indexOf(name);    //获取在数组中索引
    $(".page-tabs-content a").eq(onceCount).remove();
    $(".J_mainContent iframe").eq(onceCount).remove();
    tname.splice(index,1);
    if(onceCount == count && onceCount == nowCount || onceCount<=nowCount){   //如果索引是最后一个tab页，点击后索引-1,或者删除之前的tab页
        nowCount--;
    }
    count--; //总数减一
    tabChange(nowCount);
    slide();
    maxSlideWidth();
})
$(document).on("click",".J_tabLeft",function(){   //左边按钮
    if(slideLeft!=0){
        $(".page-tabs-content").stop(true).animate({
            "left":0,
        })
    }
})
$(document).on("click","#tabRight",function(){   //右边按钮
    $(".page-tabs-content").stop(true).animate({
        "left":-maxSlideW,
    })
    slideLeft = maxSlideW;
})
$(document).on("click",".J_tabShowActive",function(){   //定位当前选项卡
    slide();
})
$(document).on("click",".J_tabCloseOther",function(){   //关闭其他选项卡
    closeOthers()
})
$(document).on("mousedown",".closeOthers",function(e){   //右键关闭其他
    e.stopPropagation();
    $(this).parent().hide();
    closeOthers();
})
$(document).on("click",".J_tabCloseAll",function(){    //关闭全部选项卡
    $(".page-tabs-content>a").not(":first").remove();
    $(".J_mainContent>iframe").not(":first").remove();
    tname.splice(0,tname.length);
    count=0;
    nowCount=0;
    tabPstLeft=0;
    maxSlideW=0;
    slide();
    tabChange(nowCount);
})
$(document).on("mousedown",".iframe-f5",function(e){     //刷新当前页
    e.stopPropagation();
    $(this).parent().hide();
    var onceIndex = $(this).parents("a").index();
    var src= $(".J_mainContent iframe").eq(onceIndex).attr("src");
    $(".J_mainContent iframe").eq(onceIndex).attr("src",src);
})
$(document).on("click","#personData",function(){      //个人资料
    var hrefs="profile.html";
    var treeName = "个人资料";
    var obj = this;
    setNav(hrefs,treeName,obj);
})
$(document).on("click","#xa_rar",function () {
    var hrefs="/profile?platfrom=html";
    var treeName = "个人资料";
    var obj = this;
    setNav(hrefs,treeName,obj);
});
function tabVisibleWidth() {     //tab可见宽度
    var docW = $(window).width();
    var left_menu = 0;
    if (leftShow) {
        left_menu = 220;
        for(var i = 0;i<activeLiArr.length;i++){
            $(activeLiArr[i]).addClass("active").children("ul").slideDown();
        }
    } else {    //左边导航栏隐藏
        left_menu = 70;
        var Lis = $("#side-menu").find("li");
        activeLiArr.splice(0,activeLiArr.length);
        for (var i = 0; i < Lis.length; i++) {
            if ($(Lis[i]).hasClass("active")) {
                activeLiArr.push(Lis[i])
                $(Lis[i]).removeClass("active").children("ul").slideUp();
            }
        }
    }
        var button_left = $(".J_tabLeft").innerWidth();
        var button_right = $("#tabRight").innerWidth();
        button_right += $("#tabRight1").innerWidth();
        button_right += $("#tabRight2").innerWidth();

        visibleW = docW - left_menu - button_left - button_right;

}
function tabChange(index){               //每次tab和iframe改变执行此方法
    $(".page-tabs-content>a").eq(index).addClass("active").siblings().removeClass("active");
    $(".J_mainContent iframe").eq(index).show().siblings().hide();
}
function slide(){                      //判断当前元素是否可见计算位移距离
    tabPstLeft = $(".page-tabs-content>a").eq(nowCount).position().left;
    onceTabWidth = $(".page-tabs-content>a").eq(nowCount).innerWidth();
    if(tabPstLeft + onceTabWidth>visibleW){
        slideLeft = tabPstLeft + onceTabWidth - visibleW;
    }else{
        slideLeft = 0
    }
    $(".page-tabs-content").stop(true).animate({
        "left":-slideLeft,
    })
}
function maxSlideWidth(){     //获取当前tab个数可位移最大距离
    tabPstLeft = $(".page-tabs-content>a").eq(count).position().left;
    onceTabWidth = $(".page-tabs-content>a").eq(count).innerWidth();
    if(tabPstLeft+onceTabWidth<=visibleW){
        maxSlideW = 0;
    }else{
        maxSlideW = tabPstLeft + onceTabWidth - visibleW;
    }
}
function closeOthers(){
    if(nowCount == 0){  //如果当前页签是首页
        tname.splice(0,tname.length);
        $(".page-tabs-content>a").eq(nowCount).show().siblings().remove();
        $(".J_mainContent>iframe").eq(nowCount).show().siblings().remove();;
        count=0;
        nowCount=0;
    }else{
        $(".page-tabs-content>a").eq(nowCount).show().siblings().not(":first").remove();
        $(".J_mainContent>iframe").eq(nowCount).show().siblings().not(":first").remove();;
        var firstEl = tname[nowCount-1];
        tname.splice(0,tname.length);
        tname[0] = firstEl;       //当前元素是在清空数组后的第一个元素;
        count=1;
        nowCount=1;
    }
    tabPstLeft=0;
    maxSlideW=0;
    slide();
    tabChange(nowCount);
}
function setNav(hrefs,treeName,obj){
    if(hrefs==="/sbom")return;
    if (tname.indexOf(treeName) == -1) {   //如果数组里没有当前tab名字,增加一个新的tab
        count++;
        nowCount++;
        $(".page-tabs-content").append(
            '<a href="javascript:;" class="J_menuTab my-dvr" sf="0" data-name="'
            + treeName + '">' + treeName
            + '<i class="fa fa-times-circle" style="margin-left:6px;"></i>'
            + '<span class="iframe-f5-pane">'
            +' <span class="iframe-f5">刷新当前页</span>'
            +' <span class="closeOthers">关闭其他</span>'
            +' </span>'
            + '</a>'
        );
        $("#content-main").append(
            '<iframe class="J_iframe" name="iframe" width="100%" height="100%" src="' + hrefs
            + '" frameborder="0" style="display:none" seamless></iframe >'
        );

        var iframeWindow = $(".J_iframe");
       iframeWindow.on("load",function(){    //iframe点击事件
           iframeWindow.contents().click(function(){
               $(".iframe-f5-pane").hide();
               if($(".nav-header .profile-element").hasClass("open")){
                   $(".nav-header .profile-element").removeClass("open")
               }
           })
       })
        tname.push(treeName);
        nowCount = count;   //如果是新的tab加在最后面,当前的tab也变为tab总数
        tabChange(nowCount);
        slide();
        maxSlideWidth();
    } else {
        nowCount = tname.indexOf(treeName) + 1; //获取当前这个元素在集合里面的索引
        tabChange(nowCount);
        slide();
    }
}
function menuActive(){
    var Lis = $("#side-menu").find("li");
    activeLiArr.splice(0,activeLiArr.length);
    for (var i = 0; i < Lis.length; i++) {
        if ($(Lis[i]).hasClass("active")) {
            activeLiArr.push(Lis[i])
        }
    }
}



    $(document).on("click", "#side-menu>li>a", function () {
        var index = $("#side-menu>li").not("li:first").children("a").index($(this));
        $("#side-menu>li>a").siblings(".nav-second-level").stop(false, true).slideUp().eq(index)
            .stop(false, true).slideDown();
        $("#side-menu>li>a").parent("li").removeClass("active").eq(index).addClass("active");
        if(!leftShow){
            menuActive()
        }
    })
    $(document).on("click", "#side-menu>li.active>a", function () {

        $(this).siblings(".nav-second-level").stop(false, true).slideUp();
        $(this).parent("li").removeClass("active");
        if(!leftShow){
            menuActive()
        }
    });
    $(document).on("click", ".nav-second-level>li>a", function () {

        $(this).siblings(".nav-third-level").stop(false, true).slideDown();
        $(this).parent("li").addClass("active");
        $(this).parent("li").siblings("li").find(".nav-third-level").stop(false, true).slideUp();
        $(this).parent("li").siblings("li").removeClass("active");
        if(!leftShow){
            menuActive()
        }
    });
    $(document).on("click", ".nav-second-level>li.active>a", function () {

    $(this).siblings(".nav-third-level").stop(false, true).slideUp();
    $(this).parent("li").removeClass("active")
    if(!leftShow){
        menuActive()
    }
});
$(document).on("click", ".nav-third-level>li>a", function () {
    $(this).siblings(".nav-four-level").stop(false, true).slideDown();
    $(this).parent("li").addClass("active")
    $(this).parent("li").siblings("li").find(".nav-four-level").stop(false, true).slideUp();
    $(this).parent("li").siblings("li").removeClass("active");
    if(!leftShow){
        menuActive()
    }
});
$(document).on("click", ".nav-third-level>li.active>a", function () {
    $(this).siblings(".nav-four-level").stop(false, true).slideUp();
    $(this).parent("li").removeClass("active")
    if(!leftShow){
        menuActive()
    }
});
$(document).on("click",'.navbar-minimalize',function () {
    var hasMini=$(this).parents('body').hasClass('mini-navbar');
    if(hasMini){
        $(".nav").find("li.active").css("display","none");
    }
});
$(document).on('mouseenter mouseleave','.mini-navbar .nav li',function(){
    $(this).children('ul').toggle();
    $(this).children("a").toggleClass("on")
});
