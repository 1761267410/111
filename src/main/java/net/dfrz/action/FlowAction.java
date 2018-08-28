package net.dfrz.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.dfrz.bean.bo.FlowBO;
import net.dfrz.bean.po.FlowPO;
import net.dfrz.service.FlowNodeServiceI;
import net.dfrz.service.FlowServiceI;

@Controller
@RequestMapping("/flows/") // 类级别映射，可以没有，一般用于减少书写量
public class FlowAction {

	@Autowired
	private FlowServiceI flowServiceI;
	@Autowired
	private FlowNodeServiceI flowNodeServiceI;

	/*
	 * 获取数据库中启用的-----当前的请假流
	 */
	// 方法级别映射,访问地址为flow/showflow
	@RequestMapping("showflows")
	// 表示该方法的返回结果直接写入 HTTP response body 中
	@ResponseBody
	public List<FlowPO> showEnterFlow() {
		List<FlowPO> flowPOs = flowServiceI.getEnableFlow();

		return flowPOs;
	}

	@RequestMapping("findAll")
	@ResponseBody
	public List<FlowPO> findAll() {
		List<FlowPO> flowPOs = flowServiceI.getFlowByHql("FROM f_flow");
		return flowPOs;
	}

	@RequestMapping("bycondition")
	@ResponseBody
	public List<FlowPO> showFlowByCondition(String flowId, String creater,
			@RequestParam(value = "creater_time") String creater_time) {
		StringBuilder hql = new StringBuilder("from f_flow where 1=1");

		if (flowId != null && !"".equals(flowId))
			hql.append(" and flowId = " + "'" + flowId + "'");
		if (creater != null && !"".equals(creater))
			hql.append(" and creater = " + "'" + creater + "'");
		if (creater_time != null && !"".equals(creater_time))
			hql.append(" and creater_time >= " + creater_time);

		List<FlowPO> flowPOs = flowServiceI.getFlowByHql(hql.toString());
		return flowPOs;
	}

	@RequestMapping("delflow")
	@ResponseBody
	public Map<String, Object> delFlow(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String ids = request.getParameter("ids");
		flowNodeServiceI.delFlowNodes("flowId", ids);
		String[] arrs = ids.split(",");

		int delnum = flowServiceI.delFlows(ids);

		if (delnum == 0)
			map.put("errorMsg", "删除失败");
		else if (delnum == arrs.length)
			map.put("success", true);
		else
			map.put("errorMsg", "未完全删除");

		return map;
	}

	@RequestMapping("addflow")
	@ResponseBody
	public Map<String, Object> addFlow(FlowBO flowBO) {
		flowBO.setFlowId(UUID.randomUUID().toString().replaceAll("-", ""));
		flowBO.setFlow_status(1);
		flowServiceI.addFlow(flowBO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		return map;
	}

	@RequestMapping("uptflow")
	@ResponseBody
	public Map<String, Object> uptFlow(FlowBO flowBO) {
		Map<String, Object> map = new HashMap<String, Object>();
		flowServiceI.uptFlow(flowBO);
		map.put("success", true);
		return map;
	}
}
