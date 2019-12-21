package com.zte.zudp.admin.info.comment.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.comment.entity.Comment;
import org.apache.ibatis.annotations.Param;
import org.apache.xmlbeans.impl.jam.mutable.MComment;

import java.util.List;
import java.util.Map;

/**
 * @Description ${}
 * @Author MMCommentDao
 * @Date 2019/12/19 13:46
 **/
public interface CommentDao extends AbstractDao<Comment> {

    /**
     * 获取该上报的所有评论
     */
    List<Comment> getComment(@Param("id") String id);
}
