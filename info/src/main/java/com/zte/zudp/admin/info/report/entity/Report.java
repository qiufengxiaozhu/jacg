package com.zte.zudp.admin.info.report.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import com.zte.zudp.admin.common.persistence.entity.FileEntity;

import java.util.List;

/**
 * 公共上报实体类
 * @author
 */

public class Report extends FileEntity{
    private String title;//上报标题
    private String content;//上报内容
    private String category;//上报类型
    private String name;//联系人
    private String telephone;//联系电话
    private String reportId;//上报人信息
    private String reportDate;//上报时间
    private String replyStatus;//回复状态
    private String reply;//回复内容
    private String replyDate;//回复日期
    private String replyId;//回复人信息
    private String place;//地点

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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

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

    public String getReportId() {
        return reportId;
    }

    public void setReportId(String reportId) {
        this.reportId = reportId;
    }

    public String getReportDate() {
        return reportDate;
    }

    public void setReportDate(String reportDate) {
        this.reportDate = reportDate;
    }

    public String getReplyStatus() {
        return replyStatus;
    }

    public void setReplyStatus(String replyStatus) {
        this.replyStatus = replyStatus;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public String getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(String replyDate) {
        this.replyDate = replyDate;
    }

    public String getReplyId() {
        return replyId;
    }

    public void setReplyId(String replyId) {
        this.replyId = replyId;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

}
