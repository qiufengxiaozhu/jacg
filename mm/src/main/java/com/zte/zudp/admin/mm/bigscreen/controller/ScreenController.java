package com.zte.zudp.admin.mm.bigscreen.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.mm.bigscreen.entity.Screen;
import com.zte.zudp.admin.mm.bigscreen.service.ScreenService;
import org.osgeo.proj4j.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * 吉安大屏控制器层
 * @Description ${}
 * @Author ScreenController
 * @Date 2019/12/24 15:13
 **/

@Controller
@RequestMapping(value = "/mm/screen")
public class ScreenController {

    @Autowired
    private ScreenService screenService;


    /**
     * 跳转到大屏
     * @return
     */
    @RequestMapping("/toBigScreen")
    public String toBigScreen(Model model){

        //统计2019年1月份所有区前十条案件
        List<Screen> screenList =  screenService.selectAllCase();

        //统计近一年每个区发生的事件有多少起
        List<Screen> list = screenService.countCase();

        String number1 = "0", number2 = "0", number3 = "0", number4 = "0";
        for (int i = 0; i < list.size(); i++) {

            if (list.get(i).getDISTRICTNAME() != null || list.get(i).getDISTRICTNAME() != "") {

                if("吉州区".equals(list.get(i).getDISTRICTNAME())){
                    number1 = list.get(i).getNUMBER();
                }
                else if("庐陵新区".equals(list.get(i).getDISTRICTNAME())){
                    number2 = list.get(i).getNUMBER();
                }
                else if("青原区".equals(list.get(i).getDISTRICTNAME())){
                    number3 = list.get(i).getNUMBER();
                }
                else if("井开区".equals(list.get(i).getDISTRICTNAME())){
                    number4 = list.get(i).getNUMBER();
                }
            }
        }

        //由于数据库中井开区没有数据，特在此模拟一下案件条数
//        number4 = "2600";

        //四个区在2019年1月案发总数
        int total = Integer.parseInt(number1) + Integer.parseInt(number2)
                + Integer.parseInt(number3) + Integer.parseInt(number4);

        model.addAttribute("ScreenList",screenList);
        model.addAttribute("Number1",number1);
        model.addAttribute("Number2",number2);
        model.addAttribute("Number3",number3);
        model.addAttribute("Number4",number4);
        model.addAttribute("Total",total);

        return "mm/bigscreen/screen";
    }

    /**
     * 效能分析
     */
    @ResponseBody
    @RequestMapping(value = "/analysis",method = RequestMethod.POST)
    public List<Screen> analysis(){

        List<Screen> analysisList =  screenService.analysis();

        for (int i = 0; i <analysisList.size() ; i++) {

            System.out.println(analysisList.get(i).toString());
        }

        return analysisList;
    }

    /**
     * 趋势分析  数据统计
     * @return
     */
    @JSON
    @ResponseBody
    @RequestMapping(value = "/trendAnaly",method = RequestMethod.POST)
    public Map trendAnaly(@RequestParam(value = "time",required = false) String time){
        List<Map> list = screenService.trendAnaly(time);
        // 创建list来接收不同地区的数据(存放纵坐标)
        List strList01 = new ArrayList();
        List strList02 = new ArrayList();
        List strList03 = new ArrayList();
        List strList04 = new ArrayList();

        // 创建map
        HashMap map = new HashMap();

        System.out.println(list);
        for (int i = 0; i < list.size(); i++) {
            if(list.get(i).get("dest") == null){ // 为空
                continue;
            }
            else{ // 地区不为空
                    if(list.get(i).get("dest").equals("庐陵新区")){ //
                      // 存放到数组中
                        strList01.add(list.get(i).get("num").toString());
                        // 存放到map中
                    }else if(list.get(i).get("dest").equals("青原区")){ //
                    // 存放到数组中
                    strList02.add(list.get(i).get("num").toString());
                }else if(list.get(i).get("dest").equals("吉州区")){ //
                        // 存放到数组中
                        strList03.add(list.get(i).get("num").toString());
                    }else if(list.get(i).get("dest").equals("井开区")){ //
                        // 存放到数组中
                        strList04.add(list.get(i).get("num").toString());
                    }
            }
        }
        // 每个区的纵坐标
        map.put("strList01",strList01);
        map.put("strList02",strList02);
        map.put("strList03",strList03);
        map.put("strList04",strList04);

                return map;
    }

