$(document).ready(function () {
    var summernotes=$("body").find("textarea[summernote]");
    for(var k=0;k<summernotes.length;k++){
        bindSum(summernotes[k]);
    }

    function sendFile(file,a) {

        data = new FormData();
        data.append("file", file);
        //增加额外的参数
        data.append("type", 'image');
        $.ajax({
                   data: data,
                   type: "POST",
                   url: "/upload/custom",
                   cache: false,
                   contentType: false,
                   processData: false,
                   success: function (json) {
                       $(a).summernote('editor.insertImage',json);
                   }
               });
    }
    function bindSum(a) {
        var ear=$(a);
        $(a).summernote({
                            toolbar: [
                                // [groupName, [list of button]]
                                ['style', ['bold', 'italic', 'underline', 'clear']],
                                ['font', ['strikethrough', 'superscript', 'subscript','fontname']],
                                ['fontsize', ['fontsize']],
                                ['color', ['color']],
                                ['para', ['ul', 'ol', 'paragraph','style']],
                                ['height', ['height']],
                                ['insert',['picture','hr']]
                            ],
                            lang: 'zh-CN',
                            minHeight: "85px",
                            maxHeight: "auto",
                            focus: false,
                            callbacks: {
                                onImageUpload: function (files,editor, $editable) {
                                    sendFile(files[0],ear);
                                    $("body").addClass("modal-open");
                                },
                                onChange: function(contents, $editable) {
                                    $(ear).val($(ear).summernote("code"));
                                },
                                onKeyup:function (contents, $editable) {
                                    $(ear).val($(ear).summernote("code"));
                                },
                                onBlur:function (contents, $editable) {
                                    $(ear).val($(ear).summernote("code"));
                                    $("form").validate().element($(ear));
                                }
                            }
                        });
    }
});