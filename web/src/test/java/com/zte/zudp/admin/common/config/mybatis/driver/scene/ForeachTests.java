package com.zte.zudp.admin.common.config.mybatis.driver.scene;

import java.util.List;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.zte.zudp.admin.persistence.entity.UserEntity;
import com.zte.zudp.admin.persistence.tests.AbstractUserTest;

/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-12.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class ForeachTests extends AbstractUserTest {

    @Autowired
    private ForeachMapper mapper;

    @Before
    public void setUp() throws Exception {
        userEntityMapper.clearTable();

        userEntityMapper.insert(new UserEntity("1", "Owen", 18));
        userEntityMapper.insert(new UserEntity("2", "Sam", 19));
        userEntityMapper.insert(new UserEntity("3", "Brannen", 35));
    }

    /**
     * 测试 foreachAlone()方法
     * @since 2018/1/12 0012
     */
    @Test
    public void test_foreachAlone(){
        String[] ids = new String[]{"1", "2"};
        List<UserEntity> list = mapper.foreachAlone(ids);
        Assert.assertEquals(2, list.size());
    }

    /**
     * 测试 foreachCombine()方法
     * @since 2018/1/12 0012
     */
    @Test
    public void test_foreachCombine(){
        String[] ids = new String[]{"1", "2"};
        List<UserEntity> list = mapper.foreachCombine(ids, 19);
        Assert.assertEquals(1, list.size());
    }

    @After
    public void tearDown() throws Exception {
        userEntityMapper.clearTable();
    }
}
