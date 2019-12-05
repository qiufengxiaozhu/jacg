package com.zte.zudp.admin.info.complain.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * @Description 投诉表，具体内容，但是（音频、视频），（定位）有专门的实体类
 * @Author TotalEntity
 * @Date 2019/11/26 10:09
 **/
public class ComplainEntity extends DataEntity {

    /**
     * department 部门名称
     */
    private String department;


    /**
     * topic 投诉/建议的大纲、总结
     */
    private String topic;
    
    /**
     * type 投诉/建议类型 0 投诉 1 建议
     */
    private int type;
    
    /**
     * username 投诉/建议人的姓名
     */
    private String username;

    /**
     * tel 投诉/建议人电话
     */
    private String tel;

    /**
     * comment 投诉/建议的具体文字内容
     */
    private String comment;

    /**
     * reply : 用户回复
     */
    private String reply;

    /**
     * replyStatus ： 回复状态，0 --> 未回复，1 --> 已回复
     */
    private String replyStatus;

    /**
     * total : 总积分数
     */
    private String total;

    public String getReplyStatus() {
        return replyStatus;
    }

    public void setReplyStatus(String replyStatus) {
        this.replyStatus = replyStatus;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }



    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "TotalEntity{" +
                "department='" + department + '\'' +
                ", topic='" + topic + '\'' +
                ", type=" + type +
                ", username='" + username + '\'' +
                ", tel='" + tel + '\'' +
                ", comment='" + comment + '\'' +
                ", reply='" + reply + '\'' +
                ", replyStatus='" + replyStatus + '\'' +
                ", total='" + total + '\'' +
                '}';
    }
}
