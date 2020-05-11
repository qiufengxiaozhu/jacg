var checkId = "";
var datetable;
var datatableInsert;
var number = 0;
$('#myTab a').click(function (e) {
    if (checkId == "") {
        swals("请选择一个事业部");
        return false;
    } else {
        if ($(this).attr("href") == '#organiz-info') {
            tab_index = 1;
            getNodeDetail(checkId);
        } else if ($(this).attr("href") == '#organiz-details') {
            tab_index = 2;
            if (datetable == null) {
                List();
            } else {
                zudp.plugin.table("#list-details").then().ajax.reload();
            }
        }
        $(this).tab('show');
    }
});

//a 标题  b确定的方法 c确定的按钮名称
function swalFunction(a, b, c) {
    swal({
        title: a,
        showCancelButton: true,
        cancelButtonText: "取消",
        confirmButtonColor: "#DD6B55",
        confirmButtonText: c,
    }, b);
}

function swals(a) {
    swal({
        title: a,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "确定",
    });
}

//******************************* 信息 *********************************//

function findUserList() {
    zudp.ajax("/api/user/userList")
        .get()
        .then(function (value) {
            //假如有null的值就变为“”
            for (var k = 0; k < value.length; k++) {
                if (value[k].id == null) {
                    value[k].id = "";
                }
                if (value[k].name == null) {
                    value[k].name = "";
                }
                if (value[k].loginName == null) {
                    value[k].loginName = "";
                }
                if (value[k].phone == null) {
                    value[k].phone = "";
                }
                //name 和loginName替换下位置 因为json没有顺序
                var b = value[k].name;
                value[k].name = value[k].loginName;
                value[k].loginName = b;
            }
            var data = {"value": value, "defaults": "没有搜索到"};
            $("#org_charge").bsSuggest({
                indexId: 0, //作为id的是下标为那个的字段
                autoSelect: true,
                indexKey: 1,//作为查询的是下标为那个
                showHeader: true,//展示表头
                effectiveFieldsAlias: {id: "用户编号", name: "所属部件", loginName: "用户名称", phone: "电话号码"},//表头
                effectiveFields: ["name", "loginName", "phone"], //显示那些字段
                listStyle: {
                    'padding-top': 0,
                    'max-height': '200px',
                    'overflow': 'auto',
                    'width': 'auto',
                    'transition': '0.3s',
                    '-webkit-transition': '0.3s',
                    '-moz-transition': '0.3s',
                    '-o-transition': '0.3s'
                },
                data: data //json串  前台查询
            });

            $("#org_charge")
                .on('onSetSelectValue', function (e, keyword) {
                    $("#org_charges").val(keyword.id);
                })
        }, function (reason) {
            zudp.plugin.dialog("error").alert("获取用户列表失败！", "提示");
        });
}

//---下拉搜索框
$("#addItem").click(function () {
    if ($("#org_form").valid()) {
        debugger;
        var data = zudp.util.formData2json("#org_form");
        // var data = JSON.parse(data);
        var recordId = $("#org_no").attr("record_id");
        if ($("#addItem").val() == 1) {
            var url = "/api/departmentController/groupInsert?parentId=" + checkId + "&isBro=false";
            if ($("#addBroBtn").attr("isBro") == "true") {
                url = "/api/departmentController/groupInsert?parentId=" + checkId + "&isBro=true"
            }
            zudp.ajax(url)
                .post(data)
                .then(function (value) {
                    zudp.plugin.dialog("success").alert("操作成功！", "提示");
                    findList();
                    $(".modal").modal("hide");
                    $("#addItem").val("0");
                    $("#addBroBtn").attr("isBro", false);
                }, function (reason) {
                    zudp.plugin.dialog("warning").alert("操作失败！", "警告");
                });
        } else {
            zudp.ajax("/api/departmentController/groupUpdate/" + recordId)
                .put(data)
                .then(function (value) {
                    zudp.plugin.dialog("success").alert("操作成功！", "提示");
                    findList();
                    getNodeDetail(recordId);
                    $(".modal").modal("hide");
                    $("#addItem").val("1");
                }, function (reason) {
                    zudp.plugin.dialog("warning").alert("操作失败！", "警告");
                })
        }
    }
});

