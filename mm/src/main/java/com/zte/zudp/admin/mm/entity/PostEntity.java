package com.zte.zudp.admin.mm.entity;

import com.zte.zudp.admin.common.persistence.entity.DataEntity;
import com.zte.zudp.admin.common.persistence.entity.FileEntity;

/**
 * 岗位信息实体类
 * User: wlf
 * Date: 2019/1/16
 * Time: 14:03
 * 说明：有附件上传则继承FileEntity  无附件则继承DataEntity
 */
public class PostEntity extends FileEntity{

    /**
	 * 
	 */
	private static final long serialVersionUID = 2456247955948607105L;
	private String name;//岗位名称
    private String mark;//岗位描述

    private String content;//内容
    private String contentnohtml;//内容 去格式
    private String identification;//岗位标识
    

    public String getIdentification() {
		return identification;
	}

	public void setIdentification(String identification) {
		this.identification = identification;
	}

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContentnohtml() {
        return contentnohtml;
    }

    public void setContentnohtml(String contentnohtml) {
        this.contentnohtml = contentnohtml;
    }
}
