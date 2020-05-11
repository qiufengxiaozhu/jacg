<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>主页</title>
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link href="/css/third/bootstrap.min.css" rel="stylesheet">
    <link href="/css/third/font-awesome.min.css" rel="stylesheet">
    <link href="/css/third/layers/default/layer.css" rel="stylesheet">
    <link href="/css/third/animate.min.css" rel="stylesheet">
    <!--图片裁剪样式-->
    <link href="/css/third/jquery.Jcrop.css" rel="stylesheet">
    <link href="/css/admin/avatar.css" rel="stylesheet">
    <link href="/css/third/toastr.min.css" rel="stylesheet"/>
    <link href="/css/style.min.css" rel="stylesheet">
    <link href="/css/third/webuploader.css" rel="stylesheet">

    <style>
        .webuploader-pick{
             background: none;
             padding: 0;
             color: inherit;
             text-align: left;
             border-radius: 0px;
         }
        .webuploader-pick-hover{
            background: none;
        }
        .webuploader-container div{
            height: 30px;
            width: 100%;
        }
    </style>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden;">

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

<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close">
            <i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <div class="zl-box">
                            <svg width="150" height="150" viewbox="0 0 150 150">
                                <circle cx="75" cy="75" r="70" stroke-width="5" stroke="#262a33" fill="none"></circle>
                                <circle cx="75" cy="75" r="70" stroke-width="5" stroke="#00A5E0" fill="none" transform="matrix(0,-1,1,0,0,150)" stroke-dasharray="0 1069"></circle>
                            </svg>
                            <div id="span_avatar" class="span_avatar" style="text-align: center;display: block"></div>
                            <#--<span class="percent1"></span>-->
                        </div>
                        <p style="color:#599235;font-size:16px;margin: 0 0 5px;" id="nameId"><strong>Hi! </strong></p>
                        <p style="color: whitesmoke;" id="home_time"></p >
                        <div class="avatar-link btn-group btn-group-justified">
                            <#--<a class="btn" ><i class="fa fa-briefcase"></i></a>-->
                            <#--<a class="btn" ><i class="fa fa-bell-o"></i><em class="green active"></em></a>-->
                            <#--<a class="btn" ><i class="fa fa-envelope-o"></i><em class="active"></em></a>-->
                            <#--<a class="btn" ><i class="fa fa-book"></i></a>-->
                        </div>
                        <#--<a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear">
                                <span class="block m-t-xs"><strong class="font-bold"></strong></span>
                                <span class="text-muted text-xs block"><span id="name"></span><b class="caret"></b></span>
                            </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li>
                                <a class="J_menuItem" id="xg_rar" href="#">修改头像</a>
                            </li>
                            <li><a class="J_menuItem" id="xa_rar" href="#">个人资料</a></li>
                            <li class="divider"></li>
                            <li><a href="/logout">安全退出</a></li>
                        </ul>-->
                    </div>
                    <div class="logo-element">HOME</div>
                </li>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn" href="#"><i class="fa fa-bars"></i></a>
                </div>

                <ul class="nav navbar-top-links navbar-right">
                    <#--<li class="dropdown" id="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning"  id="home-message-count"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages" id="home-message">

                        </ul>
                    </li>-->
                    <li class="dropdown hidden-xs">
                        <a class="right-sidebar-toggle" aria-expanded="false"> <i class="fa fa-tasks"></i> 帮助</a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft">
                <i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs home-page-tabs">
                <div class="page-tabs-content my-dvr">
                    <a href="javascript:;" class="active J_menuTab"
                       data-id="index_v1.html">
                        首页
                        <#--<span class="iframe-f5-pane">-->
                            <#--<span class="iframe-f5">刷新当前页</span>-->
                            <#--<span class="closeOthers">关闭其他</span>-->
                        <#--</span>-->
                    </a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight" id="tabRight">
                <i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right" id="tabRight1">
                <button class="dropdown J_tabClose" data-toggle="dropdown">
                    关闭操作<span class="caret"></span>
                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a></li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
                </ul>
            </div>
            <a href="/logout" class="roll-nav roll-right J_tabExit" id="tabRight2"><i
                    class="fa fa fa-sign-out"></i> 退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%"
                    src="/index" frameborder="0" data-id="index_v1.html" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">
                &copy; 2017-2018 <a href="#" target="_blank">zudp</a>
            </div>
        </div>
    </div>
    <!--右侧部分结束-->
    <!--右侧边栏开始-->
    <div id="right-sidebar">
        <div class="sidebar-container">
            <ul class="nav nav-tabs navs-3">
                <li class="active"><a data-toggle="tab" href="#tab-1"> <i
                        class="fa fa-gear"></i> 主题
                </a></li>
               <#-- <li class=""><a data-toggle="tab" href="#tab-2"> 通知 </a></li>
                <li><a data-toggle="tab" href="#tab-3"> 项目进度 </a></li>-->
            </ul>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="sidebar-title">
                        <h3>
                            <i class="fa fa-comments-o"></i> 主题设置
                        </h3>
                        <small><i class="fa fa-tim"></i>
                            你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。
                        </small>
                    </div>
                    <div class="skin-setttings">
                        <div class="title">主题设置</div>
                        <div class="setings-item">
                            <span>收起左侧菜单</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu"
                                           class="onoffswitch-checkbox" id="collapsemenu"> <label
                                        class="onoffswitch-label" for="collapsemenu"> <span
                                        class="onoffswitch-inner"></span> <span
                                        class="onoffswitch-switch"></span>
                                </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定顶部</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="fixednavbar"
                                           class="onoffswitch-checkbox" id="fixednavbar"> <label
                                        class="onoffswitch-label" for="fixednavbar"> <span
                                        class="onoffswitch-inner"></span> <span
                                        class="onoffswitch-switch"></span>
                                </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span> 固定宽度 </span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="boxedlayout"
                                           class="onoffswitch-checkbox" id="boxedlayout"> <label
                                        class="onoffswitch-label" for="boxedlayout"> <span
                                        class="onoffswitch-inner"></span> <span
                                        class="onoffswitch-switch"></span>
                                </label>
                                </div>
                            </div>
                        </div>
                        <div class="title">皮肤选择</div>
                        <div class="setings-item default-skin nb">
                                <span class="skin-name "> <a href="#" class="s-skin-0">
                                        默认皮肤 </a>
                                </span>
                        </div>
                        <div class="setings-item blue-skin nb">
                                <span class="skin-name "> <a href="#" class="s-skin-1">
                                        蓝色主题 </a>
                                </span>
                        </div>
                        <div class="setings-item yellow-skin nb">
                                <span class="skin-name "> <a href="#" class="s-skin-3">
                                        黄色/紫色主题 </a>
                                </span>
                        </div>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="sidebar-title">
                        <h3>
                            <i class="fa fa-comments-o"></i> 最新通知
                        </h3>
                        <small><i class="fa fa-tim"></i> 您当前有0条未读信息</small>
                    </div>
                    <div>
                        <div class="sidebar-message">
                            <a href="#">
                                <div class="pull-left text-center">
                                    <div class="m-t-xs">
                                        <i class="fa fa-star text-warning"></i>
                                        <i class="fa fa-star text-warning"></i>
                                    </div>
                                </div>
                                <div class="media-body">
                                    据天津日报报道：瑞海公司董事长于学伟，副董事长董社轩等10人在13日上午已被控制。 <br>
                                    <small
                                            class="text-muted">今天 4:21
                                    </small>
                                </div>
                            </a>
                        </div>
                        <div class="sidebar-message">
                            <a href="#">
                                <div class="pull-left text-center">
                                <#--<img alt="image" class="img-circle message-avatar"
                                         src="/img/a2.jpg">-->
                                </div>
                                <div class="media-body">
                                    HCY48之音乐大魔王会员专属皮肤已上线，快来一键换装拥有他，宣告你对华晨宇的爱吧！ <br>
                                    <small
                                            class="text-muted">昨天 2:45
                                    </small>
                                </div>
                            </a>
                        </div>
                        <div class="sidebar-message">
                            <a href="#">
                                <div class="pull-left text-center">
                                <#--<img alt="image" class="img-circle message-avatar"
                                     src="/img/a3.jpg">-->
                                    <div class="m-t-xs">
                                        <i class="fa fa-star text-warning"></i> <i
                                            class="fa fa-star text-warning"></i> <i
                                            class="fa fa-star text-warning"></i>
                                    </div>
                                </div>
                                <div class="media-body">
                                    写的好！与您分享 <br>
                                    <small class="text-muted">昨天 1:10</small>
                                </div>
                            </a>
                        </div>
                        <div class="sidebar-message">
                            <a href="#">
                                <div class="pull-left text-center">
                                <#--<img alt="image" class="img-circle message-avatar"
                                         src="/img/a4.jpg">-->
                                </div>
                                <div class="media-body">
                                    国外极限小子的炼成！这还是亲生的吗！！ <br>
                                    <small class="text-muted">昨天
                                        8:37
                                    </small>
                                </div>
                            </a>
                        </div>
                        <div class="sidebar-message">
                            <a href="#">
                                <div class="pull-left text-center">
                                <#--  <img alt="image" class="img-circle message-avatar"
                                         src="/img/a8.jpg">-->
                                </div>
                                <div class="media-body">
                                    一只流浪狗被收留后，为了减轻主人的负担，坚持自己觅食，甚至......有些东西，可能她比我们更懂。 <br>
                                    <small
                                            class="text-muted">今天 4:21
                                    </small>
                                </div>
                            </a>
                        </div>
                        <div class="sidebar-message">
                            <a href="#">
                                <div class="pull-left text-center">
                                <#--  <img alt="image" class="img-circle message-avatar"
                                         src="/img/a7.jpg">-->
                                </div>
                                <div class="media-body">
                                    这哥们的新视频又来了，创意杠杠滴，帅炸了！ <br>
                                    <small class="text-muted">昨天
                                        2:45
                                    </small>
                                </div>
                            </a>
                        </div>
                        <div class="sidebar-message">
                            <a href="#">
                                <div class="pull-left text-center">
                                <#--<img alt="image" class="img-circle message-avatar"
                                     src="/img/a3.jpg">-->
                                    <div class="m-t-xs">
                                        <i class="fa fa-star text-warning"></i> <i
                                            class="fa fa-star text-warning"></i> <i
                                            class="fa fa-star text-warning"></i>
                                    </div>
                                </div>
                                <div class="media-body">
                                    最近在补追此剧，特别喜欢这段表白。 <br>
                                    <small class="text-muted">昨天
                                        1:10
                                    </small>
                                </div>
                            </a>
                        </div>
                        <div class="sidebar-message">
                            <a href="#">
                                <div class="pull-left text-center">
                                <#-- <img alt="image" class="img-circle message-avatar"
                                         src="/img/a4.jpg">-->
                                </div>
                                <div class="media-body">
                                    我发起了一个投票 【你认为下午大盘会翻红吗？】 <br>
                                    <small class="text-muted">星期一
                                        8:37
                                    </small>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="sidebar-title">
                        <h3>
                            <i class="fa fa-cube"></i> 最新任务
                        </h3>
                        <small><i class="fa fa-tim"></i> 您当前有14个任务，10个已完成</small>
                    </div>
                    <ul class="sidebar-list">
                        <li><a href="#">
                            <div class="small pull-right m-t-xs">9小时以后</div>
                            <h4>市场调研</h4> 按要求接收教材；
                            <div class="small">已完成： 22%</div>
                            <div class="progress progress-mini">
                                <div style="width: 22%;"
                                     class="progress-bar progress-bar-warning"></div>
                            </div>
                            <div class="small text-muted m-t-xs">项目截止： 4:00 -
                                2015.10.01
                            </div>
                        </a></li>
                        <li><a href="#">
                            <div class="small pull-right m-t-xs">9小时以后</div>
                            <h4>可行性报告研究报上级批准</h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的
                            开发进度作出一个合理的比对
                            <div class="small">已完成： 48%</div>
                            <div class="progress progress-mini">
                                <div style="width: 48%;" class="progress-bar"></div>
                            </div>
                        </a></li>
                        <li><a href="#">
                            <div class="small pull-right m-t-xs">9小时以后</div>
                            <h4>立项阶段</h4> 东风商用车公司 采购综合综合查询分析系统项目进度阶段性报告武汉斯迪克科技有限公司
                            <div class="small">已完成： 14%</div>
                            <div class="progress progress-mini">
                                <div style="width: 14%;"
                                     class="progress-bar progress-bar-info"></div>
                            </div>
                        </a></li>
                        <li><a href="#"> <span
                                class="label label-primary pull-right">NEW</span>
                            <h4>设计阶段</h4> <!--<div class="small pull-right m-t-xs">9小时以后</div>-->
                            项目进度报告(Project Progress Report)
                            <div class="small">已完成： 22%</div>
                            <div class="small text-muted m-t-xs">项目截止： 4:00 -
                                2015.10.01
                            </div>
                        </a></li>
                        <li><a href="#">
                            <div class="small pull-right m-t-xs">9小时以后</div>
                            <h4>拆迁阶段</h4> 科研项目研究进展报告 项目编号: 项目名称: 项目负责人:
                            <div class="small">已完成： 22%</div>
                            <div class="progress progress-mini">
                                <div style="width: 22%;"
                                     class="progress-bar progress-bar-warning"></div>
                            </div>
                            <div class="small text-muted m-t-xs">项目截止： 4:00 -
                                2015.10.01
                            </div>
                        </a></li>
                        <li><a href="#">
                            <div class="small pull-right m-t-xs">9小时以后</div>
                            <h4>建设阶段</h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的
                            开发进度作出一个合理的比对
                            <div class="small">已完成： 48%</div>
                            <div class="progress progress-mini">
                                <div style="width: 48%;" class="progress-bar"></div>
                            </div>
                        </a></li>
                        <li><a href="#">
                            <div class="small pull-right m-t-xs">9小时以后</div>
                            <h4>获证开盘</h4> 编写目的编写本项目进度报告的目的在于更好的控制软件开发的时间,对团队成员的
                            开发进度作出一个合理的比对
                            <div class="small">已完成： 14%</div>
                            <div class="progress progress-mini">
                                <div style="width: 14%;"
                                     class="progress-bar progress-bar-info"></div>
                            </div>
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="/js/third/jquery.min.js?v=2.1.4"></script>
<script src="/js/third/bootstrap.min.js?v=3.3.6"></script>
<script src="/js/third/jquery.metisMenu.js"></script>
<script src="/js/third/jquery.slimscroll.min.js"></script>
<script src="/js/third/layer/layer.min.js"></script>
<script src="/js/hplus.min.js?v=4.1.0"></script>
<script src="/js/third/pace.min.js"></script>
<script src="/js/third/jquery.validate.min.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script type="text/javascript" src="/js/zudp.js"></script>
<script src="/js/third/jquery.Jcrop.js"></script>
<script src="/js/sys/avatar.js"></script>
<script src="/js/third/webuploader.js"></script>
<script>

    $(document).ready(function () {



        zudp.ajax("/api/info/notReaderMessageCount").get().then(function (da) {
            $("#home-message-count").html(da);
        });

        zudp.ajax('/api/user/current').get('').then(function (data) {
            $('#name').text(data.name);
            // 登录名称
            var name = data.loginName;
            $("#nameId").html("Hi!  " +name);

            console.log(name);
            var src = data.avatar;
            if (zudp.util.isString(src)) {
                // 提供默认图片
                src = "/img/profile.png";
                src = "/img/profile.jpg";
            }
            $('#span_avatar').html('<img alt="image" id="useravatar" class="img-circle avatar home-avatar" src="' + src + '"/>');
        });

        $("#personData_form").validate({
                                     rules: {
                                         name: {
                                             required:true,
                                         },
                                         birthday: {
                                             date:true
                                         },
                                         email: {
                                             required:true,
                                             email:true
                                         },
                                     },
                                     messages: {
                                         name: {
                                             required: "请输入你的姓名",
                                         },
                                         birthday: {
                                             date: "请输入正确的时间格式"
                                         },
                                         email: {
                                             required:"请填写邮箱",
                                             email:"请输入正确邮箱格式"
                                         },
                                     }
                                 });

    });
    setInterval("getDate()",1000);

    function getDate(){
        //获取当前时间
        var date = new Date();
        //格式化为本地时间格式
        var date1 = date.toLocaleString();

        $("#home_time").html(date1);
    }
    function compare(property) {
        return function(a, b) {
            var value1 = a[property];
            var value2 = b[property];
            return value1 - value2;
        }
    }
    var a = "fa-home";
    var o;

    /**
     * 过滤不包含叶子节点的父节点
     * @param menus 整颗树
     */
    var filterNoLeafParentNode = function (menus) {
        var container = [];
        var index = 0;
        var hasChild = false;
        var unqueId;
        for (var i = 0; i < menus.length; i++) {
            if (!menus[i].href) {
                hasChild = false;
                unqueId = (menus[i].parentIds ? menus[i].parentIds + ":" : '')  + menus[i].id;
                for (var j = 0; j < menus.length; j++) {
                    if (menus[j].parentIds === unqueId) {
                        hasChild = true;
                        break;
                    }
                }

                if (!hasChild) {
                    container[index] = i;
                    index++;
                }
            }
        }

        for (i = 0; i < index; i++) {
            menus.splice(container[i], 1);
        }
    };

    var suc_method = function (obj) {
        var parent = [];
        var roots = [];
        var childs = [];
        var last = [];
        var Sample = [];
        var iconArray = ['z-icon1','z-icon2','z-icon3','z-icon4'];
        var icon = 0;

        filterNoLeafParentNode(obj);
        $.each(obj, function (i, objItem) {
            if(objItem.parentId!=''){
                objItem.id=objItem.parentId+":"+objItem.id;
            }
            objItem.id = objItem.id.replace(/:/g, '_');
            objItem.parentId = objItem.parentId.replace(/:/g, '_');
            objItem.parentIds = objItem.parentIds.replace(/:/g, '_');
            Sample.push(objItem)
        });
        Sample = Sample.sort(compare("weight"));
        $.each(Sample, function (index, el) {
            if (el.parentId == "") {
                roots.push(el);
            } else {
                // parent[admin]=el;
                if (el.parentIds != "" && el.parentId == el.parentIds) {
                    parent.push(el);
                } else {
                    var arr = el.parentIds.split("_");
                    if (arr.length === 2) {
                        childs.push(el);
                    } else {
                        last.push(el);
                    }
                }

            }
        });
        $.each(roots, function (i, rootItem) {
            icon = i%3;
            $('#side-menu').append(
                    '<li>' +
                    '<a>' +
                    '<i class="' + iconArray[icon] + '"></i>' +
                    '<span class="nav-label">' + rootItem.treeName + '</span>' +
                    '<span class="fa arrow"></span>' +
                    '</a>' +
                    '<ul class="nav nav-second-level collapse" id=' + rootItem.id + '>' +
                    '</ul>' +
                    '</li>'
            )
        });
        $.each(roots, function (i, rootItem) {
            $.each(parent, function (j, parentItem) {
                if (rootItem.id == parentItem.parentIds) {
                    icon = j%4;
                    if (parentItem.href == null) {
                        $('#' + rootItem.id).append(
                                '<li>' +
                                '<a href="#">' +
                                '<i class="' + iconArray[icon] + '"></i>' +
                                '<span class="nav-label">' + parentItem.treeName + '</span>' +
                                '<span class="fa arrow"></span>' +
                                '</a>' +
                                '<ul class="nav nav-third-level home-nav-third collapse" id='
                                + parentItem.id + '>' +
                                '</ul>' +
                                '</li>'
                        );
                    } else {
                        $('#' + rootItem.id).append(
                                '<li>' +
                                '<a  class="J_menuItem " onclick=changeIframe("/'
                                + parentItem.href + '?platfrom=html","' + parentItem.treeName
                                + '",this)>'
                                + '<i class="' + iconArray[icon] + '"></i>' + parentItem.treeName
                                + '</a>' +
                                '</li>'
                        );
                    }
                }
            });
        });
        $.each(parent, function (i, parentItem) {
            $.each(childs, function (j, childItem) {
                icon = j%3;
                if (parentItem.id == childItem.parentIds) {
                    if (childItem.href == null) {
                        $('#' + parentItem.id).append(
                                '<li>' +
                                '<a href="#">' +
                                '<i class="' + iconArray[icon] + '"></i>' +
                                '<span class="nav-label">' + childItem.treeName + '</span>' +
                                '<span class="fa arrow"></span>' +
                                '</a>' +
                                '<ul class="nav nav-four-level collapse" id=' + childItem.id + '>' +
                                '</ul>' +
                                '</li>'
                        )
                    } else {
                        $('#' + parentItem.id).append(
                                '<li>' +
                                '<a  class="J_menuItem " onclick=changeIframe("/'
                                + childItem.href + '","' + childItem.treeName + '",this)>'
                                + '<i class="' + iconArray[icon] + '"></i>' + childItem.treeName
                                + '</a>' +
                                '</li>'
                        )
                    }
                }
            });
        });
        $.each(childs, function (i, childItem) {
            $.each(last, function (j, lastItem) {
                icon = j%3;
                if (childItem.id == lastItem.parentId) {
                    $('#' + childItem.id).append(
                            '<li>' +
                            '<a  class="J_menuItem " onclick=changeIframe("/'
                            + lastItem.href + '","' + lastItem.treeName + '",this)>'
                            + '<i class="' + iconArray[icon] + '"></i>' + lastItem.treeName
                            + '</a>' +
                            '</li>'
                    )
                }
            })
        })
    };
    zudp.ajax('/api/menu?platform=html').get(o).then(suc_method);


    // $(document).on("click", ".nav-third-level>li>a", function () {
    //     var index = $(".nav-third-level>li>a").not("a.J_menuItem ").index($(this));
    //     $(".nav-third-level>li>a").siblings(".nav-four-level").stop(false, true).slideUp().eq(index).stop(false, true).slideDown();
    //     $(".nav-third-level>li>a").parent("li").removeClass("active").eq(index).addClass("active");
    // });
    // $(document).on("click", ".nav-third-level>li.active>a", function () {
    //     $(this).siblings(".nav-four-level").stop(false, true).slideUp();
    //     $(this).parent("li").removeClass("active")
    // });

    <!--查看信息-->
    $("#dropdown").click(function () {
        zudp.ajax("/api/info").get({"status":1}).then(function (da) {
            $("#home-message").html("");
            var html="";
            var data=da.result;
            var index=data.length;
            for(var k=0;k<(index<5?index:5);k++){
                html+=" <li class=\"m-t-xs\">\n"
                         + "                                <div class=\"dropdown-messages-box\">\n"
                         + "                                    <a href=\"profile.html\" class=\"pull-left\">\n"
                         + "                                        <img alt=\"image\" id=\""+data[k].infoSender.sender.id+"\" class=\"img-circle\" src=\""+data[k].infoSender.sender.avatar+"\">\n"
                         + "                                    </a>\n"
                         + "                                    <div class=\"media-body\">\n"
                         + "                                        <strong>"+data[k].infoSender.sender.name+": </strong>"+data[k].infoSender.message+"<br>\n"
                         + "                                        <small class=\"text-muted\">"+zudp.util.timeformater(data[k].infoSender.createDate)+"</small>\n"
                         + "                                    </div>\n"
                         + "                                </div>\n"
                         + "                            </li>\n"
                         + "                            <li class=\"divider\"></li>";
            }
            html+="<li  id=\"home-message\">\n"
                  + "                                <div class=\"text-center link-block\">\n"
                  + "                                    <a class=\"J_menuItem\" href=\"#\" data-index=\"88\" onclick=\"homeAllMessage()\">\n"
                  + "                                        <i class=\"fa fa-envelope\"></i> <strong> 查看所有消息</strong>\n"
                  + "                                    </a>\n"
                  + "                                </div>\n"
                  + "                            </li>";
            $("#home-message").html(html);

        });

        zudp.ajax("/api/info/notReaderMessageCount").get().then(function (da) {
            $("#home-message-count").html(da);
        });
    });

    function homeAllMessage() {
        $(".page-tabs-content").append(
            '<a href="javascript:;" id="tab-person" class="J_menuTab" sf="0" data-name="消息列表">消息列表<i class="fa fa-times-circle" style="margin-left:6px;"></i></a>'
        );
        $("#content-main").append(
            '<iframe class="J_iframe" id="ifr-person" name="iframe" width="100%" height="100%" src="/info" frameborder="0" style="display:none" seamless></iframe >'
        );
        $("#ifr-person").show().siblings().hide();
        $("#tab-person").addClass('active').siblings().removeClass("active");
    }
    <!--修改头像-->
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
   /* $("#xg_rar").click(function () {
        $('.webuploader-pick').next().find("input").click();
        $('.webuploader-pick').next().find("object").click();
    });*/
    <!--/修改头像-->
    /*资料填写率*/
//    var circle = document.querySelectorAll("circle")[1];
//    var percent = 70/100;
//    var perimeter = Math.PI * 2 * 75;
//    circle.setAttribute('stroke-dasharray', perimeter * percent + " " + perimeter * (1- percent));
//    $(".percent1").html(percent * 100)
</script>
<script src="/js/menuTab.js"></script>

</body>
</html>
