package net.dfrz.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import net.dfrz.bean.po.FlowNodePO;
import net.dfrz.bean.po.SheetPO;
import net.dfrz.bean.po.UserPO;
import net.dfrz.mail.MailUtil;
import net.dfrz.service.FlowNodeServiceI;
import net.dfrz.service.FlowServiceI;
import net.dfrz.service.SheetServiceI;
import net.dfrz.service.UserServiceI;

@Controller
@RequestMapping(value = "/sheet/")
public class SheetListAction extends CommonAction {

	private static final long serialVersionUID = 1L;

	@Autowired
	private SheetServiceI sheetServiceI;
	@Autowired
	private FlowNodeServiceI flowNodeServiceI;
	@Autowired
	private FlowServiceI flowServiceI;
	@Autowired
	private UserServiceI userServiceI;
	@Autowired
	private DataSource dataSource;

	private Map<String, Object> getSheetDataList(int currentPage, int pageSize, Map<String, Object> paramMap) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<SheetPO> sheetList = new ArrayList<SheetPO>();
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(this.dataSource);
		String sql = "select * from f_sheet";
		// 1：取总记录数
		int total = sheetServiceI.getSheets().size();
		// 2：记录集分页
		int startIndex = (currentPage - 1) * pageSize;
		String pageSQL = sql + " limit " + startIndex + "," + pageSize + "";
		try {
			BeanPropertyRowMapper<SheetPO> rowMapper = new BeanPropertyRowMapper<SheetPO>(SheetPO.class);
			sheetList = template.query(pageSQL, rowMapper);
			dataMap.put("total", total);
			dataMap.put("rows", sheetList);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return dataMap;
	}

	// 获取被启用的请假表
	@RequestMapping(value = "entrySheet")
	@ResponseBody
	public SheetPO getEntrySheet(HttpServletRequest request) {
		String uid = ((UserPO) request.getSession().getAttribute("user")).getUid();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM f_sheet ");
		sql.append("WHERE uid = '" + uid + "' ");
		sql.append("AND flow_status = 1 ");

		return sheetServiceI.getSheetByHql(sql.toString()).get(0);
	}

	// 获取被启用的请假表的节点
	@RequestMapping(value = "entryNodes")
	@ResponseBody
	public List<FlowNodePO> getEntryNodes(HttpServletRequest request) {
		StringBuilder sql = new StringBuilder();
		String uid = ((UserPO) request.getSession().getAttribute("user")).getUid();
		sql.append("SELECT b.* FROM f_sheet a,f_flownode b ");
		sql.append("WHERE a.uid = '" + uid + "' ");
		sql.append("AND a.flow_status = 1 AND b.flowId = a.flowId ");
		sql.append("ORDER BY b.created_time ASC");

		return flowNodeServiceI.getFlowNodeBySql(sql.toString());
	}

	@RequestMapping(value = "sheetList")
	@ResponseBody()
	public Map<String, Object> sheetList1(HttpServletRequest request, HttpServletResponse response) {

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

		Map<String, Object> sheetPOs = getSheetDataList(pageNo, pageSize, null);
		return sheetPOs;
	}

	@RequestMapping(value = "sheetSearch")
	@ResponseBody()
	public List<SheetPO> userSerarch(String id, String name, String reason, String start_day, String end_day)
			throws Exception {

		StringBuilder hql = new StringBuilder("from f_sheet where 1=1");

		if (id != null && !"".equals(id))
			hql.append(" and id like " + "'%" + id + "%'");
		if (name != null && !"".equals(name))
			hql.append(" and name like " + "'%" + name + "%'");
		if (reason != null && !"".equals(reason))
			hql.append(" and reason like " + "'%" + reason + "%'");
		// if (start_day != null && !"".equals(start_day))
		// hql.append(" and start_day >= " + start_day);
		// if (end_day != null && !"".equals(end_day))

		// hql.append(" and end_day <= " + end_day);
		List<SheetPO> sheetPOs = sheetServiceI.getSheetByHql(hql.toString());

		return sheetPOs;
	}

