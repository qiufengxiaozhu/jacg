package com.zte.zudp.admin.webservice;

import javax.xml.ws.Endpoint;

import org.apache.cxf.Bus;
import org.apache.cxf.jaxws.EndpointImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.zte.zudp.admin.webservice.example.UserWebService;

/**
 * webService配置类
 *
 * @author zzw
 * @version 1.0.0
 * @since on 2018/2/22.
 */
@Configuration
public class ServiceConfig {

    @Autowired
    UserWebService userWebService;

    @Autowired
    private Bus bus;

    /**
     * JAX-WS 当程序运行后然后相应接口的访问地址就是 http://localhost:8080/services/userWebService?wsdl
     **/
    @Bean
    public Endpoint endpoint() {
        EndpointImpl endpoint = new EndpointImpl(bus, userWebService);
        endpoint.publish("/userWebService");
        return endpoint;
    }
}
