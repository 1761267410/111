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

import net.dfrz.bean.po.DepPO;
import net.dfrz.bean.po.RolePO;
import net.dfrz.bean.po.UserPO;
import net.dfrz.service.DepServiceI;

@Controller
@RequestMapping(value = "/dep/")
public class DepListAction extends CommonAction {

	private static final long serialVersionUID = 1L;

	@Autowired
	private DepServiceI depServiceI;
	@Autowired
	private DataSource dataSource;

	private Map<String, Object> getDepDataList(int currentPage, int pageSize,
			Map<String, Object> paramMap) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<DepPO> depList = new ArrayList<DepPO>();
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(
				this.dataSource);
		String sql = "select * from f_dep";
		// 1：取总记录数
		int total = depServiceI.getDeps().size();
		// 2：记录集分页
		int startIndex = (currentPage - 1) * pageSize;
		String pageSQL = sql + " limit " + startIndex + "," + pageSize + "";
		try {
			BeanPropertyRowMapper<DepPO> rowMapper = new BeanPropertyRowMapper<DepPO>(
					DepPO.class);
			depList = template.query(pageSQL, rowMapper);
			dataMap.put("total", total);
			dataMap.put("rows", depList);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return dataMap;
	}

	@RequestMapping(value = "depList")
	@ResponseBody()
	public  Map<String, Object> depList(HttpServletRequest request, HttpServletResponse response) {
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

		 Map<String, Object> depPOs = getDepDataList(pageNo, pageSize, null);
		
		return depPOs;
	}
	
	@RequestMapping(value = "depList2")
	@ResponseBody()
	public List<DepPO> depList2() {

		List<DepPO> depPOs = depServiceI.getDeps();
		return depPOs;
	}

	@RequestMapping(value = "depSearch")
	@ResponseBody()
	public List<DepPO> userSerarch(String dep_id, String dep_name) {

		StringBuilder hql = new StringBuilder("from f_dep where 1=1");

		if (dep_id != null && !"".equals(dep_id))
			hql.append(" and depid like " + "'%" + dep_id + "%'");
		if (dep_name != null && !"".equals(dep_name))
			hql.append(" and depname like " + "'%" + dep_name + "%'");

		List<DepPO> depPOs = depServiceI.getDepByHql(hql.toString());

		return depPOs;
	}

	@RequestMapping(value = "depSave")
	@ResponseBody()
	public Map<String, Object> userSave(String depid, String depname, String depother) {
		DepPO depPO = new DepPO();
		depPO.setDepid(depid);
		depPO.setDepname(depname);
		depPO.setDepother(depother);

		List<DepPO> depPOs = depServiceI.getDeps();
		for (int i = 0; i < depPOs.size(); i++) {
			if (depPOs.get(i).getDepid().equals(depid)) {
				depServiceI.uptDep(depPO);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("success", true);
				return map;
			}
		}
		depServiceI.addDep(depPO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		return map;
	}

	@RequestMapping(value = "depDel")
	@ResponseBody()
	public Map<String, Object> depDel(String ids) {
		Map<String, Object> map = new HashMap<String, Object>();

		int delnum = depServiceI.delDeps(ids);

		if (delnum == 0)
			map.put("errorMsg", "删除失败");
		else
			map.put("success", true);
		return map;

	}

}
