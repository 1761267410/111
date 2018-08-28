package net.dfrz.action;

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

import net.dfrz.bean.po.ClassPO;
import net.dfrz.bean.po.DepPO;
import net.dfrz.bean.po.UserPO;
import net.dfrz.service.ClassServiceI;

@Controller
@RequestMapping(value = "/class/")
public class ClassListAction extends CommonAction {

	private static final long serialVersionUID = 1L;

	@Autowired
	private ClassServiceI classServiceI;
	@Autowired
	private DataSource dataSource;

	private Map<String, Object> getClassDataList(int currentPage, int pageSize,
			Map<String, Object> paramMap) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<ClassPO> classList = new ArrayList<ClassPO>();
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(
				this.dataSource);
		String sql = "select * from f_class";
		// 1：取总记录数
		int total = classServiceI.getClasses().size();
		// 2：记录集分页
		int startIndex = (currentPage - 1) * pageSize;
		String pageSQL = sql + " limit " + startIndex + "," + pageSize + "";
		try {
			BeanPropertyRowMapper<ClassPO> rowMapper = new BeanPropertyRowMapper<ClassPO>(
					ClassPO.class);
			classList = template.query(pageSQL, rowMapper);
			dataMap.put("total", total);
			dataMap.put("rows", classList);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return dataMap;
	}

	@RequestMapping(value = "classList")
	@ResponseBody()
	public Map<String, Object> classList(HttpServletRequest request, HttpServletResponse response) {

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

		 Map<String, Object> classPOs = getClassDataList(pageNo, pageSize, null);
		 return classPOs;
	}
	
	@RequestMapping(value = "classList2")
	@ResponseBody()
	public List<ClassPO> classList2() {

		List<ClassPO> classPOs = classServiceI.getClasses();
		return classPOs;
	}

	@RequestMapping(value = "classSearch")
	@ResponseBody()
	public List<ClassPO> userSerarch(String class_id, String class_name) {

		StringBuilder hql = new StringBuilder("from f_class where 1=1");

		if (class_id != null && !"".equals(class_id))
			hql.append(" and classid like " + "'%" + class_id + "%'");
		if (class_name != null && !"".equals(class_name))
			hql.append(" and classname like " + "'%" + class_name + "%'");

		List<ClassPO> classPOs = classServiceI.getClassByHql(hql.toString());

		return classPOs;
	}

	@RequestMapping(value = "classSave")
	@ResponseBody()
	public Map<String, Object> userSave(String classid, String classname, String classother, String depid) {
		ClassPO classPO = new ClassPO();
		classPO.setClassid(classid);
		classPO.setClassname(classname);
		classPO.setClassother(classother);
		classPO.setDepid(depid);
		List<ClassPO> classPOs = classServiceI.getClasses();
		for (int i = 0; i < classPOs.size(); i++) {
			if (classPOs.get(i).getClassid().equals(classid)) {
				classServiceI.uptClass(classPO);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("success", true);
				return map;
			}
		}
		classServiceI.addClass(classPO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		return map;
	}

	@RequestMapping(value = "classDel")
	@ResponseBody()
	public Map<String, Object> classDel(String ids) {
		Map<String, Object> map = new HashMap<String, Object>();

		int delnum = classServiceI.delClasses(ids);

		if (delnum == 0)
			map.put("errorMsg", "删除失败");
		else
			map.put("success", true);
		return map;

	}

	@RequestMapping(value = "changeClass")
	@ResponseBody()
	public List<ClassPO> changeClass(HttpServletRequest request, HttpServletResponse response) {
		String depid = request.getParameter("depid");
		StringBuilder hql = new StringBuilder("from f_class where 1=1 ");
		hql.append(" and depid =" + depid);

		List<ClassPO> classPOs = classServiceI.getClassByHql(hql.toString());
		return classPOs;
	}

}
