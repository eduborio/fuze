package br.com.weblogia.fuze.autorizacao;

import java.io.Serializable;

public interface Autorizavel extends Serializable{
	
	UserRole getRole();
	boolean isLogado();
	void setLogado(boolean isLogado);
	String getLastUrlAttempt();
	void setLastUrlAttempt(String url);

}
