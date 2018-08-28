package net.dfrz.service;

import java.util.List;

import net.dfrz.bean.po.ClassPO;

public interface ClassServiceI {

	public void addClass(ClassPO classPO);

	public void delClass(String classid);

	public int delClasses(String classids);

	public void uptClass(ClassPO classPO);

	public ClassPO getClassById(String classid);

	public List<ClassPO> getClasses();

	public List<ClassPO> getClassByHql(String hql);

}
