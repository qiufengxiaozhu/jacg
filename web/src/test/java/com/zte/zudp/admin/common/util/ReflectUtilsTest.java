package com.zte.zudp.admin.common.util;

import java.nio.file.Paths;


import com.zte.zudp.admin.modules.sys.user.controller.UserController;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;


/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-17.
 */
public class ReflectUtilsTest {

    @Test
    public void isExtends() {
      //  Assert.assertTrue(ReflectUtils.isExtends(UserControllertroller.class, AbstractCRUDController.class));
    }

    @Test
    public void setAnnotationValue() {
        RequestMapping requestMapping = UserController.class.getAnnotation(RequestMapping.class);
        String[] path = requestMapping.path();
        for (int i = 0; i < path.length; i++) {
            path[i] = Paths.get("/api", path[i]).normalize().toString().replaceAll("\\\\", "/");
        }
        ReflectUtils.setAnnotationValue(requestMapping, "path", path);
    }
}