package com.zte.zudp.admin.mybatis;

import java.io.Serializable;

/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-12.
 */
public class TestEntity implements Serializable {

    private String id;

    public TestEntity(String id) {
        this.id = id;
    }

    public TestEntity() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "TestEntity{" +
                "id='" + id + '\'' +
                '}';
    }
}
