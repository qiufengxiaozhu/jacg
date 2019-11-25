package com.zte.zudp.admin.modules.sys.role;

/**
 * @author zzw
 * @version 1.0.0
 * @since on 2018/3/12.
 */
public class RoleApi {


    /**
     * @api {get} /api/role 查询角色列表
     * @apiGroup Role
     * @apiVersion 1.0.0
     * @apiDescription 查询角色列表
     * @apiParam {String} name 角色名模糊查询(可选)
     * @apiParam {String} role 系统内部名准确查询(可选)
     * @apiSuccess (HTTP 200 OK) {String} data.result.name 角色名
     * @apiSuccess (HTTP 200 OK) {String} data.result.id id
     * @apiSuccess (HTTP 200 OK) {String} data.result.role 系统内部名
     * @apiSuccess (HTTP 200 OK) {String} data.result.description 描述
     * @apiSuccess (HTTP 200 OK) {String} data.result.actived 是否激活
     * @apiParamExample {String} 请求样例：
     *                  http://localhost:8080/api/role
     * @apiSuccessExample {json} 返回样例:
     *              {"success":true,"msg":null,"code":0,"data":{"current":1,"size":15,"lastPage":1,"result":[{"id":"180209164649447000","name":"撒旦","role":"21312","description":"213","actived":true,"permissions":null}],"total":2}}
     * @apiUse returnPageResult
     */
    public void index() {
    }

    /**
     * @api {get} /api/role/{id} 查询单个角色
     * @apiGroup Role
     * @apiVersion 1.0.0
     * @apiDescription 查询单个角色
     * @apiSuccess (HTTP 200 OK) {Object}  data 角色
     * @apiSuccess (HTTP 200 OK) {String} data.name 角色名
     * @apiSuccess (HTTP 200 OK) {String} data.id 角色id
     * @apiSuccess (HTTP 200 OK) {String} data.role 系统内部名
     * @apiSuccess (HTTP 200 OK) {String} data.description 描述
     * @apiSuccess (HTTP 200 OK) {String} data.actived 是否激活
     * @apiParamExample {String} 请求样例：
     *                  http://localhost:8080/api/role/180205094933497000
     * @apiSuccessExample {json} 返回样例:
     *               {"success":true,"msg":null,"code":0,"data":{"id":"180205094933497000","name":"管理员","role":"adminDIdi","description":"测试管理员","actived":true,"permissions":null}}
     * @apiUse returnResult
     */
    public void get() {

    }

    /**
     * @api {Delete} /api/role/{id} 删除单个角色
     * @apiGroup Role
     * @apiVersion 1.0.0
     * @apiDescription 删除单个角色
     * @apiParamExample {String} 请求样例：
     *                  http://localhost:8080/api/role/180205094933497000
     * @apiSuccessExample {json} 返回样例:
     *                {"success":true,"msg":null,"code":0,"data":null}
     * @apiUse returnResult
     */
    public void delete() {

    }

    /**
     * @api {Delete} /api/role 删除多个角色
     * @apiGroup Role
     * @apiVersion 1.0.0
     * @apiDescription 删除多个角色
     * @apiParam {String[]} ids 角色的id数组
     * @apiParamExample {String} 请求样例：
     *                  http://localhost:8080/api/role
     * @apiSuccessExample {json} 返回样例:
     *                {"success":true,"msg":null,"code":0,"data":null}
     * @apiUse returnResult
     */
    public void deleteInBatch() {

    }
}
