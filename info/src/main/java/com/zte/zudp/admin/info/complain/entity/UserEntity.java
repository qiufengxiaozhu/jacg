package com.zte.zudp.admin.info.complain.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * @Description ${}
 * @Author UserEntity
 * @Date 2019/11/28 15:23
 **/
public class UserEntity extends DataEntity {
    /**
     * username
     */
    private String username;

    /**
     * password
     */
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "UserEntity{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
