package com.zte.zudp.admin.info.queinvest.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;


/**
 * 题干实体类
 */
public class Questions extends DataEntity{


    private String id;

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    private String choiceText01;
    private String choiceText02;
    private String choiceText03;
    private String choiceText04;

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

    /**
     * 题干
     */
    private String contents;

    /**
     * 题号
     */
    private String number;


    private String label;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 题目状态
     */

    private String status;

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    /**
     * 题目类型id
     */
    private String questionType;

    private String [] idsJson;
    private String idJson;

    public String getIdJson() {
        return idJson;
    }

    public void setIdJson(String idJson) {
        this.idJson = idJson;
    }


    public String[] getIdsJson() {
        return idsJson;
    }

    public void setIdsJson(String[] idsJson) {
        this.idsJson = idsJson;
    }

    private String name;



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getTitlesId() {
        return titlesId;
    }

    public void setTitlesId(String titlesId) {
        this.titlesId = titlesId;
    }
    private String titlesId;

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }
}
