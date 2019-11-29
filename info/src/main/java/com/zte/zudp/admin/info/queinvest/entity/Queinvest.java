package com.zte.zudp.admin.info.queinvest.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 问卷实体类
 */
public class Queinvest  extends DataEntity{


    public String getQueinvestType() {
        return queinvestType;
    }

    public void setQueinvestType(String queinvestType) {
        this.queinvestType = queinvestType;
    }

    /**
     * 问卷类型
     */
    private String  queinvestType;
    /**
     * 标题
     */
    private String title;
    /**
     * 描述
     */
    private String description;

    private String valid;

    private String status;

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

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
}
