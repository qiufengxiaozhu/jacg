package com.zte.zudp.admin.persistence.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;

/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-16.
 */
public class ArticleEntity extends DataEntity {

    private String name;

    private String author;

    private String title;

    private UserEntity userEntity;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }
}
