
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="/mm/bigscreen/css/index.css">
    <link rel="stylesheet" href="/mm/bigscreen/css/main.css">

    <script src="/mm/bigscreen/js/rem.js"></script>
    <script src="/mm/bigscreen/js/jquery-3.3.1.min.js"></script>
    <script src="/mm/bigscreen/js/echarts.min.js"></script>
    <script src="/mm/bigscreen/js/main.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=F0i6SrLmHquLVNLCqpExxPrj8mWVdFwx"></script>
    <script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
    <script src="/js/third/jquery.min.js"></script>
    <script src="/js/pluginInit/animation.js"></script>
    <script src="/js/third/bootstrap.min.js"></script>
    <script src="/js/third/jquery.validate.min.js"></script>
    <script src="/js/third/jquery.dataTables.min.js"></script>
    <script src="/js/third/dataTables.bootstrap.js"></script>
    <script src="/js/third/layer/layer.min.js"></script>
    <script src="/js/third/icheck.min.js"></script>
    <script src="/js/third/sweetalert.min.js"></script>
    <script src="/js/third/toastr.min.js"></script>
    <script src="/js/third/laydate/laydate.js"></script>
    <script src="/js/pluginInit/dataecho.js"></script>
    <script src="/js/third/laydate/laydate.js"></script>
    <script src="/js/zudp.js"></script>
    <script type="text/javascript" src="/js/third/jquery.ztree.all.js"></script>
    <script src="/js/third/bootstrap-suggest.min.js"></script>
    <script src="/js/sys/avatar.js"></script>
    <script src="/js/third/webuploader.js"></script>
    <script src="/js/rest.js"></script>
    <#--引入时间控件-->
    <script src="/js/pluginInit/laydateInit.js"></script>

    <#--滚动用的js-->
    <script src="/mm/bigscreen/js/jquery.SuperSlide.2.1.3.js"></script>
    <script src="/mm/bigscreen/js/analysis.js"></script>

    <script src="/screen/rightscreen.js"></script>
    <#--引入之最 js文件-->
    <script src="/screen/mostOfThe.js"></script>
    <#--引入案件 js文件-->
    <script src="/screen/findAllCases.js"></script>
    <title>Document</title>
</head>
<body>
<div class="sum-bg" id="container"></div>
<div style="height:100%;width: 100%;">
    <div class="center-top"><div class="data-city">吉安城市管理大数据平台</div></div>
    <div class="sum-center flex">
        <div class="left-top">
            <div class="case" style="width: 4.5rem;">
                <span class="case-tell">案情展示</span>
                <span class="case-time">1月1日—12.16日</span>
                <span class="case-sum">案件总数
                    <span class="case-num">&nbsp;${Total!""}</span>
                </span>
            </div>
            <div class="case-show">
                <div class="radius flex">
                    <div class="case-one flex-1">
                        <div class="circle-1">
                            <div class="circle-center case-tex">${Number1!""}起</div>
                        </div>
                        <div class="case-tex">吉州区</div>
                    </div>
                    <div class="case-one flex-1">
                        <div class="circle-1 ch-co-ye">
                            <div class="circle-center tex-ye">${Number2!""}起</div>
                        </div>
                        <div class="case-tex">庐陵新区</div>
                    </div>
                    <div class="case-one flex-1">
                        <div class="circle-1 ch-co-qi">
                            <div class="circle-center tex-qi">${Number3!""}起</div>
                        </div>
                        <div class="case-tex">青原区</div>
                    </div>
                    <div class="case-one flex-1">
                        <div class="circle-1 ch-co-ys">
                            <div class="circle-center tex-ys">${Number4!""}起</div>
                        </div>
                        <div class="case-tex">井开区</div>
                    </div>
                </div>
                <div class="new-case">
                    <div class="case-fl">
                        <div class="case-the">最新案件</div>
