package com.zte.zudp.admin.common.persistence.entity;


/**
 * 
* @ClassName: FileEntity 
* @Description: 附件上传公用类，继承该类即可使用上传附件功能
* @author zss
* @date 2018年9月13日 上午10:49:02
 */
public class FileEntity extends DataEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6646597271020816279L;

	private String[] attachPaths;//附件路径
	private String[] attachNames;//附件名称
	private String[] attachIdss;//附件ids
	
	private String[] attachPaths_s;//附件路径2
	private String[] attachNames_s;//附件名称2
	private String[] attachIdss_s;//附件ids2
	
	
	
	private String tableName;
	
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public FileEntity() {
		super();
	}
	public FileEntity(String id) {
		super(id);
	}
	public String[] getAttachPaths() {
		return attachPaths;
	}
	public void setAttachPaths(String[] attachPaths) {
		this.attachPaths = attachPaths;
	}
	public String[] getAttachNames() {
		return attachNames;
	}
	public void setAttachNames(String[] attachNames) {
		this.attachNames = attachNames;
	}
	public String[] getAttachIdss() {
		return attachIdss;
	}
	public void setAttachIdss(String[] attachIdss) {
		this.attachIdss = attachIdss;
	}
	public String[] getAttachPaths_s() {
		return attachPaths_s;
	}
	public void setAttachPaths_s(String[] attachPaths_s) {
		this.attachPaths_s = attachPaths_s;
	}
	public String[] getAttachNames_s() {
		return attachNames_s;
	}
	public void setAttachNames_s(String[] attachNames_s) {
		this.attachNames_s = attachNames_s;
	}
	public String[] getAttachIdss_s() {
		return attachIdss_s;
	}
	public void setAttachIdss_s(String[] attachIdss_s) {
		this.attachIdss_s = attachIdss_s;
	}
	
}
