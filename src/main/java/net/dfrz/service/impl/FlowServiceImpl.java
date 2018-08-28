package net.dfrz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import net.dfrz.bean.bo.FlowBO;
import net.dfrz.bean.po.FlowPO;
import net.dfrz.dao.FlowDao;
import net.dfrz.service.FlowServiceI;

@Service("flowService")
@Transactional
public class FlowServiceImpl implements FlowServiceI {

	@Autowired
	private FlowDao flowDao;

	@Override
	public void addFlow(FlowBO flowBO) {
		flowDao.save(bo2po(flowBO));
	}

	@Override
	public void delFlow(String fid) {
		flowDao.deleteById(fid);
	}

	@Override
	public int delFlows(String flowIds) {

		String hql = "delete from f_flow where flowId in(:flowId)";
		Map<String, List<Object>> map = new HashMap<>();
		List<Object> idLong = new ArrayList<>();
		for (Object id : CollectionUtils.arrayToList(flowIds.split(","))) {
			idLong.add(id.toString());
		}
		map.put("flowId", idLong);
		int delNum = 0;
		try {
			delNum = flowDao.delete(hql, map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return delNum;

	}

	@Override
	public void uptFlow(FlowBO flowBO) {
		flowDao.update(bo2po(flowBO));
	}

	@Override
	public FlowPO getFlowById(String fid) {

		// 根据fid获取库内Flow对象
		FlowPO flowPO = flowDao.findById(fid);

		return flowPO;
	}

	@Override
	public List<FlowPO> getEnableFlow() {
		Object[] param = { FlowBO.Enter_Flow };

		String sql = "FROM f_flow WHERE flow_status = ?";

		return getSql(sql, param);
	}

	@Override
	public List<FlowPO> getFlowByHql(String sql) {

		return getSql(sql, null);
	}

	/*
	 * 通过BeanUtils.copyProperties方法将BO对象转化为PO对象 由于FlowPO中的FlowNodes不是基础数据类型
	 * 所以利用循环进行挨个拷贝
	 */
	public FlowPO bo2po(FlowBO flowBO) {
		FlowPO flowPO = new FlowPO();

		BeanUtils.copyProperties(flowBO, flowPO);

		return flowPO;
	}

	private List<FlowPO> getSql(String sql, Object[] param) {
		// 根据fid获取库内Flow对象
		List<FlowPO> flowPO = flowDao.find(sql, param);

		return flowPO;
	}

	@Override
	public int delFlowsAndNode(String flowIds) {
		StringBuilder sql = new StringBuilder();
		Map<String, List<Object>> map = new HashMap<>();
		List<Object> idLong = new ArrayList<>();

		sql.append("DELETE a,b FROM f_flow a LEFT JOIN ");
		sql.append("f_flownode b ON ");
		sql.append("a.flowId = b.flowId ");
		sql.append("WHERE a.flowId IN (:flowId)");

		for (Object id : CollectionUtils.arrayToList(flowIds.split(","))) {
			idLong.add(id.toString());
		}
		map.put("flowId", idLong);
		try {
			return flowDao.delete(sql.toString(), map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}

}
