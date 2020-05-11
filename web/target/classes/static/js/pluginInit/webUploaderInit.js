$(document).ready(function () {
    var imageType="bmp,jpg,png,tiff,gif,pcx,fpx,svg,raw";
    var fileType="doc,docx,xlsx,xls,ppt,pptx,pdf,zip,rar,7z,mp4,avi,txt";

    var up=$("body").find("div[webUploader]");
    var uploaders=new Array(up.length);
    for(var k=0;k<up.length;k++){
        var server;
        //查看是否上传到自己的文件上传
        var url=$(up[k]).attr("webUploader");
        if(url=="" || url==null || typeof url=="undefind"){
            //默认的文件上传路径
            server="/upload/custom";
        }else{
            server=url;
        }
        //上传的前台校验
        var type=$(up[k]).attr("accept");
        if(type==null || type=="" || typeof type==undefined){
            type=imageType+","+fileType;
        }
        var accept;
        if(type!="" && type!=null && typeof type!="undefind"){
            accept={
                extensions:type
            }
            var types=type.split(",");
            var image=false;
            var file=false;
            for(var b=0;b<types.length;b++){
                if(imageType.indexOf(types[b]) != -1 && !image){
                    image=true;
                }
                if(fileType.indexOf(types[b]) != -1 && !file){
                    file=true;
                }
                if(!image && !file){
                    break;
                }
            }
            if(image && file){
                accept["title"]="file";
                accept["mimeTypes"]="file/*";
                server+="?acceptType="+type;
            }else if(image){
                accept["title"]="image";
                accept["mimeTypes"]="img/*";
                server+="?acceptType="+type;
            }else if(file){
                accept["title"]="file";
                accept["mimeTypes"]="file/*";
                server+="?acceptType="+type;
            }else{
                accept["title"]="file";
                accept["mimeTypes"]="file/*";
                server+="?acceptType="+type;
            }
        }
        uploaders[k]=WebUploader.create({
                                            swf:'/css/third/Uploader.swf',
                                            // 选完文件后，是否自动上传。
                                            auto: true,

                                            // swf文件路径
                                            /* swf: '/js/Uploader.swf',*/

                                            // 文件接收服务端。
                                            server: server,

                                            // 选择文件的按钮。可选。
                                            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                                            pick: $(up[k]).find("*[filePicker]"),

                                            // 只允许选择图片文件。
                                            accept:accept,
                                            duplicate :true
                                        });
        bindFile(uploaders[k],up[k]);
    }
    k--;
   function bindFile(upload,up) {
       // 当有文件添加进来的时候
       upload.on( 'fileQueued', function(file) {
           if(Number($(up).attr("size"))<=$(up).find(".info").length){
               zudp.plugin.dialog("warning").alert("超出上传数量！","警告");
               return;
           }else{
               var $li = $(
                   '<div id="' + file.id + '" class="file-item thumbnail">' +
                   '<img>' +
                   '<div class="info">' + file.name + '</div><span title="删除" class="file-span">×</span>' +
                   '</div>'
                   ),
                   $img = $li.find('img');


               // $list为容器jQuery实例
               $(up).find("*[fileList]").append($li);

               // 创建缩略图
               // 如果为非图片文件，可以不用调用此方法。
               // thumbnailWidth x thumbnailHeight 为 100 x 100
               upload.makeThumb( file, function( error, src ) {
                   if ( error ) {
                       $img.replaceWith('<span style="display: block;\n'
                                        + '    width: 100px;\n'
                                        + '    height: 100px;\n'
                                        + '    line-height: 100px;\n">不能预览</span>');
                       return;
                   }

                   $img.attr( 'src', src );
               }, 100, 100 );
           }
       });

       // 文件上传过程中创建进度条实时显示。
       upload.on( 'uploadProgress', function( file, percentage ) {
           var $li = $( '#'+file.id ),
               $percent = $li.find('.progress span');

           // 避免重复创建
           if ( !$percent.length ) {
               $percent = $('<p class="progress"><span></span></p>')
                   .appendTo( $li )
                   .find('span');
           }

           //$percent.css( 'width', percentage * 100 + '%' );
       });

       // 文件上传成功，给item添加成功class, 用样式标记上传成功。
       upload.on( 'uploadSuccess', function( file,response) {
           var value=$(up).children("input[result]").val();
           if(value==null || value=="" || typeof value=="undefind"){
               value="";
           }
           if(value!="" && value.split(",").length-1==Number($(up).attr("size"))){
                return;
           }
           value+=","+response.data;
           $(up).children("input[result]").val(value);
           $( '#'+file.id ).addClass('upload-state-done');
       });

       // 文件上传失败，显示上传出错。
       upload.on( 'uploadError', function( file ) {
           var $li = $( '#'+file.id ),
               $error = $li.find('div.error');

           // 避免重复创建
           if ( !$error.length ) {
               $error = $('<div class="error"></div>').appendTo( $li );
           }

           $error.text('上传失败');
       });

       // 完成上传完了，成功或者失败，先删除进度条。
       upload.on( 'uploadComplete', function( file ) {
           $( '#'+file.id ).find('.progress').remove();
       });
   }

   $(document).on("click",".file-span",function () {
       var a=$(this);
       zudp.plugin.dialog("warning").confirm("取消该文件上传","删除",function () {
           var parent=$(a).parent("div");
           var filelist=$(a).parent("div").parent("div");
           var input=$(filelist).parent("div").find("input[result]");
           var inputVal=$(input).val().split(",");
           var firstDivId=$(filelist).find(".upload-state-done").eq(0).attr("id");
           var parentId=$(parent).attr("id");
           var a1=parseInt(parentId.split("_")[2]);
           var b1=parseInt(firstDivId.split("_")[2]);
           var str="";
           for(var k=1;k<inputVal.length;k++){
               if((k-1)==(b1-a1)){
                   continue;
               }
               str+=","+inputVal[k];
           }
           $(input).val(str);
           $(parent).remove();
       });
   });
});