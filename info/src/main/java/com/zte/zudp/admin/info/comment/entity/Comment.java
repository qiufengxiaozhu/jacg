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
     * 问题上报表主键id，评论表外键
     */
    private String fk_issuereportId;

    /**
     * 问题上报表主键id
     */
    private String replyId;
    /**
     * 问题上报标题
     */
    private String title;

    /**
     * 问题上报类型
     */
    private String issueQuestionType;

    /**
     * 问题上报时间
     */
    private String complainDate;

    /**
     * 问题答复时间
     */
    private String replyDate;

    /**
     * 问题答复状态
     */
    private String replyStatus;

    /**
     * 评论状态
     */
    private String commentType;

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

    public String getCommentType() {
        return commentType;
    }

    public void setCommentType(String commentType) {
        this.commentType = commentType;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIssueQuestionType() {
        return issueQuestionType;
    }

    public void setIssueQuestionType(String issueQuestionType) {
        this.issueQuestionType = issueQuestionType;
    }

    public String getComplainDate() {
        return complainDate;
    }

    public void setComplainDate(String complainDate) {
        this.complainDate = complainDate;
    }

    public String getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(String replyDate) {
        this.replyDate = replyDate;
    }

    public String getReplyStatus() {
        return replyStatus;
    }

    public void setReplyStatus(String replyStatus) {
        this.replyStatus = replyStatus;
    }

    public String getReplyId() {
        return replyId;
    }

    public void setReplyId(String replyId) {
        this.replyId = replyId;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "content='" + content + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", clicks='" + clicks + '\'' +
                ", publicTime='" + publicTime + '\'' +
                ", fk_issuereportId='" + fk_issuereportId + '\'' +
                ", replyId='" + replyId + '\'' +
                ", title='" + title + '\'' +
                ", issueQuestionType='" + issueQuestionType + '\'' +
                ", complainDate='" + complainDate + '\'' +
                ", replyDate='" + replyDate + '\'' +
                ", replyStatus='" + replyStatus + '\'' +
                ", commentType='" + commentType + '\'' +
                '}';
    }
}
