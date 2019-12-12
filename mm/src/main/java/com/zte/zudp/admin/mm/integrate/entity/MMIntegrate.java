package com.zte.zudp.admin.mm.integrate.entity;
import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 积分实体类  移动端
 */
public class MMIntegrate extends DataEntity {

    private String points; //积分数
    private String telephone; // 电话
    private String type; // 类型
    private String foreignId; // 外键

    private String title; // 上报标题
    private String reportDate; // 上报时间

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getReportDate() {
        return reportDate;
    }

    public void setReportDate(String reportDate) {
        this.reportDate = reportDate;
    }

    public String getPoints() {
        return points;
    }

    public void setPoints(String points) {
        this.points = points;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getForeignId() {
        return foreignId;
    }

    public void setForeignId(String foreignId) {
        this.foreignId = foreignId;
    }
}
