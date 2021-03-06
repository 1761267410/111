package net.dfrz.bean.po;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

//流程节点表 记录流程节点的表
@Entity(name = "f_flowNode")
public class FlowNodePO {
	private String fnId;// 流程节点主键
	private String nodeName;// 节点名称
	private int statusName;// 审理状态
	private int nodeSort;// 节点排序
	private String creator;// 创建者
	private Date created_time;// 创建时间
	private String currentUser;// 当前用户ID
	private String nextUser;// 流向用户ID
	private String previousUser;// 回退用户ID
	private String flowId;

	public FlowNodePO() {
		// TODO Auto-generated constructor stub
	}

	@Id
	public String getFnId() {
		return fnId;
	}

	public void setFnId(String fnId) {
		this.fnId = fnId;
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public int getStatusName() {
		return statusName;
	}

	public void setStatusName(int statusName) {
		this.statusName = statusName;
	}

	public int getNodeSort() {
		return nodeSort;
	}

	public void setNodeSort(int nodeSort) {
		this.nodeSort = nodeSort;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Date getCreated_time() {
		return created_time;
	}

	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}

	public String getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(String currentUser) {
		this.currentUser = currentUser;
	}

	public String getNextUser() {
		return nextUser;
	}

	public void setNextUser(String nextUser) {
		this.nextUser = nextUser;
	}

	public String getPreviousUser() {
		return previousUser;
	}

	public void setPreviousUser(String previousUser) {
		this.previousUser = previousUser;
	}

	@Column(nullable = false)
	public String getFlowId() {
		return flowId;
	}

	public void setFlowId(String flowId) {
		this.flowId = flowId;
	}

}
