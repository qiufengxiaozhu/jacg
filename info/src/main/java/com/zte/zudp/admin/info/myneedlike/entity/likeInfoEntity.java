package com.zte.zudp.admin.info.myneedlike.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 我要点赞详情实体类
 * @author lc
 * @version 1.0.0
 * @serial on 2019-12-07
 */
public class likeInfoEntity extends DataEntity {
    private static final long serialVersionUID = -4257876374635134765L;
    //标题
    private String icon; //图标 拇指 鲜花
    private String comment; // 评论
    private String likePID;  //点赞人ID
    private String likeContentId; //点赞内容ID
    private String likeTime; //点赞时间
    private long likeCNum;// 评论点赞数
    private String likePhone;//点赞人手机号

    public String getLikePhone() {
        return likePhone;
    }

    public void setLikePhone(String likePhone) {
        this.likePhone = likePhone;
    }

    public void setLikeCNum(long likeCNum) {
        this.likeCNum = likeCNum;
    }

    public long getLikeCNum() {
        return likeCNum;
    }

    public String getIcon() {
        return icon;
    }

    public String getComment() {
        return comment;
    }

    public String getLikePID() {
        return likePID;
    }

    public String getLikeContentId() {
        return likeContentId;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setLikePID(String likePID) {
        this.likePID = likePID;
    }

    public void setLikeContentId(String likeContentId) {
        this.likeContentId = likeContentId;
    }

    public String getLikeTime() {
        return likeTime;
    }

    public void setLikeTime(String likeTime) {
        this.likeTime = likeTime;
    }
}
