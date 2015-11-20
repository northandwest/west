package org.swc.bestpratise.order.entity;

import java.util.Date;

import com.bucuoa.west.dao.extend.annotations.Column;
import com.bucuoa.west.dao.extend.annotations.Id;
import com.bucuoa.west.dao.extend.annotations.Table;

@Table(name = "t_table")
public class TTable {

	@Column(name = "id")
	@Id(autoincrement = true, uuid = false, seqId = "")
	private int id; // id
	
	@Column(name = "project_id")
	private int projectId; // 项目

	@Column(name = "name")
	private String name; // 名称

	@Column(name = "remark")
	private String remark; // 备注

	@Column(name = "create_time")
	private Date createTime; // 时间

	@Column(name = "version")
	private int version; // 版本

	@Column(name = "update_time")
	private Date updateTime; // 修改时间

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}
