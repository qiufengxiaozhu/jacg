package com.zte.zudp.admin.info.weixinQueinvest.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import com.zte.zudp.admin.info.queinvest.entity.Questions;

/**
 * 选项实体类
 */
public class WXOptions extends DataEntity {

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
    private String opt01;
    private String opt02;
    private String opt03;

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

    public String getOpt01() {
        return opt01;
    }

    public void setOpt01(String opt01) {
        this.opt01 = opt01;
    }

    public String getOpt02() {
        return opt02;
    }

    public void setOpt02(String opt02) {
        this.opt02 = opt02;
    }

    public String getOpt03() {
        return opt03;
    }

    public void setOpt03(String opt03) {
        this.opt03 = opt03;
    }

    public String getQuestionsId() {
        return questionsId;
    }

    public void setQuestionsId(String questionsId) {
        this.questionsId = questionsId;
    }
}
