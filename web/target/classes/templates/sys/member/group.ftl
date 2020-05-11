<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>主页</title>
    <link rel="shortcut icon" href="/img/favicon.ico">
    <link href="/css/third/bootstrap.min.css" rel="stylesheet">
    <link href="/css/third/font-awesome.min.css" rel="stylesheet">
    <link href="/css/third/animate.min.css" rel="stylesheet">
    <link href="/css/third/toastr.min.css" rel="stylesheet"/>
    <link href="/css/style.min.css?v=4.1.0" rel="stylesheet">
    <link href="/css/third/zTree/zTreeStyle/zTreeStyle.css" rel="stylesheet">
</head>
<body class="no-skin no-scoll">
<div class="infrom">
    <div >
        <div class="col-md-12 sidebar">
            <div class="col-sm-12" style="position: relative;margin-top: 10px">
                <input type="text"  id="key" class="empty form-control" placeholder="搜索..." onkeyup="callNumber()">
                <div class="key-right my-key-right">
                    <label id="number"></label>
                    <a id="clickUp" class="glyphicon glyphicon-menu-up" onclick="clickUp()"></a>
                    <a id="clickDown" class="glyphicon glyphicon-menu-down" onclick="clickDown()"></a>
                </div>
            </div>
            <ul id="tree" class="ztree my-ztree"></ul>
        </div>
    </div>
    <div style="text-align: center;"><button class="btn btn-info btn-sm" id="_save" type="button">保存</button></div>
