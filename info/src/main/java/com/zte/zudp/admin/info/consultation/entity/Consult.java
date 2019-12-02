package com.zte.zudp.admin.info.consultation.entity;


import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 咨询信息实体类
 */
public class Consult extends DataEntity {

    private String name;//咨询人姓名
    private String telephone;//咨询人电话
    private String picture;//咨询附带图片地址
    private String video;//咨询附带视频地址
    private String voice;//咨询附带语音地址
    private String content;//咨询内容
    private long categoryId;//种类关联
    private String reply;//回复内容
    private long state;
    private ConsultCategory category;

    public ConsultCategory getCategory() {
        return category;
    }

    public void setCategory(ConsultCategory category) {
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

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getVoice() {
        return voice;
    }

    public void setVoice(String voice) {
        this.voice = voice;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public long getState() {
        return state;
    }

    public void setState(long state) {
        this.state = state;
    }
}
