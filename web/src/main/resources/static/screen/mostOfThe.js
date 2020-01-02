// 之最
function mostOfThe() {
    // 显示模态框

        $("#modal01").show();
         $(".list01").empty();
         $(".list02").empty();
         $(".list03").empty();
    // 发送ajax请求获取数据
    zudp.ajax("/mm/screen/findTheMost" ).post().then(function (value) {
            console.info(value);
            var list01 = value.list01;
            var list02 = value.list02;
            var list03 = value.list03;

        // 遍历最新的数据
        for(var i = 0; i<list01.length;i++){

            var time = (list01[i])['time'];
            var name = (list01[i])['name'];
            var description = (list01[i])['description'];

            var tr;
            tr='<td>'+name+'</td>'+'<td>'+description+'</td>'+'<td>'+time+'</td>';
            $("#table002").append('<tr class="list01">'+tr+'</tr>')
        }

        // 遍历最长的数据
        for(var i = 0; i<list02.length;i++) {

            var time = (list02[i])['time'];
            var name = (list02[i])['name'];
            var description = (list02[i])['description'];
            var maxTime = (list02[i])['maxTime'];

            var tr;
            tr = '<td>' + name + '</td>' + '<td>' + description + '</td>' + '<td>' + time + '</td>' + '<td>' + maxTime + '</td>';
            $("#table003").append('<tr class="list02">' + tr + '</tr>')
        }


        // 遍历最频繁的数据
        for(var i = 0; i<list03.length;i++){

            var time = (list03[i])['time'];
            var name = (list03[i])['name'];
            var description = (list03[i])['description'];
            var num = (list03[i])['num'];

            var tr;
            tr = '<td>' + name + '</td>' + '<td>' + description + '</td>' + '<td>' + time + '</td>' + '<td>' + num + '</td>';
            $("#table004").append('<tr class="list03">' + tr + '</tr>')
        }




    });

}

