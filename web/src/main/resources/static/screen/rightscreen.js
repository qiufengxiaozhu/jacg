

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
        
        var categorys = [];
        for(var i=0;i<value.listdit.length;i++){
            var dit  =value.listdit[i];
            categorys.push(dit.label);
        }

        var areaname = [];
        for(var i=0;i<value.listArea.length;i++){
            var area  =value.listArea[i];
            areaname.push(area.name);
        }


        var series = [];
        for(var i=0;i<value.listMap.length;i++){
            var map  =value.listMap[i];
            var data = [];
            for(var j=0;j<value.listArea.length;j++){
                var area  =value.listArea[j];
                var sname=area.name;
                data.push(map[sname]);
            }

            var serie = {
                name:map.name,
                type:'bar',
                barWidth : 30,
                stack: '分宜',
                data:data
            }
            series.push(serie);
        }


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
                data:categorys
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
                    data : areaname

                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : series
        };

        if (option1 && typeof option1 === "object") {
            myChart2.setOption(option1, true);
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


    zudp.ajax("/mm/screen/getrightEvenType" ).get().then(function (value) {
        
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
            legend: {
                data: data
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
                data:datas,
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
                trigger: 'item',
                formatter:'{c}'　　　　//这是关键，在需要的地方加上就行了
            },
            grid: {
                borderWidth: 0,
                y: 80,
                y2: 60
            },
            xAxis: {
                type: 'category',
                data: data
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: datas,
                type: 'bar'
            }]



        };

        if (option4 && typeof option4 === "object") {
            myChart4.setOption(option4, true);
        }

    }, function (reason) {
        zudp.plugin.dialog("error").alert("查询拼图失败！", "提示");
    });



}