    /**
     * 整合后台代码，将数据封装到前台
     * @return
     */
//    @RequestMapping(value = "/selectAll", method = RequestMethod.GET)
//    public String selectCase(Model model){

//        //显示最近一个月数据，显示三条
//        List<Screen> screenList =  screenService.selectCase();
//
//        //统计每个区的最近一个月数据
//        List<Screen> list = screenService.countCase();
//
//        String number1 = "0", number2 = "0", number3 = "0", number4 = "0";
//        for (int i = 0; i < list.size(); i++) {
//
//            if (list.get(i).getDISTRICTNAME() != null || list.get(i).getDISTRICTNAME() != "") {
//
//                if("吉州区".equals(list.get(i).getDISTRICTNAME())){
//                    number1 = list.get(i).getNUMBER();
//                }
//                else if("庐陵新区".equals(list.get(i).getDISTRICTNAME())){
//                    number2 = list.get(i).getNUMBER();
//                }
//                else if("青原区".equals(list.get(i).getDISTRICTNAME())){
//                    number3 = list.get(i).getNUMBER();
//                }
//                else if("井开区".equals(list.get(i).getDISTRICTNAME())){
//                    number4 = list.get(i).getNUMBER();
//                }
//            }
//        }
//
//        //四个区最近一个月案发总数
//        int total = Integer.parseInt(number1) + Integer.parseInt(number2)
//                + Integer.parseInt(number3) + Integer.parseInt(number4);
//
//        model.addAttribute("ScreenList",screenList);
//        model.addAttribute("Number1",number1);
//        model.addAttribute("Number2",number2);
//        model.addAttribute("Number3",number3);
//        model.addAttribute("Number4",number4);
//        model.addAttribute("Total",total);
//
//        return "/mm/bigscreen/screen";
//    }



    /**
     *  关联 分析
     *  //案发时间 柱状图
     * @return
     */
    @JSON
    @GetMapping(value = "/getIndex")
    public Map getIndex() {
        //季度
        List listtype=new ArrayList<>();
        listtype.add("第一季度");
        listtype.add("第二季度");
        listtype.add("第三季度");
        listtype.add("第四季度");

        //社区遍历
        //大类最大 前五条
       /* List<Map> list = screenService.findType();
        //保存值
        List<Map> listMap=new ArrayList<>();
        //根据类型遍历
        for (int i = 0; i < list.size(); i++) {

            Map map=new HashMap();
            Map map2=list.get(i);
            //遍历季度
            for (int j = 0; j < listtype.size(); j++) {
                Integer counts= screenService.findareacountList( map2.get("name").toString(),listtype.get(j).toString());
                map.put(listtype.get(j),counts);
            }
            map.put("name",list.get(i).get("name").toString());
            listMap.add(map);

        }*/



        //大类最大 前五条
       List<Map> list = screenService.findType();

        //社区遍历
        //大类最大 前五条
        List<Map> listcout = screenService.findTypeJdCount();
        //保存值
        List<Map> listMap=new ArrayList<>();
        //根据类型遍历
        for (int i = 0; i < list.size(); i++) {

            Map map=new HashMap();
            Map map2=list.get(i);
            //遍历季度
            for (int j = 0; j < listtype.size(); j++) {

                for (int k = 0; k < listcout.size(); k++) {
                     if (listtype.get(j).toString().equals(listcout.get(k).get("jd").toString()) && map2.get("name").toString().equals(listcout.get(k).get("MAINTYPENAME").toString())){
                         map.put(listtype.get(j),listcout.get(k).get("num").toString());
                     }


                }


            }
            map.put("name",list.get(i).get("name").toString());
            listMap.add(map);

        }



        Map map=new HashMap();
        map.put("listMap",listMap);
        map.put("listdit",list);
        map.put("listArea",listtype);
        return  map;


    }


    /**
     *  案发频率趋势图
     *
     * @return
     */
    @JSON
    @GetMapping(value = "/getrightEvenTypes")
    public  List<Map>  getrightEvenTypes() {

        //遍历
        List<Map> list = screenService.getrightEvenTypes();

        return list;

    }




    /**
     *  案发频率趋势图
     *
     * @return
     */
    @JSON
    @GetMapping(value = "/getrightEvenType")
    public  List<Map>  getrightEvenType() {

        //遍历
        List<Map> list = screenService.getrightEvenType();

        return list;

    }




    /**
     *  区域案件报警
     * 显示 前2周的数据 每个区域 前5条
     * @return
     */
    @JSON
    @GetMapping(value = "/getrightCaseNum")
    public  List<Map>  getrightCaseNum() {

        //遍历
        List<Map> list = screenService.getrightCaseNum();

        return list;

    }


