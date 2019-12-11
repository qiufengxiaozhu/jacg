package com.zte.zudp.admin.info.systemCheckout;

import ch.qos.logback.core.util.TimeUtil;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;


/**
 * 系统自检
 * @author lc
 * Date: 2019/12/10
 * Time: 8:10
 */
@RestController
@EndpointModule(name = "系统自检", id = "xtCheckOut" )
@RequestMapping(value = "/xtCheckOut")
public class systemCheckOut{

    public boolean isConnect(){
        boolean connect = false;
        Runtime runtime = Runtime.getRuntime();
        Process process;
        try {
            process = runtime.exec("ping " + "www.baidu.com");
            InputStream is = process.getInputStream();
            InputStreamReader isr = new InputStreamReader(is);
            BufferedReader br = new BufferedReader(isr);
            String line = null;
            StringBuffer sb = new StringBuffer();
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            String result   = new String(sb.toString().getBytes("UTF-8"));
            System.out.println("返回值为:"+result  );
            is.close();
            isr.close();
            br.close();
            if (null != result   && !result  .toString().equals("")) {
                String logString = "";
                if (result  .toString().indexOf("TTL") > 0) {
                    // 网络畅通
                    connect = true;
                } else {
                    // 网络不畅通
                    connect = false;
                }


            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return connect;
    }

    public static void main(String[] args) {
        systemCheckOut netState = new systemCheckOut();
        System.out.println(netState.isConnect());

    }

}
