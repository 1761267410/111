package net.dfrz.bean.bo;

import net.dfrz.bean.po.UserPO;

public class SheetBO {
	private int id;// 假条编号
	private String name;// 请假人姓名
	private String reason;// 理由
	private int day;// 时间/日
	private String start_day;// 开始时间
	private String end_day;// 结束时间
	private String progress;// 审核进度（选择：默认等待审核）
	private UserPO userBO;// 多假条对一用户
	private FlowBO flowBO;// 一个请假表对应一个流程
}
