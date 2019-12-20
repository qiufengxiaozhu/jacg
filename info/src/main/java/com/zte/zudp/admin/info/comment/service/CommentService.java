package com.zte.zudp.admin.info.comment.service;

import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.info.comment.dao.CommentDao;
import com.zte.zudp.admin.info.comment.entity.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @Description ${}
 * @Author MMCommentService
 * @Date 2019/12/19 13:59
 **/
@Service
@Transactional
public class CommentService extends FileBusinessService<Comment> {

    @Autowired
    private CommentDao commentDao;

    /**
     * 根据具体的问题上报查询具体的评论
     */
    public List<Comment> getDetail(String id){

        List<Comment> list = commentDao.getDetail(id);

        return list;
    }

    /**
     * 查询所有问题上报
     * @return
     */
    public List<Map> selectAll() {
       return  commentDao.selectAll();
    }

    /**
     * 根据id查询具体问题上报
     * @param id
     * @return
     */
    public Map getReport(String id) {

        return commentDao.getReport(id);
    }

    /**
     * 新增评论
     * @param comment
     * @return
     */
    public int addComment(Comment comment) {
        int rows = commentDao.addComment(comment);
        return rows;
    }

    /**
     * 点赞数加1
     * @return
     */
    public int addClicks(String commentId) {
        int rows = commentDao.addClicks(commentId);
        return rows;
    }
}
