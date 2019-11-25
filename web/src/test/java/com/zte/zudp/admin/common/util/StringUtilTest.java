package com.zte.zudp.admin.common.util;

import org.junit.Assert;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;

/**
 * StringUtil 测试类
 *
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-03-01.
 */
public class StringUtilTest {

    @Rule
    public ExpectedException thrown= ExpectedException.none();

    @Test
    public void formatNumber() {
        String format = StringUtil.format("a{0}b{1}c", 1, 2, 3);
        Assert.assertEquals("a1b2c", format);
    }

    @Test
    public void format() {
        String format = StringUtil.format("a{}b{}c", 1, 2, 3);
        Assert.assertEquals("a1b2c", format);
    }

    @Test
    public void formatInvalidNumber() {
        String format = StringUtil.format("a{1.1}b{}c", 1, 2, 3);
        Assert.assertEquals("a{1.1}b1c", format);
    }

    @Test
    public void formatInvalid() {
        String format = StringUtil.format("a{a}b{}c", 1, 2, 3);
        Assert.assertEquals("a{a}b1c", format);
    }

    @Test
    public void formatNULL() {
        thrown.expect(IllegalStateException.class);
        thrown.expectMessage("pattern 不能为空");
        StringUtil.format(null, 1, 2, 3);
    }

    @Test
    public void formatEmpty() {
        thrown.expect(IllegalStateException.class);
        thrown.expectMessage("pattern 不能为空");
        StringUtil.format("", 1, 2, 3);
    }

    @Test
    public void isContain() {
        String top = "role";
        String topChild = "role:create";
        String topTwo = "user";

        Assert.assertTrue(StringUtil.isSameOrSubNode(top, "role:*"));
        Assert.assertTrue(StringUtil.isSameOrSubNode(topChild, "role:*"));
        Assert.assertTrue(StringUtil.isSameOrSubNode(topChild, "role:create:*"));
        Assert.assertFalse(StringUtil.isSameOrSubNode(topChild, "role:update:*"));
        Assert.assertFalse(StringUtil.isSameOrSubNode(topTwo, "role:*"));
        Assert.assertFalse(StringUtil.isSameOrSubNode(topTwo, "role:feef:*"));
    }
}