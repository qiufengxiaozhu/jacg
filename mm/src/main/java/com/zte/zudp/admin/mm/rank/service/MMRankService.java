package com.zte.zudp.admin.mm.rank.service;

import com.zte.zudp.admin.mm.rank.entity.MMRankEntity;

import java.util.List;

/**
 * @Description ${}
 * @Author MMRankService
 * @Date 2019/12/12 11:29
 **/
public interface MMRankService {

    //<!-- 得到自己积分排名，根据上面的表作为结果集表 -->
    MMRankEntity myRank(String telephone);

    //<!-- 得到所有人的积分排行，根据电话号码累计积分并限制查询数据条数 只查询 number 条数据 -->
    List<MMRankEntity> rankListOfLimit();

}
