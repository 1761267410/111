package net.dfrz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import net.dfrz.bean.bo.FlowNodeBO;
import net.dfrz.bean.po.FlowNodePO;
import net.dfrz.dao.FlowNodeDao;
import net.dfrz.service.FlowNodeServiceI;

@Service
@Transactional
public class FlowNodeServiceImpl implements FlowNodeServiceI {

	@Autowired
	private FlowNodeDao flowNodeDao;

	@Override
	public int addFlowNode(FlowNodePO FlowNode) {
		return flowNodeDao.save(FlowNode) != null ? 1 : 0;
	}

	@Override
	public void delFlowNode(String fnId) {
		flowNodeDao.deleteById(fnId);
	}

	@Override
	public int delFlowNodes(String keyname, String value) {
		String hql = "delete from f_flownode where " + keyname + " in(:fnId)";
		Map<String, List<Object>> map = new HashMap<>();
		List<Object> idLong = new ArrayList<>();
		for (Object id : CollectionUtils.arrayToList(value.split(","))) {
			idLong.add(id.toString());
		}
		map.put("fnId", idLong);
		try {
			return flowNodeDao.delete(hql, map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int delFlowNodesByflowId(String flowId) {
		String sql = "DELETE FROM f_flownode where flowId = ?";
		return flowNodeDao.excuteBySql(sql, flowId);
	}

	@Override
	public void uptFlowNode(FlowNodeBO FlowNode) {
		flowNodeDao.update(bo2po(FlowNode));
	}

	@Override
	public FlowNodePO getFlowNodeById(String fnId) {
		FlowNodePO flowNodePO = flowNodeDao.findById(fnId);
		return flowNodePO;
	}

	@Override
	public List<FlowNodePO> getFlowNodeByFlow(String flowId) {
		Object object = flowId;
		String hql = "from f_flowNode where flowId = ?";

		List<FlowNodePO> flowNodePOs = flowNodeDao.find(hql, object);

		return flowNodePOs;
	}

	public FlowNodePO bo2po(FlowNodeBO FlowNode) {
		FlowNodePO flowNodePO = new FlowNodePO();
		BeanUtils.copyProperties(FlowNode, flowNodePO);
		return flowNodePO;
	}

	@Override
	public List<FlowNodePO> getFlowNodeByHql(String hql) {
		return flowNodeDao.find(hql, null);
	}

	@Override
	public FlowNodePO getCurrentNode(String flwoId) {
		StringBuilder sql = new StringBuilder();
		sql.append("select a.* from f_flownode a");
		sql.append(" where a.flowId = '" + flwoId + "'");
		sql.append(" and a.nodeSort =");
		sql.append(" (select max(b.nodeSort) from f_flownode b where b.flowId = '" + flwoId + "')");
		FlowNodePO flowNode = flowNodeDao.findBySql(sql.toString(), null).get(0);
		return flowNode;
	}

	public List<FlowNodePO> getFlowNodeBySql(String sql) {
		return flowNodeDao.findBySql(sql, null);
	}

}
