package com.zte.zudp.admin.info.issueReport.ctrl;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.persistence.Subject;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.common.security.SubjectUtil;
import com.zte.zudp.admin.info.issueReport.IssueReplyMenu;
import com.zte.zudp.admin.info.issueReport.entity.IssueReply;
import com.zte.zudp.admin.info.issueReport.svr.IssueReplyService;
import com.zte.zudp.admin.info.report.ReportMenu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 公众上报controller
 * @author
 */
@RestController
@EndpointModule(name = "问题回复管理", id = "issueReply", parent = IssueReplyMenu.class, order = 1, icon = "bookmark")
@RequestMapping("/issueReply")
public class IssueReplyController extends AbstractCRUDController<IssueReply> {
   @Autowired
   private IssueReplyService issueReplyService;
    /**
     * 获取问题上报信息的附件
     * @param id
     * @return
     */
    @RequestMapping("/getFj")
    @ResponseBody
    public IssueReply getFj(String id, HttpServletRequest request){
        // 获取到登录人名称
        String loginName = SubjectUtil.getSubject().getLoginName();
        if(loginName!= null){
            request.getSession().setAttribute("loginName",loginName);
            issueReplyService.insertIntoIssueReply(loginName,id);
        }
        IssueReply issueReply = issueReplyService.get(id);
        return issueReply;
    }
}
