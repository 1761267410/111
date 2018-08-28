package net.dfrz.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import net.dfrz.bean.po.UserPO;

@Repository
public class UserDao extends BaseDao<UserPO, String> {
	@Autowired
	public JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public UserPO loginUser(UserPO user) {
		String sql = "select * from f_user where name = '" + user.getName() + "' and password= '" + user.getPassword()
				+ "'";
		List<UserPO> list = (List<UserPO>) this.jdbcTemplate.query(sql, new BeanPropertyRowMapper(UserPO.class));
		if (list != null && list.size() != 0) {
			return list.get(0);
		}
		return null;
	}

	public UserPO checkNameExist(String name) {
		String sql = "select * from f_user where name = '" + name + "'";
		List<UserPO> list = (List<UserPO>) this.jdbcTemplate.query(sql, new BeanPropertyRowMapper(UserPO.class));
		if (list != null && list.size() != 0) {
			return list.get(0);
		}
		return null;
	}
}
