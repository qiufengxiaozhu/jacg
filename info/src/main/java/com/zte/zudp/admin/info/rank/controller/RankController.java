package com.zte.zudp.admin.info.rank.controller;

import com.zte.zudp.admin.common.annotation.endpoint.EndpointModule;
import com.zte.zudp.admin.common.persistence.web.AbstractCRUDController;
import com.zte.zudp.admin.info.rank.RankMenu;
import com.zte.zudp.admin.info.rank.entity.RankEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Description 排行榜详情
 * @Author RankController
 * @Date 2019/12/11 21:06
 **/
@RestController
@EndpointModule(name = "排行榜详情", id = "rank", parent = RankMenu.class, order = 1, icon = "bookmark")
@RequestMapping("/rank")
public class RankController extends AbstractCRUDController<RankEntity> {

}
