/**
 * zudp
 * @namespace
 */
var zudp = {
    /**
     * util 工具包
     * @member {Object} zudp.util
     */
    util: {
        /**
         * assert 校验工具包
         * @member {Object} zudp.util.assert
         */
        assert: {
            /**
             * 检查参数是否为一个函数对象，如果不是则抛出异常
             * @method checkFunction
             * @param {Object} param 检查参数是否为一个函数对象
             * @example
             * var f = function() {}
             * zudp.util.assert.checkFunction(f);
             */
            checkFunction: function (param) {
                if (!zudp.util.isFunction(param)) {
                    throw '预期参数类型为 Function，实际类型为 ' + Object.prototype.toString.call(param);
                }
            },
            /**
             * 检查参数是否为一个数组对象，如果不是则抛出异常
             * @method checkArray
             * @param {Object} param 检查参数是否为一个数组对象
             * @example
             * var f = []
             * zudp.util.assert.checkArray(f);
             */
            checkArray: function (param) {
                if (!zudp.util.isArray(param)) {
                    throw '预期参数类型为 Array，实际类型为 ' + Object.prototype.toString.call(param);
                }
            },
            /**
             * 检查参数是否为一个字符串对象，如果不是则抛出异常
             * @method checkString
             * @param {Object} param 检查参数是否为一个字符串对象
             * @example
             * var f = 'test'
             * zudp.util.assert.checkString(f);
             */
            checkString: function (param) {
                if (!zudp.util.isString(param)) {
                    throw '预期参数类型为 String，实际类型为 ' + Object.prototype.toString.call(param);
                }
            },
            /**
             * 检查参数是否为一个布尔对象，如果不是则抛出异常
             * @method checkBoolean
             * @param {Object} param 检查参数是否为一个布尔对象
             * @example
             * var f = true
             * zudp.util.assert.checkBoolean(f);
             */
            checkBoolean: function (param) {
                if (!zudp.util.isBoolean(param)) {
                    throw '预期参数类型为 Boolean，实际类型为 ' + Object.prototype.toString.call(param);
                }
            }
        },
        /**
         * 渲染字符串
         * @method render
         * @param {String} template 字符串模板，通过 {fieldName} 进行替换，支持多级
         * @param {Object} context 上下文，里面存放了模板中需要的字段
         * @returns {String} 返回渲染后的字符串
         * @example
         * var t = '{name} is gay!'
         * var c = { name: 'w' }
         * zudp.util.render(t, c);
         */
        render: function (template, context) {
            var tokenReg = /(\\)?\{([^\{\}\\]+)(\\)?\}/g;

            return template.replace(tokenReg, function (word, slash1, token, slash2) {
                if (slash1 || slash2) {
                    return word.replace('\\', '');
                }

                var variables = token.replace(/\s/g, '').split('.');
                var currentObject = context;
                var i, length, variable;

                for (i = 0, length = variables.length; i < length; ++i) {
                    variable = variables[i];
                    currentObject = currentObject[variable];
                    if (currentObject === undefined || currentObject === null) return '';
                }
                return currentObject;
            })
        },
        /**
         * 渲染字符串
         * @method renderArray
         * @param {String} template 字符串模板，通过 {fieldName} 进行替换，支持多级
         * @param {Array} context 上下文，这里是一个数组，里面每一个对象存放了模板中需要的字段
         * @returns {String} 返回渲染后的字符串
         * @example
         * var t = '{name} is gay!'
         * var c = [{ name: 'w' }, { name: 'd' }]
         * zudp.util.renderArray(t, c);
         */
        renderArray: function (template, context) {
            zudp.util.assert.checkArray(context);

            var result = '';
            for (var i = 0; i < context.length; i++) {
                result += zudp.util.render(template, context[i]);
            }

            return result;
        },
        getJquery: function(jqueryIdentifier) {
            return $(jqueryIdentifier)
        },
        /**
         * 是否为开发模式
         * @method isDev
         * @param {Object} status 判断的其中一个条件
         * @returns {Boolean} 如果是返回true
         * @example
         * var t = true
         * zudp.util.isDev(t);
         */
        isDev: function(status) {
            return zudp.global.profile === zudp.global.status.dev && status;
        },
        /**
         * 是否字符串
         * @method isString
         * @param {Object} o 检查的对象
         * @returns {Boolean} 如果是返回true
         * @example
         * var t = '{name} is gay!'
         * zudp.util.isString(t);
         */
        isString: function(o) {
            return Object.prototype.toString.call(o).slice(8, -1) === 'String'
        },
        /**
         * 是否数字
         * @method isNumber
         * @param {Object} o 检查的对象
         * @returns {Boolean} 如果是返回true
         * @example
         * var t = 3
         * zudp.util.isNumber(t);
         */
        isNumber: function(o) {
            return Object.prototype.toString.call(o).slice(8, -1) === 'Number'
        },
        /**
         * 是否为普通对象
         * @method isObj
         * @param {Object} o 检查的对象
         * @returns {Boolean} 如果是返回true
         * @example
         * var t = 3
         * zudp.util.isObj(t);
         */
        isObj: function(o) {
            return Object.prototype.toString.call(o).slice(8, -1) === 'Object'
        },
        /**
         * 是否为数组
         * @method isArray
         * @param {Object} o 检查的对象
         * @returns {Boolean} 如果是返回true
         * @example
         * var t = 3
         * zudp.util.isArray(t);
         */
        isArray: function(o) {
            return Object.prototype.toString.call(o).slice(8, -1) === 'Array'
        },
        /**
         * 是否为时间对象，通过 new Date() 出来的
         * @method isDate
         * @param {Object} o 检查的对象
         * @returns {Boolean} 如果是返回true
         * @example
         * var t = new Date()
         * zudp.util.isDate(t);
         */
        isDate: function(o) {
            return Object.prototype.toString.call(o).slice(8, -1) === 'Date'
        },
        /**
         * 是否为boolean
         * @method isBoolean
         * @param {Object} o 检查的对象
         * @returns {Boolean} 如果是返回true
         * @example
         * var t = ...
         * zudp.util.isBoolean(t);
         */
        isBoolean: function(o) {
            return Object.prototype.toString.call(o).slice(8, -1) === 'Boolean'
        },
        /**
         * 是否为函数
         * @method isFunction
         * @param {Object} o 检查的对象
         * @returns {Boolean} 如果是返回true
         * @example
         * var t = ...
         * zudp.util.isDateisFunctiont);
         */
        isFunction: function(o) {
            return Object.prototype.toString.call(o).slice(8, -1) === 'Function'
        },
        /**
         * 是否为null
         * @method isNull
         * @param {Object} o 检查的对象
         * @returns {Boolean} 如果是返回true
         * @example
         * var t = ...()
         * zudp.util.isNullate(t);
         */
        isNull: function(o) {
            return Object.prototype.toString.call(o).slice(8, -1) === 'Null'
        },
        /**
         * 是否为undefined
         * @method isUndefined
         * @param {Object} o 检查的对象
         * @returns {Boolean} 如果是返回true
         * @example
         * var t = ...
         * zudp.util.isDate(isUndefined);
         */
        isUndefined: function(o) {
            return Object.prototype.toString.call(o).slice(8, -1) === 'Undefined'
        },
        isFalse: function(o) {
            if (!o || o === 'null' || o === 'undefined' || o === 'false' || o === 'NaN') return true
            return false
        },
        isTrue: function(o) {
            return !this.isFalse(o)
        },
        /**
         * 判断当前是否为 ios 手机
         * @method isIos
         * @returns {Boolean} 如果是返回true
         * @example
         * zudp.util.isIos();
         */
        isIos: function() {
            var u = navigator.userAgent;
            if (u.indexOf('Android') > -1 || u.indexOf('Linux') > -1) {//安卓手机
                // return "Android";
                return false
            } else if (u.indexOf('iPhone') > -1) {//苹果手机
                // return "iPhone";
                return true
            } else if (u.indexOf('iPad') > -1) {//iPad
                // return "iPad";
                return false
            } else if (u.indexOf('Windows Phone') > -1) {//winphone手机
                // return "Windows Phone";
                return false
            }else{
                return false
            }
        },
        /**
         * 判断当前是否为 PC 端
         * @method isPC
         * @returns {Boolean} 如果是返回true
         * @example
         * zudp.util.isPC();
         */
        isPC: function() {
            var userAgentInfo = navigator.userAgent;
            var Agents = ["Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"];
            var flag = true;
            for (var v = 0; v < Agents.length; v++) {
                if (userAgentInfo.indexOf(Agents[v]) > 0) {
                    flag = false;
                    break;
                }
            }
            return flag;
        },
        /**
         * 获取浏览器类型
         * @method browserType
         * @returns {String} 返回相应的字符串值，如 IE7、IE8、IE9、IE10、IE11、Chrome、FF、Opera、Edge等。
         * @example
         * var browserType = zudp.util.browserType();
         */
        browserType: function(){
            //取得浏览器的 userAgent 字符串
            var userAgent = navigator.userAgent;
            //判断是否Opera浏览器
            var isOpera = userAgent.indexOf("Opera") > -1;
            //判断是否IE浏览器
            var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera;
            //判断是否IE的Edge浏览器
            var isEdge = userAgent.indexOf("Edge") > -1;
            //判断是否Firefox浏览器
            var isFF = userAgent.indexOf("Firefox") > -1;
            //判断是否Safari浏览器
            var isSafari = userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") === -1;
            //判断Chrome浏览器
            var isChrome = userAgent.indexOf("Chrome") > -1 && userAgent.indexOf("Safari") > -1;
            if (isIE) {
                var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
                reIE.test(userAgent);
                var fIEVersion = parseFloat(RegExp["$1"]);
                if(fIEVersion === 7) return "IE7";
                else if(fIEVersion === 8) return "IE8";
                else if(fIEVersion === 9) return "IE9";
                else if(fIEVersion === 10) return "IE10";
                else if(fIEVersion === 11) return "IE11";
                else return "IE7以下"//IE版本过低
            }

            if (isFF) return "FF";
            if (isOpera) return "Opera";
            if (isEdge) return "Edge";
            if (isSafari) return "Safari";
            if (isChrome) return "Chrome";
        },
        /**
         * 检查字符串是否符合某种类型
         * @method checkStr
         * @param {String} str 需要检测的字符串
         * @param {String} type 类型值，包括 phone、tel、card、pwd、QQ、email、money、URL等
         * @returns {String} 如果符合就返回 true，否则返回 false
         * @example
         * var result = zudp.util.checkStr('18598745632', 'phone');
         */
        checkStr: function(str, type) {
            switch (type) {
                // 手机号码
                case 'phone':
                    return /^(13|18|14|17|15)[0-9]{9}$/.test(str);
                // 座机
                case 'tel':
                    return /^(0\d{2,3}-\d{7,8})(-\d{1,4})?$/.test(str);
                // 身份证
                case 'card':
                    return /^\d{15}|\d{18}$/.test(str);
                // 密码以字母开头，长度在6~18之间，只能包含字母、数字和下划线
                case 'pwd':
                    return /^[a-zA-Z]\w{5,17}$/.test(str);
                // 邮政编码
                case 'postal':
                    return /[1-9]\d{5}(?!\d)/.test(str);
                // QQ号
                case 'QQ':
                    return /^[1-9][0-9]{4,9}$/.test(str);
                // 邮箱
                case 'email':
                    return /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/.test(str);
                // 金额(小数点2位)
                case 'money':
                    return /^\d*(?:\.\d{0,2})?$/.test(str);
                // 网址
                case 'URL':
                    return /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?/.test(str)
                // IP
                case 'IP':
                    return /((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d))/.test(str);
                // 日期时间
                case 'date':
                    return /^(\d{4})\-(\d{2})\-(\d{2}) (\d{2})(?:\:\d{2}|:(\d{2}):(\d{2}))$/.test(str) || /^(\d{4})\-(\d{2})\-(\d{2})$/.test(str)
                // 数字
                case 'number':
                    return /^[0-9]$/.test(str);
                // 英文
                case 'english':
                    return /^[a-zA-Z]+$/.test(str);
                // 中文
                case 'chinese':
                    return /^[\u4E00-\u9FA5]+$/.test(str);
                // 小写
                case 'lower':
                    return /^[a-z]+$/.test(str);
                // 大写
                case 'upper':
                    return /^[A-Z]+$/.test(str);
                // HTML标记
                case 'HTML':
                    return /<("[^"]*"|'[^']*'|[^'">])*>/.test(str);
                default:
                    return true;
            }
        },
        /**
         * 将时间戳格式化
         * @method timeformater
         * @param {Number} timestamp 时间戳
         * @returns {String} 返回格式化后的时间
         * @example
         * var result = zudp.util.timeformater(18598745632);
         */
        timeformater: function (timestamp) {
            if (!zudp.util.isNull(timestamp)) {
                if (!zudp.util.isNumber(timestamp)) {
                    throw "预期 timestamp 应该为 Number类型，传入参数类型是：" +
                          Object.prototype.toString.call(timestamp);
                }
                return function (time) {
                    var oDate = new Date(time);
                    var oYear = oDate.getFullYear();
                    var oMonth = oDate.getMonth() + 1;
                    var oDay = oDate.getDate();//最后拼接时间
                    return oYear + '-' + getzf(oMonth) + '-' + getzf(oDay);
                }(timestamp);

                //补0操作,当时间数据小于10的时候，给该数据前面加一个0
                function getzf(num) {

                    if (parseInt(num) < 10) {
                        num = '0' + num;
                    }
                    return num;
                }
            } else {
                return "";
            }
        },
        /**
         * 序列化一个表单内的所有值
         * @method formData2json
         * @param {Number} jqSelector form表单的jq选择器
         * @returns {String} 返回序列化后的字符串值
         * @example
         * var result = zudp.util.timeformater('#form');
         */
        formData2json: function (jqSelector) {
            $.fn.serializeObject = function () {
                var o = {};
                var a = this.serializeArray();
                $.each(a, function () {
                    if (o[this.name]) {
                        if (!o[this.name].push) {
                            o[this.name] = [o[this.name]];
                        }
                        o[this.name].push(this.value || '');
                    } else {
                        o[this.name] = this.value || '';
                    }
                });
                return o;
            };

            return function (jqSelector) {
                return JSON.stringify($(jqSelector).serializeObject());
            }(jqSelector);
        },
        /**
         * 为 ztree 树节点进行排序
         * @method ztreeSort
         * @param {Object} ztree 通过 $.fn.zTree.init($("#tree"), setting, data) 返回的值对象
         * @param {Object} node 为 ztree.getNodes()[0] 对象
         * @param {String} property 排序字段名，默认为 weight
         * @example
         * var ztree = $.fn.zTree.init($("#tree"), setting, data);
         * var node = ztree.getNodes()[0];
         * zudp.util.ztreeSort(ztree, node);
         */
        ztreeSort: function(ztree, node, property) {
            if (!property) {
                property = 'weight';
            }
            if (!node) {
                node = ztree.getNodes()[0];
            }

            var children = node.children;
            if (!children) {
                return;
            }

            // 同级排序
            for (var i = 0; i < children.length; i++) {
                for (var j = 0; j < children.length - 1; j++) {
                    if (children[j][property] > children[j + 1][property]) {
                        ztree.moveNode(children[j], children[j + 1], 'prev', true);
                    }
                }
            }

            // 子级排序
            for (i = 0; i < children.length; i++) {
                zudp.util.ztreeSort(ztree, children[i]);
            }
        }
    },
    plugin: {
    },
    component: {},
    template: {
        detailBtn: '<button class="btn btn-info btn-sm row-detail" value="{id}"><i class="fa fa-pencil"></i>详情</button>',
        editBtn: '<button class="btn btn-info btn-sm row-edit updateOpBtn" value="{id}"><i class="fa fa-pencil"></i>编辑</button>',
        delBtn: '<button class="btn btn-danger btn-sm row-delete mgl my-mgl" value="{id}"><i class="fa fa-close"></i>删除</button>&nbsp;&nbsp;',
    },
    data: {
        table: {}
    }
};
zudp.global = {
    version: "1.0.0",
    name: "zudp",
    profile: "dev", // 生产环境设置为 product
    status: {
        dev: "dev",
        product: "product"
    },
    msg: {

    }
};
/**
 * 发送 Ajax 请求的起步，生成 AjaxConfig 对象
 * @method ajax
 * @param {String} url 请求地址
 * @returns {Object} AjaxConfig 对象，
 * @example
 * var ajax = zudp.ajax('/api/test');
 */
