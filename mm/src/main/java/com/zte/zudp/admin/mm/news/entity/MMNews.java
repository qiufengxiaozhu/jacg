package com.zte.zudp.admin.mm.news.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import com.zte.zudp.admin.common.persistence.entity.FileEntity;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 新闻实体类
 */
public class MMNews extends FileEntity {

    /**

     * 封面路径
     */
    private String path;

    /**
     * 查询时起始时间
     */
    private String  startTime;

    /**
     * 查询时终止时间
     */
    private String endTime;

    /**

     * 新闻标题
     */
    private String title;

    /**
     * 新闻正文
     */
    private String content;

    /**
     * //内容 去格式
     */
    private String contentnohtml;

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
    private String newsDate;

    /**
     * 点击量
     */
    private int clicks;

    /**
     * 新闻类别id
     */
    private String fk_categoryid;

    /**
     * 新闻类别
     */
    private String category;

    /**
     * 新闻摘要
     */
    private String summary;

//    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
//    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    public String getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(String newsDate) {
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "MMNews{" +
                "path='" + path + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", contentnohtml='" + contentnohtml + '\'' +
                ", video='" + video + '\'' +
                ", status='" + status + '\'' +
                ", timeZone='" + timeZone + '\'' +
                ", newsDate='" + newsDate + '\'' +
                ", clicks=" + clicks +
                ", fk_categoryid='" + fk_categoryid + '\'' +
                ", category='" + category + '\'' +
                ", summary='" + summary + '\'' +
                '}';
    }

}