$(document).ready(function () {
    $(document).on("click", "#addBtn,#addBroNode,#addBroBtn", function () {
        $("#addBroBtn").attr("isBro", false);
        if ($(this).attr("id") == "addBroBtn") {
            $("#addBroBtn").attr("isBro", true);
        }
        zudp.plugin.form("#org_form").reset();
        $("#org_no").attr("name", "no");
        $(".modal-title").html("部件新增");
        $("#addItem").val("1");
        $("#org_no").attr("readonly", false);
    });
    findUserList();

    $("#updateBtn").click(function () {
        zudp.plugin.form("#org_form").reset();
        $("#org_no").attr("name", "no_template");
        zudp.ajax("/api/departmentController/" + checkId)
            .get()
            .then(function (value) {
                debugger;
                $("#org_no").attr("record_id", value.id);
                $("#org_no").val(value.no);
                $("#org_name").val(value.name);
                $("#org_desc").val(value.describe);
                $("#org_weight").val(value.weight);
                /*$("#org_charge").val(value.primaryUser.name);
                $("#org_charges").val(value.primaryUser.id);*/
                $("#describe").val(value.describe);

                $("#cdepartment").val(value.cdepartment);
                $("#disposalUnit").val(value.disposalUnit);
                $("#jurisdiction").val(value.jurisdiction);
                $("#requirements").val(value.requirements);


                $("#imgurl").val(value.imgurl);
                $("#partscode").val(value.partscode);
                $("#partsnum").val(value.partsnum);


            });
        $(".modal-title").html("部件修改");
        $("#addItem").val("0");
        $("#org_no").attr("readonly", true);
    });

    $("#deleteBtn").click(function () {
        swalFunction("是否确认删除该节点以及其所有子节点", function () {
            zudp.ajax("/api/departmentController/cascade/" + checkId)
                .get()
                .then(function (value) {
                    if (value) {
                        findList();
                        checkId = "";
                        $("#addBtn, #updateBtn,#deleteBtn,#revoke,#enable-btn").hide();
                        $("#addBroNode").show();
                        $("#insert-select").html("");
                        var template = '<li><a data-toggle="modal" id="addBroNode" data-target="#org_modal">顶级节点</a></li>';
                        $("#insert-select").html(template);
                        $("#insert-select-div").show();
                        $("#list-table-role-div").hide();

                        zudp.plugin.dialog("success").alert("删除成功！", "提示");
                    } else {
                        zudp.plugin.dialog("warning").alert("删除失败！", "警告");
                    }
                })
        }, "删除");
    });

    $("#revoke").click(function () {
        zudp.ajax("/api/departmentController/hasChild/" + checkId)
            .get()
            .synch()
            .then(function (value) {
                if (value == "true") {
                    swalFunction("该节点有子部件，是否要级联撤销", function () {
                        revokeNode();
                    }, "确认撤销");
                } else {
                    swalFunction("是否撤销该部件", function () {
                        revokeNode();
                    }, "撤销")
                }
            })
    });

    $("#enable-btn").click(function () {
        if (ztree.getSelectedNodes()[0].parentId != null &&
            ztree.getNodeByParam("id", ztree.getSelectedNodes()[0].parentId).status != 0) {
            swals("这个部件的上级部件处于非正常状态无法启动！！");
        } else {
            swalFunction("你是否要启用这个部件", function () {
                zudp.ajax("/api/departmentController/enable/" + checkId)
                    .get()
                    .then(function (value) {
                        if (value) {
                            $("#enable-btn").hide();
                            $("#revoke").show();
                            ztree.getSelectedNodes()[0].status = 0;
                            getNodeDetail(checkId);
                            zudp.plugin.dialog("success").alert("操作成功", "提示");
                        } else {
                            zudp.plugin.dialog("warning").alert("操作失败", "警告");
                        }
                    })
            }, "确认");
        }
    });

    $("#update_group_insert").click(function () {
        var h1 = document.getElementById('dept_cause');
        h1.innerHTML = '立案新增';
        if (ztree.getSelectedNodes()[0].status != 2) {
            debugger;
            $("#details_modal").modal("show");
            if (datatableInsert == null) {
                listInsert();
            } else {
                zudp.plugin.table("#list-details-insert").then().ajax.reload();
            }
        } else {
            swals("该部件已被撤销无法添加用户！");
        }
    });
    $("#select_group_details_insert").click(select_details_insert);
    $("#update_group_details_insert").click(updateAll_insert);

    $(document).on("click", ".add-user-to-group", function () {
        var ids = [];
        ids.push($(this).val());
        if ($(this).val() != null && $(this).val() != '' && checkId != "") {
            batchUpdateGroup_insert(ids);
        }
        return false;
    });
});

function revokeNode() {
    zudp.ajax("/api/departmentController/revoke/" + checkId)
        .get()
        .then(function (value) {
            if (value) {
                $("#enable-btn").show();
                $("#revoke").hide();
                ztree.getSelectedNodes()[0].status = 2;
                getNodeDetail(checkId);
                zudp.plugin.dialog("success").alert("操作成功！", "提示");
            } else {
                zudp.plugin.dialog("warming").alert("操作失败！", "提示");
            }
        })
}

