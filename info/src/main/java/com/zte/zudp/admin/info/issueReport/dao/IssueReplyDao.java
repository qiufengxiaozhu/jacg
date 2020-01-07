package com.zte.zudp.admin.info.issueReport.dao;

import com.zte.zudp.admin.common.persistence.dao.AbstractDao;
import com.zte.zudp.admin.info.issueReport.entity.IssueReply;
import org.apache.ibatis.annotations.Param;

/**
 *问题答复dao
 *@author
 */
public interface IssueReplyDao extends AbstractDao<IssueReply> {

    void insertIntoIssueReply(@Param("loginName") String loginName,@Param("id")String id);

    //统计管理
//    List<Report> countManage();
}
