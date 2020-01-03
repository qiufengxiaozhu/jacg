// 查询出所有的案件信息
var page=1;
var sumpage=10;

//尾页
function endpage() {
    page=sumpage;
    findAllCases();
}
//首页
function firstPage() {
    page=1;
    findAllCases();
}

//上一页
function uppers() {
    if(page==1){
        alert("已经是首页哦")
    }else{
        page=page-1;
        findAllCases();
    }
}

//下一页
function lowers() {
    if(sumpage==page){
        alert("已是尾页");
    }else {
        page=page+1;
        findAllCases();
    }
}

findAllCases();




function findAllCases() {

    $("#modal02").show();
    $(".list1").empty();

    var startTime = $("#startTime").val();
    var endTime = $("#endTime").val();
    var description = $("#description").val();
    // 发送ajax请求 查询出所有的案件

    zudp.ajax("/mm/screen/findAllCases?page="+page+"&startTime="+startTime+"&endTime="+endTime+"&description="+description).get().then(function (value) {
        for(var i= 0;i<value.length;i++){ // 遍历数据
            var id = (value[i])["id"];
            var description = (value[i])["description"];
            // 大类名称
            var name = (value[i])["name"];
            var time = (value[i])["time"];
            // 问题描述
            var description02 = (value[i])["description02"];
            // 小类名称
            var littleName = (value[i])["littleName"];



            var tr;
            tr= '<td class="faguang">'+description+'</td>'+'<td class="faguang">'+name+'</td>'+'<td class="faguang">'+time+'</td>';
            $("#tableList").append('<tr id="'+id+'" class="list1">'+tr+'</tr>');
            // 三级页面 填入信息 问题描述
            $('.put-tex').html((value[i])["description02"]);
            // $('#nameId').html(name);
            // $('#nameId').html(littleName);
            // $('.put-tex').html(description02);
// 查询详情
//             zudp.ajax("/mm/screen/findCaseById?id="+id).get().then(function (value02) {
//                 var name = value02.name;
//                 var littleName = value02.littleName;
//                 var address = value02.address;
//                 var deadTime =  value02.deadTime;
//                 var endTime = value02.endTime;
//                 var department = value02.department;
//                 var dealTime = value02.dealTime;
//                 var adv = value02.adv;
//                 var description = value02.description;
//                 $('.put-tex').html(description);
//
//             });
        }



            $('.list1').on('click',function(){
            $(this).siblings().removeClass("click-ch");
            $(this).addClass('click-ch');
            $('.mess').show();
        })
    });
};

$(document).on("click","#tableList tr.list1",function () {
    var id = $(this).attr("id");
    // 查询详情
            zudp.ajax("/mm/screen/findCaseById?id="+id).get().then(function (value02) {

                var name = value02.name;
                var littleName = value02.littleName;
                var address = value02.address;
                var deadTime =  value02.deadTime;
                var endTime = value02.endTime;
                var department = value02.department;
                var dealTime = value02.dealTime;
                var adv = value02.adv;
                var description = value02.description;

                $('#nameId01').html("大类名称:&nbsp;"+name);
                $('#nameId02').html("小类名称:&nbsp;"+littleName);
                $('#addressId').html("地址:&nbsp;&nbsp;"+address);
                $('#deadTimeId').html("案件截止时间:&nbsp;&nbsp;"+deadTime);
                $('#endTimeId').html("案件截止时间:&nbsp;&nbsp;"+endTime);
                $('#departmentId').html("处理部门:&nbsp;&nbsp;"+department);
                $('#dealTimeId').html("部门处理时间:&nbsp;&nbsp;"+dealTime);
                $('#advId').html("处理意见:&nbsp;"+adv);
                $('#descriptionId').html("问题描述:&nbsp;"+description);

            });
})





