package net.dfrz.exception;

public class BizException extends RuntimeException {
	protected int code;

	protected String msg;

	public BizException(int code, String msgFomat, Object... args) {
		super(String.format(msgFomat, args));
		this.code = code;
		this.msg = String.format(msgFomat, args);
	}

	public BizException() {
		super();
	}

	public int getCode() {
		return this.code;
	}

	public String getMsg() {
		return this.msg;
	}

	/**
	 * 实例化异常
	 */

	public BizException newInstance(String msgFormat, Object... args) {
		return new BizException(this.code, msgFormat, args);
	}

	public BizException(String message, Throwable cause) {
		super(message, cause);
	}

	public BizException(Throwable cause) {
		super(cause);
	}

	public BizException(String message) {
		super(message);
	}
}
