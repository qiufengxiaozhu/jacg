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
     * 获取该上报的所有评论
     */
    public List<Comment> getComment(String id) {
        return commentDao.getComment(id);
    }
}
