<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>功能端点展示</title>
    <link href="/css/third/bootstrap.min.css" rel="stylesheet">
    <link href="/css/third/font-awesome.min.css" rel="stylesheet">
    <link href="/css/third/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/css/third/animate.min.css" rel="stylesheet">
    <link href="/css/third/sweetalert.css" rel="stylesheet"/>
    <link href="/css/third/toastr.min.css" rel="stylesheet"/>
    <link href="/css/third/zTree/zTreeStyle/zTreeStyle.css" rel="stylesheet">
    <link href="/css/style.min.css" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content clearfix">
                    <div class="left_role group-left_role">
                        <div class="col-md-12 sidebar">
                            <div class="row">
                                <div style="position: relative;">
                                    <input type="text" id="key" class="empty form-control" placeholder="搜索..."
                                           onkeyup="callNumber()">
                                    <div class="key-right group-key-right">
                                        <label id="number"></label>
                                        <a id="clickUp" class="glyphicon glyphicon-menu-up" onclick="clickUp()"></a>
                                        <a id="clickDown" class="glyphicon glyphicon-menu-down" onclick="clickDown()"></a>
                                    </div>
                                </div>
                            </div>
                            <ul id="tree" class="ztree"></ul>
                        </div>
                    </div>

                    <div class="right_role_detail group-right_role_detail">
                        <div class="col-sm-12">

                            <div class="tab-content">
                                <div id="organiz-info" class="fade in active tab-pane">
                                    <div class="panel-body">
                                        <div class="form-group" id="list-table-role-div">
                                            <div class='col-sm-12'>
                                                <table id="list-table-role"
                                                       class="table table-striped table-bordered table-hover dataTables-example"
                                                       style="width:100%;margin-top: 5px">
                                                    <tbody>
                                                    <tr>
                                                        <td class='group_td'>uniqueId</td>
                                                        <td id="endpoint-uniqueId"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class='group_td'>id</td>
                                                        <td id="endpoint-id"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class='group_td'>名称</td>
                                                        <td id="endpoint-name"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class='group_td'>权限类型</td>
                                                        <td id="endpoint-authorized-type"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class='group_td'>权限</td>
                                                        <td id="endpoint-authorized"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class='group_td'>parentId</td>
                                                        <td id="endpoint-parent"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class='group_td'>路径</td>
                                                        <td id="endpoint—href"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class='group_td'>排序</td>
                                                        <td id="endpoint—weight"></td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                <button class="btn btn-primary" id="copy-uniqueId" type="button">复制 uniqueId</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="/js/third/jquery.min.js"></script>
<script src="/js/third/bootstrap.min.js"></script>
<script src="/js/zudp.js"></script>
<script src="/js/third/bootstrap-suggest.min.js"></script>
<script src="/js/third/sweetalert.min.js"></script>
<script src="/js/third/jquery.dataTables.min.js"></script>
<script src="/js/third/dataTables.bootstrap.js"></script>
<script src="/js/third/jquery.validate.min.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script src="/js/third/clipboard.min.js"></script>
<script type="text/javascript" src="/js/third/jquery.ztree.all.js"></script>
<script src="/js/sys/group.js"></script>
<script>

    var ztree;
    var key = $('#semail');

    var clipboard = new ClipboardJS('#copy-uniqueId', {
        text: function(trigger) {
            return $('#endpoint-uniqueId').text();
        }
    });

    clipboard.on('success', function(e) {
        zudp.plugin.dialog("success").alert("uniqueId 已复制到剪切板中！","提示");
    });

    clipboard.on('error', function(e) {
        zudp.plugin.dialog("error").alert("复制到剪切板失败失败！", "提示");
    });

    function nodeClick(ev, tree, node) {
        $("#endpoint-uniqueId").html(node.uniqueId);
        $("#endpoint-id").html(node.id);
        $("#endpoint-name").html(node.name);
        $("#endpoint-authorized-type").html(node.authorizedType);
        $("#endpoint-authorized").html(node.authorized);
        $("#endpoint-parent").html(node.parentId);
        $("#endpoint—href").html(node.href);
        $("#endpoint—weight").html(node.weight);
    }

    function findList() {
        var setting = {
            data: {
                simpleData: {
                    pIdKey: "parentIds",
                    idKey: "uniqueId",
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
        zudp.ajax("/dev/showAllFunItems")
            .get()
            .then({
                      success: function (data) {
                          for (var i = 0; i < data.length; i++) {
                              data[i].uniqueId = '';
                              if (data[i].parentIds != null && data[i].parentIds != '') {
                                  data[i].uniqueId = data[i].parentIds + ':';
                              }
                              data[i].uniqueId += data[i].id;
                          }
                          ztree = $.fn.zTree.init($("#tree"), setting, data);
                          zudp.util.ztreeSort(ztree);
                      }
                  });
    }

    $(document).ready(function () {
        findList();
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

    jQuery.validator.addMethod("num_and_math", function (value, element, param) {
        var patrn = /^[0-9a-zA-Z]+$/;
        if (!patrn.exec(value)) {
            return false;
        }
        return true;
    }, "编号只能由数字和字母组成");

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
</script>
</body>
</html>
