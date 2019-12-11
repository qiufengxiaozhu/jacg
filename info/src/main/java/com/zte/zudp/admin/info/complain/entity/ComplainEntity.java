package com.zte.zudp.admin.info.complain.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import com.zte.zudp.admin.common.persistence.entity.FileEntity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Description 投诉表，具体内容，但是（音频、视频），（定位）有专门的实体类
 * @Author TotalEntity
 * @Date 2019/11/26 10:09
 **/
public class ComplainEntity extends FileEntity {

    /**
     * title ：标题
     */
    private String title;

    /**
     * description : 投诉/建议 文本内容描述
     */
    private String description;

    /**
     * picture : 投诉/建议 图片描述（存全路径吗？）
     */
    private String picture;

    /**
     * audio : 投诉/建议 音频描述
     */
    private String audio;

    /**
     * video ： 投诉/建议 视频描述
     */
    private String video;

    /**
     * type ： 类型， 0 ---> 投诉， 1 ---> 建议
     */
    private String type;

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
     * complain_date : 投诉/建议 时间
     */
    private String complainDate;

    /**
     * reply_status : 回复状态 0 ---> 未回复， 1 ---> 已回复
     */
    private String replyStatus;

    /**
     * reply_content : 回复内容
     */
    private String replyContent;

    /**
     * reply_date : 回复时间
     */
    private String replyDate;

    /**
     * reply_user : 回复人信息 id
     */
    private String replyUser;

    /**
     * longitude ： 地图坐标经度
     */
    private String longitude;

    /**
     * latitude ： 地图地址维度
     */
    private String latitude;

    /**
     * 一下是 dto 字段，不对应complain 表中的数据
     * 用于做时间范围查询
     * startTime ： 开始时间
     */
    private String startTime;

    /**
     * endTime ： 结束插件
     */
    private String endTime;


    /**
     * address ： 详细地址，xxx市/xxx县/xxx街道
     */
    private String address;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
        if (complainDate != null && !complainDate.equals("")) {
            try {
                Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(complainDate);
                complainDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return complainDate;
    }

    public void setComplainDate(String complainDate) {
        this.complainDate = complainDate;
    }

    public String getReplyStatus() {
        if (this.replyStatus != null) {
            switch (this.replyStatus) {
                case "0":
                    this.replyStatus = "未回复";
                    break;
                case "1":
                    this.replyStatus = "已回复";
                    break;
                case "未回复":
                    this.replyStatus = "1";
                    break;
                case "已回复":
                    this.replyStatus = "1";
                    break;
            }
        }
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
        if (this.replyDate == null || this.replyDate.equals(""))
            this.replyDate = "您还未回复";
        else
            try {
                Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(replyDate);
                replyDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }

        return replyDate;
    }

    public void setReplyDate(String replyDate) {
        this.replyDate = replyDate;
    }

    public String getReplyUser() {
        return replyUser;
    }

    public void setReplyUser(String replyUser) {
        this.replyUser = replyUser;
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

    @Override
    public String toString() {
        return "Complain{" +
                "title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", picture='" + picture + '\'' +
                ", audio='" + audio + '\'' +
                ", video='" + video + '\'' +
                ", type='" + type + '\'' +
                ", contact='" + contact + '\'' +
                ", phone='" + phone + '\'' +
                ", contactUser='" + contactUser + '\'' +
                ", complainDate=" + complainDate +
                ", replyStatus='" + replyStatus + '\'' +
                ", replyContent='" + replyContent + '\'' +
                ", replyDate=" + replyDate +
                ", replyUser='" + replyUser + '\'' +
                ", longitude='" + longitude + '\'' +
                ", latitude='" + latitude + '\'' +
                ", address='" + address + '\'' +
                ", address='" + startTime + '\'' +
                ", address='" + endTime + '\'' +
                '}';
    }
}
