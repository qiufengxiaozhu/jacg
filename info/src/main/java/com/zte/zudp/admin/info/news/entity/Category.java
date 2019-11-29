package com.zte.zudp.admin.info.news.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 新闻类别实体类
 */
public class Category extends DataEntity {

    /**
     * 新闻类别
     */
    private String category;
    /**
     * 类别描述
     */
    private String describe;
    /**
     * 闲置字段
     */
    private String spare_1;

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getSpare_1() {
        return spare_1;
    }

    public void setSpare_1(String spare_1) {
        this.spare_1 = spare_1;
    }

    @Override
    public String toString() {
        return "Category{" +
                "category='" + category + '\'' +
                ", describe='" + describe + '\'' +
                ", spare_1='" + spare_1 + '\'' +
                '}';
    }
}
