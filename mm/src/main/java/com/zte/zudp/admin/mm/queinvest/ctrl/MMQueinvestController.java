package com.zte.zudp.admin.mm.queinvest.ctrl;

import com.zte.zudp.admin.common.persistence.Result;
import com.zte.zudp.admin.common.persistence.Subject;
import com.zte.zudp.admin.common.security.SubjectUtil;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.info.queinvest.entity.Answers;
import com.zte.zudp.admin.info.queinvest.entity.Queinvest;
import com.zte.zudp.admin.mm.queinvest.entity.MMQueinvest;
import com.zte.zudp.admin.mm.queinvest.service.MMQueinvestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;
import java.util.*;

/**
 * 公众调查
 */

@Controller
@RequestMapping(value = "/mm/queinvest")
public class MMQueinvestController {

    @Autowired
    private MMQueinvestService mmQueinvestService;


    /**
     * 问卷列表
     * @param model
     * @return
     */
    @RequestMapping("/survey")
    public String survey(Model model,HttpServletRequest request) {
        // 获取到登录人的手机号
        Object userPhone = request.getSession().getAttribute("userPhone");
        List<MMQueinvest> queinvestList=mmQueinvestService.selectAll(userPhone);
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
        List<MMQueinvest> list = mmQueinvestService.startQueinvest(id);

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

    @RequestMapping(value = "/test",method = RequestMethod.POST)
    public String test(@RequestParam Map<String ,Object> map, HttpServletRequest request, HttpServletResponse response) {
            // 获取到手机号
        Object userPhone = request.getSession().getAttribute("userPhone");
        // 获取到用户名称
        Object userName = request.getSession().getAttribute("userName");

        // 题目数量
            int queSize = 0;
            // 获取到问卷id
        String queinvestId = map.get("queiId").toString();
            // 存放查询出来的结果
            List<MMQueinvest> list= new ArrayList();
            try {
                if (map.get("queSize") != null) { // 题目数量不为空
                    queSize = Integer.parseInt((String) map.get("queSize"));

                }
                // 让题目数量为长度，进行遍历
                for (int i = 1; i <= queSize; i++) {
                    // 获得到每个被选中的单选按钮的值  选项内容
                     if(map.get(i+"") != null){
                         // 所选的选项内容
                         String str = map.get(i+"").toString();
                         // queId：题目的id
                        String queId =  map.get(i+"queId").toString();
                         // 调用service层，查询出此答案所对应的题目
                        MMQueinvest answer = mmQueinvestService.selectAllByAnswer(str,queId);
                        answer.setOptContext(str);
                        answer.setQuestionId(queId);
                        // 将查询出来的结果放入到list中
                        list.add(answer);
                     }
                }
                System.out.println(list);
                // 遍历list，将它插入到答案表中
                for(int i = 0;i<list.size();i++){ //得到的问卷名称

//                    String queinvestId = list.get(i).getQueinvestId(); // 问卷id
                    String questionId =  list.get(i).getQuestionId(); // 题目id
                    String optContext = list.get(i).getOptContext(); // 所选的答案
                    //生成一个无序的uuid
                    String id = UUID.randomUUID().toString();
                    // 将其插入到答案表中
                    mmQueinvestService.insertToAnswer(id,queinvestId,questionId,optContext,userPhone,userName);

                }

            }catch (Exception e){
                e.printStackTrace();
            }


            return "redirect:/mm/news/index";

        }



}
