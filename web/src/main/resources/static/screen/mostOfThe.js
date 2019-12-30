// 之最

function mostOfThe() {
    // 显示模态框
    $("#myModal5").modal("show");

    // 发送ajax请求获取数据
    zudp.ajax("/mm/screen/findTheMost" ).post().then(function (value) {
            alert(value);
            var list01 = value.list01;
            var list02 = value.list02;
            var list03 = value.list03;

        // 遍历最新的数据
        for(var i = 0; i<list01.length;i++){

            var time = (list01[i])['time'];
            var name = (list01[i])['name'];
            var description = (list01[i])['description'];

            var divTemp =  $("#theNew");
            // 获取到大的div
            divTemp.append("<div id='description"+ list02[i] +"'>问题描述:</div>").append(description);
            divTemp.append("<div id='time"+ list02[i] +"'>案发时间:</div>").append(time);
            divTemp.append("<div id='name"+ list02[i] +"'>大类:</div>").append(name);

        }

        // 遍历最长的数据
        for(var i = 0; i<list02.length;i++){

            var time = (list02[i])['time'];
            var name = (list02[i])['name'];
            var description = (list02[i])['description'];
            var maxTime = (list02[i])['maxTime'];


            var divTemp =  $("#theLength");
            // 获取到大的div
            divTemp.append("<div id='description"+ list02[i] +"'>问题描述:</div>").append(description);
            divTemp.append("<div id='time"+ list02[i] +"'>案发时间:</div>").append(time);
            divTemp.append("<div id='name"+ list02[i] +"'>大类:</div>").append(name);
            divTemp.append("<div id='maxTime"+ list02[i] +"'>案件已用时间:</div>").append(maxTime);
        }

        // 遍历最频繁的数据
        for(var i = 0; i<list03.length;i++){


            var time = (list03[i])['time'];
            var name = (list03[i])['name'];
            var description = (list03[i])['description'];
            var num = (list03[i])['num'];


            var divTemp =  $("#theFrequent");
            // 获取到大的div
            divTemp.append("<div id='description"+ list02[i] +"'>问题描述:</div>").append(description);
            divTemp.append("<div id='time"+ list02[i] +"'>案发时间:</div>").append(time);
            divTemp.append("<div id='name"+ list02[i] +"'>大类:</div>").append(name);
            divTemp.append("<div id='num"+ list02[i] +"'>数量:</div>").append(maxTime);

            // div04.append(description);
            // div05.append(time);
            // div06.append(name);




        }



    });

}