package com.zte.zudp.admin.info.weixinQueinvest.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class WXQueinvest extends DataEntity{
    public String getQueinvestType() {
        return queinvestType;
    }

    public void setQueinvestType(String queinvestType) {
        this.queinvestType = queinvestType;
    }

    /**
     * 问卷类型
     */
    private String  queinvestType;
    /**
     * 标题
     */
    private String title;
    /**
     * 描述
     */
    private String description;

    private String valid;

    private String status;

    private Date pubdate;

    private String startTime;
    private String endTime;

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    //    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
//    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
