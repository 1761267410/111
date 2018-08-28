package net.dfrz.exception;

public class UserBizException extends BizException {
	/**************************** 用户平台-用户相关Start ******************************/
	public static final UserBizException UID_IS_NOT_EXIST = new UserBizException(1001001, "当前ID不存在");
	public static final UserBizException USERNAME_IS_NOT_EXIST = new UserBizException(1001002, "用户名不存在");
	public static final UserBizException USER_IS_NOT_EXIST = new UserBizException(1001003, "用户不存在");
	public static final UserBizException PASSWORD_IS_ERROR = new UserBizException(1001004, "密码错误");
	// public static final UserBizException USER_IS_NULL = new
	// UserBizException(1001005, "查询ID为空");

	public static final UserBizException USER_ADD_FAIL = new UserBizException(1001005, "查询ID为空");
	// public static final UserBizException USER_IS_NULL = new
	// UserBizException(1001005, "查询ID为空");
	// public static final UserBizException USER_IS_NULL = new
	// UserBizException(1001005, "查询ID为空");

	/**************************** 用户平台-用户相关End ********************************/
	public UserBizException() {

	}

	public UserBizException(int code, String msgFormat, Object... args) {
		super(code, msgFormat, args);
	}

	public UserBizException(int code, String msg) {
		super(code, msg);
	}

	/**
	 * 实例化异常
	 * 
	 * @param msgFormat
	 * @param args
	 * @return
	 */
	public UserBizException newInstance(String msgFormat, Object... args) {
		return new UserBizException(this.code, msgFormat, args);
	}

	public UserBizException print() {
		return new UserBizException(this.code, this.msg);
	}
}
