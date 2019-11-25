//jquery校验的封装
//封装的目的  在一个js里定义一个项目中所有的校验 当想要新增加
/**
 1.isMeu 只能由数字,26个英文字母或者下划线组成的字符串
 2.isChinese 只能是中文
 3.isPositiveInt 只能是正整数
 4.isInt 只能是整数
 5.isUrl 只能是url
 6.isIP 只能是ip
 7.isQQNum 只能是qq账号
 8.isDecimal 只能是小数
 9.isPhone 手机号码格式不正确
 10.checkEmail 邮件已存在
 11.isEmail  邮件格式不正确
 12.required 字段是必须字段
 13.isPositiveDecimals 只能是正小数
 14.isEnglish 只能是英文
 15.isMe 只能是英文和数字组成的字符串
 */
$(document).ready(function () {
    var checked=$("body").find("*[zudpValidate]");
    for(var k=0;k<checked.length;k++){

        var inputs=$(checked[k]).find("*[isMeu],*[isChinese],*[isPositiveInt],*[isInt],*[isUrl],*[isIP],*[isQQNum],"
                                      + "*[isDecimal],*[isPhone],*[checkEmail],*[isEmail],*[required],*[isPositiveDecimals],"
                                      + "*[isEnglish],*[isMe]");
        var rules={};
        var messages={};
        for(var b=0;b<inputs.length;b++){
            var nameType={};
            var nameMessage={};
            var map=findAllValidateAttr(inputs[b]);
            for(var key in map){
                nameType[key]=true;
                nameMessage[key]=$(inputs[b]).attr("placeholder")+map[key];
            }
            rules[$(inputs[b]).attr("name")]=nameType;
            messages[$(inputs[b]).attr("name")]=nameMessage;
        }
        if(window.validates) {
            var validate=validates();
            for(var key in validate){
                if(key==$(checked[k]).attr("id")){
                    var ru=validate[key]["rules"];
                    var message=validate[key]["messages"];
                    for(var j in ru){
                        if(rules[j]!=null){
                            for(var b in ru[j]){
                                rules[j][b]=ru[j][b];
                                messages[j][b]=message[j][b];
                            }
                        }else{
                            rules[j]=ru[j];
                            messages[j]=message[j];
                        }
                    }
                }
            }
        }
        var vali={};
        vali.rules=rules;
        vali.messages=messages;
        $(checked[k]).validate(vali);
    }
    // m代表数字 e代表英文 u代表下滑先
    function findAllValidateAttr(a) {
        var map={};
        var add=true;
        if($(a).attr("isMeu")==""){
            map.isType="只能由数字,26个英文字母或者下划线组成的字符串";
            add=false;
        }else if(typeof ($(a).attr("isMeu"))!='undefined'){
            map.isType=$(a).attr("isMeu");
            add=false;
        }
        if(!add){
            jQuery.validator.addMethod("isMeu",function (value, element, param) {
                var length = value.length;
                var login_name = /^[0-9a-zA-Z_]{1,}$/;
                return this.optional(element) || (length <= 64  && login_name.test(value));
            }, "");
            add=true;
        }
        if($(a).attr("isChinese")==""){
            map.isType="只能是汉字";
            add=false;
        }else if(typeof ($(a).attr("isChinese"))!='undefined'){
            map.isType=$(a).attr("isChinese");
            add=false;
        }
        if(!add){
            jQuery.validator.addMethod("isChinese", function(value, element) {
                var length = value.length;
                var regName = /[^\u4e00-\u9fa5]/g;
                return this.optional(element) || !regName.test( value );
            }, "");
            add=true;
        }
        if($(a).attr("isPositiveInt")==""){
            map.isValue="只能是正整数";
            add=false;
        }else if(typeof ($(a).attr("isPositiveInt"))!='undefined'){
            map.isValue=$(a).attr("isPositiveInt");
            add=false;
        }
        if(!add){
            jQuery.validator.addMethod("isPositiveInt",function (value, element, param) {
                var login_name = /^[0-9]*[1-9][0-9]*$/;
                return this.optional(element) || (login_name.test(value));
            }, "");
            add=true;
        }
        if($(a).attr("isInt")==""){
            map.isValue="只能是整数";
            add=false;
        }else if(typeof ($(a).attr("isInt"))!='undefined'){
            map.isValue=$(a).attr("isInt");
            add=false;
        }
        if(!add){
            jQuery.validator.addMethod("isInt",function (value, element, param) {
                var login_name = "^-?/d+$";
                return this.optional(element) || (login_name.test(value));
            }, "");
            add=true;
        }

        if($(a).attr("isUrl")==""){
            map.isValue="只能是url";
            add=false;
        }else if(typeof ($(a).attr("isUrl"))!='undefined'){
            map.isValue=$(a).attr("isUrl");
            add=false;
        }
        if(!add){
            jQuery.validator.addMethod("isUrl",function (value, element, param) {
                var login_name = "^[a-zA-z]+://(/w+(-/w+)*)(/.(/w+(-/w+)*))*(/?/S*)?$";
                return this.optional(element) || (login_name.test(value));
            }, "");
            add=true;
        }

        if($(a).attr("isIP")==""){
            map.isValue="只能是ip";
            add=false;
        }else if(typeof ($(a).attr("isIP"))!='undefined'){
            map.isValue=$(a).attr("isIP");
            add=false;
        }
        if(!add){
            jQuery.validator.addMethod("isIP",function (value, element, param) {
                var login_name = "^(d{1,2}|1dd|2[0-4]d|25[0-5]).(d{1,2}|1dd|2[0-4]d|25[0-5]).(d{1,2}|1dd|2[0-4]d|25[0-5]).(d{1,2}|1dd|2[0-4]d|25[0-5])$";
                return this.optional(element) || (login_name.test(value));
            }, "");
            add=true;
        }

        if($(a).attr("isQQNum")==""){
            map.isValue="只能是qq账号";
            add=false;
        }else if(typeof ($(a).attr("isQQNum"))!='undefined'){
            map.isValue=$(a).attr("isQQNum");
            add=false;
        }
        if(!add){
            jQuery.validator.addMethod("isQQNum",function (value, element, param) {
                var login_name = "^[1-9]*[1-9][0-9]*$";
                return this.optional(element) || (login_name.test(value));
            }, "");
            add=true;
        }

        if($(a).attr("isDecimal")==""){
            map.isValue="只能是小数";
            add=false;
        }else if(typeof ($(a).attr("isDecimal"))!='undefined'){
            map.isValue=$(a).attr("isDecimal");
            add=false;
        }
        if(!add){
            jQuery.validator.addMethod("isDecimal",function (value, element, param) {
                var login_name = "^(([0-9]+/.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*/.[0-9]+)|([0-9]*[1-9][0-9]*))$";
                return this.optional(element) || (login_name.test(value));
            }, "");
            add=true;
        }


        if($(a).attr("isPhone")==""){
            map.isValue="手机号码格式不正确";
            add=false;
        }else if(typeof ($(a).attr("isPhone"))!='undefined'){
            map.isValue=$(a).attr("isPhone");
            add=false;
        }
        if(!add){
            jQuery.validator.addMethod("isPhone",function (value, element, param) {
                var length = value.length;
                // var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
                return this.optional(element) || (length == 11 && zudp.util.checkStr(value, "phone"));
            }, "");
        }


        if($(a).attr("checkEmail")==""){
            map.isValue="邮件已存在";
            add=false;
        }else if(typeof ($(a).attr("checkEmail"))!='undefined'){
            map.isValue=$(a).attr("checkEmail");
            add=false;
        }
        if(!add){
            jQuery.validator.addMethod("checkEmail",function (value, element, param) {
                return checkEmail(value);
            }, "");
        }

        if($(a).attr("isEmail")==""){
            map.isValue="邮箱格式不正确";
            add=false;
        }else if(typeof ($(a).attr("isEmail"))!='undefined'){
            map.isValue=$(a).attr("isEmail");
            add=false;
        }
        if(!add){
            jQuery.validator.addMethod("isEmail",function (value, element, param) {
                var login_name = "^([w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$";
                return this.optional(element) || (login_name.test(value));
            }, "");
            add=true;
        }

        //假如是jquery种的对象会要像下面一样
        if($(a).attr("required")=="required"){
            map.required="字段是必须字段";
        }else if(typeof ($(a).attr("required"))!='undefined'){
            map.required=$(a).attr("required");
        }


        if($(a).attr("isPositiveDecimals")==""){
            map.isValue="只能是正小数";
            add=false;
        }else if(typeof ($(a).attr("isPositiveDecimals"))!='undefined'){
            map.isValue=$(a).attr("isPositiveDecimals");
            add=false;
        }
        if(!add){
            jQuery.validator.addMethod("isPositiveDecimals",function (value, element, param) {
                var login_name = "^((-/d+(/./d+)?)|(0+(/.0+)?))$";
                return this.optional(element) || (login_name.test(value));
            }, "");
            add=true;
        }

        if($(a).attr("isEnglish")==""){
            map.isValue="只能是英文";
            add=false;
        }else if(typeof ($(a).attr("isEnglish"))!='undefined'){
            map.isValue=$(a).attr("isEnglish");
            add=false;
        }
        if(!add){
            jQuery.validator.addMethod("isEnglish",function (value, element, param) {
                var login_name = "^[A-Za-z]+$";
                return this.optional(element) || (login_name.test(value));
            }, "");
            add=true;
        }

        if($(a).attr("isMe")==""){
            map.isValue="只能是英文和数字组成的字符串";
            add=false;
        }else if(typeof ($(a).attr("isMe"))!='undefined'){
            map.isValue=$(a).attr("isMe");
            add=false;
        }
        if(!add){
            jQuery.validator.addMethod("isMe",function (value, element, param) {
                var login_name = "^[A-Za-z0-9]+$";
                return this.optional(element) || (login_name.test(value));
            }, "");
            add=true;
        }
        return map;
    }
});

//方法
function checkEmail(data) {
    var result;
    zudp.ajax("/api/user/checkEmail")
        .synch()
        .get({"email":data})
        .then(function (da) {
            if(zudp.util.isBoolean(da)){
                result=da;
            }else{
                result=false;
            }
    },function (error) {
        result=false;
    });
    return result;
}
