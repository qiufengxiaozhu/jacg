package com.zte.zudp.admin.persistence.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import com.zte.zudp.admin.persistence.entity.UserEntity;

/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-15.
 */
public interface UserEntityMapper {

    @Delete("DELETE FROM tt_user")
    void clearTable();

    @Insert("INSERT INTO tt_user (id, name, age) VALUES (#{id}, #{name}, #{age})")
    void insert(UserEntity entity);
}
