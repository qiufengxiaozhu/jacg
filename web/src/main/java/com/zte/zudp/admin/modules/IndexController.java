package com.zte.zudp.admin.modules;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.zte.zudp.admin.modules.sys.user.entity.User;
import com.zte.zudp.admin.modules.sys.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zte.zudp.admin.common.Constants;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.config.CacheManager;
import com.zte.zudp.admin.common.enums.AuthorizedType;
import com.zte.zudp.admin.common.enums.CacheName;
import com.zte.zudp.admin.common.interceptor.AbstractLoginInterceptor;
import com.zte.zudp.admin.common.persistence.Result;
import com.zte.zudp.admin.common.security.SubjectContext;
import com.zte.zudp.admin.common.util.CaptchaUtil;
import com.zte.zudp.admin.common.util.LoggerUtil;
import com.zte.zudp.admin.common.util.StringUtil;
import com.zte.zudp.admin.common.util.WebUtil;
import com.zte.zudp.admin.modules.sys.config.LoginInterceptor;

/**
 * 后台首页
 *
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-01-11.
 */
@Controller
@EndpointModule(id = "index", name = "首页", authorizedType = AuthorizedType.LOGIN)
public class IndexController {

    @Value("${zudp.register.enable}")
    private Boolean registerEnable;

    private static final String USER_CHANGE_PASSWORD_ = "user_change_password_";

    @Autowired
    private UserService userService;

    /**
     * 后台首页
     */
    @GetMapping("")
    @EndpointPage(id = "home", name = "后台首页")
    public String home() {
        return "home";
    }

    /**
     * 后台首页
     */
    @GetMapping("index")
    @EndpointPage(id = "welcome", name = "欢迎页")
    public String index() {
        return "index";
    }

    /**
     * 登录页
     */
    @GetMapping("login")
    @EndpointPage(id = "login", name = "登录页", authorizedType = AuthorizedType.GUEST)
    public String login(Model model, HttpServletRequest request) {
        model.addAttribute("error", request.getAttribute(AbstractLoginInterceptor.LOGIN_FAIL));
        model.addAttribute("enabledCaptcha", CacheManager.get(CacheName.PASSWORD_ERROR_COUNT,
                LoginInterceptor.ERROR_SHOW_CAPTCHA + request.getParameter("loginName")));
        return "login";
    }

    /**
     * 登录页
     */
    @PostMapping("login")
    @EndpointPage(id = "showLogin", name = "展现登录页", authorizedType = AuthorizedType.GUEST)
    public String login(Model model, HttpServletRequest request, HttpServletResponse response) {
        return login(model, request);
    }

    /**
     * 退出登录，重定向到登录页
     *
     * @throws IOException
     */
    @GetMapping(Constants.Permission.URI_LOGOUT)
    @EndpointPage(id = "logout", name = "退出登录")
    public void logout(HttpServletResponse response, HttpServletRequest request) throws IOException {
        if (SubjectContext.getSubject() != null) {
            SubjectContext.unbindSubject();
        }

        //退出登陆使cookie失效
        for (Cookie cookie : request.getCookies()) {
            if (LoginInterceptor.REMEMBER_ME_KEY.equals(cookie.getName())) {
                cookie.setValue(null);
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                break;
            }
        }
        response.sendRedirect(Constants.Permission.URI_LOGIN);
    }

    /**
     * 退出登录，返回 json 消息
     *
     * @param response .
     * @throws IOException .
     */
    @RequestMapping(value = Constants.Permission.URI_LOGOUT, method = RequestMethod.POST)
    @EndpointPage(id = "logoutPost", name = "退出登录消息")
    public void postLogout(HttpServletResponse response) throws IOException {
        // POST 操作，返回退出成功的信息
        if (SubjectContext.getSubject() != null) {
            SubjectContext.unbindSubject();
        }

        byte[] message = WebUtil.buildMessage(Result.success("退出登录成功！"));
        response.getOutputStream().write(message);
    }

    /**
     * 验证码
     *
     * @param response
     * @param session
     * @throws IOException
     */
    @GetMapping("img/captcha")
    @EndpointPage(id = "captcha", name = "验证码", authorizedType = AuthorizedType.GUEST)
    public void captcha(HttpServletResponse response, HttpSession session) throws IOException {
        String png = CaptchaUtil.create(120, 30, "png", response.getOutputStream());
        session.setAttribute(LoginInterceptor.CAPTCHA, png);
    }


