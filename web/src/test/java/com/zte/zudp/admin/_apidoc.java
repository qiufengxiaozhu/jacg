package com.zte.zudp.admin;

/**
 * 存放 apidoc 定义的宏
 */
public class _apidoc {

    /**
     * @apiDefine returnResult
     * @apiSuccess (HTTP 200 OK) {Boolean} success 请求是否发送成功
     * @apiSuccess (HTTP 200 OK) {String} msg 请求的状态信息，成功则返回 null
     * @apiSuccess (HTTP 200 OK) {Number} code 请求的错误码，为 0 表示正常
     */
    public void apidocForResult() {
    }


    /**
     * @apiDefine returnPageResult
     * @apiParam {Number} page_no 当前页数
     * @apiParam {Number} page_size 每页数据大小
     * @apiSuccess (HTTP 200 OK) {Boolean} success 请求是否发送成功
     * @apiSuccess (HTTP 200 OK) {String} msg 请求的状态信息，成功则返回 null
     * @apiSuccess (HTTP 200 OK) {Number} code 请求的错误码，为 0 表示正常
     * @apiSuccess (HTTP 200 OK) {Object} data 数据
     * @apiSuccess (HTTP 200 OK) {Number} data.current 分页当前页
     * @apiSuccess (HTTP 200 OK) {Number} data.size 分页的 size
     * @apiSuccess (HTTP 200 OK) {Number} data.lastPage 最后一页
     * @apiSuccess (HTTP 200 OK) {Number} data.total 总记录数
     * @apiSuccess (HTTP 200 OK) {Array} data.result 结果集
     */
    public void apidocForPageResult() {

    }
}