<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>便民服务</title>
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">

	<script type="text/javascript" src="/mm/js/rem.js"></script>
	<script type="text/javascript" src="/mm/js/jquery-1.11.0.min.js"></script>
	<link rel="stylesheet" href="/mm/css/index.css">

    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=F0i6SrLmHquLVNLCqpExxPrj8mWVdFwx"></script>

	<style>
		/*去掉百度地图标志*/
		.BMap_cpyCtrl {
			display: none;
		}

		.anchorBL {
			display: none;
		}
	</style>
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
                <#--纬度:--> <input id="latitude${i}" type="hidden" value='${MMConvenientList[i].latitude!""}'/>
                <#--位置:--> <input id="location${i}" type="hidden" value='${MMConvenientList[i].location!""}'/>
                <#--名称:--> <input id="name${i}" type="hidden" value='${MMConvenientList[i].name!""}'/>
					<input type="hidden" id="searchLocation"/>
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
			<span class="border-left"></span>
			<h3>便民服务</h3>
		</div>

        <#list 0..(ListType!?size-1) as i>

            <#if i % 4 == 0>

				<div class="bottom-content">
					<ul class="list flex">

                        <#if i < ListType?size >
							<li class="flex flex-c-c">
								<span class="space"></span>

								<img src="/mm/convenience/${ListType[i].label!}.png">
								&nbsp;
								<a href="/mm/mmConvenient/getConvenientList?id=${ListType[i].id!}"
								   style="white-space:nowrap">${ListType[i].label!}</a>

							</li>
                        </#if>
                        <#if i+1 < ListType?size >
							<li class="flex flex-c-c">
								<span class="space"></span>

								<img src="/mm/convenience/${ListType[i+1].label!}.png">
								&nbsp;
								<a href="/mm/mmConvenient/getConvenientList?id=${ListType[i+1].id!}"
								   style="white-space:nowrap">${ListType[i+1].label!}</a>
							</li>
                        </#if>
                        <#if i+2 < ListType?size >
							<li class="flex flex-c-c">
								<span class="space"></span>

								<img src="/mm/convenience/${ListType[i+2].label!}.png">
								&nbsp;
								<a href="/mm/mmConvenient/getConvenientList?id=${ListType[i+2].id!}"
								   style="white-space:nowrap">${ListType[i+2].label!}</a>

							</li>
                        </#if>
                        <#if i+3 < ListType?size >
							<li class="flex flex-c-c">
								<span class="space"></span>

								<img src="/mm/convenience/${ListType[i+3].label!}.png">
								&nbsp;
								<a href="/mm/mmConvenient/getConvenientList?id=${ListType[i+3].id!}"
								   style="white-space:nowrap">${ListType[i+3].label!}</a>
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

        window.location.href = '/mm/news/index';
    }

    // 百度地图API功能
    var map = new BMap.Map("allmap");

    //初始化中心点
    map.centerAndZoom(new BMap.Point(116.331398, 39.897445), 19);

    //百度地图缩放
    map.enableScrollWheelZoom(true);

    //地图类型控件 默认右上角可切换地图/卫星/三维三种状态
    map.addControl(new BMap.MapTypeControl());

    // 百度坐标系坐标(地图中需要使用这个)
    var bPoints = new Array();

    //信息窗口样式
    var opts = {
        width: 250,     // 信息窗口宽度
        height: 80,     // 信息窗口高度
        title: "<p style='color: red;'>信息窗口</p>", // 信息窗口标题
        enableMessage: true//设置允许信息窗发送短息
    };

    var new_point = "";
    var marker = "";
    // 用经纬度设置地图中心点
    $(document).ready(function () {

        <#list 0..(MMConvenientList!?size-1) as i>

        if ($("#longitude${i}").val() != "" && $("#latitude${i}").val() != "") {
            // map.clearOverlays();

            <#--alert("经度："+$("#longitude${i}").val() +"  纬度"+$("#latitude${i}").val());-->
            new_point = new BMap.Point($("#longitude${i}").val(), $("#latitude${i}").val());
            bPoints.push(new_point); // 添加到百度坐标数组 用于自动调整缩放级别
            marker = new BMap.Marker(new_point); // 创建标注
            var content = "名称：" + $("#name${i}").val() + "<br />地址：" + $("#location${i}").val(); //此标注的地址；
            map.addOverlay(marker); // 将标注添加到地图中
            map.panTo(new_point);

            addClickHandler(content, marker);//把地址及标注当放到信息窗口上
        }
        </#list>
    });

    //把地址及标注当放到信息窗口上
    function addClickHandler(content, marker) {
        marker.addEventListener("click", function (e) {
                openInfo(content, e)
            }
        );
    };

    // 创建信息窗口对象
    function openInfo(content, e) {
        var p = e.target;
        var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
        var infoWindow = new BMap.InfoWindow(content, opts);  // 创建信息窗口对象
        map.openInfoWindow(infoWindow, point); //开启信息窗口
    };

    // 根据点的数组自动调整缩放级别
    function setZoom(bPoints) {
        var view = map.getViewport(eval(bPoints));
        var mapZoom = view.zoom;
        var centerPoint = view.center;
        map.centerAndZoom(centerPoint, mapZoom);
    };
    setTimeout(function () {
        setZoom(bPoints);
    }, 1000)

</script>
</html>