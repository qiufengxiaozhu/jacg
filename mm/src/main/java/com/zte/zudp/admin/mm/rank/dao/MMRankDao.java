package com.zte.zudp.admin.mm.rank.dao;

import com.zte.zudp.admin.mm.rank.entity.MMRankEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Description ${}
 * @Author RankDao
 * @Date 2019/12/11 21:30
 **/
public interface MMRankDao {
    //<!-- 得到自己积分排名，根据上面的表作为结果集表 -->
    MMRankEntity myRank(@Param("telephone") String telephone);

    //<!-- 得到所有人的积分排行，根据电话号码累计积分并限制查询数据条数 只查询 number 条数据 -->
    List<MMRankEntity> rankListOfLimit(@Param("number") String number);
}
