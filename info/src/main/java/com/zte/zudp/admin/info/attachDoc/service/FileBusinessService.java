package com.zte.zudp.admin.info.attachDoc.service;


import com.zte.zudp.admin.common.persistence.Subject;
import com.zte.zudp.admin.common.persistence.entity.FileEntity;
import com.zte.zudp.admin.common.persistence.service.BusinessService;
import com.zte.zudp.admin.common.security.SubjectUtil;
import com.zte.zudp.admin.common.util.IDUtil;
import com.zte.zudp.admin.info.attachDoc.dao.AttachDocDao;
import com.zte.zudp.admin.info.attachDoc.entity.AttachDoc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @program: 附件上传FileBusinessService
 * @author: zss
 * @create: 2018-09-12
 **/
@Transactional
public abstract class FileBusinessService<T extends FileEntity> extends BusinessService<T> {

	@Autowired
    private AttachDocDao attachDocDao;//附件dao
	  
    /** ===============附件上传， 开始===============*/
	
	public String tableName;//附件1
	
	public String tableName_s;//附件2
	
	public boolean isMainTable = false;//是否是主表  默认不是
	
	public boolean isOverrideFindList = false;//是否重写findList(T)，默认不是
   
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
	public String getTableName_s() {
		return tableName_s;
	}

	public void setTableName_s(String tableName_s) {
		this.tableName_s = tableName_s;
	}

	public boolean isMainTable() {
		return isMainTable;
	}

	public void setMainTable(boolean isMainTable) {
		this.isMainTable = isMainTable;
	}

	
	public boolean isOverrideFindList() {
		return isOverrideFindList;
	}

	public void setOverrideFindList(boolean isOverrideFindList) {
		this.isOverrideFindList = isOverrideFindList;
	}

	@Override
    public synchronized T get(String id) {
		T model = dao.get(id);
		if(model != null ){
	        AttachDoc seachatt = new AttachDoc();
	        //如果不是主表就是子表
	        if(isMainTable){
	        	seachatt.setBillid(id);
	        }else{
	        	seachatt.setBillid(model.getId());
	        }
	        seachatt.setBilltype(tableName);
	        if(seachatt.getBillid() !=null ){
		        //查找关联附件
		        List<AttachDoc> list=attachDocDao.findList(seachatt);
		        String[] attachPaths=new String[list.size()];
		        String[]  attachNames=new String[list.size()];
		        String[] attachIdss = new String[list.size()];
		        if(list !=null && list.size()>0){
		            for(int i=0;i<list.size();i++){
		            	attachPaths[i]=list.get(i).getPath();
		            	attachNames[i]=list.get(i).getName();
		            	attachIdss[i]= list.get(i).getId();
		            }
		        }
		    	model.setAttachNames(attachNames);
		    	model.setAttachPaths(attachPaths);
		    	model.setAttachIdss(attachIdss);

		    	if(tableName_s!=null){
					//附件2
					seachatt.setBilltype(tableName_s);
					//查找关联附件
					List<AttachDoc> list_s=attachDocDao.findList(seachatt);
					String[] attachPaths_s=new String[list_s.size()];
					String[] attachNames_s=new String[list_s.size()];
					String[] attachIdss_s = new String[list_s.size()];
					if(list !=null && list_s.size()>0){
						for(int i=0;i<list_s.size();i++){
							attachPaths_s[i]=list_s.get(i).getPath();
							attachNames_s[i]=list_s.get(i).getName();
							attachIdss_s[i]= list_s.get(i).getId();
						}
					}
					model.setAttachNames_s(attachNames_s);
					model.setAttachPaths_s(attachPaths_s);
					model.setAttachIdss_s(attachIdss_s);
				}

	        }
		}
        return model;
    }
    
	@Override
	public synchronized List<T> findList(T t) {
		List<T> list_old = dao.findList(t);
		if(isOverrideFindList){
			List<T> list_new = new ArrayList<T>();
			if(list_new !=null ){
				for(int j =0; j<list_old.size();j++){
					String id = list_old.get(j).getId();
					T model = dao.get(id);
			        AttachDoc seachatt = new AttachDoc();
			        if(model != null ){
				        //如果不是主表就是子表
				        if(isMainTable){
				        	seachatt.setBillid(id);
				        }else{
				        	seachatt.setBillid(model.getId());
				        }
				        seachatt.setBilltype(tableName);
				        if(seachatt.getBillid() !=null ){
					        //查找关联附件
					        List<AttachDoc> list=attachDocDao.findList(seachatt);
					        String[] attachPaths=new String[list.size()];
					        String[]  attachNames=new String[list.size()];
					        String[] attachIdss = new String[list.size()];
					        if(list !=null && list.size()>0){
					            for(int i=0;i<list.size();i++){
					            	attachPaths[i]=list.get(i).getPath();
					            	attachNames[i]=list.get(i).getName();
					            	attachIdss[i]= list.get(i).getId();
					            }
					        }
					    	model.setAttachNames(attachNames);
					    	model.setAttachPaths(attachPaths);
					    	model.setAttachIdss(attachIdss);
					    	
					     	list_new.add(model);
				        }
					}
				}
				list_old = list_new;
			}
		}
		return list_old;
	}
	
