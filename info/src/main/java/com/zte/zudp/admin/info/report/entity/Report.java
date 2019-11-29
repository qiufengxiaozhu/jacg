package com.zte.zudp.admin.info.report.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

import java.util.List;

/**
 * 公共上报实体类
 * @author 闵思迁
 */

public class Report extends DataEntity {


    /**
     * 案件类型
     */
    private String caseType;

    /**
     * 案发位置
     */
    private String location;

    /**
     * 坐标经纬度
     */
    private String coordinate;


    /**
     * 案件描述
     */
    private String description;

    /**
     * 上报人昵称
     */
    private String nickName;

    /**
     *多媒体资源
     */
    private List<MultimediaResources> resourcesList;


    public String getCaseType() {
        return caseType;
    }

    public void setCaseType(String caseType) {
        this.caseType = caseType;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCoordinate() {
        return coordinate;
    }

    public void setCoordinate(String coordinate) {
        this.coordinate = coordinate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public List<MultimediaResources> getResourcesList() {
        return resourcesList;
    }

    public void setResourcesList(List<MultimediaResources> resourcesList) {
        this.resourcesList = resourcesList;
    }
}
