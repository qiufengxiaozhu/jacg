package com.zte.zudp.admin.info.dynamicpush.entity;


import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import com.zte.zudp.admin.common.persistence.entity.FileEntity;

import java.util.Date;

/**
 * 动态推送实体类
 */
public class DynamicPush extends DataEntity{


    /**
     * 推送标题
     */
    private String title;

    private String contents;

    private String status;

    private String pushTime;

    private String contentsText;

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

    public String getContentsText() {
        return contentsText;
    }

    public void setContentsText(String contentsText) {
        this.contentsText = contentsText;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPushTime() {
        return pushTime;
    }

    public void setPushTime(String pushTime) {
        this.pushTime = pushTime;
    }
}
