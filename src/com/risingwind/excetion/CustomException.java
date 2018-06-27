package com.risingwind.excetion;

/**
 * 自定义异常类
 * @author OMEN
 *
 */
public class CustomException extends Exception {
	
	/**
	 * 序列化版本
	 */
	private static final long serialVersionUID = 1L;
	
	public CustomException(String message) {
		super(message);
		this.message = message;
	}
	
	public String message;

	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	

}
