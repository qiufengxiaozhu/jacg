package com.zte.zudp.admin.modules.component.info.entity;

import javax.validation.constraints.Max;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import com.zte.zudp.admin.modules.sys.user.entity.User;

/**
 * @author zzw
 * @version 1.0.0
 * @since on 2018/3/14.
 */
public class InfoReceiver extends DataEntity {

    /**
     * 关联消息的id
     */
    private InfoSender infoSender;

    /**
     * 接收者
     */
    private User receiver;

    /**
     * 已读未读
     */
    @Max(4)
    private Integer status;


    public InfoSender getInfoSender() {
        return infoSender;
    }

    public void setInfoSender(InfoSender infoSender) {
        this.infoSender = infoSender;
    }

    public User getReceiver() {
        return receiver;
    }

    public void setReceiver(User receiver) {
        this.receiver = receiver;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