zudp.ajax=(function(){
    var AjaxConfig = function(url) {
        if (!url) {
            throw "缺少 url 参数";
        }

        this.url = url;
        this.async = true;
    };

    AjaxConfig.prototype = {
        config: function() {
            return this;
        },
        synch: function() {
            this.async = false;
            return this;
        },
        // get 请求
        get: function(data) {
            this.type = "get";
            if(data){
                this.val = data;
            }

            return this;
        },
        // post 请求
        post: function (data) {
            this.type = "post";
            if (data) {
                this.val = data;
            }

            return this;
        },
        // put 请求
        put: function (data) {
            this.type = "put";
            if (data) {
                this.val = data;
            }

            return this;
        },
        // delete 请求
        del: function (data) {
            this.type = "delete";
            if (data) {
                this.val = data;
            }

            return this;
        },
        // 之后的操作
        then: function (sucMethod, errMethod, failMethod) {
            if (zudp.util.isObj(sucMethod)) {
                errMethod = sucMethod.error;
                failMethod = sucMethod.fail;
                sucMethod = sucMethod.success;
            }

            if (!zudp.util.isFunction(errMethod)) {
                errMethod = function (jqXHR, textStatus, errorThrown) {
                    zudp.plugin.dialog('error').alert(jqXHR.responseJSON.msg, '错误');
                    if (zudp.util.isDev()) {
                        console.log(jqXHR);
                        console.log(textStatus);
                        console.log(errorThrown);
                    }
                }
            }
            $.ajax({
                       url: this.url,
                       type: this.type,
                       data: this.val,
                       async: this.async,
                       cache: false,
                       dataType: 'json',
                       contentType: 'application/json',
                       success: function (data) {
                           if (data.success) {
                               sucMethod(data.data, data);
                           } else if (failMethod) {
                               failMethod(data);
                           }
                       },
                       error: function (jqXHR, textStatus, errorThrown) {
                           errMethod(jqXHR, textStatus, errorThrown);
                       }
                   });

        }
    };

    return function (url) {
        return new AjaxConfig(url);
    };
})();
/**
 * radio 对应的操作，包括
 * 单选框
 *
 */
