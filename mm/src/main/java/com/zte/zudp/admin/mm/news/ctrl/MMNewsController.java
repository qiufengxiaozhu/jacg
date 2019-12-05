package com.zte.zudp.admin.mm.news.ctrl;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.util.EncryptUtil;
import com.zte.zudp.admin.common.util.StringUtil;
import com.zte.zudp.admin.common.util.WebUtil;
import com.zte.zudp.admin.info.news.service.NewsService;
import com.zte.zudp.admin.modules.sys.user.entity.User;
import com.zte.zudp.admin.modules.sys.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.security.auth.Subject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/mm/news")
public class MMNewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private UserService userService;


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
    public String pcenter(Model model,HttpServletRequest request) {
        User user =(User)request.getSession().getAttribute("mobile_user");
       //未登录
        if(user==null){
            return tologin(model,"/mm/news/pcenter");
        }
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

    /**
     * 登录页
     * @param model
     * @return
     */
    @GetMapping("/tologin")
    public String tologin(Model model,String laterurl) {

        model.addAttribute("laterurl",laterurl==null?"":laterurl);
        return "/mm/news/login";
    }

    /**
     * 登录
     * @param t
     * @return
     */
    @JSON
    @PostMapping("/login")
    public String login(@RequestBody User t) {
        String username=t.getLoginName();
        String pwd=t.getPassword();
        HttpServletRequest request = WebUtil.getHttpRequest();
        User user = userService.getUserWithNoActiveByLoginName(username);

        if (user == null) {
            //用户名不存在
            return "noperson";
        }

        if (user.getStatus() == User.STATUS_INACTIVATED) {
            //用户名未激活
            return "noactive";
        }
        char[] encrypt = EncryptUtil.encryptPassword(user.getLoginName(), pwd, user.getSalt());
        if (!new String(encrypt).equals(user.getPassword())) {
            //用户名或密码错误
            return "nomatch";
        }

        //设置session
        request.getSession(true).setAttribute("mobile_user", user);
        return "ok";

    }
    /**
     * 退出登录
     * @return
     */
    @JSON
    @GetMapping("/goout")
    public String goout() {
        HttpServletRequest request = WebUtil.getHttpRequest();

        //设置session
        request.getSession().removeAttribute("mobile_user");
        return "ok";

    }
}
