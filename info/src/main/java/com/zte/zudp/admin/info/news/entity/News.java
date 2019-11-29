package com.zte.zudp.admin.info.news.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 新闻实体类
 */
public class News extends DataEntity {

    /**
     * 新闻标题
     */
    private String title;

    private Date newsDate;
    /**
     * 新闻摘要
     */
    private String summary;
    /**
     * 新闻正文
     */
    private String content;
    /**
     * 新闻类别id
     */
    private String fk_categoryid;
    /**
     * 新闻状态
     */
    private String status;
    /**
     * 创建时间
     */
//    private Date create_date;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd")
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

    @Override
    public String toString() {
        return "News{" +
                "title='" + title + '\'' +
                ", summary='" + summary + '\'' +
                ", content='" + content + '\'' +
                ", fk_categoryid='" + fk_categoryid + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
