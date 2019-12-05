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

    @GetMapping("/newsDetail")
    public String newsDetail(Model model,String type) {
        model.addAttribute("type",type==null?"":type);
        return "/mm/news/news-detail";
    }

    /**
     * 首页
     * @param model
     * @return
     */
    @GetMapping("/index")
    public String index(Model model) {
        return "/mm/news/index";
    }

    /**
     * 便民服务
     * @param model
     * @return
     */
    @GetMapping("/conven")
    public String conven(Model model) {
        return "/mm/news/convenience";
    }

    /**
     * 公众咨询
     * @param model
     * @return
     */
    @GetMapping("/advisory")
    public String advisory(Model model) {
        return "/mm/news/advisory";
    }


    /**
     * 排行榜
     * @param model
     * @return
     */
    @GetMapping("/ranking")
    public String ranking(Model model) {
        return "/mm/news/ranking";
    }
    /**
     * 公众调查
     * @param model
     * @return
     */
    @GetMapping("/survey")
    public String survey(Model model) {
        return "/mm/news/survey";
    }

    /**
     * 个人中心
     * @param model
     * @return
     */
    @GetMapping("/pcenter")
    public String pcenter(Model model) {
        return "/mm/news/pcenter";
    }

    /**
     * 我的投诉
     * @param model
     * @return
     */
    @GetMapping("/mytousu")
    public String mytousu(Model model) {
        return "/mm/advice/my-tousu";
    }
    /**
     * 投诉详情
     * @param model
     * @return
     */
    @GetMapping("/tsdetail")
    public String tsdetail(Model model) {
        return "/mm/advice/tsdetail";
    }

    /**
     * 公众投诉
     * @param model
     * @return
     */
    @GetMapping("/toadvice")
    public String toadvice(Model model) {
        return "/mm/advice/to-advice";
    }


    /**
     * 调查详情
     * @param model
     * @return
     */
    @GetMapping("/investigation")
    public String investigation(Model model) {
        return "/mm/invest/investigation";
    }
}
