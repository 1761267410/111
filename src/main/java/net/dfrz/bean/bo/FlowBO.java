package net.dfrz.bean.bo;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

public class FlowBO {
	private String flowId; // 流程主键
	private String flowName;// 流程名称
	private int flow_status;// 是否启用流程
	private String creater;// 创建者

	public String getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(String currentUser) {
		this.currentUser = currentUser;
	}

	private Date creater_time;// 创建时间
	private String currentUser;// 当前流程的用户

	/*
	 * 开启流程
	 */
	public static final int Enter_Flow = 1;
	/*
	 * 流程关闭
	 */

	public static final int Close_Flow = 0;

	public String getFlowId() {
		return flowId;
	}

	public void setFlowId(String flowId) {
		this.flowId = flowId;
	}

	public String getFlowName() {
		return flowName;
	}

	public void setFlowName(String flowName) {
		this.flowName = flowName;
	}

	public int getFlow_status() {
		return flow_status;
	}

	public void setFlow_status(int flow_status) {
		this.flow_status = flow_status;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	@JSON(format = "yyyy-MM-dd")
	public Date getCreater_time() {
		return creater_time;
	}

	public void setCreater_time(Date creater_time) {
		this.creater_time = creater_time;
	}

}
