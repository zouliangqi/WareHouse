package com.yourcompany.struts.Exception;

/**
 * Ӧ�ó����쳣������
 *
 */
public class AppException extends RuntimeException {
	// �������
	private String errorCode;//��Դ�ļ��ж������
	
	private Object [] args;//�����Դ�ļ���ռλ��Ϣ����{0},{1}��
	
	public AppException(String errorCode){
		this.errorCode = errorCode;
	}
	
	public AppException(String errorCode, Object [] args){
		this.errorCode = errorCode;
		this.args = args;
	}
	
	public AppException(String errorCode, String arg){
		this(errorCode,new Object[]{arg});
	}

	public Object[] getArgs() {
		return args;
	}

	public String getErrorCode() {
		return errorCode;
	}
	
}