//******************************* 详情模态框 *********************************//

function closeMemberModel() {
    zudp.plugin.table("#list-details").then().ajax.reload();
}

function select_details_insert() {
    zudp.plugin.table("#list-details-insert").then().ajax.reload();
}

function updateAll_insert() {
    var data = datatableInsert.rows('.evenSelect').data();
    var ids = [];
    for (var k = 0; k < data.length; k++) {
        ids.push(data[k].id);
    }
    if (ids.length > 0 && checkId != "") {
        batchUpdateGroup_insert(ids);
    } else {
        swals("数据未被选中");
    }
}

function batchUpdateGroup_insert(data) {
    zudp.ajax("/api/departmentController/updateUserGroup/" + checkId)
        .post(JSON.stringify(data))
        .then(function (da) {
            zudp.plugin.dialog("success").alert("操作成功！", "提示");
            zudp.plugin.table("#list-details-insert").then().ajax.reload();
        }, function (error) {
            zudp.plugin.dialog("warning").alert("操作失败！", "警告");
        });
}

//******************************* 详情页面 *********************************//
$(document).ready(function () {
    $("#update_group_details").click(updateAll);
    $("#select_group_details").click(select_details);
});

function select_details() {
    zudp.plugin.table("#list-details").then().ajax.reload();

}

function updateAll() {
    var data = datetable.rows('.evenSelect').data();
    var ids = [];
    for (var k = 0; k < data.length; k++) {
        ids.push(data[k].id);
    }
    if (ids.length > 0 && checkId != "") {
        swalFunction("确定删除", function () {
            batchUpdateGroup(ids);
        }, "删除");
    } else {
        swals("数据未被选中");
    }
}

function batchUpdateGroup(data) {
    zudp.ajax("/api/departCaseEntityController/deleteUserGroup/" + checkId)
        .post(JSON.stringify(data))
        .then(function (da) {
            zudp.plugin.dialog("success").alert("操作成功！", "提示");
            zudp.plugin.table("#list-details").then().ajax.reload();
        }, function (error) {
            zudp.plugin.dialog("warning").alert("操作失败！", "警告");
        });
}

$(document).on("click",".updateUserToGroup",function() {
    var ids = [];
    ids.push($(this).val());
    if ($(this).val() != null && $(this).val() != '' && checkId != "") {
        batchUpdateGroup(ids);
    }
    return false;
})


var tab_index = 1;
var ztree;
var key = $('#semail');

function getNodeDetail(groupId) {

    debugger;
    if (ztree.getSelectedNodes()[0].status == '2') {
        $("#revoke").hide();
        $("#enable-btn").show();
        $("#deleteBtn").show();
    } else {
        $("#deleteBtn").hide();
        $("#revoke").show();
        $("#enable-btn").hide();
    }
    zudp.ajax('/api/departmentController/' + groupId).get().then(function (value) {
        debugger;
        $('#group_cdepartment').html(value.cdepartment);
        $('#group_disposalUnit').html(value.disposalUnit);
        $('#group_jurisdiction').html(value.jurisdiction);
        $('#group_requirements').html(value.requirements);

        $('#icon').html(value.icon);
        $('#group_partscode').html(value.partscode);
        $('#group_partsnum').html(value.partsnum);


        $('#group_no').html(value.no);
        $("#group_name").html(value.name);
        if (value.describe == null) {
            $("#group_desc").html("");
        } else {
            $("#group_desc").html(value.describe);

        }
        if (value.primaryUser == null) {
            $("#group_charge").html("");
        } else {
            $("#group_charge").html(value.primaryUser.name);
        }
        $("#group_create_date").html(zudp.util.timeformater(value.buildTime));
        $("#group_weight").html(value.weight);
        if (value.status == '2') {
            $("#revoke").hide();
            $("#enable-btn").show();
            $("#deleteBtn").show();
            $("#group_status").html("已撤销");
        } else {
            $("#deleteBtn").hide();
            $("#group_status").html("正常");

            $("#enable-btn").hide();
        }
        /*$("#myTab a:first").tab('show');*/
    })
}

