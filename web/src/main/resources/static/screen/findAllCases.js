// 查询出所有的案件信息
function findAllCases() {
    // 获取到模态框
    $("#myModal6").modal("show");
    // 发送ajax请求 查询出所有的案件
    zudp.ajax("/mm/screen/findAllCases" ).post().then(function (value) {
        for(var i= 0;i<value.length;i++){ // 遍历数据
            var id = (value[i])["id"];
            var description = (value[i])["description"];
            var name = (value[i])["name"];
            var time = (value[i])["time"];


            // var tr;
            // tr='<td>'+id+'</td>'+'<td>'+description+'</td>'+'<td>'+name+'</td>'+'<td>'+time+'</td>'
            // $("#tableList").append('<tr>'+tr+'</tr>')
        }

    });
}