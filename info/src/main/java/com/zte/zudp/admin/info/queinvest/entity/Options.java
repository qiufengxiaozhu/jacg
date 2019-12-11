package com.zte.zudp.admin.info.queinvest.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 选项实体类
 */
public class Options extends DataEntity {

    private String idJson;

    public String getIdJson() {
        return idJson;
    }

    public void setIdJson(String idJson) {
        this.idJson = idJson;
    }

    /**
     * 选项编号
     */
    private String number;
    /**
     * 选项内容
     */
    private String choiceText01;
    private String choiceText02;
    private String choiceText03;
    private String choiceText04;
    /**
     * 题干的id
     */
    private String questionsId;

    /**
     * 题目对象注入
     * @return
     */
    private Questions questions;

    public Questions getQuestions() {
        return questions;
    }

    public void setQuestions(Questions questions) {
        this.questions = questions;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
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

    public String getQuestionsId() {
        return questionsId;
    }

    public void setQuestionsId(String questionsId) {
        this.questionsId = questionsId;
    }
}
