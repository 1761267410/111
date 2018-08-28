package net.dfrz.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import net.dfrz.bean.po.ClassPO;
import net.dfrz.bean.po.DepPO;
import net.dfrz.bean.po.RolePO;
import net.dfrz.bean.po.UserPO;
import net.dfrz.service.ClassServiceI;
import net.dfrz.service.DepServiceI;
import net.dfrz.service.RoleServiceI;
import net.dfrz.service.SheetServiceI;
import net.dfrz.service.UserServiceI;

@Controller
@RequestMapping(value = "/user/")
public class UserListAction extends CommonAction {

	private static final long serialVersionUID = 1L;
	@Autowired
	private UserServiceI userServiceI;
	@Autowired
	private SheetServiceI sheetServiceI;
	@Autowired
	private RoleServiceI roleServiceI;
	@Autowired
	private ClassServiceI classServiceI;
	@Autowired
	private DepServiceI depServiceI;
	@Autowired
	private DataSource dataSource;

	private Map<String, Object> getUserDataList(int currentPage, int pageSize, Map<String, Object> paramMap) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<UserPO> userList = new ArrayList<UserPO>();
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(this.dataSource);
		String sql = "select * from f_user";
		// 1：取总记录数
		int total = userServiceI.getUsers().size();
		// 2：记录集分页
		int startIndex = (currentPage - 1) * pageSize;
		String pageSQL = sql + " limit " + startIndex + "," + pageSize + "";
		try {
			BeanPropertyRowMapper<UserPO> rowMapper = new BeanPropertyRowMapper<UserPO>(UserPO.class);
			userList = template.query(pageSQL, rowMapper);
			dataMap.put("total", total);
			dataMap.put("rows", userList);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return dataMap;
	}

	@RequestMapping(value = "uptPassword")
	@ResponseBody
	public void uptPassword(HttpServletRequest request) {
		UserPO user = (UserPO) request.getSession().getAttribute("user");
		String duplicate_new_pwd = request.getParameter("duplicate_new_pwd");
		String old_pwd = request.getParameter("old_pwd");
		String new_pwd = request.getParameter("new_pwd");
		if (user.getPassword().equals(old_pwd) && new_pwd.equals(duplicate_new_pwd)) {
			user.setPassword(new_pwd);
		}
		userServiceI.uptUser(user);
	}

	@RequestMapping(value = "userList")
	@ResponseBody()
	public Map<String, Object> userList(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
		if (page == null || page.equals("")) {
			page = "1";
		}
		if (rows == null || rows.equals("")) {
			rows = "10";
		}

		int pageNo = Integer.parseInt(page);
		int pageSize = Integer.parseInt(rows);
		// 获取查询信息

		Map<String, Object> userPOs = getUserDataList(pageNo, pageSize, null);

		return userPOs;
	}

	@RequestMapping(value = "userSearch")
	@ResponseBody()
	public List<UserPO> userSerarch(String userId, String userName, String roleid) {

		StringBuilder hql = new StringBuilder("from f_user where 1=1");

		if (userId != null && !"".equals(userId))
			hql.append(" and uid like " + "'%" + userId + "%'");
		if (userName != null && !"".equals(userName))
			hql.append(" and name like " + "'%" + userName + "%'");
		if (roleid != null && !"".equals(roleid))
			hql.append(" and rid like " + "'%" + roleid + "%'");
		// if (s_birthday != null && !"".equals(s_birthday))
		// hql.append(" and birthday >= " + s_birthday);
		// if (d_birthday != null && !"".equals(d_birthday))
		// hql.append(" and birthday <= " + d_birthday);

		List<UserPO> userPOs = userServiceI.getUserByHql(hql.toString());
		return userPOs;
	}

