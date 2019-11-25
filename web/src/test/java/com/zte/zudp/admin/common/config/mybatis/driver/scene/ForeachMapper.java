package com.zte.zudp.admin.common.config.mybatis.driver.scene;

import java.util.List;

import org.apache.ibatis.annotations.Lang;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.zte.zudp.admin.common.config.mybatis.driver.ForeachLanguageDriver;
import com.zte.zudp.admin.persistence.entity.UserEntity;

/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-12.
 */
public interface ForeachMapper {

    @Lang(ForeachLanguageDriver.class)
    @Select("SELECT id, name, age FROM tt_user WHERE id = 'forIn(userIds)'")
    List<UserEntity> foreachAlone(@Param("userIds") String[] ids);

    @Lang(ForeachLanguageDriver.class)
    @Select("SELECT id, name, age FROM tt_user WHERE id = 'forIn(userIds)' AND age = #{age}")
    List<UserEntity> foreachCombine(@Param("userIds") String[] ids, @Param("age") int age);
}
