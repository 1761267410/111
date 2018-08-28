package net.dfrz.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import net.dfrz.bean.po.SheetPO;

@Repository
public class SheetDao extends BaseDao<SheetPO, Integer> {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public int UpdateSheet(String progress, int id, String currentUser, int status) {
		// TODO Auto-generated method stub
		int result = 0;
		String user = currentUser == null ? "" : currentUser;
		StringBuilder sql = new StringBuilder();
		sql.append("update f_sheet a,f_flow b");
		sql.append(
				" set b.flow_status = " + status + ",a.flow_status = " + status + ", a.progress = '" + progress + "',");
		sql.append(" b.currentUser = '" + user + "'");
		sql.append(" where a.id = '" + id + "'");
		sql.append(" and a.flowId = b.flowId");
		try {
			jdbcTemplate.execute(sql.toString());
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("修改失败");
			result = 0;
		}

		return result;
	}
}
