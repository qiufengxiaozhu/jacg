package com.zte.zudp.admin.info.comment;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 问题回复管理
 * @author hjm
 */

@Controller
@EndpointModule(id="CommentManage",name = "微信市民评论管理", order = 330,icon = "home")
@RequestMapping("/CommentMenu")
public class CommentMenu {

    /**
     *查看问题回复列表
     * @return
     */
    @Menu
    @GetMapping("/commentList")
    @EndpointPage(id = "commentList", name = "市民评论管理", order = 1,icon = "cog")
    public String commentList() {
        return "/info/comment/commentList";
    }



}
