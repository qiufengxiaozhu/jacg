
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
    <script src="/screen/rightscreen.js"></script>
    <title>Document</title>
</head>
<body>
    <div class="sum-bg" id="container"></div>
    <div>
        <div class="center-top"><div class="data-city">吉安城市管理大数据平台</div></div>
        <div class="sum-center flex">
            <div class="left-top">
                <div class="case" style="width: 4.5rem;"><#--<span class="case-tell">案情展示</span><span class="case-time">1月1日—12.16日</span><span class="case-sum">案件总数<span class="case-num">&nbsp;${Total!""}</span></span>--></div>                <div class="case-show">
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
                            <div class="case-cont">详情</div>
                        </div>


                        <#list ScreenList as screen>
                            <div class="case-thing">
                                <div class="case-usal">
                                    <div class="flex case-hot">

                                        <#if (screen.EVENTDESC?? && screen.EVENTDESC?length>30)>
                                            <div class="flex-1 case-hot2 flex"><div class="min-radius"></div><div>问题描述：${screen.EVENTDESC?substring(0,17)}...</div></div>
                                        <#else>
                                            <div class="flex-1 case-hot2 flex"><div class="min-radius"></div><div>问题描述：${screen.EVENTDESC!""}</div></div>
                                        </#if>

                                    </div>
                                    <div class="flex case-hot">
                                        <div class="flex-1 case-hot3 flex"><div class="min-radius"></div><div>案发时间：${screen.NEWINSTTIME!""}</div></div>
                                    </div>
                                    <div class="flex case-hot">
                                        <div class="flex-1 case-hot3 flex"><div class="min-radius"></div><div>大类：${screen.MAINTYPENAME!""}</div></div>
                                    </div>
                                </div>
                            </div>
                        </#list>

<#--                        <div class="case-thing">-->
<#--                            <div class="case-usal">-->
<#--                                <div class="flex case-hot">-->
<#--                                    <div class="flex-1 case-hot2 flex"><div class="min-radius"></div><div>案发事件:火灾报警</div></div>-->
<#--                                    <div class="flex-1 case-hot3 flex"><div class="min-radius"></div><div>案发时间:2019年12月16日</div></div>-->
<#--                                </div>-->
<#--                                <div class="flex case-hot">-->
<#--                                    <div class="flex-1 flex"><div class="min-radius"></div><div>报警人:刘娜娜</div></div>-->
<#--                                    <div class="flex-1 flex"><div class="min-radius"></div><div>联系电话:13768789955</div></div>-->
<#--                                </div>-->
<#--                                <div class="case-hot ch-col flex"><div class="min-radius"></div><div>案发地址:吉安市冀州区华彩大厦2栋32楼405市</div></div>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                        <div class="case-thing">-->
<#--                            <div class="case-usal">-->
<#--                                <div class="flex case-hot">-->
<#--                                    <div class="flex-1 case-hot2 flex"><div class="min-radius"></div><div>案发事件:火灾报警</div></div>-->
<#--                                    <div class="flex-1 case-hot3 flex"><div class="min-radius"></div><div>案发时间:2019年12月16日</div></div>-->
<#--                                </div>-->
<#--                                <div class="flex case-hot">-->
<#--                                    <div class="flex-1 flex"><div class="min-radius"></div><div>报警人:刘娜娜</div></div>-->
<#--                                    <div class="flex-1 flex"><div class="min-radius"></div><div>联系电话:13768789955</div></div>-->
<#--                                </div>-->
<#--                                <div class="case-hot ch-col flex"><div class="min-radius"></div><div>案发地址:吉安市冀州区华彩大厦2栋32楼405市</div></div>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                        <div class="case-thing">-->
<#--                            <div class="case-usal">-->
<#--                                <div class="flex case-hot">-->
<#--                                    <div class="flex-1 case-hot2 flex"><div class="min-radius"></div><div>案发事件:火灾报警</div></div>-->
<#--                                    <div class="flex-1 case-hot3 flex"><div class="min-radius"></div><div>案发时间:2019年12月16日</div></div>-->
<#--                                </div>-->
<#--                                <div class="flex case-hot">-->
<#--                                    <div class="flex-1 flex"><div class="min-radius"></div><div>报警人:刘娜娜</div></div>-->
<#--                                    <div class="flex-1 flex"><div class="min-radius"></div><div>联系电话:13768789955</div></div>-->
<#--                                </div>-->
<#--                                <div class="case-hot ch-col flex"><div class="min-radius"></div><div>案发地址:吉安市冀州区华彩大厦2栋32楼405市</div></div>-->
<#--                            </div>-->
<#--                        </div>-->
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

                <#--</div>-->


            </div>
            <div class="center">
                <div class="center-cen flex">
                    <div class="area-1">青原区</div>
                    <div class="area-2">蓟州区</div>
                    <div class="area-2">路岭新区</div>
                    <div class="area-2">经开区</div>
                </div>
                <!-- <div class="map-log">
                  <div class="map-text">
                      <div class="map-cont">当前状态</div>
                      <div>案件: &nbsp;电话报警</div>
                      <div>案件状态: &nbsp;处理中</div>
                      <div>案件负责人: &nbsp;刘青云</div>
                      <div>操作:</div>
                  </div>
                </div> -->
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
                        <div class="fr-text">区域案件预警</div>
                    </div>
                    <div class="ri-bg">
                        <div class="ri-query flex">
                            <div class="ri-left flex">
                                <div class="chart4" id="chart4" style="width:280px;height:160px"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom">
            <div class="bo-text flex">
                <div class="flex-1"><div class="bo-bg">井盖</div></div>
                <div class="flex-1"><div class="bo-bg">案件</div class="bo-bg"></div>
                <div class="flex-1"><div class="bo-bg">之最</div class="bo-bg"></div>
                <div class="flex-1"><div class="bo-bg">监控</div class="bo-bg"></div>
                <div class="flex-1"><div class="bo-bg">待开发</div class="bo-bg"></div>
                <div class="flex-1"><div class="bo-bg">待开发</div></div>
            </div>
        </div>






    </div>

        <div class="modal-ly" style="display: none;"  id="company_amoun">
            <div class="mask"></div>
            <div class="modal-cnt flex flex-fx-c" style="">
                <div class="g-info-tit flex flex-c-c">
                    <i class="i-icon icon-tb"></i>
                    <span class="flex-1" id="qyssfx">关联分析类型案件统计</span>
                    <div class="m-closes"  onclick="notshow()" >×</div>
                </div>
                <div class="modal-main flex-1" style="padding-top:0.2rem;overflow: auto;">
                    <iframe id="company_amoun_iframe" width="100%" height="99%" frameborder="0"></iframe>

                </div>
            </div>
        </div>


<script>

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
            left: '4%',
            right: '4%',
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
            data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
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
                    data: ['1500','300','500','800','3000','1500','300','500','800','3000','2000','2400']
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
//                    {name:"井开区",data:strList04},
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




</script>




</body>
</html>