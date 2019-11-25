package com.zte.zudp.admin.common.config.jackson;

import org.junit.Test;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ser.FilterProvider;
import com.zte.zudp.admin.persistence.entity.ArticleEntity;
import com.zte.zudp.admin.persistence.entity.UserEntity;


/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-16.
 */
public class JacksonJsonFilterTest {

    @Test
    public void include() throws JsonProcessingException {
        JacksonJsonFilter jacksonFilter = new JacksonJsonFilter();

        // 过滤除了 id,title 以外的所有字段
        String fieldStr = "id,title";
        jacksonFilter.include(ArticleEntity.class, fieldStr.split(","));

        ArticleEntity value = new ArticleEntity();
        value.setId("1");
        value.setTitle("java core partition1");
        String include=
                objectMapper(jacksonFilter, ArticleEntity.class, jacksonFilter.getClass())
                        .writeValueAsString(value);

        System.out.println("include:" + include);
    }

    @Test
    public void filter() throws JsonProcessingException {

        JacksonJsonFilter jacksonFilter = new JacksonJsonFilter();

        // 序列化所有字段，但是排除 id 和 title
        String fieldStr = "createUser,createDate,updateUser,updateDate,del,userEntity.id";
        jacksonFilter.filter(ArticleEntity.class, fieldStr.split(","));

        ArticleEntity value = new ArticleEntity();
        value.setId("1");
        value.setTitle("java core partition1");
        value.setAuthor("Sam");
        UserEntity userEntity = new UserEntity("1", "Owen", 11);
        value.setUserEntity(userEntity);
        ObjectMapper objectMapper = objectMapper(jacksonFilter, ArticleEntity.class, jacksonFilter.getClass());
        String filter = objectMapper.writeValueAsString(value);

        System.out.println(objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(value));
    }

    private ObjectMapper objectMapper(FilterProvider filterProvider, Class<?> target,
                                      Class<?> mixinSource) {

        ObjectMapper mapper = new ObjectMapper();
        // 设置过滤器
        mapper.setFilterProvider(filterProvider);
        // 为类应用过滤器
        mapper.addMixIn(target, mixinSource);

        return mapper;
    }
}