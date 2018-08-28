package net.dfrz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import net.dfrz.bean.po.UserPO;
import net.dfrz.dao.UserDao;
import net.dfrz.service.UserServiceI;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserServiceI {

	@Autowired
	private UserDao userDao;

	public void setUserDaoI(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public UserPO login(UserPO user) {
		return userDao.loginUser(user);

	}

	@Override
	public UserPO checkNameExist(String name) {
		return userDao.checkNameExist(name);
	}

	@Override
	public int addUser(UserPO user) {
		return userDao.save(user) != null ? 1 : 0;
	}

	@Override
	public void delUser(String uid) {
		userDao.deleteById(uid);
	}

	@Override
	public int delUsers(String uids) {
		// TODO Auto-generated method stub
		String hql = "delete from f_user where uid in(:uid)";
		Map<String, List<Object>> map = new HashMap<>();
		List<Object> ids = new ArrayList<>();
		for (Object id : CollectionUtils.arrayToList(uids.split(","))) {
			ids.add(id.toString());
		}
		map.put("uid", ids);
		try {
			return userDao.delete(hql, map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int uptUser(UserPO user) {
		return userDao.update(user) != null ? 1 : 0;
	}

	@Override
	public UserPO getUserById(String uid) {
		UserPO userPO = userDao.findById(uid);

		return userPO;
	}

	@Override
	public List<UserPO> getUsers() {
		String sql = "from f_user";
		return getSql(sql, null);
	}

	@Override
	public List<UserPO> getUserByHql(String sql) {
		return getSql(sql, null);
	}

	private List<UserPO> getSql(String sql, Object[] param) {
		List<UserPO> userPOs = userDao.find(sql, param);
		return userPOs;
	}

	@Override
	public UserPO getTeacher(String uid) {
		StringBuilder sql = new StringBuilder();
		sql.append("select b.* from f_user a left join ");
		sql.append("f_user b on ");
		sql.append("b.classid = a.classid ");
		sql.append("where a.uid = ? ");
		sql.append("and b.rid = '2' ");

		UserPO user = (userDao.findBySql(sql.toString(), uid)).get(0);
		return user;
	}

	@Override
	public UserPO getDean(String uid) {
		StringBuilder sql = new StringBuilder();
		UserPO user;
		sql.append("select b.* from f_user a left join ");
		sql.append("f_user b on ");
		sql.append("b.depid = a.depid ");
		sql.append("where a.uid = ? ");
		sql.append("and b.rid = '3' ");

		user = (userDao.findBySql(sql.toString(), uid)).get(0);
		return user;
	}

	@Override
	public String getMail(String uid) {
		StringBuilder hql = new StringBuilder();
		hql.append("from f_user ");
		hql.append("where uid = '" + uid + "'");
		String mail = userDao.find(hql.toString(), null).get(0).getEmail();
		if (mail != null)
			return mail;
		return "";
	}

	@Override
	public void uptPassword(UserPO userPO) {
		StringBuilder sql = new StringBuilder();
		sql.append("Update f_user ");
		sql.append("SET password = " + userPO.getPassword());
		sql.append(" WHERE uid = '" + userPO.getUid() + "'");

	}

}