    /**
     * 跳转到关联下钻
     * @return
     */
    @RequestMapping("/glarea")
    public String glarea(Model model,String name){
        model.addAttribute("name",name);
        return "mm/bigscreen/glarea";
    }

    /**
     * 跳转到关联下钻列表
     * @return
     */
    @JSON
    @RequestMapping("/glareaList")
    public  List<Map>  glareaList(String name){
        //季度
        List listtype=new ArrayList<>();
        if (name.equals("第一季度")){
            listtype.add("第一季度");
        }else if (name.equals("第二季度")){
            listtype.add("第二季度");
        }else if (name.equals("第三季度")){
            listtype.add("第三季度");
        }else if (name.equals("第四季度")){
            listtype.add("第四季度");
        }

        List<Map> list2 = screenService.getrightCasetypeNum(listtype.get(0).toString());


        return list2;
    }

    /**
     * 跳转到关联下钻
     * @return
     */
    @RequestMapping("/glCommunity")
    public String glCommunity(Model model,String name){
        model.addAttribute("name",name);
        return "mm/bigscreen/glcommunity";
    }

    /**
     * 跳转到关联下钻列表
     * @return
     */
    @JSON
    @RequestMapping("/glCommunityList")
    public  List<Map>  glCommunityList(String name){
        //新增
        List<Map> list = screenService.glCommunityList(name);


        return list;
    }


    /**
     * 案件坐标定位展示
     * @return
     */
    @JSON
    @RequestMapping("/glCaseList")
    public  List<Map>  glCaseList(String name){
        //新增
        List<Map> list2=new ArrayList<>();
        //展示
        List<Map> list = screenService.glCaseList(name);
        for (int i = 0; i < list.size(); i++) {
             Map map=list.get(i);
             String s=list.get(i).get("DISTRICTNAME").toString()+list.get(i).get("STREETNAME").toString();
             if(s.equals("吉州区习溪桥街道")){
                 map.put("x",114.982592);
                 map.put("y",27.122108);
             }else if(s.equals("吉州区二街街道")){//???
                 map.put("x",114.97829);
                 map.put("y",27.092633);
             }else if(s.equals("吉州区北门街道")){
                 map.put("x",114.982592);
                 map.put("y",27.122108);
             }else if(s.equals("吉州区古南街道")){
                 map.put("x",114.998605);
                 map.put("y",27.131434);
             }else if(s.equals("吉州区文山街道")){
                 map.put("x",114.992923);
                 map.put("y",27.113601);
             }else if(s.equals("吉州区樟山镇")){
                 map.put("x",115.051361);
                 map.put("y",27.186478);
             }else if(s.equals("吉州区永叔街道")){
                 map.put("x",114.992819);
                 map.put("y",27.108012);
             }else if(s.equals("吉州区白塘街道")){
                 map.put("x",114.978635);
                 map.put("y",27.126267);
             }else if(s.equals("庐陵新区滨江街道")){
                 map.put("x",115.018175);
                 map.put("y",27.115362);
             }else if(s.equals("庐陵新区禾埠乡政府")){
                 map.put("x",114.974037);
                 map.put("y",27.104343);
             }else if(s.equals("庐陵新区禾埠街道")){//  ?????
                 map.put("x",114.95223);
                 map.put("y",27.100417);
             }else if(s.equals("青原区天玉镇")){
                 map.put("x",115.067342);
                 map.put("y",27.14425);
             }else if(s.equals("青原区河东街道")){
                 map.put("x",115.033676);
                 map.put("y",27.096904);
             }

            list2.add(map);

        }



        return list2;
    }

    /**
     * 跳转到关联下钻(案件点击事件)
     * @return
     */
    @RequestMapping("/glindexCase")
    public String glindexCase(Model model,String name){
        model.addAttribute("name",name);
        //新增
        int listsize = screenService.glindexCaseListCount(name);
        int totalPageNum = (listsize  +  10  - 1) / 10;
        model.addAttribute("listsize",String.valueOf(totalPageNum));
        return "mm/bigscreen/glindexCase";
    }

    /**
     * 跳转到关联下钻(案件点击事件列表)
     * @return
     */
    @JSON
    @RequestMapping("/glindexCaseList")
    public  List<Map>  glindexCaseList(String name,String page){
        int pages=Integer.valueOf(page);
        if(null != page && !"".equals(page)){
            pages = (pages -1) * 10;
        }
        //新增 (page-1)*5
        List<Map> list = screenService.glindexCaseList(name,pages);


        return list;
    }

