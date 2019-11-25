var width;// 裁剪框的宽度
var height;// 裁剪框的高度
var x;// 相对于裁剪图片x左边
var y;// 相对于裁剪图片y左边
var jcrop_api, boundx, boundy, $preview, $pcnt, $pimg, xsize, ysize;
// 实现裁剪
function updatePreview(c) {
    if (parseInt(c.w) > 0) {
        var rx = xsize / c.w;
        var ry = ysize / c.h;
        $pimg.css({
                      width: Math.round(rx * boundx) + 'px',
                      height: Math.round(ry * boundy) + 'px',
                      marginLeft: '-' + Math.round(rx * c.x) + 'px',
                      marginTop: '-' + Math.round(ry * c.y) + 'px'
                  });
    }
    // 赋值
    x = c.x;
    y = c.y;
    width = c.w;
    height = c.h;
};

function change(json) {
    $("#width").val("");
    $("#height").val("");
    $("#windowHeight").val("");
    $("#windowWidth").val("");
    $("#file").val("");
    var data=json.data;
    $('.jcrop-preview').attr('src', data);
    $("#file").val(data);
    $preview = $('#preview-pane');
    $pcnt = $('#preview-pane .preview-container');
    $pimg = $(document).find('#preview-pane .preview-container img');
    xsize = $pcnt.width();
    ysize = $pcnt.height();
    if(jcrop_api){
        jcrop_api.destroy();
    }
    $(document).find('#target').Jcrop({
                                          onChange: updatePreview,
                                          onSelect: updatePreview,
                                          boxWidth:503,
                                          boxHeight:317,
                                          aspectRatio: xsize / ysize
                                      },function(){
        var bounds = this.getBounds();
        boundx = bounds[0];
        boundy = bounds[1];
        jcrop_api = this;
        $preview.appendTo(jcrop_api.ui.holder);
    });
    $("#img").modal("show");
}
function unsaveImage() {
    $("#img").modal("hide");
}

function saveCropImage() {
    // 需要获取裁剪之后，裁剪框的宽度和高度，以及裁剪框相对于裁剪图片的坐标位置
    $("#width").val(x);
    $("#height").val(y);
    $("#windowHeight").val(height);
    $("#windowWidth").val(width);
    zudp.ajax("/api/user/avatar").post(zudp.util.formData2json($("#image-form"))).then(function (data) {
        zudp.plugin.dialog("success").alert("头像修改成功", "提示");
        $("#file").val("");
        $('#useravatar').attr("src",data);
        $('#user_image').attr("src",data);
        $("#user_avatar").val(data);
        window.parent.document.getElementById("useravatar").setAttribute("src",data);
        $("#img").modal("hide");
    });
};