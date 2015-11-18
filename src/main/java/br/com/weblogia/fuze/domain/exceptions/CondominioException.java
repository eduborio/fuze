package br.com.weblogia.fuze.domain.exceptions;

public class CondominioException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public CondominioException(String message) {
		super(message);
	}
	
	public CondominioException(String message, Throwable e){
		super(message,e);
	}

}
