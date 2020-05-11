$(function(){

    $('.analysis').on('click',function(){
        // alert("123");
        $('#analysis').show();

        $(".list1").empty();


        $.ajax({
            url: "/mm/screen/analysis",
            type: "post",
            data: {
                // "commentId": commentId
            },
            dataType: 'json',
            success: function (data) {

                console.info(data);
                var tempData = data.data;

                for(var i=0;i<tempData.length;i++){
                    // alert("123");
                    var department=tempData[i].department;
                    var total=tempData[i].total;
                    var caseRate=tempData[i].caseRate;
                    var onTimeRate=tempData[i].onTimeRate;
                    var overTimeRate=tempData[i].overTimeRate;

                    $("#table-analysis").append(

                        "<tr class='list1'>"+
                        "<td>"+department+  "</td>"+
                        "<td>"+total+       "</td>"+
                        "<td>"+caseRate+    "</td>"+
                        "<td>"+onTimeRate+  "</td>"+
                        "<td>"+overTimeRate+"</td>"+
                        "</tr> "

                        // "<tr class='list1'>"+
                        // "<td>"+department+  "</td>"+
                        // "<td>"+total+       "</td>"+
                        // "<td>"+parseFloat(caseRate)*100+'%'+    "</td>"+
                        // "<td>"+parseFloat(onTimeRate)*100+'%'+  "</td>"+
                        // "<td>"+parseFloat(overTimeRate)*100+'%'+"</td>"+
                        // "</tr> "
                    );

                }
            }
        });

    });

    $('.close').on('click',function(){

        $('#analysis').hide();
    });




});


