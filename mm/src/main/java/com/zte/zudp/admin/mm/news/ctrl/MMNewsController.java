package com.zte.zudp.admin.mm.news.ctrl;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.util.EncryptUtil;
import com.zte.zudp.admin.common.util.WebUtil;
import com.zte.zudp.admin.mm.news.entity.MMNews;
import com.zte.zudp.admin.mm.news.service.MMNewsService;
import com.zte.zudp.admin.modules.sys.user.entity.User;
import com.zte.zudp.admin.modules.sys.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Enumeration;

@Controller
@RequestMapping(value = "/mm/news")
public class MMNewsController {

    @Autowired
    private MMNewsService newsService;

    @Autowired
    private UserService userService;



    /**
     * 查询所有新闻
     * @param model
     * @return
     */
    @GetMapping("/mmNews")
    public String mmNews(Model model,@RequestParam("timeZone") String timeZone) {

        //
        //        ArrayList<MMNews> newslist = newsService.find_allNews(timeZone);

        System.out.println(timeZone);

        ArrayList<MMNews> newslist = null;

        //查询所有新闻
        if("1".equals(timeZone) || timeZone == null) {
            newslist = newsService.find_allNews();
        }
        //根据时区查询所有新闻
        else{
            newslist = newsService.find_allNewsList(timeZone);
        }
        //动态获取IP地址
        Enumeration<NetworkInterface> allNetInterfaces = null;
        String resultIP=null;
        try {
            allNetInterfaces = NetworkInterface.getNetworkInterfaces();
        } catch (SocketException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        InetAddress ip = null;
        while (allNetInterfaces.hasMoreElements())
        {
            NetworkInterface netInterface = (NetworkInterface) allNetInterfaces.nextElement();
            System.out.println(netInterface.getName());
            Enumeration<InetAddress> addresses = netInterface.getInetAddresses();
            while (addresses.hasMoreElements())
            {
                ip = (InetAddress) addresses.nextElement();
                if (ip != null && ip instanceof Inet4Address)
                {
                    if(resultIP==null)
                        resultIP= ip.getHostAddress();
                    System.out.println("本机地址是："+ip.getHostAddress());
                    model.addAttribute("ResultIP",ip.getHostAddress());
                }
            }
        }


        model.addAttribute("Newslist",newslist);
        model.addAttribute("TimeZone",timeZone);

        return "/mm/news/mmNews";
    }

    /**
     * 根据id查找新闻
     * @param model
     * @param id
     * @param type
     * @return
     */
    @RequestMapping("/newsDetail/{obj}")
    public String newsDetail(Model model,@PathVariable("obj") String id ,String type) {

        //将该新闻的点击量+1
        newsService.add_newsClicks(id);

        //根据id查找新闻
        MMNews news = newsService.find_news(id);

//        System.out.println(news.getId()+"   "+news.getTitle()+"   "+news.getContent()+"   "+news.getNewsDate());

        model.addAttribute("type",type==null?"":type);
        model.addAttribute("News",news);

        return "/mm/news/news-detail";
    }

    /**
     * 根据发布时间查找新闻
     * @param model
     * @param newsDate
     * @return
     */
    @RequestMapping("/queryNews")
    public String queryNews(Model model, String newsDate,String TimeZone) {


//        System.out.println("日期："+newsDate+"  时区："+TimeZone);
        ArrayList<MMNews> newslist = null;
        if("1".equals(TimeZone)) {
            //根据发布时间查找新闻
            newslist = newsService.find_newsList(newsDate);
        }
        else{
            //根据发布时间及时区查找新闻
            newslist = newsService.find_newsTime(newsDate, TimeZone);
        }

        //动态获取IP地址
        Enumeration<NetworkInterface> allNetInterfaces = null;
        String resultIP=null;
        try {
            allNetInterfaces = NetworkInterface.getNetworkInterfaces();
        } catch (SocketException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        InetAddress ip = null;
        while (allNetInterfaces.hasMoreElements())
        {
            NetworkInterface netInterface = (NetworkInterface) allNetInterfaces.nextElement();
            System.out.println(netInterface.getName());
            Enumeration<InetAddress> addresses = netInterface.getInetAddresses();
            while (addresses.hasMoreElements())
            {
                ip = (InetAddress) addresses.nextElement();
                if (ip != null && ip instanceof Inet4Address)
                {
                    if(resultIP==null)
                        resultIP= ip.getHostAddress();
                    System.out.println("本机地址是："+ip.getHostAddress());
                    model.addAttribute("ResultIP",ip.getHostAddress());
                }
            }
        }

        model.addAttribute("Newslist",newslist);
        model.addAttribute("TimeZone",TimeZone);


//        return "forward:/mm/news/mmNews";
        return "/mm/news/mmNews";
    }

    /**
     * 首页
     * @param model
     * @return
     */
    @GetMapping("/index")
    public String index(Model model,@RequestParam(value = "TimeZone",required = false) String TimeZone,HttpServletRequest request) {

        HttpSession session = request.getSession();

        ArrayList<MMNews> newslist = null;

        //如果时区为1，查询所有区前三条新闻
        if("1".equals(TimeZone)) {

            newslist = newsService.find_threeNews();
            session.setAttribute("timeZone", "1");
        }else if(TimeZone == null ){

            //如果传过来的时区为空，获取之前session中时区的值
            Object newTimeZone = request.getSession().getAttribute("timeZone");
            if(newTimeZone.equals("1"))
                newslist = newsService.find_threeNews();
            else
                newslist = newsService.find_threeNewsTime(newTimeZone.toString());
        }
        //根据时区查询前三条新闻
        else{

            newslist = newsService.find_threeNewsTime(TimeZone);
            session.setAttribute("timeZone", TimeZone);
        }

        model.addAttribute("Newslist", newslist);

        return "/mm/news/index";
    }

    /**
     * 便民服务
     * @param model
     * @return
     */
    @GetMapping("/conven")
    public String conven(Model model) {

        return "forward:/mm/mmConvenient/getConvenientType";
    }

    /**
     * 我的咨询
     * @param model
     * @return
     */
    @GetMapping("/advisory")
    public String advisory(Model model) {

        return "/consult/myadvisory";
    }

    /**
     *公众咨询
     * @param model
     * @return
     */
    @GetMapping("/addadvisory")
    public String addadvisory(Model model){
        return "/mm/consult/add-advisory";
    }


    /**
     *我的上报
     * @param model
     * @return
     */
    @GetMapping("/report")
    public String report(Model model){
        return "/report/myreport";
    }

    /**
     * 我的上报（不加查询条件，查询所有人）
     */
    @GetMapping("/reportAll")
    public String reportAll(Model model){
        return "/report/allreport";
    }

    /**
     *公众上报
     * @param
     * @return
     */
    @GetMapping("/addreport")
    public String addreport(){
        //System.out.println(userName+"-->"+userPhone);

        //去数据库中匹配电话和用户名称
//        List<Map> list = mmReportService.checkUserAndPhone();

        return "/mm/report/add-report";
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
    @GetMapping("/myComplain")
    public String mytousu( Model model, @RequestParam("phone") String phone) {

        String telephone = "";
        //没有参数就写死

        if(phone != null || phone != ""){
            telephone = phone;
        }
        else {
            telephone = "110";
        }
        return "forward:/mm/complain/myComplain";
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
    @GetMapping("/addComplain")
    public String toadvice(Model model) {
        return "forward:/mm/complain/addComplain";
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
     * 注册页
     * @param model
     * @return
     */
    @GetMapping("/toreg")
    public String toreg(Model model,String laterurl) {

//        model.addAttribute("laterurl",laterurl==null?"":laterurl);
        return "/mm/reg";
    }

    /**
     * 登录  微信
     * @param t
     * @return
     */
    @JSON
    @PostMapping("/login")
    public String login(@RequestBody User t) {
        String username=t.getLoginName();
        String pwd=t.getPassword();
        String name = t.getName();
        String phone = t.getLoginName();
        HttpServletRequest request = WebUtil.getHttpRequest();
        // 根据手机号 查询出用户名称
        String name02 =null;
        if(newsService.findNameByTel(phone)!=null){
           name02 = newsService.findNameByTel(phone);
        }


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

        request.getSession(true).setAttribute("userName", phone);
        request.getSession(true).setAttribute("userPhone", phone);
        request.getSession(true).setAttribute("name02", name02);
        return "ok";

    }
    @JSON
    @PostMapping("/regsave")
    public String regsave(@RequestBody User t) {

        userService.save(t,false);
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
