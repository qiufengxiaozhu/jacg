package com.zte.zudp.admin.info.warning.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * 报警类
 */
public class Warning  extends DataEntity{

    private String warningPosition;
    private String description;
    private String status;

    public String getWarningPosition() {
        return warningPosition;
    }

    public void setWarningPosition(String warningPosition) {
        this.warningPosition = warningPosition;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
