package com.zte.zudp.admin.info.warning.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import com.zte.zudp.admin.info.queinvest.entity.Questions;

/**
 * 选项实体类
 */
public class Options extends DataEntity {

    /**
     * 报警描述
     */
    private String description;
    /**
     * 报警位置
     */
    private String warningPosition;
    /**
     * 状态
     */
    private String  status;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getWarningPosition() {
        return warningPosition;
    }

    public void setWarningPosition(String warningPosition) {
        this.warningPosition = warningPosition;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