zudp.plugin.radio = (function() {

    /**
     * 生成一个 radio 对象
     * @param {String} jq jquery 定位的字符串，如 #id。
     */
    function Radio(jq) {
        var radio = {};

        if (typeof jq === 'string') {
            radio.jq = zudp.util.getJquery(jq);
        } else {
            throw "zudp.plugin.radio() 参数必须为字符串: " + jq;
        }

        radio.checked = function() {
             // 设置选中
            this.jq.prop("checked","true");
            return this;
        };
        radio.unchecked = function() {
            // 设置取消选中
            this.jq.removeProp("checked");
            return this;
        };
        radio.ischecked = function (){
            // 获取单选框状态
            var isCheck = this.jq.prop("checked");
            return isCheck;
        };
        radio.disabled = function (){
            //设置禁用
            this.jq.prop("disabled","true");
            return this;
        };
        radio.undisabled = function (){
            //设置取消禁用
            this.jq.removeProp("disabled");
            return this;
        };
        radio.property = function (prop,val){
            //设置属性
            this.jq.prop(prop,val);
            return this;
        };
        /**
         * 设置 radio 的值
         * @param {String} val 设置当前 radio 的值
         */
        radio.val = function(val) {
            // 获取值和设置值
            if(val){
                this.jq.attr("value",val);
                return this;
            }else{
                return this.jq.attr("value");
            }
        }

        return radio;
    };
    return Radio;
})()

