var map;

$(function(){
    $('.map-log').hide();
    $('.close').on('click',function(){
        $(this).parent().hide();
    })
    map = new BMap.Map("container");
    // 创建地图实例  
    var point = new BMap.Point(114.995314,27.110965);
    // 创建点坐标  
    // map.disableDragging();
    map.centerAndZoom(point, 15);
    map.enableScrollWheelZoom();
    map.disableDoubleClickZoom(true);
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
        div.classList.add("map-radio");

        var divA = this._divA = document.createElement("div");
        divA.classList.add("map-img");

        map.getPanes().labelPane.appendChild(div);
        map.getPanes().labelPane.appendChild(divA);
        var arr = [div,divA];
        return div;

    }
    ComplexCustomOverlay.prototype.draw = function(){
        var map = this._map;
        var pixel = map.pointToOverlayPixel(this._point);
        console.log(pixel.x);
        console.log(pixel.y);

        this._div.parentNode.style.left = pixel.x +"px";
        this._div.parentNode.style.top  = pixel.y + "px";

        this._divA.parentNode.style.left = pixel.x +"px";
        this._divA.parentNode.style.top  = pixel.y + "px";
        console.log(this._div)
    }
    var myCompOverlay1 = new ComplexCustomOverlay(new BMap.Point(116.304, 39.888));
    map.addOverlay(myCompOverlay1);

    zudp.ajax("/mm/screen/glCaseList" ).get().then(function (value) {

        // 随机向地图添加25个标注
        var bounds = map.getBounds();
        var sw = bounds.getSouthWest();
        var ne = bounds.getNorthEast();
        var lngSpan = Math.abs(sw.lng - ne.lng);
        var latSpan = Math.abs(ne.lat - sw.lat);
        for(var i=0;i<value.length;i++){
            var point = new BMap.Point(value[i].x ,value[i].y );
            var label = new BMap.Label("我是id="+i,{offset:new BMap.Size(20,-10)});
            addMarker(point,value[i].STREETNAME,label);
        }

// 编写自定义函数,创建标注
        function addMarker(point,name){
            var marker = new BMap.Marker(point);
            var myIcon = new BMap.Icon("../bigscreen/img/arr27.png", new BMap.Size(40,50));
            var marker2 = new BMap.Marker(point,{icon:myIcon});  // 创建标注
            map.addOverlay(marker2);
            addClickHandler(name,marker2);
            marker.setLabel(label);
        }

        $('.new-case').slide({mainCell:".scroll",autoPlay:true,autoPage:true,effect:"top",vis:3,interTime:2000});

        function addClickHandler(content,marker){
            marker.addEventListener("click",function(e){

                    var frameSrc = "/mm/screen/glindexCase?name="+content;
                    document.getElementById("qyssfx").innerText=content;
                    $("#company_amoun_iframe").attr("src", frameSrc);
                    $('#company_amoun').show();
                    $('#company_amoun').css("display","block");

                }
            );
        }
        function openInfo(content,e){
            var p = e.target;
            var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
            var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
            map.openInfoWindow(infoWindow,point); //开启信息窗口
        }




    }, function (reason) {
        zudp.plugin.dialog("error").alert("查询拼图失败！", "提示");
    });


    /**
     * 地图上点击事件
     //  */
    var temp = true;
    $('.map-img').on('click',function(){
        if(temp){
            $('.map-log').show();
            temp = false;
        }else{
            $('.map-log').hide();
            temp = true;
        }
    })


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
        series: [{
            name: '销量',
            type: 'pie',
            radius: ['0%', '0%'],
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
            barWidth : 10,
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




function ComplexCustomOverlay(point){
    this._point = point;
}
ComplexCustomOverlay.prototype = new BMap.Overlay();
ComplexCustomOverlay.prototype.initialize = function(map){

    this._map = map;
    var div = this._div = document.createElement("div");
    div.classList.add("map-radio");

    var divA = this._divA = document.createElement("div");
    divA.classList.add("map-img");

    map.getPanes().labelPane.appendChild(div);
    map.getPanes().labelPane.appendChild(divA);
    var arr = [div,divA];
    return div;

}
ComplexCustomOverlay.prototype.draw = function(){
    var map = this._map;
    var pixel = map.pointToOverlayPixel(this._point);
    console.log(pixel.x);
    console.log(pixel.y);

    this._div.parentNode.style.left = pixel.x +"px";
    this._div.parentNode.style.top  = pixel.y + "px";

    this._divA.parentNode.style.left = pixel.x +"px";
    this._divA.parentNode.style.top  = pixel.y + "px";
    console.log(this._div)
}


function showManhole() {
    if (manholeis==0){
        
        zudp.ajax("/mm/screen/glindexManholeis" ).get().then(function (value) {
            
            for(var i=0;i<value.length;i++){
                var s= value[i].XY;
                var strs= new Array(); //定义一数组
                strs=s.split(","); //字符分割

                var point = new BMap.Point(strs[0],strs[1]);
                var label = new BMap.Label(".",{offset:new BMap.Size(20,-10)});
                addMarker(point,label);
            }


            manholeis=1;//显示

        }, function (reason) {
            zudp.plugin.dialog("error").alert("查询拼图失败！", "提示");
        });

    } else {

        deletePoint();
        addCase();
        manholeis=0;//隐藏
    }







}


// 编写自定义函数,创建标注
function addMarker(point,label){
    var marker = new BMap.Marker(point);
    var myIcon = new BMap.Icon("../bigscreen/img/arrjg.png", new BMap.Size(20,35));
    var marker2 = new BMap.Marker(point,{icon:myIcon});  // 创建标注
    map.addOverlay(marker2);
    marker.setLabel(label);
}

function deletePoint(){

    map.clearOverlays();
    addCase();

/*    var allOverlay = map.getOverlays();
    for (var i = 0; i < allOverlay.length -1; i++){
         if(allOverlay[i].getLabel()!=null){
             if(allOverlay[i].getLabel().content == "."){
                 map.removeOverlay(allOverlay[i]);
                 return false;
             }
         }

    }*/
}

function addCase(casetype){

    zudp.ajax("/mm/screen/glCaseList" ).get().then(function (value) {
      
        // 随机向地图添加25个标注
        var bounds = map.getBounds();
        var sw = bounds.getSouthWest();
        var ne = bounds.getNorthEast();
        var lngSpan = Math.abs(sw.lng - ne.lng);
        var latSpan = Math.abs(ne.lat - sw.lat);
        for(var i=0;i<value.length;i++){
            var point = new BMap.Point(value[i].x ,value[i].y );
            var label = new BMap.Label("我是id="+i,{offset:new BMap.Size(20,-10)});
            addMarkercase(point,value[i].STREETNAME,casetype,value[i].DISTRICTNAME);
        }





    }, function (reason) {
        zudp.plugin.dialog("error").alert("查询拼图失败！", "提示");
    });


}

// 编写自定义函数,创建标注
function addMarkercase(point,name,casetype,nametype){
    
    var marker = new BMap.Marker(point);
    var myIcon="";
    if (casetype!=null){
        if (nametype==casetype) {
            myIcon  = new BMap.Icon("../bigscreen/img/arr27.png", new BMap.Size(40,50));
        }else {
            myIcon  = new BMap.Icon("../bigscreen/img/arrhide.png", new BMap.Size(40,50));
        }
    } else{
        myIcon  = new BMap.Icon("../bigscreen/img/arr27.png", new BMap.Size(40,50));
    }



    var marker2 = new BMap.Marker(point,{icon:myIcon});  // 创建标注
    map.addOverlay(marker2);
    addClickHandler(name,marker2);

}



function addClickHandler(content,marker){
    marker.addEventListener("click",function(e){

            var frameSrc = "/mm/screen/glindexCase?name="+content;
            document.getElementById("qyssfx").innerText=content;
            $("#company_amoun_iframe").attr("src", frameSrc);
            $('#company_amoun').show();
            $('#company_amoun').css("display","block");

        }
    );
}
function openInfo(content,e){
    var p = e.target;
    var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
    var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
    map.openInfoWindow(infoWindow,point); //开启信息窗口
}

function casenow(casetype) {
    map.clearOverlays();
    addCase(casetype);
}