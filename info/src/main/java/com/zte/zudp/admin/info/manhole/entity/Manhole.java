package com.zte.zudp.admin.info.manhole.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 *
 * 井盖类
 */
public class Manhole extends DataEntity{

    /**
     * 井盖名称
     */
    private String manhole;

    /**
     * 所在街道
     */
    private String street;

    /**
     * 闲置字段1
     */
    private String spareOne;

    /**
     * 闲置字段1
     */
    private String spareTwo;

    /**
     * 闲置字段1
     */
    private String spareThree;

    public String getManhole() {
        return manhole;
    }

    public void setManhole(String manhole) {
        this.manhole = manhole;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getSpareOne() {
        return spareOne;
    }

    public void setSpareOne(String spareOne) {
        this.spareOne = spareOne;
    }

    public String getSpareTwo() {
        return spareTwo;
    }

    public void setSpareTwo(String spareTwo) {
        this.spareTwo = spareTwo;
    }

    public String getSpareThree() {
        return spareThree;
    }

    public void setSpareThree(String spareThree) {
        this.spareThree = spareThree;
    }

    @Override
    public String toString() {
        return "Manhole{" +
                "manhole='" + manhole + '\'' +
                ", street='" + street + '\'' +
                ", spareOne='" + spareOne + '\'' +
                ", spareTwo='" + spareTwo + '\'' +
                ", spareThree='" + spareThree + '\'' +
                '}';
    }
}