    @Override
    protected synchronized void afterInsert(T t) {
		Subject user = SubjectUtil.getSubject();
        String[] attpaths = t.getAttachPaths();
        String[] attNames = t.getAttachNames();
        AttachDoc attachDoc = null;
        if(attpaths !=null){
	        for(int i=0;i<attpaths.length;i++){
	            attachDoc = new AttachDoc();
	            attachDoc.setId(String.valueOf(IDUtil.simpleId()));//设置id
	            attachDoc.setCreateUser(user);//设置上传人
	            attachDoc.setCreateDate(new Date());//设置创建时间
	            attachDoc.setBilltype(tableName);//设置附件表名称
	            attachDoc.setBillid(t.getId());
	            attachDoc.setName(attNames[i]);//设置附件名称
	            attachDoc.setPath(attpaths[i]);//设置附件路径
	            //新增保存附件
	            attachDocDao.insert(attachDoc);
	        }
        }
        //附件2
        String[] attpaths_s = t.getAttachPaths_s();
        String[] attNames_s = t.getAttachNames_s();
        AttachDoc attachDoc_s = null;
        if(attpaths_s != null){
	        for(int i=0;i<attpaths_s.length;i++){
	        	attachDoc_s = new AttachDoc();
	        	attachDoc_s.setId(String.valueOf(IDUtil.simpleId()));//设置id
	        	attachDoc_s.setCreateUser(user);//设置上传人
	        	attachDoc_s.setCreateDate(new Date());//设置创建时间
	        	attachDoc_s.setBilltype(tableName_s);//设置附件表名称
	        	attachDoc_s.setBillid(t.getId());
	        	attachDoc_s.setName(attNames_s[i]);//设置附件名称
	        	attachDoc_s.setPath(attpaths_s[i]);//设置附件路径
	            //新增保存附件
	            attachDocDao.insert(attachDoc_s);
	        }
        }
    }
//
    @Override
    protected synchronized void afterUpdate(T t) {
    	/*1.先删除该条数据的附件数据， 2再新增附件数据  ==  修改*/
    	if(t.getAttachIdss() != null && t.getAttachIdss().length>0){
    		attachDocDao.batchDelete(t.getAttachIdss());//通过主键ids删除数据
    	}
        if(t.getAttachIdss_s() != null && t.getAttachIdss_s().length>0){
        	attachDocDao.batchDelete(t.getAttachIdss_s());//通过主键ids删除数据
        }
		Subject user = SubjectUtil.getSubject();
        String[] attpaths = t.getAttachPaths();
        String[] attNames = t.getAttachNames();
        AttachDoc attachDoc = null;
        if(attpaths !=null && attpaths.length>0){
	        for(int i=0;i<attpaths.length;i++){
	            attachDoc = new AttachDoc();
	            attachDoc.setId(String.valueOf(IDUtil.simpleId()));//设置id
	            attachDoc.setCreateUser(user);//设置上传人
	            attachDoc.setCreateDate(new Date());//设置创建时间
	            attachDoc.setBilltype(tableName);//设置附件表名称
	            attachDoc.setBillid(t.getId());
	            attachDoc.setName(attNames[i]);//设置附件名称
	            attachDoc.setPath(attpaths[i]);//设置附件路径
	            //新增保存附件
	            attachDocDao.insert(attachDoc);
	        }
        }

        //附件2
        String[] attpaths_s = t.getAttachPaths_s();
        String[] attNames_s = t.getAttachNames_s();
        AttachDoc attachDoc_s = null;
        if(attpaths_s != null && attpaths_s.length>0){
	        for(int i=0;i<attpaths_s.length;i++){
	        	attachDoc_s = new AttachDoc();
	        	attachDoc_s.setId(String.valueOf(IDUtil.simpleId()));//设置id
	        	attachDoc_s.setCreateUser(user);//设置上传人
	        	attachDoc_s.setCreateDate(new Date());//设置创建时间
	        	attachDoc_s.setBilltype(tableName_s);//设置附件表名称
	        	attachDoc_s.setBillid(t.getId());
	        	attachDoc_s.setName(attNames_s[i]);//设置附件名称
	        	attachDoc_s.setPath(attpaths_s[i]);//设置附件路径
	            //新增保存附件
	            attachDocDao.insert(attachDoc_s);
	        }
        }
    }
//
    /** ===============附件上传， 结束===============*/
}
