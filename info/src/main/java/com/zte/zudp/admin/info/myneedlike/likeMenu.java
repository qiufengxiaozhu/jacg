package com.zte.zudp.admin.info.myneedlike;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 我要点赞<br />
 * 本类存放 <strong>我要点赞</strong> 相关的所有页面跳转
 *
 * @author piumnl
 * @version 1.0.0
 * @since on 2018-02-05.
 */
@Controller
@EndpointModule(id = "likeMenu", name = "我要点赞", order = 60, icon = "home")
@RequestMapping("/likeMenu")
public class likeMenu {
}
