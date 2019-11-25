package com.zte.zudp.admin.modules.sys.dict;

/**
 * Dict类, apiDoc补充接口
 * @author DW
 * @version 1.0.0
 * @since 2018/3/13 8:20
 */
public class DictApiController {

    /**
     * @api {GET} /api/dict/{id} 查询一个字典数据
     * @apiGroup Dict
     * @apiVersion 1.0.0
     * @apiDescription 查询一个字典数据
     * @apiParam {String} id 数据字典的id
     * @apiUse returnResult
     * @apiSuccess (HTTP 200 OK) {Boolean} data 字典数据
     * @apiParamExample {json} 请求样例：
     *                  http://localhost:8080/api/dict/180302135317018000
     * @apiSuccessExample {json} 返回样例:
     *               {"success":true,"msg":null,"code":0,"data":{"id":"180302135317018000","type":"yes_no","label":"否","status":0,"value":"no","mark":"是否字典 否","weight":2}}
     */
    public void get() {}

    /**
     * @api {POST} /api/dict/ 添加一个字典数据
     * @apiGroup Dict
     * @apiVersion 1.0.0
     * @apiDescription 添加一个字典数据
     * @apiParam {Object} dict 字典实体类
     * @apiParam {String} dict.type 字典类型
     * @apiParam {String} dict.label 字典标签
     * @apiParam {String} dict.value 字典属性值
     * @apiParam {String} dict.mark 字典备注(可选)
     * @apiParam {String} dict.weight 字典权重排序
     * @apiUse returnResult
     * @apiSuccess (HTTP 200 OK) {Boolean} data 字典数据
     * @apiParamExample {json} 请求样例：
     *                  http://localhost:8080/api/dict/
     *                  {id: "", type: "abc", label: "aaa", value: "aaa", mark: "", weight: "1"}
     * @apiSuccessExample {json} 返回样例:
     *               {"success":true,"msg":null,"code":0,"data":{"id":"180313083733409000","type":"abc","label":"aaa","status":null,"value":"aaa","mark":"","weight":1}}
     */
    public void create() {}

    /**
     * @api {PUT} /api/dict/{id} 修改一个字典数据
     * @apiGroup Dict
     * @apiVersion 1.0.0
     * @apiDescription 修改一个字典数据
     * @apiParam {String} id 字典数据 id
     * @apiParam {Object} dict 字典实体类
     * @apiParam {String} dict.type 字典类型
     * @apiParam {String} dict.label 字典标签
     * @apiParam {String} dict.value 字典属性值
     * @apiParam {String} dict.mark 字典备注(可选)
     * @apiParam {String} dict.weight 字典权重排序
     * @apiUse returnResult
     * @apiSuccess (HTTP 200 OK) {Boolean} data 字典数据
     * @apiParamExample {json} 请求样例：
     *                  http://localhost:8080/api/dict/180313083733409000
     *                  {id: "180313083733409000", type: "abc", label: "aaa1", value: "aaa", mark: "", weight: "1"}
     * @apiSuccessExample {json} 返回样例:
     *               {"success":true,"msg":null,"code":0,"data":{"id":"180313083733409000","type":"abc","label":"aaa1","status":null,"value":"aaa","mark":"","weight":1}}
     */
    public void update() {}

    /**
     * @api {DELETE} /api/dict/{id} 删除一个字典数据
     * @apiGroup Dict
     * @apiVersion 1.0.0
     * @apiDescription 删除一个字典数据
     * @apiParam {String} id 数据字典的id
     * @apiUse returnResult
     * @apiParamExample {json} 请求样例：
     *                  http://localhost:8080/api/dict/180313083733409000
     * @apiSuccessExample {json} 返回样例:
     *               {"success":true,"msg":null,"code":0,"data":null}
     */
    public void delete() {}

    /**
     * @api {DELETE} /api/dict/ 批量删除字典数据
     * @apiGroup Dict
     * @apiVersion 1.0.0
     * @apiDescription 批量删除字典数据
     * @apiParam {Array} ids 数据字典的id
     * @apiUse returnResult
     * @apiParamExample {json} 请求样例：
     *                  http://localhost:8080/api/dict
     *                  ["180309094832556000", "180309093027479374"]
     * @apiSuccessExample {json} 返回样例:
     *               {"success":true,"msg":null,"code":0,"data":null}
     */
    public void batchDelete() {}

    /**
     * @api {GET} /api/dict/ 根据条件获取数据
     * @apiGroup Dict
     * @apiVersion 1.0.0
     * @apiDescription 根据条件获取数据
     * @apiParam {Object} Dict 数据字典对象(可选)
     * @apiParam {Number} Dict.status 数据字典对象的类型 1为业务字典, 0位普通字典(可选)
     * @apiParam {String} Dict.type 数据字典类型(可选)
     * @apiParam {String} Dict.label 数据字典标签(可选)
     * @apiUse returnPageResult
     * @apiParamExample {json} 请求样例：
     *                  http://localhost:8080/api/dict?label=&type=login_first4
     *                  ["180309094832556000", "180309093027479374"]
     * @apiSuccessExample {json} 返回样例:
     *               {"success":true,"msg":null,"code":0,"data":{"current":1,"size":15,"lastPage":1,"result":[{"id":"180308173058760000","type":"login_first4","label":"登陆1","status":0,"value":"first","mark":"第一","weight":222}],"total":1}}
     */
    public void findList() {}
}
