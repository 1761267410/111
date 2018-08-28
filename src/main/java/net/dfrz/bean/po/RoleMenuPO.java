package net.dfrz.bean.po;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "f_role_menu")
public class RoleMenuPO 
{
	private RoleMenuPK pk;

	@Id
	public RoleMenuPK getPk() {
		return pk;
	}
	public void setPk(RoleMenuPK pk) {
		this.pk = pk;
	}
}

