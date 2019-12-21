package com.zte.zudp.admin.mm.comment.controller;

import com.zte.zudp.admin.common.annotation.JSON;
import com.zte.zudp.admin.common.persistence.Subject;
import com.zte.zudp.admin.common.security.SubjectUtil;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.mm.comment.entity.MMComment;
import com.zte.zudp.admin.mm.comment.service.MMCommentService;
import com.zte.zudp.admin.mm.issueReport.entity.MMIssueReport;
import com.zte.zudp.admin.mm.issueReport.service.MMIssueReportService;
import org.apache.commons.collections4.Get;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.xml.namespace.QName;
import javax.xml.stream.Location;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.Characters;
import javax.xml.stream.events.Comment;
import javax.xml.stream.events.EndElement;
import javax.xml.stream.events.StartElement;
import java.io.Writer;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description ${}
 * @Author MMCommentController
 * @Date 2019/12/19 11:39
 **/
@Controller
@RequestMapping(value = "/mm/comment")
public class MMCommentController {


    @Autowired
    private MMCommentService mmCommentService;

    @Autowired
    private MMIssueReportService mmIssueReportService;

    /**
     * 查询所有问题上报
     */
    @RequestMapping(value = "/selectAll", method = RequestMethod.GET)
    public String selectAll(Model model){

        List<Map> list =  mmCommentService.selectAll();
        model.addAttribute("Comment",list);
        return "/mm/comment/commentlist";
    }

    /**
     * 根据具体的问题上报查询具体的市民评论,附加评论显示
     */
    @RequestMapping(value = "/getDetail", method = RequestMethod.POST)
    public String getDetail(@RequestParam Map<String, Object> map, Model model, HttpSession session){

        //获取session域中的值
        String name = session.getAttribute("userName").toString();
        String phone = session.getAttribute("userPhone").toString();

        //获取上报列表中的id
        String id = (String) map.get("id");

        //传过来的id带有逗号（,），现在需要切割字符串
        String idStr = id.replaceAll(",","");

        //根据id查询具体的评论
        List<MMComment> commentList = mmCommentService.getDetail(idStr);

        //根据id查询具体的上报
//        Map  report = mmCommentService.getReport(idStr);
        MMIssueReport report = mmIssueReportService.get(idStr);
        //市民评论
        model.addAttribute("CommentList",commentList);
        //问题上报
        model.addAttribute("Report",report);

        return "/mm/comment/comment-detail";
    }

    /**
     * 增加评论
     */
    @JSON
    @RequestMapping(value = "/addComment",method = RequestMethod.GET)
    public String addComment(HttpSession session,String content,String reportId) {

        MMComment comment = new MMComment();
        Subject user = SubjectUtil.getSubject();

        comment.setId(String.valueOf(IDUtil.simpleId()));
        comment.setContent(content);
        comment.setName(session.getAttribute("userName").toString());
        comment.setPhone(session.getAttribute("userPhone").toString());
        comment.setClicks("0");
//        comment.setPublicTime(new Date().toString());
        comment.setFk_issuereportId(reportId);

        comment.setCreateUser(user);
        comment.setUpdateUser(user);
        comment.setCreateDate(new Date());
        comment.setUpdateDate(comment.getCreateDate());

        //新增评论
        int rows = mmCommentService.addComment(comment);
        if (rows>0){
            return "redirect:/mm/comment/selectAll";
        }
        return null;
    }

    /**
     * 点赞数加1
     */
    @JSON
    @RequestMapping(value = "/addClicks", method = RequestMethod.GET)
    public String addClicks(Model model,String commentId){

        int rows = mmCommentService.addClicks(commentId);
        if(rows > 0)
            return "redirect:/mm/comment/selectAll";

        return null;
    }

}
