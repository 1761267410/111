package net.dfrz.service;

import java.util.List;

import net.dfrz.bean.po.SheetPO;

public interface SheetServiceI {

	public int addSheet(SheetPO Sheet);

	public int uptSheet(SheetPO sheet);

	public int addOruptSheet(SheetPO sheet);

	public void delSheet(Integer sheetid);

	public int delSheetBydelUser(String key, String value);

	// 根据流程编号删除请假表
	public int delSheets(String flowIds);

	// 根据请假表创建请假流程
	public void createFlow(SheetPO sheetPO);

	public SheetPO getSheetById(Integer sheetid);

	public List<SheetPO> getSheets();

	public List<SheetPO> getSheetByHql(String hql);

	public int UpdateSheet(String progress, int id, String currentUser, int status);

}
