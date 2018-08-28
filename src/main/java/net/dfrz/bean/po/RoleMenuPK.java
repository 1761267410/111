package net.dfrz.bean.po;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class RoleMenuPK implements Serializable {

	private static final long serialVersionUID = 1L;
	private String roleid;
	private String menuid;
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public String getMenuid() {
		return menuid;
	}
	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}
}
