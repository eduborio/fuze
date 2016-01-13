package br.com.weblogia.fuze.domain.services.emails;

import java.util.Arrays;
import java.util.List;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.MultiPartEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EnviadorDeEmail implements Runnable {
	
	private static final Logger logger = LoggerFactory.getLogger(EnviadorDeEmail.class); 
	private Email email;
	
	public EnviadorDeEmail(Email email){
		this.email = email;
	}
	
	public void enviaSemThread() throws EmailException{
		
		ConfiguracaoDeEmail cfg = new ConfiguracaoDeEmail();
		List<String> destinatarios = Arrays.asList(email.getDestinatarios().split(";"));
		
		MultiPartEmail emailMulti = new MultiPartEmail();
		emailMulti.setHostName(cfg.getSmtpHost());
		emailMulti.setSmtpPort(cfg.getSmtpPort());
		emailMulti.setAuthenticator(new DefaultAuthenticator(cfg.getEmail(), cfg.getSenha()));
		emailMulti.setSSLOnConnect(cfg.getUsaSSL());
		emailMulti.setFrom(cfg.getEmail());
		emailMulti.setSubject(email.getAssunto());
		emailMulti.setMsg(email.getCorpo());
		
		for(String destinatario : destinatarios){
			emailMulti.addTo(destinatario);
		}
		
		for(Anexo anexo : email.getAnexos()){
			emailMulti.attach(anexo.getDataSource(),anexo.getNomeArquivo(),anexo.getDescricao());
		}
		emailMulti.send();
		
	}
	
	private void enviaEmail() throws EmailException{
		
		ConfiguracaoDeEmail cfg = new ConfiguracaoDeEmail();
		List<String> destinatarios = Arrays.asList(email.getDestinatarios().split(";"));
		
		MultiPartEmail emailMulti = new MultiPartEmail();
		emailMulti.setHostName(cfg.getSmtpHost());
		emailMulti.setSmtpPort(cfg.getSmtpPort());
		emailMulti.setAuthenticator(new DefaultAuthenticator(cfg.getEmail(), cfg.getSenha()));
		emailMulti.setSSLOnConnect(cfg.getUsaSSL());
		emailMulti.setFrom(cfg.getEmail());
		emailMulti.setSubject(email.getAssunto());
		emailMulti.setMsg(email.getCorpo());
		
		for(String destinatario : destinatarios){
			emailMulti.addTo(destinatario);
		}
		
		for(Anexo anexo : email.getAnexos()){
			emailMulti.attach(anexo.getDataSource(),anexo.getNomeArquivo(),anexo.getDescricao());
		}
		emailMulti.send();
	}

	@Override
	public void run() {
		try {
			enviaEmail();
		} catch (EmailException e) {
			logger.debug("Nao foi possivel enviar email: " + e.getMessage());
		} catch (Exception e) {
			logger.debug("Nao foi possivel enviar email: " + e.getMessage());
		}
	}

}