/**
 * checkbox 对应的操作，包括
 * 复选框
 *
 */
zudp.plugin.checkbox = (function() {

    /**
     * 生成一个 checkbox 对象
     * @param {String} jq jquery 定位的字符串，如 #id。
     */
    function Checkbox(jq) {
        var checkbox = {};

        if (typeof jq === 'string') {
            checkbox.jq = zudp.util.getJquery(jq);
        } else {
            throw "zudp.plugin.checkbox() 参数必须为字符串: " + jq;
        }

        checkbox.checked = function() {
             // 设置选中
            this.jq.prop("checked","true");
            return this;
        };
        checkbox.unchecked = function() {
            // 设置取消选中
            this.jq.removeProp("checked");
            return this;
        };
        checkbox.ischecked = function (){
            // 获取复选框状态
            var isCheck = this.jq.prop("checked");
            return isCheck;
        };
        checkbox.disabled = function (){
            //设置禁用
            this.jq.prop("disabled","true");
            return this;
        };
        checkbox.undisabled = function (){
            //设置取消禁用
            this.jq.removeProp("disabled");
            return this;
        };
        checkbox.property = function (prop,val){
            //设置禁用
            this.jq.prop(prop,val);
            return this;
        };
        /**
         * 设置 checkbox 的值
         * @param {String} val 设置当前 checkbox 的值
         */
        checkbox.val = function(val) {
            // 获取值和设置值
            if(val){
                this.jq.attr("value",val);
                return this;
            }else{
                return this.jq.attr("value");
            }

        };
        return checkbox;
    };
    return Checkbox;
})();
/**
 * input[type="text"] 对应的操作，包括
 * 文本框
 *
 */
zudp.plugin.text = (function(){
    /**
     * 生成一个 text 对象
     * @param {String} jq jquery 定位的字符串，如 #id。
     */
    function Text(jq){
        var text = {};

        if (typeof jq === 'string') {
            text.jq = zudp.util.getJquery(jq);
        } else {
            throw "zudp.plugin.text() 参数必须为字符串: " + jq;
        }
        text.val = function(val){
            // 获取值和设置值
            if(val){
                this.jq.attr("value",val);
                return this;
            }else{
                return this.jq.attr("value");
            };
        }
        text.property = function (prop,val){
            //设置属性
            this.jq.prop(prop,val);
            return this;
        };
        text.disabled = function (){
            //设置禁用
            this.jq.prop("disabled","true");
            return this;
        };
        text.undisabled = function (){
            //设置取消禁用
            this.jq.removeProp("disabled");
            return this;
        };
        text.readonly = function (){
            //设置只读
            this.jq.prop("readonly","true");
            return this;
        };
        text.unreadonly = function (){
            //设置取消只读
            this.jq.removeProp("readonly");
            return this;
        };
        return text;
    }
    return Text;
})();
zudp.plugin.select = (function(){
    /**
     * 生成一个 select 对象
     * @param {String} jq jquery 定位的字符串，如 #id。
     */
    function Select(jq){
        var select = {};

        if (typeof jq === 'string') {
            select.jq = zudp.util.getJquery(jq);
        } else {
            // select.jq = jq;
            throw "zudp.plugin.select() 参数必须为字符串: " + jq;
        }
        select.val = function(val){
            // 获取值和设置值
            if(val){
                this.jq.find("option:selected").val(val);
                return this;
            }else{
                return this.jq.find("option:selected").val();
            };
        }
        select.init = function(val){
            // 初始化
            var selectVal=val
            var inHtml="";
            $.each(selectVal,function(name,val){
                inHtml += "<option value='"+ val +"' >"+ name +"</option>"
            })
            this.jq.html(inHtml);
        }
        select.disabled = function (){
            //设置禁用
            this.jq.prop("disabled","true");
            return this;
        };
        select.undisabled = function (){
            //设置取消禁用
            this.jq.removeProp("disabled");
            return this;
        };
        select.required = function (){
            //设置禁用
            this.jq.prop("required","true");
            return this;
        };
        select.unrequired = function (){
            //设置禁用
            this.jq.prop("required","false");
            return this;
        };
        return select;
    }
    return Select;
})();
zudp.plugin.select2 = (function(){
    /**
     * 生成一个 select 对象
     * @param {String} jq jquery 定位的字符串，如 #id。
     */
    function Select2(jq){
        var select2 = {};

        if (typeof jq === 'string') {
            select2.jq = zudp.util.getJquery(jq);
        } else {
            // select2.jq = jq;
            throw "zudp.plugin.select2() 参数必须为字符串: " + jq;
        }
        select2.val = function(val){
            // 获取值和设置值
            if(val){
                this.jq.val(val).trigger('change');
                return this;
            }else{
                return this.jq.select2("data");
                // return list;
            };

        }
        select2.init = function(obj){
            // 初始化
            // obj.multiple = true;
            if(obj){
                this.jq.select2(obj);
            }else{
                this.jq.select2();
            }
            return this;
        };
        select2.clear = function(){
            this.jq.val(null).trigger("change");
            return this;
        }
        select2.disabled = function (){
            //设置禁用
            this.jq.prop("disabled", true);
            return this;
        };
        select2.undisabled = function (){
            //设置取消禁用
            this.jq.removeProp("disabled");
            return this;
        };
        select2.ajax = function(url){
            if(url){
                this.jq.select2({
                                    ajax:{
                                        url: url,
                                        dataType: 'json',
                                        // delay: 250,
                                        data: function (params) {
                                            return {
                                                q: params.term,
                                            };
                                        },
                                        processResults: function (data) {
                                            return {
                                                results: data
                                            };
                                        },
                                        cache: true
                                    }
                                })
            }
        }
        return select2;
    }
    return Select2;
})();
zudp.plugin.textarea = (function(){
    /**
     * 生成一个 text 对象
     * @param {String} jq jquery 定位的字符串，如 #id。
     */
    function Textarea(jq){
        var textarea = {};

        if (typeof jq === 'string') {
            textarea.jq = zudp.util.getJquery(jq);
        } else {
            throw "zudp.plugin.textarea() 参数必须为字符串: " + jq;
        }
        textarea.text = function(txt){
            // 获取文本和设置文本
            if(txt){
                this.jq.text(txt);
                return this;
            }else{
                return this.jq.text();
            };
        }
        textarea.disabled = function (){
            //设置禁用
            this.jq.prop("disabled","true");
            return this;
        };
        textarea.undisabled = function (){
            //设置取消禁用
            this.jq.removeProp("disabled");
            return this;
        };
        textarea.readonly = function (){
            //设置禁用
            this.jq.prop("readonly","true");
            return this;
        };
        textarea.unreadonly = function (){
            //设置取消禁用
            this.jq.removeProp("readonly");
            return this;
        };
        textarea.property = function (prop,val){
            //设置属性
            this.jq.prop(prop,val);
            return this;
        };
        return textarea;
    }
    return Textarea;
})();
// zudp.plugin.threeLevelMenu = (function(){
//     /**
//      * 生成一个 threeLevelMenu 对象
//      * @param {String} jq jquery 定位的字符串，如 #id。
//      */
//     function Menu(jq){
//         var menu = {};

