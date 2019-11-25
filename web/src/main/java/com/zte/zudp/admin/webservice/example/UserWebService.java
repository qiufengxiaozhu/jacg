package com.zte.zudp.admin.webservice.example;

import java.util.Map;

import javax.jws.WebMethod;
import javax.jws.WebService;


/**
 * @author zzw
 * @version 1.0.0
 * @since on 2018/2/22.
 */
@WebService(name = "UserWebService", // 暴露服务名称
        targetNamespace = "http://webservice.admin.zudp.zte.com/"// 命名空间,一般是接口的包名倒序
)
public interface UserWebService {

    @WebMethod
    Map<String, Object> findList();
}