	// 角色为“1”(学生)发起请假
	@RequestMapping("sheetApply")
	@ResponseBody
	public void sheetApply(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ParseException, IOException {
		int result;
		SheetPO sheetPO = new SheetPO();
		UserPO user = (UserPO) session.getAttribute("user");

		String start = request.getParameter("start_day");
		String end = request.getParameter("end_day");
		String type = request.getParameter("type");
		String reason = request.getParameter("reason");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		// SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		// String start_day = sdf.format(sdf1.parse(start));
		// String end_day = sdf.format(sdf1.parse(end));

		sheetPO.setEnd_day(sdf1.parse(end));
		sheetPO.setStart_day(sdf1.parse(start));
		sheetPO.setReason(reason);
		sheetPO.setType(type);
		sheetPO.setUid(user.getUid());
		sheetPO.setName(user.getName());
		try {
			sheetServiceI.createFlow(sheetPO);
			result = 1;
		} catch (Exception e) {
			result = 0;
		}
		this.resultMap(result, response);

	}

	// 显示请假记录
	@RequestMapping(value = "getSheetHistory")
	@ResponseBody
	public List<SheetPO> getSheetHistory(HttpSession session) throws Exception {
		UserPO user = (UserPO) session.getAttribute("user");
		StringBuilder hql = new StringBuilder("SELECT * FROM f_sheet WHERE uid = '" + user.getUid() + "' ");
		hql.append("ORDER BY id DESC");

		return sheetServiceI.getSheetByHql(hql.toString());
	}

	@RequestMapping(value = "getSheetDetail")
	@ResponseBody
	public List<FlowNodePO> getSheetDetail(String id) throws Exception {
		StringBuilder hql = new StringBuilder();
		hql.append("SELECT a.* FROM f_flownode a,f_sheet b");
		hql.append("WHERE b.id = '" + id + "' AND a.flowId = b.flowId;");

		List<FlowNodePO> flowNodes = flowNodeServiceI.getFlowNodeByHql(hql.toString());

		return flowNodes;
	}

	// 角色编号为2、3(班主任和系主任)显示当前待自己审核的请假表
	@RequestMapping(value = "sheetLists")
	@ResponseBody()
	public void sheetList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserPO user = null;
		String name = request.getParameter("name");
		String start_day = request.getParameter("start_day");

		StringBuilder hql = new StringBuilder("SELECT a.* FROM f_sheet a,f_flow b");
		hql.append(" WHERE b.flowId = a.flowId");
		user = (UserPO) request.getSession().getAttribute("user");
		if (user.getUid() != null) {
			hql.append(" AND b.currentUser = " + user.getUid());
		}
		hql.append(" AND b.flow_status = 1");

		if (name != null && !"".equals(name)) {
			hql.append(" and a.name like " + "'%" + name + "%'");
			if (start_day != null && !"".equals(start_day)) {
				hql.append(" and a.start_day like " + "'%" + start_day + "%'");
			}
		} else {
			if (start_day != null && !"".equals(start_day)) {
				hql.append(" and a.start_day like " + "'%" + start_day + "%'");
			}
		}
		List<SheetPO> sheetPOs = sheetServiceI.getSheetByHql(hql.toString());
		Gson gson = new Gson();
		String sheetPOsStr = new String(gson.toJson(sheetPOs).getBytes(), "UTF-8");
		System.out.println(sheetPOsStr);
		response.setCharacterEncoding("UTF-8");
		response.reset();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(sheetPOsStr);
		out.flush();
		out.close();

	}

