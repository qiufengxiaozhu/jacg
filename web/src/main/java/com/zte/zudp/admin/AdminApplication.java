package com.zte.zudp.admin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.ImportResource;

/**
 * 启动类
 *
 * @author piumnl
 * @since on 2018-01-12
 */
@EnableCaching
@MapperScan("com.zte.zudp")
@SpringBootApplication
@EnableAspectJAutoProxy(proxyTargetClass = true)
@ImportResource(locations = {"classpath:druid-bean.xml"})
@ServletComponentScan
public class AdminApplication {
    /**
     * 项目启动
     * @param args
     */
    public static void main(String[] args) {
        SpringApplication.run(AdminApplication.class, args);
    }
}
