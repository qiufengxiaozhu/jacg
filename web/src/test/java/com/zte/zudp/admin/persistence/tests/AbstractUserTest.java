package com.zte.zudp.admin.persistence.tests;

import org.springframework.beans.factory.annotation.Autowired;

import com.zte.zudp.admin.persistence.mapper.UserEntityMapper;

/**
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-15.
 */
public abstract class AbstractUserTest {

    @Autowired
    protected UserEntityMapper userEntityMapper;
}
