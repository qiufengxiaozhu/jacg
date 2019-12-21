package com.zte.zudp.admin.mm.comment.service;

import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.mm.comment.dao.MMCommentDao;
import com.zte.zudp.admin.mm.comment.entity.MMComment;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description ${}
 * @Author MMCommentService
 * @Date 2019/12/19 13:59
 **/
@Service
@Transactional
public class MMCommentService extends FileBusinessService<MMComment> {

    @Autowired
    private MMCommentDao mmCommentDao;

    /**
     * 根据具体的问题上报查询具体的评论
     */
    public List<MMComment> getDetail(String id){

        List<MMComment> list = mmCommentDao.getDetail(id);

        return list;
    }

    /**
     * 查询所有问题上报
     * @return
     */
    public List<Map> selectAll() {
       return  mmCommentDao.selectAll();
    }

    /**
     * 根据id查询具体问题上报
     * @param id
     * @return
     */
    public Map getReport(String id) {

        return mmCommentDao.getReport(id);
    }

    /**
     * 新增评论
     * @param comment
     * @return
     */
    public int addComment(MMComment comment) {
        int rows = mmCommentDao.addComment(comment);
        return rows;
    }

    /**
     * 点赞数加1
     * @return
     */
    public int addClicks(String commentId) {
        int rows = mmCommentDao.addClicks(commentId);
        return rows;
    }
}
