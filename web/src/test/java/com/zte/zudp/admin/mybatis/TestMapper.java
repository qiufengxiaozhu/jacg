package com.zte.zudp.admin.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-12.
 */
public interface TestMapper {

    @Select("SELECT * FROM tt_test")
    List<TestEntity> findList();

    @Delete("DELETE FROM tt_test")
    void clearTable();

    @Insert("INSERT INTO tt_test (id) VALUES (#{id})")
    void insert(TestEntity entity);
}