<#--                        <div class="case-cont">详情</div>-->
                    </div>


                    <div class="scroll">
                        <#list ScreenList as screen>
                            <div class="case-thing">
                                <div class="case-usal">
                                    <#--第一行-->
                                    <div class="flex case-hot case-top wheel">
                                        <#if (screen.EVENTDESC?? && screen.EVENTDESC?length>17)>
                                            <div class="flex-1 case-hot2 flex">
                                                <div class="min-radius"></div>
                                                <div>问题描述：${screen.EVENTDESC?substring(0,17)}...</div>
                                            </div>
                                        <#else>
                                            <div class="flex-1 case-hot2 flex">
                                                <div class="min-radius"></div>
                                                <div>问题描述：${screen.EVENTDESC!""}</div>
                                            </div>
                                        </#if>
                                    </div>
                                    <#--第二行-->
                                    <div class="flex case-hot wheel">
                                        <div class="flex-1 flex">
                                            <div class="min-radius"></div>
                                            <div>案发时间：${screen.NEWINSTTIME!""}</div>
                                        </div>
                                    </div>
                                    <#--第三行-->
                                    <div class="flex case-hot wheel">
                                        <div class="flex-1 flex">
                                            <div class="min-radius"></div>
                                            <div>大类：${screen.MAINTYPENAME!""}</div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </#list>
                    </div>

                </div>
            </div>
            <#--<div class="frequency">-->

            <#--<div class="flex">-->
            <#--<div class="fr-text">案发频率趋势图</div>-->
            <#--<div>-->
            <#--                            <select name="" id="" class="fr-sel">-->
            <#--                                <option value="">1月1日——12.16日</option>-->
            <#--                            </select>-->
            <#--                        </div>-->
            <#--                    </div>-->
            <#--                    <div class="fr-bg" id = "myChart" >-->
            <#--                      <div class="chart" id="myChart"></div>-->
            <#--                    </div>-->

            <#--                    <div class="fr-bg" id = "myChart" >-->
            <#--                    </div>-->
                <label class="case-tell">案发频率趋势图</label>
                <div class="fr-bg" >
                    <div id="myChart" style="width: 280px;height:180px;"></div>
                </div>
        </div>
        <div class="center">
            <div class="center-cen flex">
                <div class="area-2" onclick="casenow('青原区')">青原区</div>
                <div class="area-2" onclick="casenow('吉州区')">吉州区</div>
                <div class="area-2" onclick="casenow('庐陵新区')">庐陵新区</div>
                <div class="area-2" onclick="casenow('井开区')">井开区</div>
            </div>
            <div class="map-log">
                <div class="map-text">
                    <div class="map-cont">当前状态</div>
                    <div>案件: &nbsp;电话报警</div>
                    <div>案件状态: &nbsp;处理中</div>
                    <div>案件负责人: &nbsp;刘青云</div>
                    <div>操作:</div>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="right-top">
                <div class="flex crime">
                    <div class="fr-text">关联分析</div>
                    <#-- <div>
                         <select name="" id="" class="ri-selected1"><option value="">16日</option></select>
                     </div>
                     <div>
                         <select name="" id="" class="ri-selected2"><option value="">8:00-18:00</option></select>
                     </div>-->
                </div>
                <div class="ri-bg">
                    <div id="myChart2" style="width: 280px;height:180px;"></div>
                </div>
            </div>
            <div class="right-top">
                <div class="flex crime">
                    <div class="fr-text">案件类型统计</div>
                    <#-- <div>
                         <select name="" id="" class="ri-selected1"><option value="">1月1日——11月16日</option></select>
                     </div>-->
                </div>
                <div class="ri-bg">
                    <div class="chart3" id="chart3" style="width: 280px;height:180px;"></div>
                </div>
            </div>
            <div class="right-top">
                <div class="flex crime">
                    <div class="fr-text">区域案件预警(最新2周)</div>
                </div>
                <div class="ri-bg">
                    <div class="ri-query flex">
                        <div class="ri-left flex">
                            <div class="chart4" id="chart4" style="width:280px;height:200px"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom">
            <div class="bo-text flex">
                <div class="flex-1"><div class="bo-bg" onclick="showManhole()">井盖</div></div>
                <div class="flex-1"><div class="bo-bg t-most" onclick="findAllCases()">案件</div></div>
                <div class="flex-1"><div class="bo-bg t-most" onclick="mostOfThe()">之最</div></div>
                <div class="flex-1"><div class="bo-bg" >监控</div class="bo-bg"></div>
                <div class="flex-1"><div class="bo-bg analysis">效能</div class="bo-bg"></div>
                <#--<div class="flex-1"><div class="bo-bg">待开发</div></div>-->
            </div>
        </div>

    </div>

    <#--效能分析模态框-->
    <div class="map-log" style="display: none;"  id="analysis">
        <div class="close"><img src="/mm/bigscreen/img/close.png"></div>
        <div class="be-relative" style="">
            <div class="map-cont">2018年1月-2018年12月案件统计</div>
            <#-- <div class="put-div">
                 <input type="text" id="startTime" placeholder="起始时间" maxlength="60px" class="put-tex" />
                 <input type="text" id="endTime" placeholder="结束时间" maxlength="60px" class="put-tex" />
                 <input type="button" value="查询" class="btn">
             </div>-->


            <div class="center-tab">
                <div class="flex get-tab">
                    <table class="gridtable show-hide1" id ="table-analysis">
                        <tr>
                            <th>部门</th>
                            <th>案件数量</th>
                            <th>结案率</th>
                            <th>按期结案率</th>
                            <th>超期结案率</th>
                        </tr>
                    </table>
                </div>
            </div>

        </div>
    </div>

    <div class="modal-ly" style="display: none;"  id="company_amoun">
        <div class="mask"></div>
        <div class="modal-cnts mbox flex flex-fx-c" style="">
            <div class="g-info-tit flex flex-c-c">
                <i class="i-icon icon-tb"></i>
                <span class="flex-1" id="qyssfx">关联分析类型案件统计</span>
                <div class="m-closes"  onclick="notshow()" >×</div>
            </div>
            <div class="modal-main flex-1" style="overflow: auto;">
                <iframe id="company_amoun_iframe" width="100%" height="99%" frameborder="0"></iframe>

            </div>
        </div>
    </div>