    /**
     * 手机端验证码
     *
     * @param response
     * @param request  需要传递一个id参数 也就是uuid
     * @throws IOException
     */
    @GetMapping("img/phoneCaptcha")
    @EndpointPage(id = "phoneCaptcha", name = "手机端验证码", authorizedType = AuthorizedType.GUEST)
    public void phoneCaptcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("codeId");
        String png = CaptchaUtil.phoneCreate(120, 30, "png", response.getOutputStream(), 5);
        CacheManager.put(CacheName.PHONE_LOGIN_CAPTCHA, id, png);
    }

    /**
     * 修改密码页面
     *
     * @param id    用户id
     * @param code  操作标识
     * @param model
     * @return html
     */
    @GetMapping("/changePasswordViews")
    @EndpointPage(id = "changePasswordViews", name = "修改密码页面", authorizedType = AuthorizedType.GUEST)
    public String changePasswordViews(@RequestParam(value = "id") String id,
                                      @RequestParam(value = "code") String code,
                                      Model model) {
        User user = userService.get(id);
        if (user != null) {
            if (!StringUtil.equals(CacheManager.get(CacheName.TIMEOUT_THIRTY_MIN_CACHE,
                    USER_CHANGE_PASSWORD_ + id) + "", code)) {
                return "/login";
            } else {
                model.addAttribute("id", id);
                model.addAttribute("code", code);
                return "/admin/changePassword";
            }
        } else {
            return "/login";
        }
    }

    @GetMapping(Constants.Permission.URI_NOT_FOUND)
    public ModelAndView notFound() {
        return new ModelAndView("/common/404");
    }

    @GetMapping(Constants.Permission.URI_BAD_REQUEST)
    public ModelAndView badRequest() {
        return new ModelAndView("/common/400");
    }

    /* **************************************** 首页 **************************************** */

    /**
     * 用户激活
     * 更新：激活之前先查询数据库 2018.3.8
     *
     * @param id    用户id
     * @param model
     * @return
     */
    @GetMapping("/sys/userActive/{id}")
    @EndpointPage(id = "userActive", name = "激活用户", authorizedType = AuthorizedType.GUEST)
    public String active(@PathVariable String id, Model model) {
        if (!registerEnable) {
            return "common/404";
        }

        String[] idnUuid = id.split("_");
        User user = userService.get(idnUuid[0]);
        if (user != null && user.getStatus() == User.STATUS_INACTIVATED) {
            Object o = CacheManager.get(CacheName.TIMEOUT_THIRTY_MIN_CACHE,
                    Constants.CACHE_KEY_NAME.ACTIVE_USER + idnUuid[0]);
            if (o == null) {
                WebUtil.setJumpTipViewModel(model, "激活失败", "邮件已经过期，是否补发一份激活邮件...", "/sys/checkUserAgain/" + id, "补发一封", false);
                return "jumpTip";
            }

            if (o instanceof String && o.equals(idnUuid[1])) {
                try {
                    userService.doActive(Long.valueOf(idnUuid[0]));
                    WebUtil.setJumpTipViewModel(model, "激活成功", "正在为你跳转到登录页...", "/login", "登陆页");
                } catch (Exception e) {
                    WebUtil.setJumpTipViewModel(model, "激活失败", "正在为你跳转到登录页...", "/login", "登陆页");
                }
            } else {
                WebUtil.setJumpTipViewModel(model, "激活失败", "正在为你跳转到登录页...", "/login", "登陆页");
            }
            return "jumpTip";
        } else {
            WebUtil.setJumpTipViewModel(model, "激活失败", "正在为你跳转到登录页...", "/login", "登陆页");
            return "jumpTip";
        }
    }

    @GetMapping("/sys/checkUserAgain/{userId}")
    @EndpointPage(name = "再次确认邮箱", id = "checkAgain", authorizedType = AuthorizedType.GUEST)
    public String checkAgain(Model model, @PathVariable String userId) {
        if (registerEnable) {
            try {
                String[] idnUuid = userId.split("_");
                userService.sendcheckEmailAgain(idnUuid[0]);
                WebUtil.setJumpTipViewModel(model, "邮件已发送，请注意查收", "正在为你跳转到登陆页面...", "/login", "登陆页");
            } catch (IOException | MessagingException e) {
                LoggerUtil.getSysLogger().warn(e.getMessage());
                WebUtil.setJumpTipViewModel(model, "邮件发送失败，请联系管理员", "正在为你跳转到登陆页面...", "/login", "登陆页");
            }
            return "jumpTip";
        } else {
            return "common/404";
        }
    }

    /**
     * 邮件检测
     *
     * @return
     */
    @GetMapping(value = "/sys/changePasswordView")
    @EndpointPage(id = "changePasswordView", name = "验证邮件", authorizedType = AuthorizedType.GUEST)
    public String changePasswordView(@RequestParam(value = "id") String id,
                                     @RequestParam(value = "code") String code, Model model) {
        boolean goView = userService.checkEmailUsered(id, code);
        if (!goView) {
            WebUtil.setJumpTipViewModel(model, "验证失败", "正在为你跳转到登陆页面...", "/login", "登陆页");
        } else {
            WebUtil.setJumpTipViewModel(model, "验证成功", "正在为你跳转到密码修改页面...",
                    "/changePasswordViews?id=" + id + "&code=" + code, "密码修改页");
        }
        return "jumpTip";
    }

}