    /**
     * 跳转到关联下钻(案件点击查看)
     * @return
     */
    @JSON
    @RequestMapping("/glindexCaseid")
    public  Map  glindexCaseid(String id){
        Map map = screenService.glindexCaseid(id);
        return map;
    }



    /**
     * 井盖 列表
     * @return
     */
    @JSON
    @RequestMapping("/glindexManholeis")
    public  List<Map>  glindexManholeis(String id){
        List<Map> list = screenService.glindexManholeis();

        return list;
    }




    public static CoordinateTransform coordtrans() {

        CRSFactory targetFactory = new CRSFactory();
        CRSFactory crsFactory = new CRSFactory();
        //目标坐标系统
        String target_param =  "+proj=longlat +datum=WGS84 +no_defs ";
        CoordinateReferenceSystem target = targetFactory.createFromParameters("wgs84", target_param);
        //源坐标系统
        String xian80_param = "+proj=longlat +a=6378140 +b=6356755.288157528 +towgs84=115.8,-154.4,-82.3,0,0,0,8 +no_defs ";
        CoordinateReferenceSystem xian80 = crsFactory.createFromParameters("xian80", xian80_param);

        CoordinateTransformFactory ctf = new CoordinateTransformFactory();
        CoordinateTransform transform = ctf.createTransform(xian80, target);
        return transform;
    }




    public static double[] GaussToBL(double X, double Y)//, double *longitude, double *latitude)

    {
        int ProjNo; int ZoneWide; ////带宽
        double[] output = new double[2];
        double longitude1,latitude1, longitude0, X0,Y0, xval,yval;//latitude0,
        double e1,e2,f,a, ee, NN, T,C, M, D,R,u,fai, iPI;
        iPI = 0.0174532925199433; ////3.1415926535898/180.0;
        //a = 6378245.0; f = 1.0/298.3; //54年北京坐标系参数
        a=6378140.0; f=1/298.257; //80年西安坐标系参数
        ZoneWide = 6; ////6度带宽
        ProjNo = (int)(X/1000000L) ; //查找带号
        longitude0 = (ProjNo-1) * ZoneWide + ZoneWide / 2;
        longitude0 = longitude0 * iPI ; //中央经线


        X0 = ProjNo*1000000L+500000L;
        Y0 = 0;
        xval = X-X0; yval = Y-Y0; //带内大地坐标
        e2 = 2*f-f*f;
        e1 = (1.0-Math.sqrt(1-e2))/(1.0+Math.sqrt(1-e2));
        ee = e2/(1-e2);
        M = yval;
        u = M/(a*(1-e2/4-3*e2*e2/64-5*e2*e2*e2/256));
        fai = u+(3*e1/2-27*e1*e1*e1/32)*Math.sin(2*u)+(21*e1*e1/16-55*e1*e1*e1*e1/32)*Math.sin(
                4*u)
                +(151*e1*e1*e1/96)*Math.sin(6*u)+(1097*e1*e1*e1*e1/512)*Math.sin(8*u);
        C = ee*Math.cos(fai)*Math.cos(fai);
        T = Math.tan(fai)*Math.tan(fai);
        NN = a/Math.sqrt(1.0-e2*Math.sin(fai)*Math.sin(fai));
        R = a*(1-e2)/Math.sqrt((1-e2*Math.sin(fai)*Math.sin(fai))*(1-e2*Math.sin(fai)*Math.sin(fai))*(1-e2*Math.sin
                (fai)*Math.sin(fai)));
        D = xval/NN;
        //计算经度(Longitude) 纬度(Latitude)
        longitude1 = longitude0+(D-(1+2*T+C)*D*D*D/6+(5-2*C+28*T-3*C*C+8*ee+24*T*T)*D
                *D*D*D*D/120)/Math.cos(fai);
        latitude1 = fai -(NN*Math.tan(fai)/R)*(D*D/2-(5+3*T+10*C-4*C*C-9*ee)*D*D*D*D/24
                +(61+90*T+298*C+45*T*T-256*ee-3*C*C)*D*D*D*D*D*D/720);
        //转换为度 DD
        output[0] = longitude1 / iPI;
        output[1] = latitude1 / iPI;
        return output;
        //*longitude = longitude1 / iPI;
        //*latitude = latitude1 / iPI;
    }


    public static void main(String[] args) {

        GaussToBL(38596678.490000,2999936.770000);

    }
}
