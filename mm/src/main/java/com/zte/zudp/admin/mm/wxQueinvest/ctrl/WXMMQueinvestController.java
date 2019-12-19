package com.zte.zudp.admin.mm.wxQueinvest.ctrl;

import com.zte.zudp.admin.mm.queinvest.entity.MMQueinvest;
import com.zte.zudp.admin.mm.queinvest.service.MMQueinvestService;
import com.zte.zudp.admin.mm.wxQueinvest.entity.WXMMQueinvest;
import com.zte.zudp.admin.mm.wxQueinvest.service.WXMMQueinvestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 公众调查
 */

@Controller
@RequestMapping(value = "/mm/wxqueinvest")
public class WXMMQueinvestController {

    @Autowired
    private WXMMQueinvestService wxmmQueinvestService;


    /**
     * 问卷列表  预留入口   首页先跳转到此控制器(点击问卷管理)---->然后进入问卷调查列表页面---
     * @param model
     * @return
     */
    @RequestMapping("/survey")
    public String survey(Model model) {
        List<WXMMQueinvest> queinvestList=wxmmQueinvestService.selectAll();
        model.addAttribute("queinvestList",queinvestList);
        return "mm/news/survey";
    }

    /**
     * 问卷页面展示 (开始答卷)
     * @param model
     * @return
     */
    @RequestMapping("/startQueinvest/{id}")
    public String startQueinvest(Model model,@PathVariable("id")String id) {
        List<WXMMQueinvest> list = wxmmQueinvestService.startQueinvest(id);

        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getTitle() != null) {
                String title = list.get(i).getTitle().toString();
                model.addAttribute("title", title);
            }
        }
            model.addAttribute("list", list);

            return "mm/queinvest/queinvestDetail";
        }




    /**
     * 得到答案 并且插入到数据库（答案表）中
     * @param map
     * @return
     */
    @GetMapping("/test")
        public String test(@RequestParam Map<String ,Object> map) {
        // 题目数量
            int queSize = 0;
            // 存放查询出来的结果
            List<WXMMQueinvest> list= new ArrayList();
            String str002 = map.get("1").toString();
            try {
                if (map.get("queSize") != null) { // 题目数量不为空
                    queSize = Integer.parseInt((String) map.get("queSize"));

                }
                // 让题目数量为长度，进行遍历
                for (int i = 1; i <= queSize; i++) {
                    // 获得到每个被选中的单选按钮的值  选项内容
                     if(map.get(i+"") != null){
                         String str = map.get(i+"").toString();
                         // 调用service层，查询出此答案所对应的题目和问卷
                        WXMMQueinvest answer = wxmmQueinvestService.selectAllByAnswer(str);
                        answer.setOptContext(str);
                        // 将查询出来的结果放入到list中
                        list.add(answer);
                     }
                }
                System.out.println(list);
                // 遍历list，将它插入到答案表中
                for(int i = 0;i<list.size();i++){ //得到的问卷名称

                    String queinvestId = list.get(i).getQueinvestId(); // 问卷id
                    String questionId =  list.get(i).getQuestionId(); // 题目id
                    String optContext = list.get(i).getOptContext(); // 所选的答案
                    //生成一个无序的uuid
                    String id = UUID.randomUUID().toString();
                    // 将其插入到答案表中
                    wxmmQueinvestService.insertToAnswer(id,queinvestId,questionId,optContext);

                }

            }catch (Exception e){
                e.printStackTrace();
            }


            return "/mm/news/index";

        }



}
