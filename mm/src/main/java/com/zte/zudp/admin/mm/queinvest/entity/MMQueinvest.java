package com.zte.zudp.admin.mm.queinvest.entity;
import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 问卷实体类  移动端
 */
public class MMQueinvest extends DataEntity {

   private String questionId;
    private String queinvestId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /**
     * 答题人名称
     */

    private String name;
    /**
     * 答题时间(提交问卷的时间)
     */
    private String answerTime;

    public String getQueinvestId() {
        return queinvestId;
    }

    public void setQueinvestId(String queinvestId) {
        this.queinvestId = queinvestId;
    }

    private Integer rowNum;
    private String yearStr; //年
    private String dayStr; // 天
    private String pubdate; // 发布时间
    private String title; // 问卷名称

    private String choiceText01;// 选项一
    private String choiceText02;// 选项二
    private String choiceText03; // 选项三
    private String choiceText04; // 选项四

    private String contents; // 题目

    private String optContext;

    public String getOptContext() {
        return optContext;
    }

    public void setOptContext(String optContext) {
        this.optContext = optContext;
    }

    public String getQuestionId() {
        return questionId;
    }

    public void setQuestionId(String questionId) {
        this.questionId = questionId;
    }
    public Integer getRowNum() {
        return rowNum;
    }

    public void setRowNum(Integer rowNum) {
        this.rowNum = rowNum;
    }
    public String getChoiceText01() {
        return choiceText01;
    }

    public void setChoiceText01(String choiceText01) {
        this.choiceText01 = choiceText01;
    }

    public String getChoiceText02() {
        return choiceText02;
    }

    public void setChoiceText02(String choiceText02) {
        this.choiceText02 = choiceText02;
    }

    public String getChoiceText03() {
        return choiceText03;
    }

    public void setChoiceText03(String choiceText03) {
        this.choiceText03 = choiceText03;
    }

    public String getChoiceText04() {
        return choiceText04;
    }

    public void setChoiceText04(String choiceText04) {
        this.choiceText04 = choiceText04;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getPubdate() {
        return pubdate;
    }

    public void setPubdate(String pubdate) {
        this.pubdate = pubdate;
    }



    public String getYearStr() {
        return yearStr;
    }

    public void setYearStr(String yearStr) {
        this.yearStr = yearStr;
    }

    public String getDayStr() {
        return dayStr;
    }

    public void setDayStr(String dayStr) {
        this.dayStr = dayStr;
    }



    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    private String description;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAnswerTime() {
        return answerTime;
    }

    public void setAnswerTime(String answerTime) {
        this.answerTime = answerTime;
    }
}
