package com.zte.zudp.admin.mm.complain.controller;

import com.zte.zudp.admin.mm.complain.entity.MMComplainEntity;
import com.zte.zudp.admin.mm.complain.service.MMComplainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @Description ${}
 * @Author DeptController
 **/
@Controller
@RequestMapping(value = "/mm/complain")
public class MMComplainController {

    @Autowired
    private MMComplainService service;

    /**
     * myComplain 个人投诉主页
     * @return
     */
    @GetMapping("/myComplain")
//    public String myComplain(@ModelAttribute("contactUser") String contactUser, Model model) {
//    @ModelAttribute("contactUser") String contactUser,
    public String myComplain(Model model, HttpSession session) {

        String phone = session.getAttribute("userPhone").toString();
        //如果是从 /mm/news/index 过来的 contact == ""，因为我也不知道怎么把用户账号信息写好
//        if (contactUser == null || contactUser.equals(""))
//            contactUser = "123";
        System.out.println(phone);
        if (phone == null || phone.equals(""))
            phone = "123456";
        MMComplainEntity entity = new MMComplainEntity();
//        entity.setContactUser(contactUser);
        //contactUser
        entity.setContactUser(phone);
        List<MMComplainEntity> contactUserList = service.findList(entity);


        model.addAttribute("contactUser", phone);
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
            complainEntity = service.get(id);
        model.addAttribute("contactUser", contactUser);
        model.addAttribute("entity", complainEntity);
        return "/mm/complain/detailComplain";
    }

    /**
     * myComplain 添加投诉
     * @param map 投诉人账户信息 投诉人账户信息的 id
     * @return
     */
    @RequestMapping(value = "/addComplain", method = RequestMethod.GET)
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
        if (complainEntity.getContactUser() == null || "".equals(complainEntity.getContactUser()))
            complainEntity.setContactUser("123");
        int i = service.saveOne(complainEntity);
//        redirectAttributes.addFlashAttribute("contactUser", complainEntity.getContactUser());

//        return "redirect:/mm/complain/myComplain";
        return "redirect:/mm/news/index";
    }

    /**
     * 从 详情页面返回到 我的详情
     * @param map
     * @return
     */
    @RequestMapping(value = "retMyComplain")
    public String retMyComplain(@RequestParam Map<String, Object> map,
                                RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("contactUser", map.get("contactUser"));
        return "redirect:/mm/complain/myComplain";
    }


    //字符串过长，裁切掉
    private List<MMComplainEntity> transform(List<MMComplainEntity> list) {
        for (MMComplainEntity entity : list) {
            String title = entity.getTitle();
            if (title != null && !title.equals(""))
                if (title.length() > 12)
                    title = title.substring(0, 12) + "...";
            entity.setTitle(title);

            String description = entity.getDescription();
            if (description != null && !description.equals(""))
                if (description.length() > 12)
                    description = description.substring(0, 24) + "...";
            entity.setDescription(description);
        }
        return list;
    }
}
