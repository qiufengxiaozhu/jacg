package com.zte.zudp.admin.info.issueReport;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointPage;
import com.zte.zudp.admin.common.annotation.endpoint.Menu;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 问题回复管理
 * @author hjm
 */

@Controller
@EndpointModule(id="issueReplyManage",name = "问题回复管理", order = 2,icon = "home")
@RequestMapping("/replyMenu")
public class IssueReplyMenu {

    /**
     *查看问题回复列表
     * @return
     */
    @Menu
    @GetMapping("/replyList")
    @EndpointPage(id = "replyList", name = "问题答复列表", order = 1,icon = "cog")
    public String reportsList() {
        return "/info/issueReply/issueReplyList";
    }



}
