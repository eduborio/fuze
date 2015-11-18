package br.com.weblogia.fuze.autorizacao;

import java.io.Serializable;

public interface Autorizador extends Serializable{
	
	boolean temPermicao(UserRole role, String url);

}
