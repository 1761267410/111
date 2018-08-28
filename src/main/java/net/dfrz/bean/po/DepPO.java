package net.dfrz.bean.po;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "f_dep")
public class DepPO {
	private String depid;//系院编号
	private String depname;//系院名称
	private String depother;//系院备注
	
	@Id
	public String getDepid() {
		return depid;
	}
	public void setDepid(String depid) {
		this.depid = depid;
	}
	public String getDepname() {
		return depname;
	}
	public void setDepname(String depname) {
		this.depname = depname;
	}
	public String getDepother() {
		return depother;
	}
	public void setDepother(String depother) {
		this.depother = depother;
	}
	
}
