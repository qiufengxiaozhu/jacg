package com.zte.zudp.admin.modules.uedito;


import com.zte.zudp.admin.common.util.FileUtil;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.core.io.ClassPathResource;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * Created by ldb on 2017/4/9.
 */
@RestController
@RequestMapping(value = "/Ueditors")
public class UeditorController {


    @RequestMapping("/")
    private String showPage(){
        return "index";
    }



    @RequestMapping(value="/config")
    public void config(HttpServletRequest request, HttpServletResponse response) throws JSONException {
    /*    response.setContentType("application/json");
        String rootPath = request.getSession().getServletContext().getRealPath("/");
        try {

            response.setContentType("application/json;charset=utf-8");
            Resource resource = new ClassPathResource("config.json");
            File file = resource.getFile();
            BufferedReader br = new BufferedReader(new FileReader(file));
            StringBuilder stringBuilder = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                stringBuilder.append(line);
            }
       *//*
            String exec = new ActionEnter(request, rootPath).exec();*//*
            PrintWriter writer = response.getWriter();
            writer.write(stringBuilder.toString());
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
*/


        response.setContentType("application/json");

        ClassPathResource classPathResource = new ClassPathResource("config.json");

        String s="";
        String configContentStr = "";
        try {
            InputStream is = classPathResource.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            response.setContentType("application/json;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            while((s=br.readLine())!=null) {
                configContentStr = configContentStr+s;
            }
            PrintWriter writer = response.getWriter();
            writer.write(configContentStr.toString());
            writer.flush();
            writer.close();
        } catch (IOException e) {

            e.printStackTrace();
        }


    }




    @RequestMapping("/uploadimage")
    //@ResponseBody
    public void upload(HttpServletRequest request, HttpServletResponse response, MultipartFile upfile) throws Exception {
        Map<String, Object> params = new HashMap<>();
        try{
            String s= FileUtil.uploadAll(upfile, null);
            params.put("state", "SUCCESS");
            params.put("url", s);
            params.put("size", upfile.getSize());
            params.put("original", "");
            params.put("type", upfile.getContentType());
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(new JSONObject(params));
        } catch (Exception e){
            params.put("state", "ERROR");
        }

    }


    @RequestMapping("/uploads")
    @ResponseBody
    public Map<String, Object> uploads (HttpServletRequest request, HttpServletResponse response, MultipartFile upfile){
        Map<String, Object> params = new HashMap<String, Object>();
        try{
            String basePath = "c:/img";  //与properties文件中lyz.uploading.url相同，未读取到文件数据时为basePath赋默认值
            String  visitUrl = "/upload/"; //与properties文件中lyz.visit.url相同，未读取到文件数据时为visitUrl赋默认值
            String ext = "abc" + upfile.getOriginalFilename();
            String fileName = String.valueOf(System.currentTimeMillis()).concat("_").concat(""+new Random().nextInt(6)).concat(".").concat(ext);
            StringBuilder sb = new StringBuilder();
            //拼接保存路径
            sb.append(basePath).append("/").append(fileName);
            visitUrl = visitUrl.concat(fileName);
            File f = new File(sb.toString());
            if(!f.exists()){
                f.getParentFile().mkdirs();
            }
            OutputStream out = new FileOutputStream(f);
            FileCopyUtils.copy(upfile.getInputStream(), out);
            params.put("state", "SUCCESS");
            params.put("url", visitUrl);
            params.put("size", upfile.getSize());
            params.put("original", fileName);
            params.put("type", upfile.getContentType());
        } catch (Exception e){
            params.put("state", "ERROR");
        }
        return params;
    }



}
