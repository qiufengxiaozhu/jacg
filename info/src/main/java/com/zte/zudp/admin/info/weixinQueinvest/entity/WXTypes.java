package com.zte.zudp.admin.info.weixinQueinvest.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 题目类型实体类
 */
public class WXTypes extends DataEntity {
    /**
     * 题目类型
     */
    private String type;
    /**
     * 问卷名称id
     */
    private String titlesId;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitlesId() {
        return titlesId;
    }

    public void setTitlesId(String titlesId) {
        this.titlesId = titlesId;
    }
}
