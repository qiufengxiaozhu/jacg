package com.zte.zudp.admin;

import org.apache.catalina.Context;
import org.apache.catalina.connector.Connector;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerFactory;
import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
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
public class AdminApplication  implements EmbeddedServletContainerCustomizer {
    /**
     * 项目启动
     * @param args
     */
    public static void main(String[] args) {
        SpringApplication.run(AdminApplication.class, args);
    }


    /** http 和https管理  开始  */
    @Bean
    public EmbeddedServletContainerFactory servletContainer() {
        TomcatEmbeddedServletContainerFactory tomcat = new TomcatEmbeddedServletContainerFactory() {
            @Override
            protected void postProcessContext(Context context) {
                // 如果要强制使用https，请松开以下注释
               /* SecurityConstraint constraint = new SecurityConstraint();
                constraint.setUserConstraint("CONFIDENTIAL");
                SecurityCollection collection = new SecurityCollection();
                collection.addPattern("/*");
                constraint.addCollection(collection);
                context.addConstraint(constraint);*/
            }
        };
        tomcat.addAdditionalTomcatConnectors(httpConnector());
        return tomcat;
    }

    /** http重定向到https 开始 */
    @Bean
    public Connector httpConnector() {
        Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
        connector.setScheme("http");
        //Connector监听的http的端口号
        connector.setPort(serverPort);
        connector.setSecure(false);
        //监听到http的端口号后转向到的https的端口号
        connector.setRedirectPort(httpsPort);
        return connector;
    }
    //这里设置默认端口为443，即https的，如果这里不设置，会https和http争夺httpPort端口
    @Override
    public void customize(ConfigurableEmbeddedServletContainer container) {
        container.setPort(httpsPort);
    }
    /** http重定向到https 结束 */


    @Value("${server.port}")
    private Integer serverPort;

    @Value("${https.port}")
    private Integer httpsPort;
    /** http 和https管理  结束  */
}
