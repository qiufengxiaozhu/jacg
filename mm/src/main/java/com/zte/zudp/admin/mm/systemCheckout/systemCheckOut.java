package com.zte.zudp.admin.mm.systemCheckout;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 系统自检
 * @author lc
 * Date: 2019/12/10
 * Time: 8:10
 */
@RestController
@EndpointModule(name = "系统自检", id = "xtCheckOut" )
@RequestMapping(value = "/xtCheckOut")
public class systemCheckOut {

    @ResponseBody
    @RequestMapping(value  = "/isConnect", method = RequestMethod.POST)
    public Object isConnect(){
        List<Object>  list = new ArrayList<>();
        //创建Map对象
        Map<String, String> map = new HashMap<String,String>();
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
                if (result  .toString().indexOf("TTL") > 0) {
                    // 网络畅通
                    map.put("message","200");
                    map.put("connect","true");
                    list.add(map);

                } else {
                    map.put("message","300");
                    map.put("connect","false");
                    list.add(map);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return  map;
    }


}
