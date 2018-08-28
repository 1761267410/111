package net.dfrz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import net.dfrz.bean.po.DepPO;
import net.dfrz.dao.DepDao;
import net.dfrz.service.DepServiceI;

@Service("depService")
@Transactional
public class DepServiceImpl implements DepServiceI {

	@Autowired
	private DepDao depDao;

	@Override
	public void addDep(DepPO depPO) {
		depDao.save(depPO);

	}

	@Override
	public void delDep(String depid) {
		depDao.deleteById(depid);

	}

	@Override
	public int delDeps(String depids) {
		String hql = "delete from f_dep where depid in(:depid)";
		Map<String, List<Object>> map = new HashMap<>();
		List<Object> ids = new ArrayList<>();
		for (Object id : CollectionUtils.arrayToList(depids.split(","))) {
			ids.add(id.toString());
		}
		map.put("depid", ids);
		try {
			return depDao.delete(hql, map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public void uptDep(DepPO depPO) {
		depDao.update(depPO);

	}

	@Override
	public DepPO getDepById(String depid) {
		DepPO depPO = depDao.findById(depid);

		return depPO;
	}

	@Override
	public List<DepPO> getDeps() {
		String sql = "from f_dep";

		return getSql(sql, null);
	}

	@Override
	public List<DepPO> getDepByHql(String hql) {
		return getSql(hql, null);
	}

	private List<DepPO> getSql(String sql, Object[] param) {
		List<DepPO> depPOs = depDao.find(sql, param);
		return depPOs;
	}
}
