package com.zte.zudp.admin.info.dynamicpush.entity;


import com.zte.zudp.admin.common.persistence.entity.DataEntity;

import java.util.Date;

public class DynamicPush extends DataEntity {

    /**
     * 动态推送类型
     */
    private String pushType;

    /**
     * 推送标题
     */
    private String title;

    /**
     *推送的作者
     */
    private String author;

    /**
     * 推送发布时间
     */
    private Date pubdate;

    /**
     * 推送消息状态：0-临时状态；1-已发布状态；2-撤销发布状态
     */
    private Integer pushStatus;

    /**
     * 推送内容
     */
    private String content;

    public String getPushType() {
        return pushType;
    }

    public void setPushType(String pushType) {
        this.pushType = pushType;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    public Integer getPushStatus() {
        return pushStatus;
    }

    public void setPushStatus(Integer pushStatus) {
        this.pushStatus = pushStatus;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
