package com.zte.zudp.admin.modules.demo.person.controller;

/**
 * @author DW
 * @version 1.0.0
 * @since 2018/3/20 9:23
 */
public class PersonController {


    /**
     * @api {GET} /api/person/{id} 查询某一个person数据
     * @apiGroup Demo-person
     * @apiVersion 1.0.0
     * @apiDescription 根据id查询某一个person数据
     * @apiParam {String} id person数据的id
     * @apiUse returnResult
     * @apiSuccess (HTTP 200 OK) {Boolean} data person数据
     * @apiParamExample {json} 请求样例：
     *                  http://localhost:8080/api/person/1231
     * @apiSuccessExample {json} 返回样例:
     *               {"success":true,"msg":null,"code":0,"data":{"id":"1231","name":"zhangsan","age":20,"gender":1,"addr":"江西南昌","work":"java开发"}}
     */
    public void get() {}

    /**
     * @api {POST} /api/person/ 添加一个person数据
     * @apiGroup Person
     * @apiVersion 1.0.0
     * @apiDescription 添加一个Person数据
     * @apiParam {Object} Person Person实体类
     * @apiParam {String} Person.name Person的name
     * @apiParam {String} Person.addr Person的地址
     * @apiParam {String} Person.age Person的age
     * @apiParam {String} Person.gender Person的性别
     * @apiParam {String} Person.work Person的工作
     * @apiUse returnResult
     * @apiSuccess (HTTP 200 OK) {Boolean} data 字典数据
     * @apiParamExample {json} 请求样例：
     *                  http://localhost:8080/api/preson/
     *                  {"name":"cjx","addr":"jxnu","age":25,"work":"web前端","gender":1}
     * @apiSuccessExample {json} 返回样例:
     *               {"success": true,"msg": null,"code": 0,"data": {"id": "180320094131507036","name": "cjx","age": 25,"gender": 1,"addr": "jxnu","work": "web前端"}}
     */
    public void create() {}

    /**
     * @api {PUT} /api/person/{id} 修改一个Person数据
     * @apiGroup Person
     * @apiVersion 1.0.0
     * @apiDescription 修改一个Person数据
     * @apiParam {String} id Person数据 id
     * @apiParam {Object} Person Person实体类
     * @apiParam {String} Person.name Person的name
     * @apiParam {String} Person.gender Person的gender
     * @apiParam {String} Person.age Person的age
     * @apiParam {String} Person.work Person的work
     * @apiParam {String} Person.addr Person的addr
     * @apiUse returnResult
     * @apiSuccess (HTTP 200 OK) {Boolean} data 字典数据
     * @apiParamExample {json} 请求样例：
     *                  http://localhost:8080/api/person/180320094131507036
     *                  {"name":"ceshiceshi","addr":"jxnu","age":25,"work":"web前端","gender":1}
     * @apiSuccessExample {json} 返回样例:
     *               {"success": true,"msg": null,"code": 0,"data": {"id": "180320094131507036","name": "ceshiceshi","age": 25,"gender": 1,"addr": "jxnu","work": "web前端"}}
     */
    public void update() {}

    /**
     * @api {DELETE} /api/person/{id} 删除一个Person数据
     * @apiGroup Person
     * @apiVersion 1.0.0
     * @apiDescription 删除一个Person数据
     * @apiParam {String} id Person的id
     * @apiUse returnResult
     * @apiParamExample {json} 请求样例：
     *                  http://localhost:8080/api/person/180320094131507036
     * @apiSuccessExample {json} 返回样例:
     *               {"success":true,"msg":null,"code":0,"data":null}
     */
    public void delete() {}

    /**
     * @api {DELETE} /api/person/ 批量删除Person数据
     * @apiGroup Person
     * @apiVersion 1.0.0
     * @apiDescription 批量删除Person数据
     * @apiParam {Array} ids 数据字典的id
     * @apiUse returnResult
     * @apiParamExample {json} 请求样例：
     *                  http://localhost:8080/api/person
     *                  {["1231",180320094131507036]}
     * @apiSuccessExample {json} 返回样例:
     *               {"success":true,"msg":null,"code":0,"data":null}
     */
    public void batchDelete() {}

    /**
     * @api {GET} /api/person/ 根据条件获取数据
     * @apiGroup Person
     * @apiVersion 1.0.0
     * @apiDescription 根据条件获取数据
     * @apiUse returnPageResult
     * @apiParamExample {json} 请求样例：
     *                  http://localhost:8080/api/person
     * @apiSuccessExample {json} 返回样例:
     *   {"success":true,"msg":null,"code":0,"data":{"current":1,"size":15,"lastPage":1,"result":[{"id":"1231","name":"zhangsan","age":20,"gender":1,"addr":"江西南昌","work":"java开发"},{"id":"180320094131507036","name":"ceshiceshi","age":25,"gender":1,"addr":"jxnu","work":"web前端"}],"total":2}}
     */
    public void findList() {}
}