//         if (typeof jq === 'string') {
//             menu.jq = zudp.util.getJquery(jq);
//         } else {
//             throw "zudp.plugin.menu() 参数必须为字符串: " + jq;
//         }
//         menu.init = function(json){
//             // 初始化菜单
//             var roots=[];
//             var parent=[];
//             var childs=[];
//         }
//         $.each(json, function(admin, el) {
//             if(el.parentId==""){
//                 roots.push(el);
//             }else{
//                 // parent[admin]=el;
//                 if(el.parentIds!="" && el.parentId==el.parentIds){
//                     parent.push(el);
//                 }else{
//                     childs.push(el);
//                 }

//             }
//         });
//     }
//     return Menu;
// })();
// jqueryId、url、搜索条件、成功所执行的方法
zudp.plugin.table = (function () {
    var TableConfig = function (jqueryIdentifier, scrollY) {
        this.config = {
            jqueryIdentifier: jqueryIdentifier
        };
        if (!scrollY) {
            var availH = window.screen.availHeight,// 屏幕可用高度
                innerH = $(window.parent).height(),
                outerH = window.outerHeight;       //浏览器高度
            if(availH == outerH){     //是否全屏
                scrollY = innerH - 140;    //iframe高度
                scrollY-=188;    //188是其他内容高度
            }else{
                var y = innerH - 140;
                if(y < 500){
                    y = 500;
                }
                scrollY = y - 190;
            }
        }

        this.settings = {
            jQueryUI: false,    // JQuery UI 风格样式，已被列入弃用
            pagingType: "full_numbers",    // 分页按钮显示选项
            dom: '<"top"<"clear">><"toolbar">rt<"bottom"<"table-fi"i><"table-fl"l>p<"clear">>',
            processing: true,  // 是否显示处理状态 (排序的时候，数据很多耗费时间长的话，也会显示这个)
            serverSide: true,  // 打开后台分页，是否开启服务器模式
            lengthChange: true,  // 改变每页显示数据数量
            stateSave: true,  // 保存状态 - 在页面重新加载的时候恢复状态（页码等内容）
            retrieve: true,   // 检索已经存在的 Datatables 实例
            ordering: true,   // 是否允许 Datatables 开启排序
            info: true,      // 页脚信息
            autoWidth: true,  // 控制 Datatables 是否自适应宽度
            scrollY: scrollY,       // 设置表格高度，设置了固定高度，就不能设置自适应了，会被覆盖
            scrollCollapse: true,  // 表格高度自适应
            language: {
                "sSearch": "搜索",
                "sSearchPlaceholder": "",
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "没有检索到数据",
                "sInfo": "显示 _START_ 至 _END_ 条 &nbsp;&nbsp;共 _TOTAL_ 条",
                "sInfoFiltered": "(筛选自 _MAX_ 条数据)",
                "sInfoEmtpy": "没有找到数据",
                "sProcessing": "正在加载数据...",
                "sEmptyTable": "没有相关记录",
                "sInfoEmpty": "第 0 到 0 条记录，共 0 条",
                "sInfoPostFix": "",
                "sDecimal": "",
                "sThousands": ",",
                "sLoadingRecords": "正在载入...",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 升序排列",
                    "sSortDescending": ": 降序排列"
                }
            }
        };
    };

    TableConfig.prototype = {
        url: function (url) {
            this.config.url = url;
            return this;
        },
        search: function (fn) {
            zudp.util.assert.checkFunction(fn);
            this.config.search = fn;
            return this;
        },
        columns: function (columnsParam) {
            zudp.util.assert.checkArray(columnsParam);

            var column;
            var configColumns = [];
            for (var i = 0; i < columnsParam.length; i++) {
                if (!zudp.util.isBoolean(columnsParam[i].visible)) {
                    columnsParam[i].visible = true;
                }

                if (!zudp.util.isBoolean(columnsParam[i].searchable)) {
                    columnsParam[i].searchable = false;
                }

                if (!zudp.util.isBoolean(columnsParam[i].orderable)) {
                    columnsParam[i].orderable = false;
                }

                if (zudp.util.isNumber(columnsParam[i].length)) {
                    if (columnsParam[i].length <= 3) {
                        throw '表格的 length 配置必须大于 3 ，当前配置的值为 ' + columnsParam[i].length;
                    }

                    if (columnsParam[i].data) {
                        columnsParam[i].render = (function (fieldName, length) {
                            return function (data, type, row) {
                                var fieldNames = fieldName.split('.');
                                var fieldValue = row;

                                for (var j = 0; j < fieldNames.length; j++) {
                                    fieldValue = fieldValue[fieldNames[j]];
                                }

                                if (fieldValue != undefined&&fieldValue.length > length) {
                                    return fieldValue.substr(0, length) + '......';
                                } else {
                                    return fieldValue;
                                }
                            };
                        })(columnsParam[i].data, columnsParam[i].length);

                        columnsParam[i].data = undefined;
                    } else if (columnsParam[i].render) {
                        columnsParam[i].render = (function (render, length) {
                            return function (data, type, row) {
                                var fieldValue = render(data, type, row);
                                if (fieldValue != undefined&&fieldValue.length > length) {
                                    return fieldValue.substr(0, length) + '...';
                                } else {
                                    return fieldValue;
                                }
                            };
                        })(columnsParam[i].render, columnsParam[i].length);
                    }
                }

                column = {
                    data: columnsParam[i].data || null,
                    visible: columnsParam[i].visible,
                    searchable: columnsParam[i].searchable,
                    orderable: columnsParam[i].orderable,
                    width: columnsParam[i].width || undefined,
                    render: columnsParam[i].render || undefined
                };

                if (column.data === null) {
                    zudp.util.assert.checkFunction(column.render);
                }

                if (!column.render) {
                    zudp.util.data = null;
                }

                configColumns[i] = column;
            }

            this.config.columns = configColumns;
            //tr 变色
            var jqSelectors = this.config.jqueryIdentifier;
            $(document).on("click",jqSelectors+" tbody tr",function(event){
                event.preventDefault();
                if( typeof($(this).attr("data-class")) === "undefined"){
                    $(this).addClass("evenSelect");
                    $(this).attr("data-class",true);
                }else{
                    $(this).removeClass("evenSelect");
                    $(this).removeAttr("data-class");
                }
            });
            return this;
        },
        then: function (successMethod, errorMethod) {
            var config = this.config;
            var jqSelector = this.config.jqueryIdentifier;

            this.settings.ajax = function(data, callback, settings) {
                // dataTable 默认提供的参数全部去除
                data.page_size = data.length;
                data.page_no = data.start / data.page_size + 1;

                data.order = undefined;
                data.search = undefined;
                data.draw = undefined;
                data.start = undefined;
                data.length = undefined;
                data.columns = undefined;

                var searchCondition = config.search();
                for (var condition in searchCondition) {
                    if (searchCondition.hasOwnProperty(condition)) {
                        data[condition] = searchCondition[condition];
                    }
                }

                var succMethod;
                if (!zudp.util.isFunction(successMethod)) {
                    succMethod = function(res) {
                        setTimeout(
                            function () {
                                var returnData = {
                                    recordsFiltered: res.total,
                                    data: res.result,
                                    recordsTotal: res.total,
                                    length: res.size
                                };
                                callback(returnData);
                            },
                            200);
                    };
                } else {
                    if (zudp.util.isDev(!zudp.util.isUndefined(successMethod))) {
                        console.warn("预期的参数为 函数 类型，实际上它的类型为：" + (typeof succMethod));
                    }
                    succMethod = successMethod;
                }

                zudp.ajax(config.url).get(data).then(succMethod, errorMethod);
            };

            this.settings.columns = this.config.columns;

            var dataTable = zudp.util.getJquery(this.config.jqueryIdentifier).DataTable(this.settings);
            zudp.data.table[this.config.jqueryIdentifier] = new Table(dataTable);
            return dataTable;
        }
    };

    var Table = function (dataTable) {
        this.dataTable = dataTable;
    };

    Table.prototype.reload = function (callback, resetPaging) {
        if (resetPaging != null && resetPaging !== undefined) {
            zudp.util.assert.checkBoolean(resetPaging);
        } else {
            resetPaging = false;
        }

        if (!callback) {
            callback = null;
        }

        this.dataTable.ajax.reload(callback, resetPaging);
    };

    Table.prototype.getTable = function () {
        return this.dataTable;
    };

    return function($identifier) {
        return new TableConfig($identifier);
    }
})();
zudp.plugin.form = (function () {

    /**
     * @param formIdentifier {string} 表单的jquery定位符
     * @constructor
     */
    var Form = function(formIdentifier) {
        zudp.util.assert.checkString(formIdentifier);

        this.$form = zudp.util.getJquery(formIdentifier);

        /**
         * 清空表单数据，及校验留下的 css 样式
         */
        Form.prototype.reset = function() {
            this.$form.find('input').not("input[type='radio']").not('input[type=checkbox]').val('');
            this.$form.find('select').val('');
            this.$form.find('input[type=radio]').attr("checked", false);
            this.$form.find('input[type=checkbox]').attr("checked", false);
            this.$form.find('textarea').val('');
            //富文本框清空
            if(this.$form.find('textarea[summernote]').html()!=null && typeof this.$form.find('textarea[summernote]').html()!='undefined'){
                this.$form.find('textarea[summernote]').summernote('code', "");
            }
            //文件回显清空
            if(this.$form.find('div[fileList]').html()!=null && typeof this.$form.find('div[fileList]').html()!='undefined'){
                this.$form.find('div[fileList]').html("");
            }


            if (this.$form.validate) {
                this.$form.validate().resetForm();
            }

            this.$form.find('.error').removeClass("error");
            this.$form.find('.has-error').removeClass("has-error");
            this.$form.find('label.error').remove();
            this.$form.find('.ckeditor').siblings('span').removeClass("z-error-ckeidtor");
        };
        /**
         * 针对 z-disabled、z-abled进行强制禁用和启用
         *
         * @param oper {Boolean} 禁用或启用
         */
        Form.prototype.disabled = function(oper) {
            oper = oper === true;
            this.$form.find('input').attr('disabled', oper);
            this.$form.find('select').attr('disabled', oper);
            this.$form.find('radio').attr('disabled', oper);
            this.$form.find('checkbox').attr('disabled', oper);
            this.$form.find('textarea').attr('disabled', oper);

            this.$form.find(".z-disabled").attr('disabled', true);
            this.$form.find(".z-abled").attr('disabled', false);
        };
    };

    return function(formIdentifier) {
        return new Form(formIdentifier);
    }
})();
zudp.plugin.dialog = (function(){
    console.warn("建议不要使用dialog方法,或使用zudp.plugin.swal.* 和 zudp.plugin.toastr.* 方法")
    function Dialog(type) {
        var dialog = {};
        dialog.alert = function (title, msg) {
            toastr.options = {
                "closeButton": true,
                "debug": true,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "showDuration": "400",
                "hideDuration": "1000",
                "timeOut": "7000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            };
            if (!msg) {
                throw "缺少通知框的内容";
            }
            switch (type || "") {
                case "success":
                    toastr.success(title || "", msg);
                    break;

                case "info":
                    toastr.info(title || "", msg);
                    break;

                case "warning":
                    toastr.warning(title || "", msg);
                    break;

                case "error":
                    toastr.error(title || "", msg);
                    break;

                default:
                    throw '参数type 类型不正确'
            }

        };
        dialog.confirm = function (title, btnText, sucMethod) {
            switch (type) {
                case "success":
                    swal({
                             title: title,
                             text: '',
                             type: "success"
                         });
                    break;

                case "warning":
                    swal({
                             title: title,
                             text: '',
                             type: "warning",
                             showCancelButton: true,
                             confirmButtonColor: "#DD6B55",
                             confirmButtonText: btnText,
                             cancelButtonText: "取消"
                         }, sucMethod)
                    break;
                case "error":
                    swal({
                        title: title,
                        text: '',
                        type: "warning",
                        showCancelButton: false,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: btnText,
                        cancelButtonText: "取消"
                    })
                    break;
                default:
                    throw '参数type 类型不正确'
            }

        };
        return dialog;
    }
    return Dialog;
})();
zudp.plugin.toastr = (function(){
    var Toastr={};
    function toastrInit() {
        toastr.options = {
            "closeButton": true,
            "debug": true,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "showDuration": "400",
            "hideDuration": "1000",
            "timeOut": "7000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
    }
    Toastr.success=function(title, msg){
        if (!msg) {
            throw "缺少通知框的内容";
        }
        toastrInit()
        toastr.success(title || "", msg);
    };
    Toastr.info=function(title, msg){
        if (!msg) {
            throw "缺少通知框的内容";
        }
        toastrInit()
        toastr.info(title || "", msg);
    };
    Toastr.warning=function(title, msg){
        if (!msg) {
            throw "缺少通知框的内容";
        }
        toastrInit()
        toastr.warning(title || "", msg);
    };
    Toastr.error=function(title, msg){
        if (!msg) {
            throw "缺少通知框的内容";
        }
        toastrInit()
        toastr.error(title || "", msg);
    };

    return Toastr;
})();
zudp.plugin.swal = (function(){
    var Swal={};
    Swal.success=function(title,okButtonText){
        swal({
            title: title || "成功",
            text: '',
            confirmButtonText: okButtonText || "确定",
            type: "success"
        });
    }
    Swal.warning=function(title, okButtonText, successCallback){
        swal({
            title: title || "",
            text: '',
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: okButtonText || "确定",
            cancelButtonText: "取消"
        }, successCallback || function () {})
    }
    Swal.error=function(title, okButtonText){
        swal({
            title: title || "",
            text: '',
            type: "warning",
            showCancelButton: false,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: okButtonText || "确定",
            cancelButtonText: "取消"
        })
    }
    return Swal;
})();
/*模态框*/
zudp.plugin.modal=(function () {
    function Modal(jq){
        var modal = {};
        if (typeof jq === 'string') {
            modal.jq = zudp.util.getJquery(jq);
        } else {
            throw "zudp.plugin.modal() 参数必须为字符串: " + jq;
        }
        function modalHtml(modalID,title,contentMain,saveID){
            var modHtml =''
            modHtml ='<div class="modal inmodal fade" id="'+modalID+'" tabindex="-1" role="dialog"  aria-hidden="true">' +
                     '<div class="modal-dialog modal-lg">'+
                     '<div class="modal-content">'+
                     '<div class="modal-header">'+
                     '<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>'+
                     '<h4 class="modal-title">'+title+'</h4></div>'+
                     '<div class="modal-body">'+contentMain+'</div>'+
                     '<div class="modal-footer">'+
                     '<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>'+
                     '<button type="button" class="btn btn-primary" id="'+saveID+'">保存</button>'+
                     '</div>'+
                     '</div>'+
                     '</div>'+
                     '</div>'
            return modHtml;
        }


        modal.size = function(modalSize){
            if(!modalSize){
                throw "请输入Modal大小参数，例：sm、md、lg 或具体大小数值"
            }
            this.modalSize=modalSize;
            return this;
        };
        modal.append=function(title,bodyMain,saveID){
            this.bodyMain=bodyMain;
            var modalID=$(this.jq).data('target').split("#")[1];

            if(zudp.util.isNumber(this.modalSize)){
                $('#'+modalID).removeClass();
            }else{
                var $modalObj=$(modalHtml(modalID,title,bodyMain,saveID));
                $('body').append($modalObj);
                switch (this.modalSize){
                    case 'sm':
                        $('#'+modalID).find('.modal-dialog').addClass('modal-sm');
                        break;
                    case 'lg':
                        $('#'+modalID).find('.modal-dialog').addClass('modal-lg');
                        break;
                    default:

                }
            }
            return this;
        }
        return modal;
    }
    return Modal;
})();
zudp.plugin.tableData=(function () {
    function Table(jq){
        var table={};
        if (typeof jq === 'string') {
            table.jq = zudp.util.getJquery(jq);
        } else {
            throw "zudp.plugin.table() 参数必须为字符串: " + jq;
        }
        table.getRow=function(){
            var rowId = [];
            var select = this.jq.selector;
            $(document).on('click', select + ' tbody tr', function () {
                $(this).toggleClass('evenSelect');
                if ($(this).hasClass('evenSelect')) {
                    rowId.push($(this).find('button').attr('value'));
                    console.log(rowId)
                } else {
                    rowId.splice(rowId.indexOf($(this).find('button').attr('value')), 1);
                    console.log(rowId)
                }
            });
            return rowId;
        };
        return table;
    }
    return Table
})();
zudp.plugin.clearFormData=(function(){
    var _this = zudp;
    return function(btnCls,emtInput){
        if (typeof btnCls === 'string' && typeof emtInput === 'string') {
            $(document).on('click', btnCls, function () {
                var select = $(emtInput).find("select"),
                    input = $(emtInput).find("input");
                $.each(select,function(index , obj){
                    $(obj).find("option:eq(0)").prop("selected","true")
                });
                input.val('');
            });
            return _this;
        } else {
            throw "zudp.plugin.clearFormData() 参数必须为字符串" ;
        }
    }
})();
zudp.plugin.import = (function() {
    return function(urls) {
        var defaults = ["hplus","menuTab","zudp"]; //默认导入
        var defaultsUrl = "js/third/";   //默认路径
        var opt = [];
        if (urls == "" || urls == null) {
            opt = defaults
        } else {
            if (typeof urls != "object") {
                urls = new Array([urls])
            }
            opt = defaults.concat(urls)
        }
        for (var i = 0; i < opt.length; i++) {
            var el = opt[i].indexOf(".min.js") < 0 ? defaultsUrl + opt[i] + ".min.js" : defaultsUrl + opt[i];
            var myScript = $("<script type='text/javascript' src='" + el + "'></script>");
            $("body").append(myScript);
        }
    }
})();
zudp.component.initCURD = (function () {
    function Init(obj) {
        if (!zudp.util.isObj(obj)) {
            throw 'initCURD 参数应为对象';
        };
        var init = {};
        if(obj.success=='' || obj.success == undefined)obj.success='数据{msg}';
        if(obj.error=='' || obj.success == undefined)obj.error='数据{msg}';
        if(obj.hideInputName.length == 0 || obj.hideInputName == undefined)obj.hideInputName=['null'];
        if(obj.disabledName.length == 0 || obj.disabledName == undefined)obj.disabledName=['null'];
        if(obj.callback ==  undefined)obj.callback={};
        if(obj.callback.create == undefined)obj.callback.create=function(){};
        if(obj.callback.update == undefined)obj.callback.update=function(){};
        if(obj.callback.delete == undefined)obj.callback.delete=function(){};
        if(obj.callback.deleteMore == undefined)obj.callback.deleteMore=function(){};
        if(obj.callback.search == undefined)obj.callback.search=function(){};
        if(obj.callback.detail == undefined)obj.callback.detail=function(){};
        if(!zudp.util.isFunction(obj.callback.create))throw "create回调必须为方法";
        if(!zudp.util.isFunction(obj.callback.update))throw "update回调必须为方法";
        if(!zudp.util.isFunction(obj.callback.delete))throw "delete回调必须为方法";
        if(!zudp.util.isFunction(obj.callback.deleteMore))throw "deleteMore回调必须为方法";
        if(!zudp.util.isFunction(obj.callback.search))throw "search回调必须为方法";
        if(!zudp.util.isFunction(obj.callback.detail))throw "detail回调必须为方法";
        var dataTable =
            zudp.plugin
                .table(obj.table.id)
                .url(obj.url)
                .search(obj.table.search)
                .columns(obj.table.columns)
                .then();

        init.create = function () {
            //弹窗
            $(document).on("click", "#add-btn", function () {
                $(".modal-form").modal("show");
                $(".modal-form").addClass("create-form").removeClass("edit-form detail-form");
                zudp.plugin.form(obj.formId).reset();
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
                if ($(obj.formId).valid()) {
                    var data = zudp.util.formData2json("form");
                    zudp.ajax(obj.url).post(data).then(function () {
                        zudp.plugin.dialog("success").alert("新建" + msgSuccess + "！", "提示");
                        dataTable.ajax.reload();
                        $(".modal-form").modal("hide");
                    });
                    obj.callback.create(data);
                }
            });
            return this;
        };
        init.update = function () {
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
                updateUrl = obj.url + '/' + $(this).val();
                //修改标题
                var titleText = zudp.util.render(obj.title, {"type": "编辑"});
                $(".modal .modal-title").text(titleText);
                //设置隐藏组件
                for (var i = 0; i < obj.hideInputName.length; i++) {
                    $(".modal form").find("*[name=" + obj.hideInputName[i] + "]").parents('.form-group').css("display", 'none');
                }

                //取值回显
                zudp.ajax(updateUrl).get("").then(function (data) {
                    dataEcho(obj.formId, data);
                }, function (error) {
                });
                //设置禁用
                for (var i = 0; i < obj.disabledName.length; i++) {
                    $(".modal form").find("*[name=" + obj.disabledName[i] + "]")
                        .attr("disabled", true);
                }

            });
            //校验保存
            var msgSuccess = zudp.util.render(obj.success, {"msg": "成功"});
            $(document).on("click", ".edit-form #save-btn", function () {
                if ($(obj.formId).valid()) {
                    var data = zudp.util.formData2json("form");
                    zudp.ajax(updateUrl).put(data).then(function () {
                        zudp.plugin.dialog("success").alert("更新" + msgSuccess + "！", "提示");
                        dataTable.ajax.reload();
                        $(".modal-form").modal("hide");
                    });
                    obj.callback.update(data);
                }
            });
            return this;
        };
        init.detail = function () {
            $(document).on("click", '.row-detail', function (e) {
                //清除冒泡
                if (e && e.stopPropagation) {
                    e.stopPropagation();
                } else {
                    window.e.cancelBubble = true;
                }

                $(".modal-form").modal("show");
                $(".modal-form").addClass("detail-form").removeClass("create-form edit-form");

                var detailData = dataTable.row($(this).parents('tr')).data();
                dataEcho(obj.formId,detailData);
                obj.callback.detail(detailData);
            });
            return this
        };
        init.delete = function () {
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
            return this;
        };
        init.deleteMore = function () {
            $(document).on("click", "#deleteItems", function () {
                var data = dataTable.rows('.evenSelect').data();
                var ids = [];
                for (var k = 0; k < data.length; k++) {
                    ids.push(data[k].id);
                }
                if (ids.length == 0) {
                    zudp.plugin.dialog().confirm("数据未选中", "关闭")
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

            return this;
        };
        init.research = function () {
            var searchDom=''
            var searchInput=''
            if (obj.search.length == 3) {
                searchDom=obj.search[1];
                searchInput=obj.search[2];
                zudp.plugin.clearFormData(obj.search[0], obj.search[1]);
            }
            $(document).on("click", ".research-btn", function () {
                dataTable.ajax.reload();
                $(searchDom).slideUp(300);
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
            obj.callback.search(rowData);
            return this;
        };
        init.detail();
        init.create();
        init.update();
        init.deleteMore();
        init.delete();
        init.research();
        return dataTable;
    }

    return Init;
})();
zudp.global = {
    version: "1.0.0",
    name: "zudp",
    profile: "dev", // 生产环境设置为 product
    status: {
        dev: "dev",
        product: "product"
    },
    msg: {
    }
};


function zeroToSpace(str){
    if(str =='0'){
        return "";
    }else{
        return str;
    }
}