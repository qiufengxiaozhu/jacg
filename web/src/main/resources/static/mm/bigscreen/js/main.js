$(function(){
    var map = new BMap.Map("container");
    // 创建地图实例  
    var point = new BMap.Point(116.304, 39.888);
    // 创建点坐标  
    map.disableDragging();
    map.centerAndZoom(point, 15);
    var  mapStyle ={ 
        features: ["road", "building","water","land"],//隐藏地图上的poi
        style : "dark"  //设置地图风格为高端黑
    }
    map.setMapStyle(mapStyle);
      function ComplexCustomOverlay(point){
        this._point = point;
      }
      ComplexCustomOverlay.prototype = new BMap.Overlay();
      ComplexCustomOverlay.prototype.initialize = function(map){
        this._map = map;
        var div = this._div = document.createElement("div");
        div.classList.add("map-log");
        var divA = document.createElement("div");
        divA.classList.add("A");
        var div2 = document.createElement("div");
        div2.classList.add("map-text");
        var div3 = document.createElement("div");
        div3.classList.add("map-cont");
        var div4 = document.createElement("div");
        var div5 = document.createElement("div");
        var div6 = document.createElement("div");
        var div7 = document.createElement("div");
        div3.innerHTML = '当前状态';
        div4.innerHTML = '案件: &nbsp;电话报警';
        div5.innerHTML = '案件状态: &nbsp;处理中';
        div6.innerHTML = '案件负责人: &nbsp;刘青云';
        div7.innerHTML = '操作:';

        div.appendChild(div2);
        div2.appendChild(div3);
        div2.appendChild(div4);
        div2.appendChild(div5);
        div2.appendChild(div6);
        div2.appendChild(div7);
        
        map.getPanes().labelPane.appendChild(div);
        map.getPanes().labelPane.appendChild(divA);
        return div;
      }
      ComplexCustomOverlay.prototype.draw = function(){
        var map = this._map;
        var pixel = map.pointToOverlayPixel(this._point);
        console.log(pixel.x);
        console.log(pixel.y);

        this._div.parentNode.style.left = pixel.x +"px";
        this._div.parentNode.style.top  = pixel.y + "px";
        console.log(this._div)
      }
        var myCompOverlay1 = new ComplexCustomOverlay(new BMap.Point(116.304, 39.888));
        map.addOverlay(myCompOverlay1);




    var myChart = echarts.init(document.getElementById('chart'));
    var myChart2 = echarts.init(document.getElementById('chart2'));
    var myChart3 = echarts.init(document.getElementById('chart3'));

    /**
     * 第一个图
     */
        var option = {
            tooltip: {},
            grid: {
                left: '1%',
                right: '-10%',
                bottom: '17%',
                containLabel: true
            },
            xAxis: {
                data: ["季度", '', "第一季度", '', "第二季度", '', "第三季度", '', "第四季度"],
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                axisLabel:{  
                    textStyle:{
                        fontSize: 10,
                        color: '#fff'
                    },
                    interval: 0
                },
                boundaryGap: false
            },
            yAxis: {
                show: false,
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                max:40,
			    minInterval: 6,
            },
            series: [{
                name: '销量',
                type: 'line',
                smooth: true,
                symbol: 'none',
                lineStyle: {
                    width: 0,
                    color: 'rgba(0, 0, 0, 0)'
                },
                data: [8, 2, 15, 2, 22, 4, 14],
                areaStyle: {
                    color: {
                        type: 'linear',
                        colorStops: [{
                            offset: 0, color: '#BDBDBD'
                        }],
                        global: false
                    }
                },
            }],
        };
        myChart.setOption(option);
        /**
         * 第二个图
         */
        var option2 = {
            tooltip: {},
            grid: {
                left: '2%',
                right: '-5%',
                bottom: '17%',
                containLabel: true
            },
            xAxis: {
                data: ["时间", "8点", "10点", "12点", "14点", "16点", "18点"],
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                axisLabel:{  
                    textStyle:{
                        fontSize: 8,
                        color: '#fff'
                    },
                    interval: 0
                },
                boundaryGap: false,
                max: 7
            },
            yAxis: {
                show: false,
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                max:20,
			    minInterval: 4,
            },
            series: [
                {
                    type: 'bar',
                    smooth: true,
                    symbol: 'none',
                    lineStyle: {
                        width: 0,
                        color: 'rgba(0, 0, 0, 0)'
                    },
                    data: [30, 30, 30, 30, 30, 30, 30],
                    barWidth : 20,
                    itemStyle: {
                        normal: {
                            color: '#281C5F'
                            }
                        }
                },
                {
                    type: 'bar',
                    smooth: true,
                    symbol: 'none',
                    lineStyle: {
                        width: 0,
                        color: 'rgba(0, 0, 0, 0)'
                    },
                    data: [8, 20, 15, 24, 22, 8, 14],
                    barWidth : 20,
                    barGap:'-100%',
                    itemStyle: {
                        normal: {
                            color: function(params) {
                                var colorList = ['#FFC1C1','#FFA500', '#D1EEEE','#ADFF2F','#97FFFF','#FFA500', '#D1EEEE'];
                                return colorList[params.dataIndex]
                                },
                                label: {
                                    show: true,
                                    position: 'top',
                                    textStyle: {
                                        color: '#fff',
                                        fontSize: 10
                                    }
                                }
                            }
                        }
                },

        ],
        };
        myChart2.setOption(option2);
        /**
         * 第三个图
         */
        var option3 = {
            tooltip: {},
            grid: {
                left: '2%',
                right: '-5%',
                bottom: '17%',
                containLabel: true
            },
            series: [{
                name: '销量',
                type: 'pie',
                radius: ['50%', '70%'],
                avoidLabelOverlap: false,
                symbol: 'none',
                lineStyle: {
                    width: 0,
                    color: 'rgba(0, 0, 0, 0)'
                },
                data:[
                    {value:15, name:'15%'},
                    {value:40, name:'40%'},
                    {value:30, name:'15%'},
                    {value:15, name:'30%'}
                ],
                barWidth : 20,
                barGap:'-50%',
                itemStyle: {
                    normal: {
                        color: function(params) {
                            var colorList = ['#FFC1C1','#FFA500', '#D1EEEE','#ADFF2F','#97FFFF','#FFA500', '#D1EEEE'];
                            return colorList[params.dataIndex]
                        }
                    }
                }
            }],
        };
        myChart3.setOption(option3);
})