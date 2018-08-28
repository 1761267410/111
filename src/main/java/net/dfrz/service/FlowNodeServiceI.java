package net.dfrz.service;

import java.util.List;

import net.dfrz.bean.bo.FlowNodeBO;
import net.dfrz.bean.po.FlowNodePO;

public interface FlowNodeServiceI {
	public int addFlowNode(FlowNodePO FlowNode);

	public void delFlowNode(String fnId);

	// 通过关键词和值删除节点
	public int delFlowNodes(String keyname, String value);

	public int delFlowNodesByflowId(String flowId);

	public void uptFlowNode(FlowNodeBO FlowNode);

	public FlowNodePO getCurrentNode(String flwoId);

	public FlowNodePO getFlowNodeById(String fnId);

	public List<FlowNodePO> getFlowNodeByFlow(String flowId);

	public List<FlowNodePO> getFlowNodeByHql(String hql);

	public List<FlowNodePO> getFlowNodeBySql(String sql);
}
