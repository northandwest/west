package org.swc.bestpratise.order.entity;

import java.util.Date;

import com.bucuoa.west.dao.extend.annotations.Column;
import com.bucuoa.west.dao.extend.annotations.Id;
import com.bucuoa.west.dao.extend.annotations.Table;

@Table(name = "t_column")
public class TColumn {

	@Column(name = "id")
	@Id(autoincrement = true, uuid = false, seqId = "")
	private int id; // id

	@Column(name = "table_id")
	private int tableId; // 表

	@Column(name = "name")
	private String name; // 名称

	@Column(name = "typex")
	private String typex; // 类型

	@Column(name = "length")
	private int length; // 长度

	@Column(name = "version")
	private int version; // 版本

	@Column(name = "aliasx")
	private String aliasx; // 别名

	@Column(name = "remark")
	private String remark; // 备注

	@Column(name = "create_time")
	private Date createTime; // 时间

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTableId() {
		return tableId;
	}

	public void setTableId(int tableId) {
		this.tableId = tableId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTypex() {
		return typex;
	}

	public void setTypex(String typex) {
		this.typex = typex;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public String getAliasx() {
		return aliasx;
	}

	public void setAliasx(String aliasx) {
		this.aliasx = aliasx;
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

}