	// 请假审核,成功则传至下一级，失败则传递回创建用户
	@RequestMapping(value = "sheetUpdate")
	@ResponseBody
	public void sheetUpdate(SheetPO sheetPO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		FlowNodePO newnode = new FlowNodePO();
		// 获取节点序号最大的节点
		FlowNodePO currentnode = flowNodeServiceI.getCurrentNode(sheetPO.getFlowId());
		Date date = new Date();

		UserPO userPO = (UserPO) request.getSession().getAttribute("user");
		String idString = request.getParameter("id");
		String progress = request.getParameter("progress");
		int id = Integer.parseInt(idString);
		int result;
		String email_address;// 邮箱地址

		newnode.setFnId(UUID.randomUUID().toString().replaceAll("-", ""));
		newnode.setFlowId(sheetPO.getFlowId());
		newnode.setCreated_time(date);
		newnode.setNodeSort(currentnode.getNodeSort() + 1);

		// 当前端传入的请假表状态为"通过"时
		if ("1".equals(progress)) {
			// 设置请假节点的基本信息
			newnode.setPreviousUser(currentnode.getCurrentUser());
			// 获取下一个节点用户的uid
			String currentUser = currentnode.getNextUser();

			// 通过节点流向创建新的节点
			if (currentUser != null && !"".equals(currentUser))
				newnode.setCurrentUser(currentUser);

			if (sheetPO.getDay() <= 3) {
				newnode.setNodeName("请假成功");
				email_address = userServiceI.getMail(sheetPO.getUid());
				MailUtil.sendMailByAsynchronous(email_address, "您的请假请求已被批准！");
				result = sheetServiceI.UpdateSheet("1", id, currentUser, 0);

			} else {
				if ("".equals(currentUser) || currentUser == null) {
					email_address = userServiceI.getMail(sheetPO.getUid());
					MailUtil.sendMailByAsynchronous(email_address, "您的请假请求已被批准！");
					newnode.setNodeName("请假成功");
					result = sheetServiceI.UpdateSheet("1", id, currentUser, 0);
				} else {
					email_address = userServiceI.getMail(currentUser);
					MailUtil.sendMailByAsynchronous(email_address, "尊敬的老师,学生 " + sheetPO.getName() + " 向您发起了 "
							+ sheetPO.getStart_day() + "到" + sheetPO.getEnd_day() + " 的请假请,请您尽快处理!");
					newnode.setNodeName("系主任审核");
					result = sheetServiceI.UpdateSheet("0", id, currentUser, 1);
				}
			}
			// 当前端传入的请假表状态为"驳回"
		} else if ("2".equals(progress)) {
			email_address = userServiceI.getMail(sheetPO.getUid());
			MailUtil.sendMailByAsynchronous(email_address, "亲爱的" + sheetPO.getName() + "同学,您的请假申请被驳回，请撤销/重新发起请假申请");
			newnode.setNodeName("请假驳回");
			newnode.setCurrentUser(sheetPO.getUid());
			newnode.setNextUser(userPO.getUid());
			result = sheetServiceI.UpdateSheet("2", id, sheetPO.getUid(), 1);
		}

		this.resultMap(flowNodeServiceI.addFlowNode(newnode), response);
	}

	// 驳回之后重新发送请假申请(发向执行驳回的教师)
	@RequestMapping(value = "resendSheet")
	@ResponseBody
	public void resendSheet(SheetPO sheet, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		FlowNodePO old_node = flowNodeServiceI.getCurrentNode(sheet.getFlowId());
		FlowNodePO current_node = new FlowNodePO();

		int sort = old_node.getNodeSort();
		String currentUser = old_node.getNextUser();

		current_node.setFlowId(sheet.getFlowId());
		current_node.setCreated_time(new Date());
		current_node.setCurrentUser(currentUser);
		current_node.setFnId(UUID.randomUUID().toString().replaceAll("-", ""));
		current_node.setNodeName("驳回之后重新审核");
		current_node.setNodeSort(sort + 1);
		current_node.setStatusName(0);

		flowNodeServiceI.addFlowNode(current_node);
		int result = sheetServiceI.UpdateSheet("0", sheet.getId(), currentUser, 1);
		this.resultMap(result, response);
	}

	// 撤销请假
	@RequestMapping("removeSheet")
	@ResponseBody
	public void removeSheet(SheetPO sheet, HttpServletResponse response) throws IOException {
		int result = sheetServiceI.UpdateSheet("2", sheet.getId(), "", 0);
		resultMap(result, response);
	}

	@RequestMapping(value = "sheetUpt")
	@ResponseBody
	public Map<String, Object> userUpt(SheetPO sheetPO) throws Exception {

		sheetServiceI.uptSheet(sheetPO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		return map;
	}

	@RequestMapping(value = "sheetSave")
	@ResponseBody()
	public void sheetSave(SheetPO sheetPO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		sheetServiceI.createFlow(sheetPO);
		this.resultMap(1, response);

	}

	@RequestMapping(value = "sheetDel")
	@ResponseBody()
	public void sheetDel(String ids, HttpServletResponse response) throws Exception {
		flowServiceI.delFlowsAndNode(ids);
		int delnum = sheetServiceI.delSheets(ids);

		this.resultMap(delnum, response);

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
}
