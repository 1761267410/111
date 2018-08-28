package net.dfrz.service;

import java.util.List;

import net.dfrz.bean.po.UserPO;

public interface UserServiceI {

	// 登录的方法
	public UserPO login(UserPO user);

	public UserPO checkNameExist(String name);

	public int addUser(UserPO user);

	public void delUser(String uid);

	public int delUsers(String uids);

	public int uptUser(UserPO user);

	public UserPO getTeacher(String uid);

	public UserPO getDean(String uid);

	// public String getNextUser(String uid);

	public UserPO getUserById(String uid);

	public List<UserPO> getUsers();

	public List<UserPO> getUserByHql(String hql);

	public String getMail(String uid);

	public void uptPassword(UserPO userPO);
}
