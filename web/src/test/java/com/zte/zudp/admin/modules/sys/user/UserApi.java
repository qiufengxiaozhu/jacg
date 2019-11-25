package com.zte.zudp.admin.modules.sys.user;

/**
 * @author zzw
 * @version 1.0.0
 * @since on 2018/3/12.
 */
public class UserApi {

    /**
     * @apiDefine user
     * @apiSuccess (HTTP 200 OK) {Array}  data 菜单树数据
     * @apiSuccess (HTTP 200 OK) {String} data.id 用户id
     * @apiSuccess (HTTP 200 OK) {String} data.loginName 登录名
     * @apiSuccess (HTTP 200 OK) {String} data.lastAccessHost 最后登陆的ip
     * @apiSuccess (HTTP 200 OK) {String} data.name 名称
     * @apiSuccess (HTTP 200 OK) {Number} data.age 年龄
     * @apiSuccess (HTTP 200 OK) {Number}   data.birthday 生日
     * @apiSuccess (HTTP 200 OK) {String} data.phone 电话
     * @apiSuccess (HTTP 200 OK) {String} data.email 邮箱
     * @apiSuccess (HTTP 200 OK) {String} data.avatar 头像地址
     * @apiSuccess (HTTP 200 OK) {Number} data.status 状态 1 激活状态， 0 未激活状态，-1 禁用状态
     * @apiSuccess (HTTP 200 OK) {Group} data.group 所属组织
     * @apiSuccess (HTTP 200 OK) {Number} data.group.id 组织的id
     * @apiSuccess (HTTP 200 OK) {String} data.group.name 组织的名称
     * @apiSuccess (HTTP 200 OK) {Boolean} data.rememberMe 记住我 true是false否
     */
    public void apidocForResult() {
    }

    /**
     * @api {Delete} /api/user/{id} 删除单个用户
     * @apiGroup User
     * @apiVersion 1.0.0
     * @apiDescription 删除单个用户
     * @apiParamExample {String} 请求样例：
     * http://localhost:8080/api/user/1
     * @apiSuccessExample {json} 返回样例:
     * {"success":true,"msg":null,"code":0,"data":null}
     * @apiUse returnResult
     */
    public void delete() {

    }

    /**
     * @api {Delete} /api/user 删除多个用户
     * @apiGroup User
     * @apiVersion 1.0.0
     * @apiDescription 删除多个用户
     * @apiParam {String[]} ids 用户的id数组
     * @apiParamExample {String} 请求样例：
     * http://localhost:8080/api/user
     * @apiSuccessExample {json} 返回样例:
     * {"success":true,"msg":null,"code":0,"data":null}
     * @apiUse returnResult
     */
    public void deleteInBatch() {

    }

}
