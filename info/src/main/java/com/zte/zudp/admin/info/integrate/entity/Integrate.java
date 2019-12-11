package com.zte.zudp.admin.info.integrate.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 积分类
 */
public class Integrate extends DataEntity{


    /**
     * 积分数

     */
    private Integer points;
    private String reportDate;
    private String title;
    private String telephone;

    public String getReportDate() {
        return reportDate;
    }

    public void setReportDate(String reportDate) {
        this.reportDate = reportDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Integer getPoints() {
        return points;
    }

    public void setPoints(Integer points) {
        this.points = points;
    }



}