function nodeClick(ev, tree, node) {
    debugger;
    checkId = node.id;
    if (tab_index == 2) {

        if (datetable == null) {
            List();
        } else {
            zudp.plugin.table("#list-details").then().ajax.reload();
        }
    } else {
        $("#btns button").show();
        $("#list-table-role-div").show();
        $("#insert-select").html("");
        $("#insert-select").html("<li ><a data-toggle='modal' data-target='#org_modal' id='addBtn'>子节点</a></li>" +
            "<li><a id='addBroBtn' data-toggle='modal' data-target='#org_modal' >同级节点</a><li>");
        getNodeDetail(checkId);
    }
}

function findList() {
    var setting = {
        data: {
            simpleData: {
                pIdKey: "parentId",
                enable: true
            }
        },
        callback: {
            onClick: nodeClick
        },
        view: {
            selectedMulti: false
        }
    };
    zudp.ajax("/api/departmentController/tree").get().then(function (data) {
        debugger;
        ztree = $.fn.zTree.init($("#tree"), setting, data);
    });
}

$(document).ready(function () {
    findList();
    $('#semail').unbind("change");
    $('#semail').bind("change", searchNode);

    $("#org_form").validate({
        rules: {
            no: {
                num_and_math: true,
                required: true,
                remote: {
                    url: "/api/departmentController/groupNoCheck",
                    type: "get",
                    data: {
                        "recordNo": function () {
                            return $("#org_no").val();
                        }
                    },
                    dataType: "json",
                    dataFilter: function (res, type) {
                        return JSON.parse(res).data;
                    }
                }
            },
            treeName: {
                required: true
            },
            primaryUser: {
                required: true
            },
            weight: {
                required: true,
                digits: true
            }
        },
        messages: {
            no: {
                required: "请输入部件编号",
                remote: "该部件编号对应的部件已存在"
            },
            primaryUser: {
                required: "请输入部件负责人"
            },
            treeName: {
                required: "请输入部件名",
            },
            weight: {
                required: "请输入部件排序",
                digits: "请输入正确的格式"
            }
        }

    });
});

$(document).ready(function () {
    document.getElementById("key").value = ""; //清空搜索框中的内容
    //绑定事件
    key = $("#key");
    key.bind("focus", focusKey)
        .bind("blur", blurKey)
        .bind("propertychange", searchNode) //property(属性)change(改变)的时候，触发事件
        .bind("input", searchNode);
});

var lastValue = "", nodeList = [], fontCss = {};

//键盘释放：当输入框的键盘按键被松开时，把查询到的数据结果显示在标签中
function callNumber() {
    var zTree = $.fn.zTree.getZTreeObj("tree");

    //如果结果有值，则显示比例；如果结果为0，则显示"[0/0]"；如果结果为空，则清空标签框；
    if (nodeList.length) {
        //让结果集里边的第一个获取焦点（主要为了设置背景色），再把焦点返回给搜索框
        zTree.selectNode(nodeList[0], false);
        document.getElementById("key").focus();

        clickCount = 0; //防止重新输入的搜索信息的时候，没有清空上一次记录

        //显示当前所在的是第一条
        document.getElementById("number").innerHTML = "[" + (clickCount + 1) + "/" + nodeList.length + "]";

    } else if (nodeList.length == 0) {
        document.getElementById("number").innerHTML = "[0/0]";
        zTree.cancelSelectedNode(); //取消焦点
    }

    //如果输入框中没有搜索内容，则清空标签框
    if (document.getElementById("key").value == "") {
        document.getElementById("number").innerHTML = "";
        zTree.cancelSelectedNode();
    }
}

function focusKey(e) {
    if (key.hasClass("empty")) {
        key.removeClass("empty");
    }
}

function blurKey(e) {
    if (key.get(0).value === "") {
        key.addClass("empty");
    }
}

//搜索节点
function searchNode(e) {
    var zTree = $.fn.zTree.getZTreeObj("tree");
    var value = $.trim(key.get(0).value);
    var keyType = "name";

    if (key.hasClass("empty")) {
        value = "";
    }
    if (lastValue === value) return;
    lastValue = value;
    if (value === "") {
        updateNodes(false);
        return;
    }
    ;
    nodeList = zTree.getNodesByParamFuzzy(keyType, value); //调用ztree的模糊查询功能，得到符合条件的节点
    updateNodes(true); //更新节点
}


//高亮显示被搜索到的节点
function updateNodes(highlight) {
    var zTree = $.fn.zTree.getZTreeObj("tree");
    for (var i = 0, l = nodeList.length; i < l; i++) {
        nodeList[i].highlight = highlight; //高亮显示搜索到的节点(highlight是自己设置的一个属性)
        zTree.expandNode(nodeList[i].getParentNode(), true, false, false); //将搜索到的节点的父节点展开
        zTree.updateNode(nodeList[i]); //更新节点数据，主要用于该节点显示属性的更新
    }
}

