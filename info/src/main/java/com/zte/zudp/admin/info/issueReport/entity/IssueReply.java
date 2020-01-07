package com.zte.zudp.admin.info.issueReport.entity;

import com.zte.zudp.admin.common.persistence.entity.FileEntity;

public class IssueReply extends FileEntity {


    /**
     * title ：标题
     */
    private String title;

    /**
     * description : 文本内容描述
     */
    private String description;

    /**
     * picture :  图片描述（存全路径吗？）
     */
    private String picture;

    /**
     * audio :   音频描述
     */
    private String audio;

    /**
     * video ：  视频描述
     */
    private String video;

    /**
     * 问题类型  字典项
     */
    private String issueQuestionType;

    /**
     * contact ： 联系人
     */
    private String contact;

    /**
     * phone ： 联系人电话
     */
    private String phone;

    /**
     * contacts_user : 投诉/建议人 的账号信息，可能是某某id
     */
    private String contactUser;

    /**
     *   投诉时间
     */
    private String complainDate;

    /**
     *  回复状态 0 ---> 未回复， 1 ---> 已回复
     */
    private String replyStatus;

    /**
     *   回复内容
     */
    private String replyContent;

    /**
     *  回复时间
     */
    private String replyDate;

    /**
     *  回复人信息 id(用于查询回复人信息)
     */
    private String replyUserId;

    /**
     * longitude ： 地图坐标经度
     */
    private String longitude;

    /**
     * latitude ： 地图地址维度
     */
    private String latitude;

    /**
     * address ： 详细地址，xxx市/xxx县/xxx街道
     */
    private String address;

    /**
     * 日
     */
    private String dayStr;
    /**
     * 年月
     */
    private String yearStr;

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

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getAudio() {
        return audio;
    }

    public void setAudio(String audio) {
        this.audio = audio;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getIssueQuestionType() {
        return issueQuestionType;
    }

    public void setIssueQuestionType(String issueQuestionType) {
        this.issueQuestionType = issueQuestionType;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getContactUser() {
        return contactUser;
    }

    public void setContactUser(String contactUser) {
        this.contactUser = contactUser;
    }

    public String getComplainDate() {
        return complainDate;
    }

    public void setComplainDate(String complainDate) {
        this.complainDate = complainDate;
    }

    public String getReplyStatus() {
        return replyStatus;
    }

    public void setReplyStatus(String replyStatus) {
        this.replyStatus = replyStatus;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public String getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(String replyDate) {
        this.replyDate = replyDate;
    }

    public String getReplyUserId() {
        return replyUserId;
    }

    public void setReplyUserId(String replyUserId) {
        this.replyUserId = replyUserId;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDayStr() {
        return dayStr;
    }

    public void setDayStr(String dayStr) {
        this.dayStr = dayStr;
    }

    public String getYearStr() {
        return yearStr;
    }

    public void setYearStr(String yearStr) {
        this.yearStr = yearStr;
    }
}
