package com.zte.zudp.admin.mm.complain.controller;

import com.zte.zudp.admin.common.persistence.Result;
import com.zte.zudp.admin.mm.complain.entity.MMComplainEntity;
import com.zte.zudp.admin.mm.complain.service.MMComplainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.parser.Entity;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @Description ${}
 * @Author DeptController
 * @Date 2019/11/26 11:45
 **/
@Controller
@RequestMapping(value = "/mm/news")
public class MMComplainController {

    @Autowired
    private MMComplainService service;

    /**
     * myComplain 个人投诉主页
     * @return
     */
    @GetMapping("/myComplain")
    public String myComplain(@ModelAttribute("contactUser") String contactUser, Model model) {

        System.out.println("@ModelAttribute(\"contactUser\") String contactUser : " + contactUser);
        //如果是从 /mm/news/index 过来的 contact == ""，因为我也不知道怎么把用户账号信息写好
        if (contactUser == null || contactUser.equals(""))
            contactUser = "123";

        List<MMComplainEntity> contactUserList = service.getAllByContactUser(contactUser);


        model.addAttribute("contactUser", contactUser);
        model.addAttribute("complainEntity",contactUserList);

        return "/mm/complain/myComplain";
    }

    /**
     * 某条 投诉的具体详情
     * @param map
     * @param model
     * @return
     */
    @RequestMapping(value = "/detail", method = RequestMethod.POST)
    public String complainDetail(@RequestParam Map<String, Object> map,
                                 Model model) {
        String id = (String) map.get("id");
        String contactUser = (String) map.get("contactUser");
        MMComplainEntity complainEntity = null;
        if (id != null && !id.equals(""))
            complainEntity = service.getOneById(id);
        model.addAttribute("contactUser", contactUser);
        model.addAttribute("entity", complainEntity);
        return "/mm/complain/detailComplain";
    }

    /**
     * myComplain 添加投诉
     * @param map 投诉人账户信息 投诉人账户信息的 id
     * @return
     */
    @RequestMapping(value = "/addComplain", method = RequestMethod.POST)
    public String addComplain(@RequestParam Map<String, Object> map,
                              Model model) {
        model.addAttribute("contactUser", map.get("contactUser"));

        return "/mm/complain/addComplain";
    }

    /**
     * 处理 新增投诉
     * @param complainEntity
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/addComplaining", method = RequestMethod.POST)
    public String addComplaining(MMComplainEntity complainEntity,
                                 RedirectAttributes redirectAttributes) {
        System.out.println(complainEntity);
        int i = service.saveOne(complainEntity);
        System.out.println("--------------------------" + i);

        redirectAttributes.addFlashAttribute("contactUser", complainEntity.getContactUser());

        return "redirect:/mm/news/myComplain";
    }

    /**
     * 从 详情页面返回到 我的详情
     * @param map
     * @return
     */
    @RequestMapping(value = "retMyComplain", method = RequestMethod.POST)
    public String retMyComplain(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("contactUser", map.get("contactUser"));
        return "redirect:/mm/news/myComplain";
    }
}
