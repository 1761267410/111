package net.dfrz.service;

import java.util.List;

import net.dfrz.bean.po.DepPO;

public interface DepServiceI {

	public void addDep(DepPO depPO);

	public void delDep(String depid);

	public int delDeps(String depids);

	public void uptDep(DepPO depPO);

	public DepPO getDepById(String depid);

	public List<DepPO> getDeps();

	public List<DepPO> getDepByHql(String hql);

}
