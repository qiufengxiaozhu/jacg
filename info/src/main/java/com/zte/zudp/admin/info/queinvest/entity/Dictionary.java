package com.zte.zudp.admin.info.queinvest.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 答案实体类
 */
public class Dictionary extends DataEntity {
    /**
     * 字典类型
     */
    private String type;
    /**
     * 中文名称
     */
    private String label;
    /**
     * 字典值
     */
    private String value;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
