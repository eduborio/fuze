package br.com.weblogia.fuze.domain.services.emails;

public class ConfiguracaoDeEmail {
	
	private String smtpHost;
	private int smtpPort;
	private String email;
	private String senha;
	private Boolean usaSSL;
	
	public ConfiguracaoDeEmail(){
		this.smtpHost = "rs12.websitehostserver.net";
		this.smtpPort = 465;
		this.usaSSL = true;
		this.email = "orcamentos@fuzeimage.com.br";
		this.senha = "orca2016";
	}

	public String getSmtpHost() {
		return smtpHost;
	}

	public int getSmtpPort() {
		return smtpPort;
	}

	public String getEmail() {
		return email;
	}

	public String getSenha() {
		return senha;
	}

	public Boolean getUsaSSL() {
		return usaSSL;
	}

}
