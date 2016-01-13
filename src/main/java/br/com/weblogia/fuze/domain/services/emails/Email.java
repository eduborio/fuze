package br.com.weblogia.fuze.domain.services.emails;

import java.util.ArrayList;
import java.util.List;


public class Email {
	
	private String assunto;
	private String corpo;
	private String destinatarios;
	private List<Anexo> anexos = new ArrayList<Anexo>();
	
	public String getAssunto() {
		return assunto;
	}
	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}
	public String getCorpo() {
		return corpo;
	}
	public void setCorpo(String corpo) {
		this.corpo = corpo;
	}
	public String getDestinatarios() {
		return destinatarios;
	}
	public void setDestinatarios(String destinatarios) {
		this.destinatarios = destinatarios;
	}
	public List<Anexo> getAnexos() {
		return anexos;
	}
	public void setAnexos(List<Anexo> anexos) {
		this.anexos = anexos;
	}
	
	public void adicionarAnexo(Anexo anexo){
		this.anexos.add(anexo);
	}
	
	

}
