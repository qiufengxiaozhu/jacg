package com.zte.zudp.admin.info.consultation.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 种类信息实体类
 */
public class ConsultCategory extends DataEntity {


    private String name;//种类名称
    private long categoryno;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getCategoryno() {
        return categoryno;
    }

    public void setCategoryno(long categoryno) {
        this.categoryno = categoryno;
    }
}
