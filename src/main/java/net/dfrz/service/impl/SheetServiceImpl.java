package net.dfrz.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import net.dfrz.bean.bo.FlowBO;
import net.dfrz.bean.po.FlowNodePO;
import net.dfrz.bean.po.SheetPO;
import net.dfrz.bean.po.UserPO;
import net.dfrz.dao.SheetDao;
import net.dfrz.mail.MailUtil;
import net.dfrz.service.FlowNodeServiceI;
import net.dfrz.service.FlowServiceI;
import net.dfrz.service.SheetServiceI;
import net.dfrz.service.UserServiceI;

@Service("sheetService")
@Transactional
public class SheetServiceImpl implements SheetServiceI {

	@Autowired
	private SheetDao sheetDao;

	@Autowired
	private FlowServiceI flowServiceI;

	@Autowired
	private FlowNodeServiceI flowNodeServiceI;

	@Autowired
	private UserServiceI userServiceI;

	@Override
	public int addSheet(SheetPO sheet) {
		return sheetDao.save(sheet) != null ? 1 : 0;
	}

	@Override
	public int addOruptSheet(SheetPO sheet) {
		return sheetDao.saveOrUpdate(sheet) != null ? 1 : 0;

	}

	@Override
	public void delSheet(Integer sheetid) {
		sheetDao.deleteById(sheetid);
	}

	@Override
	public int delSheets(String flowIds) {
		String hql = "delete from f_sheet where flowId in(:flowIds)";
		Map<String, List<Object>> map = new HashMap<>();
		List<Object> ids = new ArrayList<>();
		for (Object id : CollectionUtils.arrayToList(flowIds.split(","))) {
			ids.add(id.toString());
		}
		map.put("flowIds", ids);
		try {
			return sheetDao.delete(hql, map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int uptSheet(SheetPO sheet) {
		return sheetDao.update(sheet) != null ? 1 : 0;

	}

	@Override
	public SheetPO getSheetById(Integer sheetid) {
		SheetPO sheetPO = sheetDao.findById(sheetid);

		return sheetPO;
	}

	@Override
	public List<SheetPO> getSheets() {
		String sql = "from f_sheet";

		return sheetDao.find(sql, null);
	}

	@Override
	public List<SheetPO> getSheetByHql(String sql) {
		return getSql(sql, null);
	}

	private List<SheetPO> getSql(String sql, Object[] param) {
		List<SheetPO> sheetPOs = sheetDao.findBySql(sql, param);
		return sheetPOs;
	}

	@Override
	public int delSheetBydelUser(String key, String value) {
		String hql = "delete from f_sheet where " + key + " in(:uid)";// 用户id
		Map<String, List<Object>> map = new HashMap<>();
		List<Object> ids = new ArrayList<>();
		for (Object id : CollectionUtils.arrayToList(value.split(","))) {
			ids.add(id.toString());
		}
		map.put("uid", ids);
		try {
			return sheetDao.delete(hql, map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public int UpdateSheet(String progress, int id, String currentUser, int status) {
		int result = sheetDao.UpdateSheet(progress, id, currentUser, status);
		return result;
	}

	@Override
	public void createFlow(SheetPO sheetPO) {
		SheetPO sheetPO2 = new SheetPO();
		FlowBO flowBO = new FlowBO();
		FlowNodePO flowNodePO = new FlowNodePO();
		BeanUtils.copyProperties(sheetPO, sheetPO2, "id");

		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		String name = sheetPO.getName();
		String uid = sheetPO.getUid();
		Date date = new Date();
		long realdate = (sheetPO.getEnd_day().getTime() - sheetPO.getStart_day().getTime()) / (1000 * 3600 * 24);
		if (realdate == 0)
			realdate = 1;
		if (realdate >= 3) {
			try {
				flowNodePO.setNextUser(userServiceI.getDean(uid).getUid());
			} catch (Exception e) {
				flowNodePO.setNextUser("");
			}
		}
		UserPO user = userServiceI.getTeacher(uid);
		String currentUser = user.getUid();

		flowBO.setCreater(name);
		flowBO.setCreater_time(date);
		flowBO.setFlow_status(1);
		flowBO.setFlowId(uuid);
		flowBO.setCurrentUser(currentUser);

		sheetPO2.setDay((int) realdate);
		sheetPO2.setFlowId(uuid);
		sheetPO2.setProgress("0");
		sheetPO2.setFlow_status(1);

		flowNodePO.setPreviousUser(sheetPO.getUid());
		flowNodePO.setCreated_time(date);
		flowNodePO.setCreator(name);
		flowNodePO.setCurrentUser(currentUser);
		flowNodePO.setFlowId(uuid);
		flowNodePO.setNodeName("班主任审核");
		flowNodePO.setFnId(UUID.randomUUID().toString().replaceAll("-", ""));

		this.addSheet(sheetPO2);
		flowServiceI.addFlow(flowBO);
		flowNodeServiceI.addFlowNode(flowNodePO);

		String emil = user.getEmail();
		// 生成邮件
		MailUtil.sendMailByAsynchronous(emil, "尊敬的" + user.getName() + ",学生 " + name + " 向您发起了 "
				+ sheetPO.getStart_day() + "到" + sheetPO.getEnd_day() + " 的请假请,请您尽快处理!");
	}
}
