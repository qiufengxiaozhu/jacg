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

    private String title;
    private String contents;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    /**
     * 所选中的答案
     */
    private String optContext;

    public String getOptContext() {
        return optContext;
    }

    public void setOptContext(String optContext) {
        this.optContext = optContext;
    }


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
