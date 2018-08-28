package net.dfrz.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.dfrz.bean.po.RolePO;
import net.dfrz.service.RoleServiceI;

@Controller
@RequestMapping(value = "/role/")
public class RoleListAction {
	@Autowired
	private RoleServiceI roleServiceI;

	@RequestMapping(value = "roleList")
	@ResponseBody
	public List<RolePO> roleList() {

		List<RolePO> rolePOs = roleServiceI.getRoles();
		return rolePOs;
	}

	@RequestMapping(value = "roleSearch")
	@ResponseBody
	public List<RolePO> roleSearch(String roleId, String roleName) {
		StringBuilder hql = new StringBuilder("from f_role where 1=1");

		if (roleId != null && !"".equals(roleId))
			hql.append(" and role_id like " + "'%" + roleId + "%'");
		if (roleName != null && !"".equals(roleName))
			hql.append(" and role_name like " + "'%" + roleName + "%'");
		List<RolePO> rolePOs = roleServiceI.getRoleByHql(hql.toString());
		return rolePOs;
	}

	@RequestMapping(value = "/roleDel")
	@ResponseBody
	public Map<String, Object> roleDel(String ids) {
		Map<String, Object> map = new HashMap<String, Object>();

		int delnum = roleServiceI.delRoles(ids);

		if (delnum == 0)
			map.put("errorMsg", "删除失败");
		else
			map.put("success", true);
		return map;

	}

	// @RequestMapping(value = "/menuTreeList")
	// @ResponseBody
	// public void menuTreeList(HttpServletRequest request,
	// HttpServletResponse response) {
	// /**
	// * 转换成json
	// */
	// List<Map<String, Object>> treeList = roleServiceI.menuTreeList();
	// String jsonStr = JsonUtil.ObjToStr(treeList);
	// response.setContentType("text/html");
	// PrintWriter out = response.getWriter();
	// out.print(jsonStr);
	// out.flush();
	// out.close();
	// }

	@RequestMapping(value = "/roleSave")
	@ResponseBody
	public Map<String, Object> roleSave(String role_id, String role_name, String role_remark) {
		// String check_menu_id = request.getParameter("check_menu_id");

		RolePO rolePO = new RolePO();
		rolePO.setRole_id(role_id);
		rolePO.setRole_name(role_name);
		rolePO.setRole_remark(role_remark);
		List<RolePO> rolePOs = roleList();
		System.out.println(role_id + "----" + role_name + "-----" + role_remark);
		for (int i = 0; i < rolePOs.size(); i++) {
			if (rolePOs.get(i).getRole_id().equals(role_id)) {
				roleServiceI.uptRole(rolePO);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("success", true);
				return map;
			}
		}
		roleServiceI.addRole(rolePO, null);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		return map;
	}

}
