package com.zte.zudp.admin.mybatis;

import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.zte.zudp.admin.persistence.entity.UserEntity;

/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-12.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class ConnectionTests {

    @Autowired
    private TestMapper mapper;

    @Before
    public void setUp() throws Exception {
        mapper.clearTable();

        mapper.insert(new TestEntity("1"));
    }

    /**
     * 测试connection()方法
     * @since 2018/1/12 0012
     */
    @Test
    public void test_connection(){
        List<TestEntity> list = mapper.findList();
        Assert.assertEquals(1, list.size());
        list.forEach(System.out::println);
    }
}
