package com.zte.zudp.admin.mm.bigscreen.entity;

import com.zte.zudp.admin.common.persistence.entity.FileEntity;

/**
 * 大屏统计实体类
 *
 * @Description ${}
 * @Author Screen
 * @Date 2019/12/24 14:28
 **/
public class Screen extends FileEntity {

    /**
     * 案卷标志
     */
    private String RECID;

    /**
     * 任务号
     */
    private String TASKNUM;

    /**
     * 问题来源名称
     */
    private String EVENTSRCNAME;

    /**
     * 问题类型名称
     */
    private String EVENTTYPENAME;

    /**
     * 大类名称
     */
    private String MAINTYPENAME;

    /**
     * 小类名称
     */
    private String SUBTYPENAME;

    /**
     * 问题描述
     */
    private String EVENTDESC;

    /**
     * 地址描述
     */
    private String ADDRESS;

    /**
     * 区
     */
    private String DISTRICTNAME;

    /**
     * 街道
     */
    private String STREETNAME;

    /**
     * 社区
     */
    private String COMMUNITYNAME;

    /**
     * X坐标
     */
    private String COORDINATEX;

    /**
     * Y坐标
     */
    private String COORDINATEY;

    /**
     * 立案时间
     */
//    private String CREATETIME;

    /**
     * 存档时间
     */
    private String ARCHIVETIME;

    /**
     * 案件结束时间
     */
    private String ENDTIME;

    /**
     * 案件截止时间
     */
    private String DEADLINE;

    /**
     * 案件已用时间
     */
    private String USEDTIME;

    /**
     * 立案时间
     */
    private String NEWINSTTIME;

    /**
     * 部门处理时间
     */
    private String DEALTIME;

    /**
     * 处置部门
     */
    private String DISPOSEDEPARTNAME;

    /**
     * 处理意见
     */
    private String DISPOSEOPINION;

    /**
     * 处置部门名称
     */
    private String FUNCPARTNAME;

    /**
     * 预留字段
     */
    private String SYNFLAG;

    public String getRECID() {
        return RECID;
    }

    public void setRECID(String RECID) {
        this.RECID = RECID;
    }

    public String getTASKNUM() {
        return TASKNUM;
    }

    public void setTASKNUM(String TASKNUM) {
        this.TASKNUM = TASKNUM;
    }

    public String getEVENTSRCNAME() {
        return EVENTSRCNAME;
    }

    public void setEVENTSRCNAME(String EVENTSRCNAME) {
        this.EVENTSRCNAME = EVENTSRCNAME;
    }

    public String getEVENTTYPENAME() {
        return EVENTTYPENAME;
    }

    public void setEVENTTYPENAME(String EVENTTYPENAME) {
        this.EVENTTYPENAME = EVENTTYPENAME;
    }

    public String getMAINTYPENAME() {
        return MAINTYPENAME;
    }

    public void setMAINTYPENAME(String MAINTYPENAME) {
        this.MAINTYPENAME = MAINTYPENAME;
    }

    public String getSUBTYPENAME() {
        return SUBTYPENAME;
    }

    public void setSUBTYPENAME(String SUBTYPENAME) {
        this.SUBTYPENAME = SUBTYPENAME;
    }

    public String getEVENTDESC() {
        return EVENTDESC;
    }

    public void setEVENTDESC(String EVENTDESC) {
        this.EVENTDESC = EVENTDESC;
    }

    public String getADDRESS() {
        return ADDRESS;
    }

    public void setADDRESS(String ADDRESS) {
        this.ADDRESS = ADDRESS;
    }

    public String getDISTRICTNAME() {
        return DISTRICTNAME;
    }

    public void setDISTRICTNAME(String DISTRICTNAME) {
        this.DISTRICTNAME = DISTRICTNAME;
    }

    public String getSTREETNAME() {
        return STREETNAME;
    }

    public void setSTREETNAME(String STREETNAME) {
        this.STREETNAME = STREETNAME;
    }

    public String getCOMMUNITYNAME() {
        return COMMUNITYNAME;
    }

    public void setCOMMUNITYNAME(String COMMUNITYNAME) {
        this.COMMUNITYNAME = COMMUNITYNAME;
    }

