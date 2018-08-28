package net.dfrz.bean.po;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "f_resource")
public class ResourcePO {

	private String res_id;
	private String name;// 资源名
	private String value_path;// 资源_路径
	private String other;// 备注

	@Id
	public String getRes_id() {
		return res_id;
	}

	public void setRes_id(String res_id) {
		this.res_id = res_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue_path() {
		return value_path;
	}

	public void setValue_path(String value_path) {
		this.value_path = value_path;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

}
