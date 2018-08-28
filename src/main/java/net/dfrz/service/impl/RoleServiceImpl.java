package net.dfrz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import net.dfrz.bean.po.RolePO;
import net.dfrz.dao.RoleDao;
import net.dfrz.service.RoleServiceI;

@Service(value = "roleService")
@Transactional
public class RoleServiceImpl implements RoleServiceI {
	@Autowired
	private DataSource dataSource;

	@Autowired
	private RoleDao roleDao;

	@Override
	public void addRole(RolePO rolePO, String check_menu_id) {
		// JdbcTemplate template = new JdbcTemplate(this.dataSource);

		roleDao.save(rolePO);

		// String[] menuidArray = check_menu_id.split(";");
		// StringBuffer insertMenu = new StringBuffer();
		// for (String menuid : menuidArray) {
		// insertMenu.setLength(0);
		// insertMenu.append("Insert into f_role_menu(");
		// insertMenu.append("roleid,menuid");
		// insertMenu.append(") values(");
		// insertMenu.append("'" + role_id + "',");
		// insertMenu.append("'" + menuid + "'");
		// insertMenu.append(")");
		//
		// template.update(insertMenu.toString());
		// }
	}

	@Override
	public void delRole(String role_id) {
		roleDao.deleteById(role_id);
	}

	@Override
	public int delRoles(String role_id) {
		String hql = "delete from f_role where role_id in(:role_id)";
		Map<String, List<Object>> map = new HashMap<>();
		List<Object> ids = new ArrayList<>();
		for (Object id : CollectionUtils.arrayToList(role_id.split(","))) {
			ids.add(id.toString());
		}
		map.put("role_id", ids);
		try {
			return roleDao.delete(hql, map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public void uptRole(RolePO rolePO) {
		roleDao.update(rolePO);
	}

	@Override
	public RolePO getRoleById(String role_id) {
		RolePO rolePO = roleDao.findById(role_id);
		return rolePO;
	}

	@Override
	public List<RolePO> getRoles() {
		String sql = "from f_role";

		return getSql(sql, null);
	}

	private List<RolePO> getSql(String sql, Object[] param) {
		List<RolePO> rolePOs = roleDao.find(sql, param);
		return rolePOs;
	}

	@Override
	public List<RolePO> getRoleByHql(String hql) {
		return getSql(hql, null);
	}

	// @Override
	// public Map<String, Object> getRoleDataList(int currentPage, int pageSize,
	// Map<String, Object> paramMap) {
	// Map<String, Object> dataMap = new HashMap<String, Object>();
	// List<RolePO> roleList = new ArrayList<RolePO>();
	// NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(
	// this.dataSource);
	// JdbcTemplate template_2 = new JdbcTemplate(this.dataSource);
	// String sql = "Select * From f_role where 1 = 1";
	// System.out.println("paramMap = " + paramMap);
	// // 处理查询条件
	// String role_id = RequestUtil.NullToStr(paramMap.get("role_id"));
	// String role_name = RequestUtil.NullToStr(paramMap.get("role_name"));
	// if (role_id != null && !role_id.equals("")) {
	// sql = sql + " and role_id like '%" + role_id + "%'";
	// }
	// if (role_name != null && !role_name.equals("")) {
	// sql = sql + " and role_name like '%" + role_name + "%'";
	// }
	// sql = sql + " order by cast(role_id as SIGNED) desc";
	//
	// // 1：取总记录数
	//
	// String countSQL = DbUtil.getCountSQL(sql);
	// Long total = template_2.queryForObject(countSQL, Long.class);
	// // 2：记录集分页
	// int startIndex = (currentPage - 1) * pageSize;
	// String pageSQL = sql + " limit " + startIndex + "," + pageSize + "";
	// try {
	// BeanPropertyRowMapper<RolePO> rowMapper = new
	// BeanPropertyRowMapper<RolePO>(
	// RolePO.class);
	// roleList = template.query(pageSQL, rowMapper);
	// dataMap.put("total", total);
	// dataMap.put("rows", roleList);
	// } catch (Exception e) {
	// e.printStackTrace();
	// throw new RuntimeException(e);
	// }
	// return dataMap;
	// }
	//
	// @Override
	// public List<Map<String, Object>> menuTreeList() {
	// Map<String, Map<String, Object>> id_nodeMap = new HashMap<String,
	// Map<String, Object>>();
	//
	// List<Map<String, Object>> treeList = new ArrayList<Map<String,
	// Object>>();
	// Map<String, Object> treeNode = null;
	// String sql = "Select * From f_menu order by menu_id asc";
	// JdbcTemplate template = new JdbcTemplate(this.dataSource);
	// List<Map<String, Object>> dataList = template.queryForList(sql);
	// for (Map<String, Object> dataMap : dataList) {
	// String menu_id = String.valueOf(dataMap.get("menu_id"));
	// String menu_name = String.valueOf(dataMap.get("menu_name"));
	// String parentid = String.valueOf(dataMap.get("parentid"));
	// int grade = Integer.parseInt(String.valueOf(dataMap.get("grade")));
	// int isLeaf = Integer
	// .parseInt(String.valueOf(dataMap.get("isleaf")));
	//
	// treeNode = new HashMap<String, Object>();
	// treeNode.put("id", menu_id);
	// treeNode.put("text", menu_name);
	// if (grade > 1 && isLeaf == 0) {
	// treeNode.put("state", "closed");
	// }
	// id_nodeMap.put(menu_id, treeNode);
	//
	// if (parentid.equals("0")) {
	// /**
	// * 将父节点加入到树形集合中
	// */
	// treeList.add(treeNode);
	// } else {
	// /**
	// * 将子节点挂到对应的父节点上面
	// */
	// Map<String, Object> parentNode = id_nodeMap.get(parentid);
	// if (parentNode != null) {
	// List<Map<String, Object>> children = null;
	// if (parentNode.get("children") == null) {
	// children = new ArrayList<Map<String, Object>>();
	// } else {
	// children = (List<Map<String, Object>>) parentNode
	// .get("children");
	//
	// }
	// children.add(treeNode);
	// parentNode.put("children", children);
	// }
	// }
	// }
	// return treeList;
	// }

}
