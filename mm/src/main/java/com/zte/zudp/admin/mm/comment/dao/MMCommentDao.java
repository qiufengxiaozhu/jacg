package com.zte.zudp.admin.mm.comment.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.mm.comment.entity.MMComment;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description ${}
 * @Author MMCommentDao
 * @Date 2019/12/19 13:46
 **/
public interface MMCommentDao extends AbstractDao<MMComment> {

    /**
     * 根据具体的问题上报查询具体的评论
     */
    public List<MMComment> getDetail(@Param("id") String id);

    /**
     * 查询所有问题上报
     * @return
     */
    List<Map> selectAll();

    /**
     * 根据id查询具体问题上报
     * @param id
     * @return
     */
    Map getReport(@Param("id")String id);

    /**
     * 新增评论
     * @param comment
     * @return
     */
    int addComment(MMComment comment);

    /**
     * 点赞数加1
     * @return
     */
    int addClicks(@Param("commentId")String commentId);
}
