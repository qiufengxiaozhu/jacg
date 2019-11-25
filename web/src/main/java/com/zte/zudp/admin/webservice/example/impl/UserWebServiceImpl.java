package com.zte.zudp.admin.webservice.example.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.zte.zudp.admin.webservice.example.UserWebService;

/**
 * @author zzw
 * @version 1.0.0
 * @since on 2018/2/22.
 */
@Component
public class UserWebServiceImpl implements UserWebService {

    @Override
    public Map<String, Object> findList() {
        Map<String, Object> resp = new HashMap<>();
        resp.put("status", 1);
        resp.put("msg", "查询成功");
        resp.put("data", "12");
        return resp;
    }
}
