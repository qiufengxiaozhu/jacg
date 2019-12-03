package com.zte.zudp.admin.mm.news.ctrl;

import com.zte.zudp.admin.info.news.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping(value = "/mm/news")
public class MMNewsController {

    @Autowired
    private NewsService newsService;


    @GetMapping("/mmNews")
    public String mmNews(Model model) {
        return "/mm/news/mmNews";
    }
}
