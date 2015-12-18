package br.com.weblogia.fuze.domain.relatorios;

import java.util.Date;

import br.com.weblogia.fuze.domain.Orcamento;

public class OrcamentoImpressao {
	
	private Orcamento o;
	
	public OrcamentoImpressao (Orcamento o){
		this.o = o;
	}
	
	public Date getData(){
		return o.getDataOrcamento();
	}
	
	public String getAgencia(){
		if(o.getAgencia()==null)
			return null;
		
		return o.getAgencia().getNome();
	}
	
	public String getCliente(){
		if(o.getCliente()==null)
			return null;
		
		return o.getCliente().getNome();
	}
	
	public String getSocio(){
		if(o.getSocio()==null)
			return null;
		
		return o.getSocio().getNome();
	}
	
	public String getSocio_nome(){
		if(o.getSocio()==null)
			return null;
		
		return o.getSocio().getNome();
	}
	
	public String getSocio_email(){
		if(o.getSocio()==null)
			return null;
		
		return o.getSocio().getEmail();
	}
	
	public String getSocio_telefone(){
		if(o.getSocio()==null)
			return null;
		
		return o.getSocio().getTelefone();
	}
	
	public String getJob(){
		return o.getJob();
	}
	
	public String getPrazo(){
		return o.getPrazoExecucao();
	}
	
	public String getMidias(){
		return o.getMidias();
	}
	
	public String getPeriodo(){
		return o.getPeriodoDeUso();
	}
	
	public String getPedido(){
		return o.getDescricao();
	}
	
	public String getAc(){
		if(o.getContato()==null)
			return null;
		
		return o.getContato().getNome();
	}
	
	public String getPraca(){
		if(o.getPraca()==null)
			return null;
		
		return o.getPraca().getDescricao();
	}
	
	public Double getValor(){
		return o.getValor();
	}
	
	public String getCodigo(){
		return o.getId().toString();
	}

}
