package com.zte.zudp.admin.info.comment.entity;

import com.zte.zudp.admin.common.persistence.entity.FileEntity;

/**
 *
 * 市民评论实体类
 *
 * @Description ${}
 * @Author MMComment
 * @Date 2019/12/19 11:40
 **/
public class Comment extends FileEntity {

    /**
     *  市民评论正文
     *
     */
    private String content;

    /**
     * 市民评论姓名/昵称
     */
    private String name;

    /**
     * 市民评论人手机号
     */
    private String phone;

    /**
     * 该评论得到的点赞数
     */
    private String clicks;

    /**
     * 该评论发表时间
     */
    private String publicTime;

    /**
     * 问题上报表主键id
     */
    private String fk_issuereportId;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getClicks() {
        return clicks;
    }

    public void setClicks(String clicks) {
        this.clicks = clicks;
    }

    public String getPublicTime() {
        return publicTime;
    }

    public void setPublicTime(String publicTime) {
        this.publicTime = publicTime;
    }

    public String getFk_issuereportId() {
        return fk_issuereportId;
    }

    public void setFk_issuereportId(String fk_issuereportId) {
        this.fk_issuereportId = fk_issuereportId;
    }

    @Override
    public String toString() {
        return "MMComment{" +
                "content='" + content + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", clicks='" + clicks + '\'' +
                ", publicTime='" + publicTime + '\'' +
                ", fk_issuereportId='" + fk_issuereportId + '\'' +
                '}';
    }
}
