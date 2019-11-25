function dataEcho(a, data) {
    var list = $(a).find("*[name]");
    for (var k = 0; k < list.length; k++) {
        var name = $(list[k]).attr("name");
        var names = name.split(".");
        var value = data;
        for (var b = 0; b < names.length; b++) {
            if (value == null) {
                break;
            }
            value = value[names[b]];
        }
        if (value == null || typeof value == "undefined") {
            value = "";
        }
        switch (list[k].localName) {
            case "input":
                switch ($(list[k]).attr("type")) {
                    case "radio":
                        if ($(list[k]).val() == value + "") {
                            $(list[k]).prop("checked", "checked");
                        }
                        break;
                    case "checkbox":
                        if ($(list[k]).val() == value + "") {
                            $(list[k]).prop("checked", "checked");
                        }
                        break;
                    case "hidden":
                        //对图片回显
                        if (typeof $(list[k]).attr("result") != 'undefined') {
                            var datas = value.split(",");
                            var html = "";
                            for (var a = 0; a < datas.length; a++) {
                                if (datas[a] == "") {
                                    continue;
                                }
                                var img = '<span style="display: block;width: 100px; height: 100px;line-height: 100px;">不能预览</span>';
                                if (datas[a].indexOf(".bmp") != -1 || datas[a].indexOf(".jpg") != -1 || datas[a].indexOf(".png") != -1 ||
                                    datas[a].indexOf(".tiff") != -1 || datas[a].indexOf(".gif") != -1 || datas[a].indexOf(".pcx") != -1 ||
                                    datas[a].indexOf(".fpx") != -1 || datas[a].indexOf(".svg") != -1 || datas[a].indexOf(".raw") != -1) {
                                    img = "<img src='" + datas[a] + "'>";
                                }
                                var name = "";
                                var da = datas[a].split("_");
                                if (da.length > 1) {
                                    name = da[1];
                                } else {
                                    name = datas[a];
                                }
                                var obj = {
                                    img:img,
                                    target:a+1,
                                    name:name
                                };
                                var template = '<div id="WU_FILE_-{target}" class="file-item thumbnail upload-state-done">{img}<div class="info">{name}</div><span title="删除" class="file-span">×</span></div>';
                                html += zudp.util.render(template, obj);
                            }
                            //将内容放入
                            $(list[k]).prev().html(html);
                        }
                        $(list[k]).val(value);
                        break;
                    case "text":
                        //时间控件的回显
                        if (typeof $(list[k]).attr("startDate") != "undefined" || typeof $(list[k]).attr("endDate") != "undefined") {
                            $(list[k]).val(zudp.util.timeformater(value));
                        } else {
                            $(list[k]).val(value);
                        }
                        break;
                    case "file":
                        break;
                    case "password":
                        $(list[k]).val('');
                        break;
                    default:
                        throw err = new Error('该类型还不支持' + $(list[k]).attr("type"));
                        break;
                }
                break;
            case "textarea":
                //对富文本框回显
                if (typeof $(list[k]).attr("summernote") != "undefined") {
                    $(list[k]).summernote('code', value);
                    $(".note-toolbar-wrapper").css("height", "69px");
                }
                $(list[k]).val(value);
                break;
            case "select":
                $(list[k]).find('option[value=' + value + ']').prop('selected', 'true');
                break;
            case "img":
                $(list[k]).attr("src", value);
                break;
            case "div":
                $(list[k]).html(value);
                break;
            case "a":
                $(list[k]).attr("href", value);
                break;
            default:
                throw err = new Error('该类型还不支持' + list[k].localName);
                break;
        }
    }
}
