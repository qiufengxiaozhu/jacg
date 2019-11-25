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
public class ForeachLanguageDriverTest {

    private Class<ForeachLanguageDriver> driverClass = ForeachLanguageDriver.class;

    @Test
    public void testReplaceFor() {
        try {
            Method replaceForMethod = driverClass.getDeclaredMethod("replaceFor", String.class);
            replaceForMethod.setAccessible(true);

            ForeachLanguageDriver languageDriver = new ForeachLanguageDriver();
            String originSQL = "SELECT * FROM users WHERE id = 'forIn(userIds)'";
            String expectSQL =
                    "<script>"
                            + "SELECT * "
                            + "FROM users "
                            + "WHERE id IN "
                                + "(<foreach collection=\"userIds\" "
                                + "item=\"__item\" separator=\",\" >#{__item}</foreach>)"
                            + "</script>";
            String generatedSQL = (String) replaceForMethod.invoke(languageDriver, originSQL);

            Assert.assertEquals(expectSQL, generatedSQL);
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
            Assert.fail("调用方法失败");
        }
    }
}