</div>
<#--之最  模态框开始-->
<div class="map-log" style="display: none;"  id="modal01">
    <div class="close"><img src="/zhizui/img/close.png"></div>
    <div class="be-relative" style="">
        <div class="center-tab" style="padding-top:0.2rem;overflow: auto;">
        <div class="flex get-tab">
            <div class="show-tab tab1">最新</div>
            <div class="show-tab tab2 ch-color">最长</div>
            <div class="show-tab tab3 ch-color">最频繁</div>
        </div>
        <table class="gridtable show-hide0 zhizui" id ="table002">
            <tr>
                <th>大类</th>
                <th>问题描述</th>
                <th>时间</th>
            </tr>
        </table>
        <table class="gridtable show-hide1 zhizui" id ="table003">
            <tr>
                <th>大类</th>
                <th>问题描述</th>
                <th>时间</th>
                <th>持续时间</th>
            </tr>
        </table>
        <table class="gridtable show-hide2 zhizui" id ="table004">
            <tr>
                <th>大类</th>
                <th>问题描述</th>
                <th>时间</th>
                <th>案件数量</th>
            </tr>
        </table>

    </div>
    </div>
</div>
<#--之最  模态框结束-->
<#--案件信息  模态框开始-->
<div class="map-log" style="display: none;"  id="modal02">
    <div class="close"><img src="/zhizui/img/close.png"></div>
    <div class="be-relative" style="">
        <div class="center-tab" style="padding-top:0.2rem;overflow: auto;">
            <input class="ge-put" type="text" name="startTime" id="startTime" startDate placeholder="案件立案开始时间" class="form-control">
            <input class="ge-put" type="text" name="endTime" id="endTime" endDate placeholder="案件立案结束时间" class="form-control">
            <#--问题描述-->
            <input class="ge-put" type="text" name="description" id="description" placeholder="问题描述" class="form-control">
            <input class="btn" type="button" id="searchId" onclick="findAllCases()" value="搜索"/>
            <#--案件 时间段-->
            <br>
              <table class="gridtable ge-put show-hide0" id ="tableList">
                  <tr>
                    <th>问题描述</th>
                    <th>大类</th>
                    <th>时间</th>
                </tr>
            </table>
            <div class="page-list">
                <a onclick="firstPage()" class="page-li page-prev">首页</a>
                <a  onclick="uppers()" class="page-li on">上一页</a>
                <a onclick="lowers()" class="page-li">下一页</a>
                <a onclick="endpage()" class="page-li page-next">尾页</a>
            </div>
        </div>
    </div>
