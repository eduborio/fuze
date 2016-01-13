package br.com.weblogia.fuze.domain.builder;

import java.util.Date;

import br.com.weblogia.fuze.domain.Orcamento;

public class OrcamentoBuilder {
	
	private Orcamento o;

	public OrcamentoBuilder(Orcamento o){
		this.o = o;
	}
	
	public Orcamento build(){
		
		Orcamento orc = new Orcamento();
		orc.setDataOrcamento(new Date());
		orc.setAcrescimo(o.getAcrescimo());
		orc.setAgencia(o.getAgencia());
		orc.setBv(o.getBv());
		orc.setCliente(o.getCliente());
		orc.setContato(o.getContato());
		orc.setDesconto(o.getDesconto());
		orc.setDescricao(o.getDescricao());
		orc.setDias(o.getDias());
		orc.setEmpresaRodape(o.getEmpresaRodape());
		orc.setJob(o.getJob());
		orc.setMidias(o.getMidias());
		orc.setNf(o.getNf());
		orc.setPeriodoDeUso(o.getPeriodoDeUso());
		orc.setPraca(o.getPraca());
		orc.setPrazoExecucao(o.getPrazoExecucao());
		orc.setSocio(o.getSocio());
		orc.setSocioRodape(o.getSocioRodape());
		orc.setTemNF(o.getTemNF());
		orc.setTipo(o.getTipo());
		orc.setValor(o.getValor());
		orc.setValorDiaria(o.getValorDiaria());
		
		return orc;
		
	}

}
