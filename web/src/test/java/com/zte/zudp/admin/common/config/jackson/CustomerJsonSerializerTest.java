package com.zte.zudp.admin.common.config.jackson;

import org.junit.Test;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zte.zudp.admin.persistence.entity.ArticleEntity;

/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-16.
 */
public class CustomerJsonSerializerTest {

    @Test
    public void test() throws JsonProcessingException {
        CustomerJsonSerializer cjs= new CustomerJsonSerializer();

        // 设置转换 Article 类时，只包含 id, name
        cjs.filter(ArticleEntity.class, "id,name", null);
        String include = cjs.toJson(new ArticleEntity());

        cjs = new CustomerJsonSerializer();
        // 设置转换 ArticleEntity 类时，过滤掉 id, name
        cjs.filter(ArticleEntity.class, null, "id,name");

        String filter = cjs.toJson(new ArticleEntity());

        System.out.println("include: " + include);
        System.out.println("filter: " + filter);
    }
}