</div>
<div class="mess" style="display: none;" id="myModal5">
    <div class="close me-close"><img src="/zhizui/img/close.png"></div>
    <div class="me-relative">
        <div class="be-center">案件详情</div>
        <div class="me-first">
            <div class="me-high">
                <#--<div class="me-fl-left" id ="name">案件名称:&nbsp;XXXXX</div>-->
                    <div class="me-fl-right flex" >案件类型:<div id="nameId01"></div>&nbsp;&nbsp;<div id="nameId02"></div></div>
            </div>
            <div class="me-high" id="addressId">地址:&nbsp;东湖区莎莎街道659号</div>
            <div class="me-high">
                <div class="me-fl-left" id="deadTimeId">案件截止时间: 2019.12.01</div>
                <div class="me-fl-right" id="endTimeId">案件结束时间: 2019.12.01</div>
            </div>
            <div class="me-high">
                <div class="me-fl-left" id="departmentId">处理部门:&nbsp;XXX</div>
                <div class="me-fl-right" id="dealTimeId">部门处理时间:&nbsp;2019.12.01</div>
            </div>
            <div class="me-resolve me-line">
                <div class="me-getres" id="advId">处理意见:</div>
                <div>深刻的较高的是快乐跟你说的圣诞节很谨慎的感觉到石圪节多斯拉克发货的世界观恢复健康该数据库定时关机看电视关键是读后感可接受的时代峻峰好大风交互的</div>
            </div>
            <div class="me-resolve">
                <div class="me-getres" id="descriptionId">问题描述:</div>
                <div class="put-tex"></div>
            </div>
        </div>
    </div>
</div>
<#--案件信息  模态框结束-->
<script>
    var manholeis=0;
    // 获取到图表的div,并初始化
    var myChart = echarts.init(document.getElementById('myChart'));

    option = {
        // 标题
//        title: {
//            text: '趋势分析图'
//        },
        // tooltip: {
        //     trigger: 'axis'
        // },
        tooltip: {},
        // 曲线类型名称
        color:['#2db7f5','#ff6600','#808bc6','FFA500'],
        legend: {
            textStyle:{
                color: '#ffffff'//字体颜色
            },
            data: ['庐陵新区', '青原区', '吉州区', '井开区']
        },
        grid: {
            left: '0%',
            right: '7%',
            bottom: '3%',
            containLabel: true
        },
        // toolbox: {
        //     feature: {
        //         saveAsImage: {}
        //     }
        // },
        // 横坐标
        xAxis: {
            type: 'category',
            boundaryGap: false,
//
            data: ['一季度', '二季度', '三季度', '四季度'],
            axisLine:{
                lineStyle:{
                    color:'#FFA500',
                }
            }

        },
        // 纵坐标
        yAxis: {
            type: 'value',
            axisLine:{
                lineStyle:{
                    color:'#FFA500',
                }
            }
        },
        series: [

            {
                name: '庐陵新区',
                type: 'line',
                data: []

            },
            {
                name: '青原区',
                type: 'line',
                data: []
            },
            {
                name: '吉州区',
                type: 'line',
                data: []
            },
            {
                name: '井开区',
                type: 'line',
                data: []
            }
        ]
    };
    // 导入设置
    myChart.setOption(option);
    // 发送ajax请求到后台，获取到数据


    $(document).ready(function () {
        getData();
        rightglfx();
        rightEvenType();
        getrightCaseNum();
    });

    // 存放数据的数组
    var strList01 =[];
    var strList02 =[];
    var strList03 =[];
    var strList04 =[];
    // var strList001 =[];
    // var strList002 =[];
    // var strList003 =[];
    // var strList004=[];
    function getData() {
        zudp.ajax("/mm/screen/trendAnaly").post().then(function (value) {
            strList01 =  value.strList01;
            strList02 =  value.strList02;
            strList03 =  value.strList03;
            strList04 =  value.strList04;
            myChart.setOption({
                series:[{name:"庐陵新区",data:strList01},
                    {name:"青原区",data:strList02},
                    {name:"吉州区",data:strList03},
                    {name:"井开区",data:strList04},
                ]
            });
            // strList001 =  value.strList001;
            // strList002 =  value.strList002;
            // strList003 =  value.strList003;
            // strList004 =  value.strList004;







        });
    };


    function notshow() {

        $('#company_amoun').hide();
    }

        $(".area-2").on("click",function(){
            var index = $(".area-2").index($(this));
            $(".area-2").removeClass("on").eq(index).addClass("on")
        })

    </script>



</body>
</html>