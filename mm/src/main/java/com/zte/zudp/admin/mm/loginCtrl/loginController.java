package com.zte.zudp.admin.mm.loginCtrl;


import com.zte.zudp.admin.info.news.entity.News;
import com.zte.zudp.admin.mm.news.entity.MMNews;
import com.zte.zudp.admin.mm.news.service.MMNewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * 模拟登陆控制器
 * @Author lc
 * @Date 2019-12-16
 **/
@Controller
@RequestMapping(value = "/mm")
public class loginController {

    @Autowired
    private MMNewsService newsService;

    @GetMapping(value = "/login")
   public String  login(Model model, String userName, String userPhone){
        System.out.println("userName:"+userName+"userPhone:"+userPhone);
        HttpSession session = getRequest().getSession();
        session.setAttribute("userName",userName);
        session.setAttribute("userPhone",userPhone);
        session.setMaxInactiveInterval(30*60);
        System.out.println(session);

        //查询所有新闻
        List<MMNews> newslist = newsService.find_threeNews();
        model.addAttribute("Newslist",newslist);

        return "/mm/news/index";
   }

    private HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
    }



}