</div>
<script src="/js/third/jquery.min.js"></script>
<script type="text/javascript" src="/js/third/jquery.ztree.all.js"></script>
<script src="/js/third/toastr.min.js"></script>
<script src="/js/zudp.js"></script>
<script>

    var type = window.parent.document.getElementById("insert_member").value;
    var role = window.parent.document.getElementById("span_id").value;
    var setting = {
        view: {
            fontCss: {
                'font-family': 'Open sans'
            }
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        check: {
            enable: true,
            chkboxType:  { "Y": "", "N": "" }
        }
    };

    var ztree;
    var key = $('#semail');

    function findList() {
        var result = {
            role: role
        };
        zudp.ajax("/api/member/type/"+type).get(result).then(function (data) {
            ztree =  $.fn.zTree.init($("#tree"), setting, data.result);
        },function (error) {
        });
    }

    function concat(parentId, id) {
        if (parentId) {
            return parentId + ":" + id;
        } else {
            return id;
        }
    }

    function childrenIsChecked(treeNode) {
        var children = treeNode.children;
        for (var i = 0; children && i < children.length; i++) {
            if (!children[i].checked) {
                return false;
            }
            if (!childrenIsChecked(children[i])) {
                return false;
            }
        }

        return true;
    }
    
    function getNamesByIds(ids) {
        var names=new Array();
        for (var k=0;k<ids.length;k++){
            var name="";
            var str=ids[k].split(":");
            var index=(str[str.length-1]=="*"?str.length-1:str.length);
            for(var i=index-1;i<index;i++){
                name+=ztree.getNodeByParam("id",str[i]).name;
            }
            if(index==str.length-1){
                name+="及其下属组织";
            }
            names.push(name);
        }
        return names;
    }

    $(document).ready(function() {

        findList();
        $('#semail').unbind("change");
        $('#semail').bind("change", searchNode);

        $('#_save').click(function () {

            var nodes = ztree.getNodes();
            var ids = convertIds(nodes, function (node, id) {
                var result;
                result=concat(id, node.id);
                if(node.children!=null){
                    return result;
                }else{
                    return result+":*";
                }
            }, '');
            var names=getNamesByIds(ids);
            var data=[];
            for(var k=0;k<ids.length;k++){
                data.push({
                              "type":type,
                              "name":names[k],
                              "member":ids[k]
                          });
            }
            zudp.ajax("/api/member/batch/"+role).post(JSON.stringify(data)).then(function (value) {
                parent.closeAllModal();
                parent.tableReloadForIfram("#list-table-member");
            })
        });

    });



    function convertIds(treeNode, fn, parentId) {
        var ids = [];
        var id = '';
        var result = false;

        if (treeNode) {
            for (var i = 0; i < treeNode.length; i++) {
                id = '';
                result = false;

                if (treeNode[i].checked) {
                    id = fn(treeNode[i], parentId);
                    if (treeNode[i].children && childrenIsChecked(treeNode[i])) {
                        id = concat(id, '*');
                        result = true;
                    }
                    ids.push(id);
                }

                if (!result) {
                    var items = convertIds(treeNode[i].children, fn, concat(parentId, treeNode[i].id));
                    ids = ids.concat(items);
                }
            }
        }

        return ids;
    }


    $(document).ready(function(){
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
    function callNumber(){
        var zTree = $.fn.zTree.getZTreeObj("tree");

        //如果结果有值，则显示比例；如果结果为0，则显示"[0/0]"；如果结果为空，则清空标签框；
        if(nodeList.length){
            //让结果集里边的第一个获取焦点（主要为了设置背景色），再把焦点返回给搜索框
            zTree.selectNode(nodeList[0],false );
            document.getElementById("key").focus();

            clickCount=0; //防止重新输入的搜索信息的时候，没有清空上一次记录

            //显示当前所在的是第一条
            document.getElementById("number").innerHTML="["+(clickCount+1)+"/"+nodeList.length+"]";

        }else if(nodeList.length == 0){
            document.getElementById("number").innerHTML="[0/0]";
            zTree.cancelSelectedNode(); //取消焦点
        }

        //如果输入框中没有搜索内容，则清空标签框
        if(document.getElementById("key").value ==""){
            document.getElementById("number").innerHTML="";
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
        if (value === ""){
            updateNodes(false);
            return;
        };
        nodeList = zTree.getNodesByParamFuzzy(keyType, value); //调用ztree的模糊查询功能，得到符合条件的节点
        updateNodes(true); //更新节点
    }


    //高亮显示被搜索到的节点
    function updateNodes(highlight) {
        var zTree = $.fn.zTree.getZTreeObj("tree");
        for( var i=0, l=nodeList.length; i<l; i++) {
            nodeList[i].highlight = highlight; //高亮显示搜索到的节点(highlight是自己设置的一个属性)
            zTree.expandNode(nodeList[i].getParentNode(), true, false, false); //将搜索到的节点的父节点展开
            zTree.updateNode(nodeList[i]); //更新节点数据，主要用于该节点显示属性的更新
        }
    }

    //设置颜色
    function getFontCss(treeId, treeNode) {
        return (!!treeNode.highlight) ? {color:"#A60000", "font-weight":"bold"} : {color:"#333", "font-weight":"normal"};
    }

    //点击向上按钮时，将焦点移向上一条数据
    function clickUp(){
        var zTree = $.fn.zTree.getZTreeObj("tree");
        //如果焦点已经移动到了最后一条数据上，就返回第一条重新开始，否则继续移动到下一条
        if(nodeList.length==0){
            zudp.plugin.dialog("").alert("没有搜索结果！","提示");
            return ;
        }else if(clickCount==0) {
            zudp.plugin.dialog("").alert("您已位于第一条记录上！","提示");
            return;
            //让结果集里边的下一个节点获取焦点（主要为了设置背景色），再把焦点返回给搜索框
            //zTree.selectNode(nodeList[clickCount], false)
        }else{
            --clickCount;
            //让结果集里边的第一个获取焦点（主要为了设置背景色），再把焦点返回给搜索框
            zTree.selectNode(nodeList[clickCount], false);
        }
        document.getElementById("key").focus();
        //显示当前所在的是条数
        document.getElementById("number").innerHTML = "[" + (clickCount+1) + "/" + nodeList.length + "]";
    }
    //点击向上按钮时，将焦点移向下一条数据
    function clickDown(){
        var zTree = $.fn.zTree.getZTreeObj("tree");
        //如果焦点已经移动到了最后一条数据上，则提示用户（或者返回第一条重新开始），否则继续移动到下一条
        if(nodeList.length==0){
            zudp.plugin.dialog("").alert("没有搜索结果！","提示");
            return ;
        }else if(nodeList.length==clickCount+1)
        {
            zudp.plugin.dialog("").alert("您已位于最后一条记录上！","提示");
            return;
        }else{
            ++clickCount;
            //让结果集里边的第一个获取焦点（主要为了设置背景色），再把焦点返回给搜索框
            zTree.selectNode(nodeList[clickCount], false)
        }
        document.getElementById("key").focus();
        //显示当前所在的条数
        document.getElementById("number").innerHTML = "[" + (clickCount+1) + "/" + nodeList.length + "]";
    }
</script>
</body>
</html>