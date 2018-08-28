package net.dfrz.action;

import com.opensymphony.xwork2.ActionSupport;

public class CommonAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	protected int pageNO;
	protected int pageSize;

	public int getPageNO() {
		return pageNO;
	}

	public void setPageNO(int pageNO) {
		this.pageNO = pageNO;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

}
