package com.zte.zudp.admin.common.util;

import java.nio.charset.StandardCharsets;

import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Assert;
import org.junit.Test;

import com.zte.zudp.admin.common.persistence.Subject;


/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-02-02.
 */
public class EncryptUtilTest {

    @Test
    public void encryptPassword() {
        String salt = RandomStringUtils.randomAlphanumeric(Subject.SALT_LENGTH);
        System.out.println(salt);
        System.out.println(EncryptUtil.encryptPassword("admin", "123456", salt));
    }

    @Test
    public void aesEncryp() throws Exception {
        String key = "4E7FF1C1F04F4B36";
        String password = "cat123@#steven";
        System.out.println("origin: " + password);
        byte[] encryptData = EncryptUtil.aesEncryp(key, password);
        System.out.println("after AES encrypt: " + new String(encryptData));
        byte[] data = EncryptUtil.aesDecryp(key, encryptData);
        System.out.println("after AES decrypt: " + new String(data));
        Assert.assertEquals(password, new String(data, StandardCharsets.UTF_8));
    }
}