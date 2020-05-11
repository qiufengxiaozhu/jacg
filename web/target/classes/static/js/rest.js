Date.prototype.Format = function(fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1,
        //月份
        "d+": this.getDate(),
        //日
        "h+": this.getHours(),
        //小时
        "m+": this.getMinutes(),
        //分
        "s+": this.getSeconds(),
        //秒
        "q+": Math.floor((this.getMonth() + 3) / 3),
        //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        }
    }
    return fmt;
}
function initForm(obj){
    //弹窗
    $(document).on("click", "#add-btn", function () {
        $(".modal-form").modal("show");
        $(".modal-form").addClass("create-form").removeClass("edit-form detail-form");
        $(".create-form").find("#save-btn").show();
        $(".create-form").find(".my-i_context").show();
        zudp.plugin.form(obj.formId).reset();
        if(obj.addBtnFun!=undefined){
            obj.addBtnFun();
        }
        //修改标题
        var titleText = zudp.util.render(obj.title, {"type": "新建"});
        $(".modal .modal-title").text(titleText);
        //取消禁用
        for (var i = 0; i < obj.disabledName.length; i++) {
            $(".modal form").find("*[name=" + obj.disabledName[i] + "]")
                .attr("disabled", false);
        }
        //设置隐藏组件
        for (var i = 0; i < obj.hideInputName.length; i++) {
            $(".modal form").find("*[name=" + obj.hideInputName[i] + "]").parents('.form-group').css("display", 'block');
        }
        //    如果页面中有radio button 点击
        if($(".modal-form input[type=radio]").length != 0) {
            $(".modal-form input[type=radio]:first").prop("checked","checked");
        }
    });

    //修改提示
    var msgSuccess = zudp.util.render(obj.success, {"msg": "成功"});

    $(document).on("click", ".create-form #save-btn", function () {
        if(obj.saveForm!=undefined){
            obj.saveForm();
        }else{
            if ($(obj.formId).valid()) {
                var data = zudp.util.formData2json("form");
                zudp.ajax(obj.url).post(data).then(function () {
                    zudp.plugin.dialog("success").alert("新建" + msgSuccess + "！", "提示");
                    dataTable.ajax.reload();
                    $(".modal-form").modal("hide");
                });
                obj.callback.create(data);
            }
        }

    });

    //弹窗
    var updateUrl ='';
    $(document).on("click", '.row-edit', function (e) {
        //清除冒泡
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }
        $(".modal-form").modal("show");
        $(".modal-form").addClass("edit-form").removeClass("create-form detail-form");
        $(".edit-form").find("#save-btn").show();
        $(".edit-form").find(".my-i_context").show();
        zudp.plugin.form(obj.formId).reset();
        updateUrl = obj.url + '/' + $(this).val();
        //修改标题
        var titleText = zudp.util.render(obj.title, {"type": "编辑"});
        $(".modal .modal-title").text(titleText);
        //设置隐藏组件
        for (var i = 0; i < obj.hideInputName.length; i++) {
            $(".modal form").find("*[name=" + obj.hideInputName[i] + "]").parents('.form-group').css("display", 'none');
        }
         $(obj.formId).find("input[name='id']").eq(0).val($(this).val());
        if(obj.editBtnFun!=undefined){
            obj.editBtnFun();
        }else{
            //取值回显
            zudp.ajax(updateUrl).get("").then(function (data) {
                dataEcho(obj.formId, data);

            }, function (error) {
            });
        }

        //设置禁用
        for (var i = 0; i < obj.disabledName.length; i++) {
            $(".modal form").find("*[name=" + obj.disabledName[i] + "]")
                .attr("disabled", true);
            $("#calendar_btn").disabled=true;
        }
    });
     //详情
    $(document).on("click", '.row-detail', function (e) {
        //清除冒泡
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }
        $(".modal-form").modal("show");
        $(".modal-form").addClass("detail-form").removeClass("create-form edit-form");
        $(".detail-form").find("#save-btn").hide();
        $(".detail-form").find(".my-i_context").hide();
        updateUrl = obj.url + '/' + $(this).val();
        //修改标题
        var titleText = zudp.util.render(obj.title, {"type": "详情"});
        $(".modal .modal-title").text("详情");
        //设置隐藏组件
        for (var i = 0; i < obj.hideInputName.length; i++) {
            $(".modal form").find("*[name=" + obj.hideInputName[i] + "]").parents('.form-group').css("display", 'none');
        }
        $(obj.formId).find("input[name='id']").eq(0).val($(this).val());
        if(obj.editBtnFun!=undefined){
            obj.editBtnFun();
        }else{
            //取值回显
            zudp.ajax(updateUrl).get("").then(function (data) {
                dataEcho(obj.formId, data);

            }, function (error) {
            });
        }
        $(".modal form").find("*[name]").prop("disabled", true);
        //设置禁用
        for (var i = 0; i < obj.disabledName.length; i++) {
            $(".modal form").find("*[name=" + obj.disabledName[i] + "]")
                .attr("disabled", true);
        }
        $(document).on("click",".detail-form .btn[data-dismiss='modal'], .close[data-dismiss='modal'] ",function () {
            $(".modal-form").find("#save-btn").show();
            $(".detail-form").find(".my-i_context").show();
            $(".modal-form *[name]").prop("disabled",false);
        })
    });
    //校验保存
    var msgSuccess = zudp.util.render(obj.success, {"msg": "成功"});
    $(document).on("click", ".edit-form #save-btn", function () {

        if(obj.saveForm!=undefined){
            obj.saveForm();
        }else{
            if ($(obj.formId).valid()) {
                var data = zudp.util.formData2json("form");
                zudp.ajax(updateUrl).put(data).then(function () {
                    zudp.plugin.dialog("success").alert("更新" + msgSuccess + "！", "提示");
                    dataTable.ajax.reload();
                    $(".modal-form").modal("hide");
                });
                obj.callback.update(data);
            }
        }

    });

    $(document).on("click", '.row-delete', function (e) {
        //清除冒泡
        if (e && e.stopPropagation) {
            e.stopPropagation();
        } else {
            window.e.cancelBubble = true;
        }
        var msgSuccess = zudp.util.render(obj.success, {"msg": "删除成功"});
        var msgError = zudp.util.render(obj.error, {"msg": "删除失败"});
        var rowData = dataTable.row($(this).parents('tr')).data();
        var deleteUrl = obj.url + '/' + $(this).val();
        zudp.plugin.dialog("warning").confirm("确认要删除吗？", "确认", function () {
            zudp.ajax(deleteUrl).del('').then(function (da) {
                zudp.plugin.dialog("success").alert(msgSuccess + "!", "提示");
                dataTable.ajax.reload();
            }, function (error) {
                zudp.plugin.dialog("warning").alert(msgError + "!", "警告");
                dataTable.ajax.reload();
            });
        });
        obj.callback.delete(rowData);
    });

    $(document).on("click", "#delete-items", function () {
        var data = dataTable.rows('.evenSelect').data();
        var ids = [];
        for (var k = 0; k < data.length; k++) {
            ids.push(data[k].id);
        }
        if (ids.length == 0) {
            zudp.plugin.dialog("warning").confirm("数据未选中", "关闭")
            return;
        }
        var msgSuccess = zudp.util.render(obj.success, {"msg": "批量删除成功"});
        var msgError = zudp.util.render(obj.error, {"msg": "批量删除失败"});
        zudp.plugin.dialog("warning").confirm("确认要删除吗？", "确认", function () {
            zudp.ajax(obj.url).del(JSON.stringify(ids)).then(function (da) {
                zudp.plugin.dialog("success").alert(msgSuccess + "!", "提示");
                dataTable.ajax.reload();
            }, function (error) {
                zudp.plugin.dialog("warning").alert(msgError + "!", "警告");
                dataTable.ajax.reload();
            });
        });
        obj.callback.deleteMore(data);
    });

    var searchDom=''
    var searchInput=''
    if (obj.search.length == 3) {
        searchDom=obj.search[1];
        searchInput=obj.search[2];
        zudp.plugin.clearFormData(obj.search[0], obj.search[1]);
    }
    $(document).on("click", ".research-btn", function () {
        dataTable.ajax.reload();
        //$(searchDom).slideUp(300);
    });
    $(document).on('keydown', function (event) {
        if (event.keyCode == 13) {
            dataTable.ajax.reload();
            $(searchDom).slideUp(300);
            return false;
        }
    });
    $(".my-querybtn "+searchInput).on('keyup change',function() {
        var value = $(".my-querybtn "+searchInput).val();
        $(searchDom+" "+searchInput).val(value);
    });
    $(searchDom+" "+searchInput).on('keyup change',function() {
        $(".my-querybtn "+searchInput).val($(searchDom+" "+searchInput).val());
    });
    $(document).on("click", '.select-query', function () {
        $(searchDom).slideToggle("fast", function () {
        });
    });
    var rowData = dataTable.row($(this).parents('tr')).data();
    // obj.callback.search(rowData);
}
//清空
$(document).on("click", ".clear-input", function () {

    $(".my-querybtn").find("input").each(function(i,obj){
        $(obj).val('');
    });
    $(".my-querybtn").find("select").each(function(i,obj){
        $(obj).val('');
    });

    $("#search").find("input").each(function(i,obj){
        $(obj).val('');
    });
    $("#search").find("select").each(function(i,obj){
        $(obj).val('');
    });

    $(".search-control").find("input").each(function(i,obj){
        $(obj).val('');
    });
    $(".search-control").find("select").each(function(i,obj){
        $(obj).val('');
    });
    dataTable.ajax.reload();
})


//查看流程图 开始
function viewBtn(processDefinitionId,processInstanceId){
    var index =layer.open({
        id: 'act-lct',
        type: 2,
        area: ['200px','100px'],
        fix: false,
        maxmin: true,
        shadeClose: false,
        shade: 0.4,
        title: '审批记录',
        content: '/activity/diagramViewer?processDefinitionId=' + processDefinitionId + '&processInstanceId=' + processInstanceId
    });
    layer.full(index);
}
//查看流程图 结束