	@RequestMapping(value = "userSave")
	@ResponseBody()
	public Map<String, Object> userSave(String uid, String name, String password, String tele, String sex,
			String birthday, String email, String other, String rid, String classid, String depid) {

		UserPO userPO = new UserPO();
		userPO.setName(name);
		userPO.setPassword(password);
		userPO.setTele(tele);
		userPO.setSex(sex);
		System.out.println(sex);
		userPO.setbirthday(birthday);
		userPO.setEmail(email);
		userPO.setOther(other);
		userPO.setUid(uid);
		userPO.setDepid(depid);
		userPO.setRid(rid);
		userPO.setClassid(classid);
		List<UserPO> userPOs = userServiceI.getUsers();
		for (int i = 0; i < userPOs.size(); i++) {
			if (userPOs.get(i).getUid().equals(userPO.getUid())) {
				userServiceI.uptUser(userPO);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("success", true);
				return map;
			}
		}

		userServiceI.addUser(userPO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		return map;
	}

	@RequestMapping(value = "userDel")
	@ResponseBody()
	public Map<String, Object> userDel(String ids) {
		Map<String, Object> map = new HashMap<String, Object>();
		int delnum = sheetServiceI.delSheetBydelUser("id", ids);
		String[] arrs = ids.split(",");
		delnum = userServiceI.delUsers(ids);

		if (delnum == 0)
			map.put("errorMsg", "删除失败");
		else if (delnum == arrs.length)
			map.put("success", true);
		else
			map.put("errorMsg", "未完全删除");
		return map;

	}

	@RequestMapping(value = "getUserById")
	@ResponseBody()
	public UserPO getUserById(String uid) throws Exception {
		UserPO userPO = userServiceI.getUserById(uid);
		return userPO;
	}

	@RequestMapping(value = "getUserDetail")
	@ResponseBody()
	public UserPO getUserDetail(String uid, HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserPO userPO = userServiceI.getUserById(uid);
		RolePO rolePO = roleServiceI.getRoleById(userPO.getRid());
		ClassPO classPO = classServiceI.getClassById(userPO.getClassid());
		DepPO depPO = depServiceI.getDepById(userPO.getDepid());
		String rolename = rolePO.getRole_name();// 角色名称
		String classname = classPO.getClassname();// 班级名称
		String depname = depPO.getDepname();// 系院名称
		request.getSession().setAttribute("getRolename", rolename);
		request.getSession().setAttribute("getClassname", classname);
		request.getSession().setAttribute("getDepname", depname);
		return userPO;

	}

	@RequestMapping(value = "uptUserDetail")
	@ResponseBody
	public void uptUserDetail(UserPO user, HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserPO userPO = (UserPO) request.getSession().getAttribute("user");
		userPO.setSex(user.getSex());
		userPO.setBirthday(user.getbirthday());
		userPO.setTele(user.getTele());
		userPO.setEmail(user.getEmail());

		int result = userServiceI.uptUser(userPO);
		this.resultMap(result, response);

	}

	public void resultMap(int i, HttpServletResponse response) throws IOException {
		String resultJson;
		Gson gson = new Gson();
		if (i > 0)
			resultJson = gson.toJson(1);
		else
			resultJson = gson.toJson(0);
		PrintWriter out = response.getWriter();
		out.print(resultJson);
	}
	// @RequestMapping(value = "text")
	// @ResponseBody
	// public void textData() {
	// java.util.Random random = new java.util.Random();
	// UserPO user;
	// for (int i = 0; i < 200; i++) {
	// int a = random.nextInt(5) + 1;
	// int b = random.nextInt(5) + 1;
	// int classid = a - 1;
	// user = new UserPO();
	// user.setClassid("00" + classid + "" + b);
	// user.setDepid("000" + a);
	// user.setName(i + i + i + i + "");
	// user.setEmail("727705453@qq.com");
	// user.setPassword("111111");
	// user.setRid("1");
	// user.setUid("3167102" + classid + (10 + i));
	// userServiceI.addUser(user);
	// }
	//
	// }
}
