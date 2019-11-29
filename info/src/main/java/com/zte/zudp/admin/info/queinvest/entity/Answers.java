package com.zte.zudp.admin.info.queinvest.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 答案实体类
 */
public class Answers extends DataEntity {

    /**
     * 题干id
     */
    private String questionsId;
    /**
     * 选项的id
     */
    private String optionsId;

    public String getQuestionsId() {
        return questionsId;
    }

    public void setQuestionsId(String questionsId) {
        this.questionsId = questionsId;
    }

    public String getOptionsId() {
        return optionsId;
    }

    public void setOptionsId(String optionsId) {
        this.optionsId = optionsId;
    }
}
