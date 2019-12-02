package com.zte.zudp.admin.info.welllid.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 井盖信息实体类
 */
public class Lid  extends DataEntity {
    private String status;//井盖状态
    private String depict;//问题描述
    private String place;//井盖位置
    private String timed;

    public String getTimed() {
        return timed;
    }

    public void setTimed(String timed) {
        this.timed = timed;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDepict() {
        return depict;
    }

    public void setDepict(String depict) {
        this.depict = depict;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }
}
