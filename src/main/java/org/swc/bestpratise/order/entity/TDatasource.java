 
								 
							package org.swc.bestpratise.order.entity;

import java.util.Date;

import com.bucuoa.west.dao.extend.annotations.Column;
import com.bucuoa.west.dao.extend.annotations.Id;
import com.bucuoa.west.dao.extend.annotations.Table;

@Table(name = "t_datasource")
public class TDatasource {


		
	@Column(name = "id")
	@Id(autoincrement = true, uuid = false, seqId = "")

	private int id;  // id
	
		
	@Column(name = "name")
	private String name;  // 名称
	
		
	@Column(name = "dbtype")
	private String dbtype;  // 数据库类型
	
		
	@Column(name = "url")
	private String url;  // 备注
	
		
	@Column(name = "username")
	private String username;  // 地址
	
		
	@Column(name = "password")
	private String password;  // 密码
	
		
	@Column(name = "create_time")
	private Date createTime;  // 时间
	
		
	@Column(name = "update_time")
	private Date updateTime;  // 修改时间
	
		
	@Column(name = "content")
	private String content;  // 备注
	
	

		public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
		public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
		public String getDbtype() {
		return dbtype;
	}

	public void setDbtype(String dbtype) {
		this.dbtype = dbtype;
	}
		public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
		public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
		public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
		public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
		public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
		public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	

}
 
								 
								 
								 
								 
									 
								