package net.dfrz.bean.po;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "f_class")
public class ClassPO {
	
	private String classid;//编号
	private String classname;//名称
	private String classother;//备注
	private String depid;//系院编号
	
	@Id
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public String getClassother() {
		return classother;
	}
	public void setClassother(String classother) {
		this.classother = classother;
	}
	public String getDepid() {
		return depid;
	}
	public void setDepid(String depid) {
		this.depid = depid;
	}

}
