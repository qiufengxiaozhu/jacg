<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>便民服务</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">

    <script type="text/javascript" src="/mm/js/rem.js"></script>
    <script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="/mm/css/index.css">

    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=7a6QKaIilZftIMmKGAFLG7QT1GLfIncg"></script>

</head>

<body>
<div class="container-app">
    <div class="top flex flex-c-c">
        <div class="top-return"></div>
        <div class="return" onclick="goIndex()">返回</div>
    </div>

    <!-- 头部背景 -->
    <div class="container-top flex flex-c-c flex-r-c">

        <#if MMConvenientList?exists && MMConvenientList??>
            <div id="allmap" style="width: 100%;height: 100%;"></div>
            <div id="r-result">

                <#list 0..(MMConvenientList!?size-1) as i>
                <#--经度:--> <input id="longitude${i}" type="hidden" value="${MMConvenientList[i].longitude!""}"/>
                <#--纬度:--> <input id="latitude${i}"  type="hidden" value='${MMConvenientList[i].latitude!""}' />
                <#--                    <input type="button" value="查询" onclick="theLocation(this)" />-->
                    <input type="hidden" id="searchLocation" />
                </#list>

            </div>
        <#else>

            <div class="head-center">
                <p>便民服务</p>
                <img src="/mm/img/rx-img.png" class="head-img">
            </div>
        </#if>
    </div>


    <!-- 底部内容按键等 -->
    <div class="container-bottom">
        <div class="bottom-title flex flex-c-c">
            <span class="border-left"></span><h3>便民服务</h3>
        </div>

            <#list 0..(ListType!?size-1) as i>

                <#if i % 4 == 0>

                    <div class="bottom-content">
                        <ul class="list flex">

                            <#if i < ListType?size >
                                <li class="flex flex-c-c">
                                    <span class="space"></span>

                                    <a href="/mm/mmConvenient/getConvenientList?id=${ListType[i].id!}">${ListType[i].label!}</a>
                                </li>
                            </#if>
                            <#if i+1 < ListType?size >
                                    <li class="flex flex-c-c">
                                        <span class="space"></span>
                                        <a href="/mm/mmConvenient/getConvenientList?id=${ListType[i+1].id!}">${ListType[i+1].label!}</a>
                                    </li>
                            </#if>
                            <#if i+2 < ListType?size >
                                    <li class="flex flex-c-c">
                                        <span class="space"></span>
                                        <a href="/mm/mmConvenient/getConvenientList?id=${ListType[i+2].id!}">${ListType[i+2].label!}</a>
                                    </li>
                            </#if>
                            <#if i+3 < ListType?size >
                                <li class="flex flex-c-c">
                                    <span class="space"></span>
                                    <a href="/mm/mmConvenient/getConvenientList?id=${ListType[i+3].id!}">${ListType[i+3].label!}</a>
                                </li>
                            </#if>
                        </ul>
                    </div>

                </#if>
            </#list>

    </div>
</div>

</body>
<script>

    /**
     * 返回首页
     */
    function goIndex() {

        window.location.href='/mm/news/index';
    }

    // 百度地图API功能
    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(116.331398, 39.897445), 19);
    map.enableScrollWheelZoom(true);

    // map.addControl(new BMap.MapTypeControl());//地图类型控件 默认右上角可切换地图/卫星/三维三种状态

    var new_point = "";
    var marker = "";
    // 用经纬度设置地图中心点
    $(document).ready(function () {

        // var baidu = $("#longitude1").val();
        // alert("第一个标记点经度："+baidu);

        <#list 0..(MMConvenientList!?size-1) as i>

            if ($("#longitude${i}").val() != "" && $("#latitude${i}").val() != "") {
                // map.clearOverlays();

                <#--alert("经度："+$("#longitude${i}").val() +"  纬度"+$("#latitude${i}").val());-->
                new_point = new BMap.Point($("#longitude${i}").val(), $("#latitude${i}").val());
                marker = new BMap.Marker(new_point); // 创建标注
                map.addOverlay(marker); // 将标注添加到地图中
                map.panTo(new_point);
            }
        </#list>



    });
    // function theLocation(obj) {
    //     if ($(obj).prev().prev().val() != "" && $(obj).prev().val() != "") {
    //         // map.clearOverlays();
    //
    //         alert("经度："+$(obj).prev().prev().val() +"  纬度"+$(obj).prev().val());
    //         new_point = new BMap.Point($(obj).prev().prev().val(), $(obj).prev().val());
    //         marker = new BMap.Marker(new_point); // 创建标注
    //         map.addOverlay(marker); // 将标注添加到地图中
    //         map.panTo(new_point);
    //     }
    // }

</script>
</html>