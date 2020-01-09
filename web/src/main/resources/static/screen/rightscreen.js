

//案发时间 柱状图
function rightglfx() {

    var dom2 = document.getElementById("myChart2");
    var myChart2 = echarts.init(dom2);

    myChart2.showLoading({
        text : "正在加载...",
        effect :"ring" ,//可选为：'spin' | 'bar' | 'ring' | 'whirling' | 'dynamicLine' | 'bubble'
        maskColor: 'rgba(255, 255, 255, 0)',
        textColor: '#fff',
        textStyle : {
            fontSize : 20,
            color:'fff'
        }
    });

    zudp.ajax("/mm/screen/getIndex" ).get().then(function (value) {
        // debugger;
        var categorys = [];
        for(var i=0;i<value.listdit.length;i++){
            var dit  =value.listdit[i];
            categorys.push(dit.name);
        }

        var areaname = [];
        for(var i=0;i<value.listArea.length;i++){
            var area  =value.listArea[i];
            areaname.push(area);
        }

        var jdsum = [];
        for(var i=0;i<value.listTypeSum.length;i++){
            var s  =value.listTypeSum[i].num;
            jdsum.push(s);
        }



// debugger;
        var series = [];
        for(var i=0;i<value.listMap.length;i++){
            var map  =value.listMap[i];
            var data = [];
            for(var j=0;j<value.listArea.length;j++){
                var area  =value.listArea[j];
                var sname=area;
                data.push(map[sname]);
            }

            var serie = {
                name:map.name,
                type:'bar',
                barWidth : 30,
                stack: '分宜',
                data:data,

            }
            series.push(serie);
        }



        var serie = {
            name: '总数',
            type: 'bar',
            barGap: '-100%',         // 左移100%，stack不再与上面两个在一列
            label: {
                normal: {
                    show: true,
                    position: 'top',       //  位置设为top
                    formatter: '{c}',
                    textStyle: { color: '#fff' }
                }
            },
            itemStyle: {
                normal: {
                    color: 'rgba(128, 128, 128, 0)'    // 仍为透明
                }
            },
            data: jdsum
        }


        series.push(serie);




        option1 = null;
        myChart2.hideLoading();
        option1 = {
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }

            },
            legend: {
                data:categorys,
                textStyle:{

                    color:'#fff'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '12%',
                containLabel: true
            },
            xAxis : [
                {
                    type : 'category',
                    data : areaname,
                    axisLine:{
                        lineStyle:{
                            color:'#FFA500'
                        }
                    }

                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLine:{
                        lineStyle:{
                            color:'#FFA500'
                        }
                    }
                }
            ],
            series : series
        };




        if (option1 && typeof option1 === "object") {
            myChart2.setOption(option1, true);

          myChart2.on('click', function (params) {

                var frameSrc = "/mm/screen/glarea?name="+params.name;
               document.getElementById("qyssfx").innerText="关联分析季度案件列表";
                $("#company_amoun_iframe").attr("src", frameSrc);
                $('#company_amoun').show();
                $('#company_amoun').css("display","block");

            });


        }






    }, function (reason) {
        zudp.plugin.dialog("error").alert("查询拼图失败！", "提示");
    });



}


//案发频率趋势图
function rightEvenType() {
   //根据类型 划分



    var dom3 = document.getElementById("chart3");
    var myChart3 = echarts.init(dom3);
    myChart3.showLoading({
        text : "正在加载...",
        effect :"ring" ,//可选为：'spin' | 'bar' | 'ring' | 'whirling' | 'dynamicLine' | 'bubble'
        maskColor: 'rgba(255, 255, 255, 0)',
        textColor: '#fff',
        textStyle : {
            fontSize : 20,
            color:'fff'
        }
    });


    zudp.ajax("/mm/screen/getrightEvenTypes" ).get().then(function (value) {
        
        var data = [];
        var datas = [];
        for(var i=0;i<value.length;i++){
            var values  =value[i];
            data.push(values.name);
            var serie = {
                value:values.num, name:values.name
            }
            datas.push(serie);
        }

        option3 = null;
        myChart3.hideLoading();
        option3 = {
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
      /*      legend: {
                orient: 'vertical',
                data: data,
                top:'5%',
                align: 'right',
                right:"0"

            },
*/

            series: [{
                name: '销量',
                type: 'pie',
                radius: ['30%', '50%'],
                avoidLabelOverlap: false,
                symbol: 'none',
                lineStyle: {
                    width: 0,
                    color: 'rgba(0, 0, 0, 0)'
                },
                itemStyle:{
                    normal:{
                        label:{
                            show: true,
                            formatter: '{b} : ({d}%)'
                        },
                        labelLine :{show:true}
                    }
                },
                data:datas,
                normal:{
                    label:{
                        show: true,
                        formatter: '{b} : ({d}%)'
                    },
                    labelLine :{show:true}
                },
                barWidth : 20,
                barGap:'-50%',
                label : {
                    normal : {
                        formatter: '{b}:({d}%)',
                        textStyle : {
                            fontWeight : 'normal',
                            fontSize : 15
                        }
                    }
                },
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

        if (option3 && typeof option3 === "object") {
            myChart3.setOption(option3, true);
        }

    }, function (reason) {
        zudp.plugin.dialog("error").alert("查询拼图失败！", "提示");
    });



}





//区域案件预警
function getrightCaseNum() {
    //根据区域案件预警



    var dom4 = document.getElementById("chart4");
    var myChart4 = echarts.init(dom4);
    myChart4.showLoading({
        text : "正在加载...",
        effect :"ring" ,//可选为：'spin' | 'bar' | 'ring' | 'whirling' | 'dynamicLine' | 'bubble'
        maskColor: 'rgba(255, 255, 255, 0)',
        textColor: '#fff',
        textStyle : {
            fontSize : 20,
            color:'fff'
        }
    });


    zudp.ajax("/mm/screen/getrightEvenType" ).get().then(function (value) {
        
        var data = [];
        var datas = [];
        for(var i=0;i<value.length;i++){
            var values  =value[i];
            data.push(values.name);
            datas.push(values.num);
        }

        option4 = null;
        myChart4.hideLoading();

        option4 =  {


            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                },

            },
            legend: {
                data: ['统计']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                boundaryGap: [0, 1],
                axisLabel: {
                    textStyle: {
                        color: '#FFFFFF'
                    }
                },
                splitLine:{
                    show:false
                }
               // splitNumber : 1
            },
            yAxis: {
                type: 'category',
                data: data,
                axisLabel: {
                    textStyle: {
                        color: '#FFFFFF'
                    }
                },
                splitLine:{
                    show:false
                },
                splitNumber : 1

            },
            series: [
                {
                    name: '2018年',
                    type: 'bar',
                    data: datas,
                    center: ['60%', '20%'],
                    itemStyle: {        //上方显示数值
                        normal: {
                            label: {
                                show: true, //开启显示
                                position: 'right', //在上方显示
                                textStyle: { //数值样式
                                    color: '#FFFFFF',
                                    fontSize: 16
                                }
                            }
                        }
                    }
                }
            ]



        };

        if (option4 && typeof option4 === "object") {
            myChart4.setOption(option4, true);
            myChart4.on('click', function (params) {

                var frameSrc = "/mm/screen/glCommunity?name="+params.name;
                document.getElementById("qyssfx").innerText="社区案件列表";
                $("#company_amoun_iframe").attr("src", frameSrc);
                $('#company_amoun').show();
                $('#company_amoun').css("display","block");

            });

        }

    }, function (reason) {
        zudp.plugin.dialog("error").alert("查询拼图失败！", "提示");
    });



}
