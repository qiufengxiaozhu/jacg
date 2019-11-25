package com.zte.zudp.admin.common.config.mybatis.driver;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.junit.Assert;
import org.junit.Test;

/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-15.
 */
public class IfLanguageDriverTest {

    private Class<IfLanguageDriver> driverClass = IfLanguageDriver.class;

    @Test
    public void testReplaceFor() {
        try {
            // TODO for piumnl: 存在问题
            Method replaceForMethod = driverClass.getDeclaredMethod("replaceIf", String.class, Class.class);
            replaceForMethod.setAccessible(true);

            IfLanguageDriver languageDriver = new IfLanguageDriver();
            String originSQL = "SELECT * FROM users WHERE id = '@(userIds)'";
            String expectSQL =
                    "<script>"
                            + "SELECT * "
                            + "FROM users "
                            + "WHERE id = '@(userIds)'"
                            + "</script>";
            String generatedSQL = (String) replaceForMethod.invoke(languageDriver, originSQL, String.class);

            Assert.assertEquals(expectSQL, generatedSQL);
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
            Assert.fail("调用方法失败");
        }
    }
}