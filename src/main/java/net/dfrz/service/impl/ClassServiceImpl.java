package net.dfrz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import net.dfrz.bean.po.ClassPO;
import net.dfrz.dao.ClassDao;
import net.dfrz.service.ClassServiceI;

@Service("classService")
@Transactional
public class ClassServiceImpl implements ClassServiceI {

	@Autowired
	private ClassDao classDao;

	@Override
	public void addClass(ClassPO classPO) {
		classDao.save(classPO);

	}

	@Override
	public void delClass(String classid) {
		classDao.deleteById(classid);

	}

	@Override
	public int delClasses(String classids) {
		String hql = "delete from f_class where classid in(:classid)";
		Map<String, List<Object>> map = new HashMap<>();
		List<Object> ids = new ArrayList<>();
		for (Object id : CollectionUtils.arrayToList(classids.split(","))) {
			ids.add(id.toString());
		}
		map.put("classid", ids);
		try {
			return classDao.delete(hql, map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public void uptClass(ClassPO classPO) {
		classDao.update(classPO);

	}

	@Override
	public ClassPO getClassById(String classid) {
		ClassPO classPO = classDao.findById(classid);

		return classPO;
	}

	@Override
	public List<ClassPO> getClasses() {
		String sql = "from f_class";

		return getSql(sql, null);
	}

	@Override
	public List<ClassPO> getClassByHql(String hql) {
		return getSql(hql, null);
	}

	private List<ClassPO> getSql(String sql, Object[] param) {
		List<ClassPO> classPOs = classDao.find(sql, param);
		return classPOs;
	}

}