    public String getCOORDINATEX() {
        return COORDINATEX;
    }

    public void setCOORDINATEX(String COORDINATEX) {
        this.COORDINATEX = COORDINATEX;
    }

    public String getCOORDINATEY() {
        return COORDINATEY;
    }

    public void setCOORDINATEY(String COORDINATEY) {
        this.COORDINATEY = COORDINATEY;
    }

    public String getARCHIVETIME() {
        return ARCHIVETIME;
    }

    public void setARCHIVETIME(String ARCHIVETIME) {
        this.ARCHIVETIME = ARCHIVETIME;
    }

    public String getENDTIME() {
        return ENDTIME;
    }

    public void setENDTIME(String ENDTIME) {
        this.ENDTIME = ENDTIME;
    }

    public String getDEADLINE() {
        return DEADLINE;
    }

    public void setDEADLINE(String DEADLINE) {
        this.DEADLINE = DEADLINE;
    }

    public String getUSEDTIME() {
        return USEDTIME;
    }

    public void setUSEDTIME(String USEDTIME) {
        this.USEDTIME = USEDTIME;
    }

    public String getNEWINSTTIME() {
        return NEWINSTTIME;
    }

    public void setNEWINSTTIME(String NEWINSTTIME) {
        this.NEWINSTTIME = NEWINSTTIME;
    }

    public String getDEALTIME() {
        return DEALTIME;
    }

    public void setDEALTIME(String DEALTIME) {
        this.DEALTIME = DEALTIME;
    }

    public String getDISPOSEDEPARTNAME() {
        return DISPOSEDEPARTNAME;
    }

    public void setDISPOSEDEPARTNAME(String DISPOSEDEPARTNAME) {
        this.DISPOSEDEPARTNAME = DISPOSEDEPARTNAME;
    }

    public String getDISPOSEOPINION() {
        return DISPOSEOPINION;
    }

    public void setDISPOSEOPINION(String DISPOSEOPINION) {
        this.DISPOSEOPINION = DISPOSEOPINION;
    }

    public String getFUNCPARTNAME() {
        return FUNCPARTNAME;
    }

    public void setFUNCPARTNAME(String FUNCPARTNAME) {
        this.FUNCPARTNAME = FUNCPARTNAME;
    }

    public String getSYNFLAG() {
        return SYNFLAG;
    }

    public void setSYNFLAG(String SYNFLAG) {
        this.SYNFLAG = SYNFLAG;
    }

    @Override
    public String toString() {
        return "Screen{" +
                "RECID='" + RECID + '\'' +
                ", TASKNUM='" + TASKNUM + '\'' +
                ", EVENTSRCNAME='" + EVENTSRCNAME + '\'' +
                ", EVENTTYPENAME='" + EVENTTYPENAME + '\'' +
                ", MAINTYPENAME='" + MAINTYPENAME + '\'' +
                ", SUBTYPENAME='" + SUBTYPENAME + '\'' +
                ", EVENTDESC='" + EVENTDESC + '\'' +
                ", ADDRESS='" + ADDRESS + '\'' +
                ", DISTRICTNAME='" + DISTRICTNAME + '\'' +
                ", STREETNAME='" + STREETNAME + '\'' +
                ", COMMUNITYNAME='" + COMMUNITYNAME + '\'' +
                ", COORDINATEX='" + COORDINATEX + '\'' +
                ", COORDINATEY='" + COORDINATEY + '\'' +
                ", ARCHIVETIME='" + ARCHIVETIME + '\'' +
                ", ENDTIME='" + ENDTIME + '\'' +
                ", DEADLINE='" + DEADLINE + '\'' +
                ", USEDTIME='" + USEDTIME + '\'' +
                ", NEWINSTTIME='" + NEWINSTTIME + '\'' +
                ", DEALTIME='" + DEALTIME + '\'' +
                ", DISPOSEDEPARTNAME='" + DISPOSEDEPARTNAME + '\'' +
                ", DISPOSEOPINION='" + DISPOSEOPINION + '\'' +
                ", FUNCPARTNAME='" + FUNCPARTNAME + '\'' +
                ", SYNFLAG='" + SYNFLAG + '\'' +
                '}';
    }
}
