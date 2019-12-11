package com.zte.zudp.admin.info.news.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import com.zte.zudp.admin.common.persistence.entity.FileEntity;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 新闻实体类
 */
public class News extends FileEntity {



    private String  startTime;
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

    /**

     * 新闻标题
     */
    private String title;

    /**
     * 新闻正文
     */
    private String content;

    private String contentnohtml;//内容 去格式

    /**
     * 视频
     */
    private String video;

    /**
     * 新闻（发布）状态
     */
    private String status;

    /**
     * 新闻时区
     */
    private String timeZone;

    /**
     * 创建时间
     */
    private Date newsDate;

    /**
     * 点击量
     */
    private int clicks;

    /**
     * 新闻类别id
     */
    private String fk_categoryid;

    /**
     * 新闻摘要
     */
    private String summary;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public Date getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(Date newsDate) {
        this.newsDate = newsDate;
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

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFk_categoryid() {
        return fk_categoryid;
    }

    public void setFk_categoryid(String fk_categoryid) {
        this.fk_categoryid = fk_categoryid;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public int getClicks() {
        return clicks;
    }

    public void setClicks(int clicks) {
        this.clicks = clicks;
    }

    public String getContentnohtml() {
        return contentnohtml;
    }

    public void setContentnohtml(String contentnohtml) {
        this.contentnohtml = contentnohtml;
    }

    public String getTimeZone() {
        return timeZone;
    }

    public void setTimeZone(String timeZone) {
        this.timeZone = timeZone;
    }
}
