package net.dfrz.service;

import java.util.List;

import net.dfrz.bean.bo.FlowBO;
import net.dfrz.bean.po.FlowPO;

public interface FlowServiceI {

	public void addFlow(FlowBO Flow);

	public void delFlow(String fid);

	public int delFlows(String flowIds);

	public int delFlowsAndNode(String flowIds);

	public void uptFlow(FlowBO Flow);

	public FlowPO getFlowById(String fid);

	// 获取启用的flow
	public List<FlowPO> getEnableFlow();

	public List<FlowPO> getFlowByHql(String sql);
}
