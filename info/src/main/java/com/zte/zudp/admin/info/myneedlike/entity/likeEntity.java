package com.zte.zudp.admin.info.myneedlike.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import com.zte.zudp.admin.common.persistence.entity.FileEntity;

import java.io.Serializable;
import java.util.Date;

/**
 * 点赞详情实体类
 * @author lc
 * @version 1.0.0
 * @serial on 2019-12-05
 */
public class likeEntity extends FileEntity {


    //序列化
    private static final long serialVersionUID = -8676756371957704647L;
    //标题
    private String title; //标题
    private String content; //内容
    private String picture;  //图片
    private String video; //视频
    private String publishStatus; //发布状态
    private Date validTime; //有效时间
    private long likeNum; //点赞数
    private String validStartTime; //有效开始时间
    private String validStopTime; //有效结束时间

    public void setValidStartTime(String validStartTime) {
        this.validStartTime = validStartTime;
    }

    public void setValidStopTime(String validStopTime) {
        this.validStopTime = validStopTime;
    }

    public String getValidStartTime() {
        return validStartTime;
    }

    public String getValidStopTime() {
        return validStopTime;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public void setPublishStatus(String publishStatus) {
        this.publishStatus = publishStatus;
    }

    public void setValidTime(Date validTime) {
        this.validTime = validTime;
    }

    public void setLikeNum(long likeNum) {
        this.likeNum = likeNum;
    }



    public static long getSerialVersionUID() {

        return serialVersionUID;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getPicture() {
        return picture;
    }

    public String getVideo() {
        return video;
    }

    public String getPublishStatus() {
        return publishStatus;
    }

    public Date getValidTime() {
        return validTime;
    }

    public long getLikeNum() {
        return likeNum;
    }


}
