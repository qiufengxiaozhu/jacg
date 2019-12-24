<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="js/rem.js"></script>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/echarts.min.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=F0i6SrLmHquLVNLCqpExxPrj8mWVdFwx"></script>
    <title>Document</title>
</head>
<body>
    <div class="sum-bg" id="container"></div>
    <div>
        <div class="center-top"><div class="data-city">吉安城市管理大数据平台</div></div>
        <div class="sum-center flex">
            <div class="left-top">
                <div class="case"><span class="case-tell">案情展示</span><span class="case-time">1月1日——12.16日</span><span class="case-sum">案件总数<span class="case-num">&nbsp;40</span></span></div>
                <div class="case-show">
                    <div class="radius flex">
                        <div class="case-one flex-1">
                            <div class="circle-1">
                              <div class="circle-center case-tex">10起</div>
                            </div>
                            <div class="case-tex">清远区</div>
                        </div>
                        <div class="case-one flex-1">
                            <div class="circle-1 ch-co-ye">
                                <div class="circle-center tex-ye">10起</div>
                            </div>
                            <div class="case-tex">清远区</div>
                        </div>
                        <div class="case-one flex-1">
                            <div class="circle-1 ch-co-qi">
                                <div class="circle-center tex-qi">10起</div>
                            </div>
                            <div class="case-tex">清远区</div>
                        </div>
                        <div class="case-one flex-1">
                            <div class="circle-1 ch-co-ys">
                                <div class="circle-center tex-ys">10起</div>
                            </div>
                            <div class="case-tex">清远区</div>
                        </div>
                    </div>
                    <div class="new-case">
                        <div class="case-fl">
                            <div class="case-the">最新案件</div>
                            <div class="case-cont">详情</div>
                        </div>
                        <div class="case-thing">
                            <div class="case-usal">
                                <div class="flex case-hot">
                                    <div class="flex-1 case-hot2 flex"><div class="min-radius"></div><div>案发事件:火灾报警</div></div>
                                    <div class="flex-1 case-hot3 flex"><div class="min-radius"></div><div>案发时间:2019年12月16日</div></div>
                                </div>
                                <div class="flex case-hot">
                                    <div class="flex-1 flex"><div class="min-radius"></div><div>报警人:刘娜娜</div></div>
                                    <div class="flex-1 flex"><div class="min-radius"></div><div>联系电话:13768789955</div></div>
                                </div>
                                <div class="case-hot ch-col flex"><div class="min-radius"></div><div>案发地址:吉安市冀州区华彩大厦2栋32楼405市</div></div>
                            </div>
                        </div>
                        <div class="case-thing">
                            <div class="case-usal">
                                <div class="flex case-hot">
                                    <div class="flex-1 case-hot2 flex"><div class="min-radius"></div><div>案发事件:火灾报警</div></div>
                                    <div class="flex-1 case-hot3 flex"><div class="min-radius"></div><div>案发时间:2019年12月16日</div></div>
                                </div>
                                <div class="flex case-hot">
                                    <div class="flex-1 flex"><div class="min-radius"></div><div>报警人:刘娜娜</div></div>
                                    <div class="flex-1 flex"><div class="min-radius"></div><div>联系电话:13768789955</div></div>
                                </div>
                                <div class="case-hot ch-col flex"><div class="min-radius"></div><div>案发地址:吉安市冀州区华彩大厦2栋32楼405市</div></div>
                            </div>
                        </div>
                        <div class="case-thing">
                            <div class="case-usal">
                                <div class="flex case-hot">
                                    <div class="flex-1 case-hot2 flex"><div class="min-radius"></div><div>案发事件:火灾报警</div></div>
                                    <div class="flex-1 case-hot3 flex"><div class="min-radius"></div><div>案发时间:2019年12月16日</div></div>
                                </div>
                                <div class="flex case-hot">
                                    <div class="flex-1 flex"><div class="min-radius"></div><div>报警人:刘娜娜</div></div>
                                    <div class="flex-1 flex"><div class="min-radius"></div><div>联系电话:13768789955</div></div>
                                </div>
                                <div class="case-hot ch-col flex"><div class="min-radius"></div><div>案发地址:吉安市冀州区华彩大厦2栋32楼405市</div></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="frequency">
                    <div class="flex">
                        <div class="fr-text">案发频率趋势图</div>
                        <div>
                            <select name="" id="" class="fr-sel">
                                <option value="">1月1日——12.16日</option>
                            </select>
                        </div>
                    </div>
                    <div class="fr-bg">
                      <div class="chart" id="chart"></div>
                    </div>
                </div>
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
                        <div class="fr-text">案发时间柱状图</div>
                        <div>
                            <select name="" id="" class="ri-selected1"><option value="">16日</option></select>
                        </div>
                        <div>
                            <select name="" id="" class="ri-selected2"><option value="">8:00-18:00</option></select>
                        </div>
                    </div>
                    <div class="ri-bg">
                        <div class="chart2" id="chart2"></div>
                    </div>
                </div>
                <div class="right-top">
                    <div class="flex crime">
                        <div class="fr-text">案发频率趋势图</div>
                        <div>
                            <select name="" id="" class="ri-selected1"><option value="">1月1日——11月16日</option></select>
                        </div>
                    </div>
                    <div class="ri-bg">
                        <div class="chart2" id="chart3"></div>
                    </div>
                </div>
                <div class="right-top">
                    <div class="flex crime">
                        <div class="fr-text">案件监控</div>
                    </div>
                    <div class="ri-bg">
                        <div class="ri-query flex">
                            <div class="ri-left flex">
                                <div class="ri-icon">
                                    <img src="img/arr4.png" class="ri-min">
                                    <img src="img/arr22.png" class="ri-min">
                                    <img src="img/arr10.png" class="ri-min">
                                </div>
                                <div class="ri-text">青园区花园小区监控</div>
                            </div>
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
</body>
</html>