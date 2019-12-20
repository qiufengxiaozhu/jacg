package com.zte.zudp.admin.info.convenient.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import com.zte.zudp.admin.common.persistence.entity.FileEntity;

/**
 * @Description ${}
 * @Author ConvenientDao 便民服务
 * @Date 2019/12/13 13:44
 **/
public class Convenient extends FileEntity {

    /**
     *  服务名称
     */
    private String name;

    /**
     * 位置
     */
    private String location;

    /**
     * 经度
     */
    private String longitude;

    /**
     * 纬度
     */
    private String latitude;

    /**
     * 描述
     */
    private String description;

    /**
     * 类型
     */
    private String category;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    @Override
    public String toString() {
        return "Convenient{" +
                "name='" + name + '\'' +
                ", location='" + location + '\'' +
                ", longitude='" + longitude + '\'' +
                ", latitude='" + latitude + '\'' +
                ", description='" + description + '\'' +
                ", category='" + category + '\'' +
                '}';
    }
}
