package net.dfrz.bean.po;

import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

//流程主表 当用户发起请假时生成的流程表
@Entity(name = "f_flow")
public class FlowPO {
	private String flowId; // 流程主键
	private String flowName;// 流程名称
	private int flow_status;// 是否启用流程
	private String creater;// 创建者
	private Date creater_time;// 创建时间
	private String currentUser;// 当前流程的用户
	// private Set<FlowNodePO> flownodes;

	public String getCurrentUser() {
		return currentUser;
	}

	public void setCurrentUser(String currentUser) {
		this.currentUser = currentUser;
	}

	public FlowPO() {

		this.flowId = UUID.randomUUID().toString().replaceAll("-", "");
		// this.flownodes = new HashSet<FlowNodePO>();
	}

	// @OneToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
	// @JoinColumn(name = "flowId") // 设置一方的外键，这里是cid，因为实际上这个外键还是加在多方，只不过控制权变了。
	// public Set<FlowNodePO> getFlownodes() {
	// return flownodes;
	// }
	//
	// public void setFlownodes(Set<FlowNodePO> flownodes) {
	// this.flownodes = flownodes;
	// }

	@Id
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

	@Column(nullable = false)
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

	public Date getCreater_time() {
		return creater_time;
	}

	public void setCreater_time(Date creater_time) {
		this.creater_time = creater_time;
	}

	// public SheetPO getSheetPO() {
	// return sheetPO;
	// }
	//
	// public void setSheetPO(SheetPO sheetPO) {
	// this.sheetPO = sheetPO;
	// }
}
