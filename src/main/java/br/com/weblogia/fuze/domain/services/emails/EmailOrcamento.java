package br.com.weblogia.fuze.domain.services.emails;

import javax.activation.DataSource;
import javax.mail.util.ByteArrayDataSource;

import br.com.weblogia.fuze.domain.Orcamento;

public class EmailOrcamento {

	public Email build(String destinatarios,Orcamento o,byte[] pdf){
		
		Email email = new Email();
		email.setAssunto("Orcamento");
		String body = "";
		body+= "Teste de email automatico \r\n";
		body+= "Esta é um a mensagem automática, favor não responder. \r\n";
		email.setCorpo(body);
		email.setDestinatarios(destinatarios);
		email.adicionarAnexo(anexoDoPdf(o, pdf));
		
		return email;
	}
	
	private Anexo anexoDoPdf(Orcamento o,byte[] pdf) {
		
		Anexo anexo = new Anexo();
		anexo.setNomeArquivo(o.getId()+"-"+o.getAgencia().getNome()+"-"+o.getCliente().getNome()+ ".pdf");
		anexo.setDescricao("Orçamento");
		
		try{
			DataSource pdfSource = new ByteArrayDataSource(pdf, "application/pdf");
			anexo.setDataSource(pdfSource);
		}catch(Exception e){
			new RuntimeException("Nao foi possivel anexar pdf ao email",e);
		}
	
		return anexo;
	}
}
