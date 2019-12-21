package com.zte.zudp.admin.info.comment.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.persistence.Page;
import com.zte.zudp.admin.common.persistence.Subject;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.common.security.SubjectUtil;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.info.comment.CommentMenu;
import com.zte.zudp.admin.info.comment.entity.Comment;
import com.zte.zudp.admin.info.comment.service.CommentService;
import com.zte.zudp.admin.info.issueReport.IssueReplyMenu;
import com.zte.zudp.admin.info.issueReport.entity.IssueReply;
import com.zte.zudp.admin.info.issueReport.svr.IssueReplyService;
import org.apache.xmlbeans.impl.jam.mutable.MComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Description ${} 市民评论
 * @Author CommentController
 * @Date 2019/12/19 11:39
 **/

@RestController
@EndpointModule(name = "市民评论管理", id = "comment", parent = CommentMenu.class, order = 1, icon = "bookmark")
@RequestMapping("/comment")
public class CommentController extends AbstractCRUDController<Comment> {
    @Autowired
    private CommentService commentService;

    @Autowired
    private IssueReplyService issueReplyService;

    /**
     * 获取问题上报信息的附件
     * @param id
     * @return
     */
    @RequestMapping("/getFj")
    @ResponseBody
    public IssueReply getFj(String id){
        return issueReplyService.get(id);
    }

    /**
     * 获取该上报的所有评论
     */
    @RequestMapping(value = "/getComment",method = RequestMethod.GET)
    @ResponseBody
    public List<Comment> getComment( String id){

        List<Comment> commentList = commentService.getComment(id);

        return commentList;
    }
}
