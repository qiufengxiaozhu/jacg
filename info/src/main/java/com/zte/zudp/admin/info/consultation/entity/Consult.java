package com.zte.zudp.admin.info.consultation.entity;


import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import com.zte.zudp.admin.info.attachDoc.entity.AttachDoc;

import java.util.List;

/**
 * 咨询信息实体类
 */
public class Consult extends DataEntity {

    private String name;//联系人姓名
    private String telephone;//联系人电话
    private String title;//标题
    private String content;//咨询内容
    private String consultId;//咨询人信息
    private String replyUnitId;//咨询单位信息
    private String consultDate;//咨询时间
    private String reply;//回复内容
    private String replyId;//回复人信息
    private String replyDate;//回复时间
    private String startDate;//咨询时间筛选(起)
    private String endDate;//咨询时间筛选(止)

    private List<AttachDoc> attachDocList;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getConsultId() {
        return consultId;
    }

    public void setConsultId(String consultId) {
        this.consultId = consultId;
    }

    public String getReplyUnitId() {
        return replyUnitId;
    }

    public void setReplyUnitId(String replyUnitId) {
        this.replyUnitId = replyUnitId;
    }

    public String getConsultDate() {
        return consultDate;
    }

    public void setConsultDate(String consultDate) {
        this.consultDate = consultDate;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public String getReplyId() {
        return replyId;
    }

    public void setReplyId(String replyId) {
        this.replyId = replyId;
    }

    public String getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(String replyDate) {
        this.replyDate = replyDate;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public List<AttachDoc> getAttachDocList() {
        return attachDocList;
    }

    public void setAttachDocList(List<AttachDoc> attachDocList) {
        this.attachDocList = attachDocList;
    }
}
