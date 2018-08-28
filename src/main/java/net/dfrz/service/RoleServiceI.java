package net.dfrz.service;

import java.util.List;

import net.dfrz.bean.po.RolePO;

public interface RoleServiceI {

	public void addRole(RolePO rolePO, String check_menu_id);

	public void delRole(String role_id);

	public int delRoles(String role_ids);

	public void uptRole(RolePO rolePO);

	public RolePO getRoleById(String role_id);

	public List<RolePO> getRoles();

	public List<RolePO> getRoleByHql(String hql);
	//
	// public Map<String, Object> getRoleDataList(int currentPage, int
	// pageSize,Map<String, Object> paramMap);
	//
	// public List<Map<String, Object>> menuTreeList();

}
