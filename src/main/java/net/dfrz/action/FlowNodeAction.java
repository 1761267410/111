package net.dfrz.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.dfrz.bean.bo.FlowNodeBO;
import net.dfrz.bean.po.FlowNodePO;
import net.dfrz.service.FlowNodeServiceI;

@Controller
@RequestMapping("/node/")
public class FlowNodeAction {

	@Autowired
	FlowNodeServiceI flowNodeServiceI;

	@RequestMapping("shownode")
	@ResponseBody
	public List<FlowNodePO> getNodeByFlowId(String flowId) {
		List<FlowNodePO> flownodes = flowNodeServiceI.getFlowNodeByFlow(flowId);
		return flownodes;
	}

	@RequestMapping("delnode")
	@ResponseBody
	public Map<String, Object> delFlowNode(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		String ids = request.getParameter("ids");
		int delnum = flowNodeServiceI.delFlowNodes("fnId", ids);
		String[] arrs = ids.split(",");
		if (delnum == 0)
			map.put("errorMsg", "删除失败");
		else if (delnum == arrs.length)
			map.put("success", true);
		else
			map.put("errorMsg", "未完全删除");

		return map;
	}

	@RequestMapping("addnode")
	@ResponseBody
	public Map<String, Object> addFlowNode(FlowNodePO flowNodePO) {
		flowNodePO.setFnId(UUID.randomUUID().toString().replaceAll("-", ""));
		flowNodeServiceI.addFlowNode(flowNodePO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		return map;
	}

	@RequestMapping("uptnode")
	@ResponseBody
	public Map<String, Object> uptFlowNode(FlowNodeBO flowNodeBO) {
		flowNodeServiceI.uptFlowNode(flowNodeBO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		return map;
	}
}
