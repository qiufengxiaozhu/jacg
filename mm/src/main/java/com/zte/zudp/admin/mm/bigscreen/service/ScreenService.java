package com.zte.zudp.admin.mm.bigscreen.service;

import com.zte.zudp.admin.info.attachDoc.service.FileBusinessService;
import com.zte.zudp.admin.mm.bigscreen.dao.ScreenDao;
import com.zte.zudp.admin.mm.bigscreen.entity.Screen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * 吉安大屏业务处理层
 * @Description ${}
 * @Author ScreenService
 * @Date 2019/12/24 15:11
 **/

@Service
@Transactional
public class ScreenService extends FileBusinessService<Screen> {

    @Autowired
    private ScreenDao screenDao;


}
