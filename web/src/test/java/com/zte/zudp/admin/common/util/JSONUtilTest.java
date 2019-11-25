package com.zte.zudp.admin.common.util;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonProcessingException;

import org.junit.Assert;
import org.junit.Test;

import com.zte.zudp.admin.persistence.entity.UserEntity;


/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-03-06.
 */
public class JSONUtilTest {

    @Test
    public void serialized() throws JsonProcessingException {
        UserEntity bean = new UserEntity();
        bean.setName("小明");
        bean.setAge(15);
        bean.setId("1");
        Assert.assertEquals("{\"id\":\"1\",\"name\":\"小明\",\"age\":15}", JSONUtil.serialized(bean));
    }

    @Test
    public void deserialized() throws IOException {
        UserEntity bean = JSONUtil.deserialized("{\"name\":\"小明\",\"age\":15,\"id\":\"1\"}", UserEntity.class);
        Assert.assertEquals("小明", bean.getName());
        Assert.assertEquals((Integer) 15, bean.getAge());
        Assert.assertEquals("1", bean.getId());
    }
}