//设置颜色
function getFontCss(treeId, treeNode) {
    return (!!treeNode.highlight) ? {color: "#A60000", "font-weight": "bold"} : {
        color: "#333",
        "font-weight": "normal"
    };
}

//点击向上按钮时，将焦点移向上一条数据
function clickUp() {
    var zTree = $.fn.zTree.getZTreeObj("tree");
    //如果焦点已经移动到了最后一条数据上，就返回第一条重新开始，否则继续移动到下一条
    if (nodeList.length == 0) {
        zudp.plugin.dialog("").alert("没有搜索结果！", "提示");
        return;
    } else if (clickCount == 0) {
        zudp.plugin.dialog("").alert("您已位于第一条记录上！", "提示");
        return;
        //让结果集里边的下一个节点获取焦点（主要为了设置背景色），再把焦点返回给搜索框
        //zTree.selectNode(nodeList[clickCount], false)
    } else {
        --clickCount;
        //让结果集里边的第一个获取焦点（主要为了设置背景色），再把焦点返回给搜索框
        zTree.selectNode(nodeList[clickCount], false);
    }
    document.getElementById("key").focus();
    //显示当前所在的是条数
    document.getElementById("number").innerHTML = "[" + (clickCount + 1) + "/" + nodeList.length + "]";
}

//点击向上按钮时，将焦点移向下一条数据
function clickDown() {
    var zTree = $.fn.zTree.getZTreeObj("tree");
    //如果焦点已经移动到了最后一条数据上，则提示用户（或者返回第一条重新开始），否则继续移动到下一条
    if (nodeList.length == 0) {
        zudp.plugin.dialog("").alert("没有搜索结果！", "提示");
        return;
    } else if (nodeList.length == clickCount + 1) {
        zudp.plugin.dialog("").alert("您已位于最后一条记录上！", "提示");
        return;
    } else {
        ++clickCount;
        //让结果集里边的第一个获取焦点（主要为了设置背景色），再把焦点返回给搜索框
        zTree.selectNode(nodeList[clickCount], false)
    }
    document.getElementById("key").focus();
    //显示当前所在的条数
    document.getElementById("number").innerHTML = "[" + (clickCount + 1) + "/" + nodeList.length + "]";
}

function heightFill(obj,othersHeight){  //othersHeight其余部分内容高度
    var availH = window.screen.availHeight,// 屏幕可用高度
        innerH = $(window.parent).height(),
        outerH = window.outerHeight;       //浏览器高度
    if(availH == outerH){     //是否全屏
        scrollY = innerH - 140;    //iframe高度
        scrollY-=othersHeight;    //210是其他内容高度
    }else{
        var y = innerH - 140;
        if(y < 500){
            y = 500;
        }
        scrollY = y - othersHeight;
    }
    obj.css("min-height",scrollY)
}
heightFill($(".ibox-content"),40);

$(window).resize(function(){
    heightFill($(".ibox-content"),40);
})

jQuery.validator.addMethod("num_and_math", function (value, element, param) {
    var patrn = /^[0-9a-zA-Z]{1,}$/;
    if (!patrn.exec(value)) {
        return false;
    }
    return true
}, "编号只能由数字和字母组成");



//-保存
$("#addCaseItem").click(function () {
    if ($("#org_carse_form").valid()) {
        debugger;
        var data = zudp.util.formData2json("#org_carse_form");

            var url = "/api/departCaseEntityController/departInsert?parentId=" + checkId ;

            zudp.ajax(url)
                .post(data)
                .then(function (value) {
                    zudp.plugin.dialog("success").alert("操作成功！", "提示");

                    $(".modal").modal("hide");
                    $("#addItem").val("0");
                    $("#addBroBtn").attr("isBro", false);
                    zudp.plugin.table("#list-details").then().ajax.reload();
                }, function (reason) {
                    zudp.plugin.dialog("warning").alert("操作失败！", "警告");
                });

    }
});

$(document).on("click", ".update_case", function () {
    debugger;
    var ids = [];
    ids.push($(this).val());

    zudp.plugin.form("#details_modal").reset();

    zudp.ajax("/api/departCaseEntityController/" + ids)
        .get()
        .then(function (value) {

            var h1 = document.getElementById('dept_cause');
            h1.innerHTML = '立案修改';

            $("#details_modal").modal("show");
            debugger;

            $('#standard').val(value.standard);
            $('#limits').val(value.limits);
            $('#casestandard').val(value.casestandard);
            $('#departmentid').val(value.departmentid);
            $('#departCaseid').val(value.id);






        });


});