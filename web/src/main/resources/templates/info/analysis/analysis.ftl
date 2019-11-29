<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link href="css/third/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/third/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/third/animate.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=4.1.0" rel="stylesheet">
    <style>
        .sl-left{ position:relative;  margin-left: 230px;  }
        .sl-left .bd{ padding:10px; }
        .sl-left .bd .tempWrap{ width:100% !important; }/* 用 !important覆盖SuperSlide自动生成的宽度，这样就可以手动控制可视宽度。 */
        .sl-left .bd ul{ overflow:hidden; zoom:1; }
        .sl-left .bd ul li{ margin-right:200px;  float:left; height:24px; line-height:24px;  text-align:left; _display:inline; width:auto !important;  list-style-type: none}
        .sl-left .bd ul li span{ color:#999;  }
        .i-time{float: left;width: 230px;    height: 46px; line-height: 46px;padding: 0 10px;}
        .i-time span{margin:0 8px}
        .i-time span.jr{padding:5px;color:#fff;background: #01D0A8}
        .ibox-content{padding-bottom: 15px}
        .ibox2 .ibox-content{padding: 6px 5px;}
        .gb-icon{width: 30px;height: 30px;display: inline-block}
    </style>
</head>
<body class="gray-bg">
<div class="clearfix" style="background: #fff">
    <div class="i-time"><img src="/img/gb.png" class="gb-icon" alt=""><span id="yearsSpanId">2019-11-21</span><span id="timeSpanId">14:51</span><span id="weekSpanId">星期四</span></div>
    <div class="sl-left">
        <div class="bd">
            <ul class="infoList" id="alertUlId">
                <li><span class="date">2011-11-11</span><a href="" target="_blank">中国打破了世界软件巨头规则</a></li>
                <li><span class="date">2011-11-11</span><a href="" target="_blank">口语：会说中文就能说英语！</a></li>
                <li><span class="date">2011-11-11</span><a href="" target="_blank">农场摘菜不如在线学外语好玩</a></li>
                <li><span class="date">2011-11-11</span><a href="" target="_blank">数理化老师竟也看学习资料？</a></li>
                <li><span class="date">2011-11-11</span><a href="" target="_blank">学英语送ipad2,45天突破听说</a></li>
                <li><span class="date">2011-11-11</span><a href="" target="_blank">学外语，上北外！</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="col-row clearfix">
        <div class="col-5x-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right month">截止2019-11</span>
                    <h5>单元网格</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" >1375<span class="font-red">个</span></h1>
                </div>
            </div>
        </div>
        <div class="col-5x-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-info pull-right month">截止2019-11</span>
                    <h5>基础部件</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" >49544<span class="font-red">个</span></h1>
                </div>
            </div>
        </div>

        <div class="col-5x-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-primary pull-right year">今天</span>
                    <h5>监督员</h5>
                </div>
                <div class="ibox-content">

                    <h1 class="no-margins">7<span class="font-red">人</span></h1>


                </div>
            </div>
        </div>
        <div class="col-5x-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>视频监控</h5>
                    <div class="ibox-tools">
                        <span class="label label-warning month">截止2019-11</span>
                    </div>
                </div>
                <div class="ibox-content ">
                    <h1 class="no-margins">129<span class="font-red">位</span></h1>
                </div>

            </div>
        </div>
        <div class="col-5x-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>车载GPS</h5>
                    <div class="ibox-tools">
                        <span class="label label-danger month">截止2019-11</span>
                    </div>
                </div>
                <div class="ibox-content ">
                    <h1 class="no-margins">20<span class="font-red">辆</span></h1>
                </div>

            </div>
        </div>
    </div>
    <div class="col-row clearfix">
        <div class="col-md-9">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>各社区案件统计情况分析</h5>
                    <span class="label label-success pull-right month">截止2019-11</span>
                </div>
                <div class="ibox-content">
                    <div style="width: 100%;height: 300px">
                        <div id="chart1" style="width: 100%;height: 300px"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>案件类型占比情况分析</h5>
                    <span class="label label-success pull-right month">截止2019-11</span>
                </div>
                <div class="ibox-content">
                    <div style="width: 100%;height: 300px">
                        <div id="chart2" style="width: 100%;height: 300px"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-row">
        <div class="col-md-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>我的待办</h5>
                </div>
                <div class="ibox-content">
                    <div style="width: 100%;height: auto">
                        <table class="table table-bordered">
                            <thead>
                            <tr >
                                <th width="10%">状态</th>
                                <th width="20%">案件号</th>
                                <th width="15%">来件时间</th>
                                <th width="10%">待办环节</th>
                                <th width="45%">任务描述</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>核查中</td>
                                <td>智慧城管[2019]字第[9647]号 督办[3]</td>
                                <td>2019-11-20 14:10:19</td>
                                <td>监督员核查</td>
                                <td>井盖又破了</td>
                            </tr>
                            <tr>
                                <td>核查中</td>
                                <td>智慧城管[2019]字第[9647]号 督办[3]</td>
                                <td>2019-11-20 14:10:19</td>
                                <td>监督员核查</td>
                                <td>井盖又破了</td>
                            </tr>
                            <tr>
                                <td>核查中</td>
                                <td>智慧城管[2019]字第[9647]号 督办[3]</td>
                                <td>2019-11-20 14:10:19</td>
                                <td>监督员核查</td>
                                <td>井盖又破了</td>
                            </tr>
                            <tr>
                                <td>核查中</td>
                                <td>智慧城管[2019]字第[9647]号 督办[3]</td>
                                <td>2019-11-20 14:10:19</td>
                                <td>监督员核查</td>
                                <td>井盖又破了</td>
                            </tr>
                            <tr>
                                <td>核查中</td>
                                <td>智慧城管[2019]字第[9647]号 督办[3]</td>
                                <td>2019-11-20 14:10:19</td>
                                <td>监督员核查</td>
                                <td>井盖又破了</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/js/third/jquery.min.js"></script>
<script src="/js/third/jquery.SuperSlide.2.1.1.js"></script>
<script src="/js/third/echarts.min.js"></script>
<script>
    jQuery(".sl-left").slide({mainCell:".bd ul",autoPlay:true,effect:"leftMarquee",interTime:50,trigger:"click"});
    var dom1 = document.getElementById("chart1");
    var myChart1 = echarts.init(dom1);
    option1 = null;
    option1 = {
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data:['市容环境','宣传广告','施工管理','街面秩序','突发事件','其他事件']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
                type : 'category',
                data : ['青山\n社区','文教\n社区','政法巷\n社区','保健巷\n社区','松湖\n社区','泗水路\n社区','天工\n社区','府前\n社区','矿建\n社区','江锻\n社区','二处\n社区']

            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'市容环境',
                type:'bar',
                barWidth : 30,
                stack: '分宜',
                data:[320, 332, 301, 334, 390, 330, 332, 301, 334, 390, 330]
            },
            {
                name:'宣传广告',
                type:'bar',
                barWidth : 30,
                stack: '分宜',
                data:[120, 132, 101, 134, 90, 230, 332, 301, 334, 390, 330]
            },
            {
                name:'施工管理',
                type:'bar',
                barWidth : 30,
                stack: '分宜',
                data:[220, 182, 191, 234, 290, 330, 332, 301, 334, 390, 330]
            },
            {
                name:'街面秩序',
                type:'bar',
                barWidth : 30,
                stack: '分宜',
                data:[150, 232, 201, 154, 190, 330, 332, 301, 334, 390, 330]
            },
            {
                name:'突发事件',
                type:'bar',
                barWidth : 30,
                stack: '分宜',
                data:[862, 1018, 964, 1026, 1679, 1600, 332, 301, 334, 390, 330]
            },
            {
                name:'其他事件',
                type:'bar',
                barWidth : 30,
                stack: '分宜',
                data:[620, 732, 701, 734, 1090, 1130, 332, 301, 334, 390, 330]
            }
        ]
    };

    if (option1 && typeof option1 === "object") {
        myChart1.setOption(option1, true);
    }


    var dom2 = document.getElementById("chart2");
    var myChart2 = echarts.init(dom2);
    option2 = null;
    option2 = {
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            data: ['市容环境','宣传广告','施工管理','街面秩序','突发事件','其他事件']
        },
        series : [
            {
                name: '访问来源',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:335, name:'市容环境'},
                    {value:310, name:'宣传广告'},
                    {value:234, name:'施工管理'},
                    {value:135, name:'街面秩序'},
                    {value:1548, name:'突发事件'},
                    {value:1548, name:'其他事件'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    if (option2 && typeof option2 === "object") {
        myChart2.setOption(option2, true);
    }


</script>
</html>
