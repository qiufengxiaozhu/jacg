package com.zte.zudp.admin.info.issueReport.svr;

import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.info.issueReport.dao.IssueReplyDao;
import com.zte.zudp.admin.info.issueReport.entity.IssueReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *问题回复service
 *@author
 */
@Service
@Transactional
public class IssueReplyService extends FileBusinessService<IssueReply> {

  @Autowired
    private IssueReplyDao issueReplyDao;

    /*统计管理*/
//    public List<Report> countManage(){
//        return reportDao.countManage();
//    }

    
}
