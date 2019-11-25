package com.zte.zudp.admin.modules.component.info.entity;

import javax.validation.constraints.Max;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import com.zte.zudp.admin.modules.sys.user.entity.User;

/**
 * @author zzw
 * @version 1.0.0
 * @since on 2018/3/14.
 */
public class InfoSender extends DataEntity {

    /**
     * 消息发送者id
     */
    private User sender;

    /**
     * 消息的类型
     */
    @Max(4)
    private Integer type;

    /**
     * 重要程度
     */
    @Max(4)
    private Integer level;

    /**
     * 消息内容
     */
    @Max(512)
    private String message;

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
