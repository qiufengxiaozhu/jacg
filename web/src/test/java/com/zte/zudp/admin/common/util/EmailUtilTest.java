package com.zte.zudp.admin.common.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.TemplateException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author zzw
 * @version 1.0.0
 * @since on 2018/2/23.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class EmailUtilTest {
    /**
     * 测试邮件发送
     */
    @Test
    public void sendEmail() {
        boolean isSend = EmailUtil.sendEmail("这是一封测试邮件", new String[]{"1282443717@qq.com"}, null, "百度一下，你就知道", null);
        System.out.println( "发送邮件:" + isSend);
    }

    /**
     * 测试通过 freemarker 发送模板邮件
     */
    @Test
    public void sendFreemarkerEmail() throws IOException, TemplateException {
        Map<String, Object> map = new HashMap<>();
        map.put("preUrl", "http://localhost:8080/");
        map.put("id", "aaa");
        map.put("code", "aaa");
        boolean isSend = EmailUtil.sendEmail("这是一封测试邮件", new String[]{"775831384@qq.com"}, null, FileUtil.render(map, "/common/email.ftl"), null);
        System.out.println( "发送邮件:" + isSend);
    }
}
