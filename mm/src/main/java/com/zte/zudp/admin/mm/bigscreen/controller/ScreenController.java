package com.zte.zudp.admin.mm.bigscreen.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.mm.bigscreen.entity.Screen;
import com.zte.zudp.admin.mm.bigscreen.service.ScreenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

        //显示最近一个月数据，显示三条
        List<Screen> screenList =  screenService.selectCase();

        //统计每个区的最近一个月数据
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

        //四个区最近一个月案发总数
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


        List strList001 = new ArrayList();
        List strList002 = new ArrayList();
        List strList003= new ArrayList();
        List strList004= new ArrayList();

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
                        strList001.add(list.get(i).get("month").toString());
                        // 存放到map中
                    }else if(list.get(i).get("dest").equals("青原区")){ //
                    // 存放到数组中
                    strList02.add(list.get(i).get("num").toString());
                    strList002.add(list.get(i).get("month").toString());
                }else if(list.get(i).get("dest").equals("吉州区")){ //
                        // 存放到数组中
                        strList03.add(list.get(i).get("num").toString());
                        strList003.add(list.get(i).get("month").toString());
                    }else if(list.get(i).get("dest").equals("井开区")){ //
                        // 存放到数组中
                        strList04.add(list.get(i).get("num").toString());
                        strList004.add(list.get(i).get("month").toString());
                    }
            }
        }
        // 每个区的纵坐标
        map.put("strList01",strList01);
        map.put("strList02",strList02);
        map.put("strList03",strList03);
        map.put("strList04",strList04);

        // 每个区的横坐标
        map.put("strList001",strList001);
        map.put("strList002",strList002);
        map.put("strList003",strList003);
        map.put("strList004",strList004);






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

}
