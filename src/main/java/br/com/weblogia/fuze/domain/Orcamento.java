package br.com.weblogia.fuze.domain;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import br.com.weblogia.fuze.controllers.Contato;

@Entity
@Table(name="orcamentos")
public class Orcamento {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private Date DataOrcamento;
	
	@ManyToOne
	private Agencia agencia;
	
	@ManyToOne
	private Cliente cliente;
	
	private String pracas;
	
	private String midias;
	
	private String periodoDeUso;
	
	private String job;
	
	@ManyToOne
	private Socio socio;
	
	@ManyToOne
	private Praca praca;

	@ManyToOne
	private Contato contato;
	
	private String descricao;
	
	private String prazoExecucao;
	
	private Boolean empresaRodape;
	
	private Boolean socioRodape;
	
	private Integer dias;
	
	private Boolean temNF;
	
	private Double valorDiaria;
	private Double bv;
	private Double nf;
	
	private TipoDiaria tipo;
	
	private String cor;
	
	private String icone;
	
	private String status;
	
	private Double valor;
	private Double acrescimo;
	private Double desconto;
	
	public List<String> getImgs(){
		List<String> pdfs = new ArrayList<String>(); 
		
		if(id!=null){
			File folder = new File("/home/eduardo/imgs/orcamento/" + id);
			
			if(folder.exists()){
				for(File file : folder.listFiles()){
					pdfs.add(file.getName());
				}
			}
			
			return pdfs;
			
		}
		
		return new ArrayList<String>();	
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDataOrcamento() {
		return DataOrcamento;
	}

	public void setDataOrcamento(Date dataOrcamento) {
		DataOrcamento = dataOrcamento;
	}

	public Agencia getAgencia() {
		return agencia;
	}

	public void setAgencia(Agencia agencia) {
		this.agencia = agencia;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public String getPracas() {
		return pracas;
	}

	public void setPracas(String pracas) {
		this.pracas = pracas;
	}

	public String getMidias() {
		return midias;
	}

	public void setMidias(String midias) {
		this.midias = midias;
	}

	public String getPeriodoDeUso() {
		return periodoDeUso;
	}

	public void setPeriodoDeUso(String periodoDeUso) {
		this.periodoDeUso = periodoDeUso;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public Socio getSocio() {
		return socio;
	}

	public void setSocio(Socio socio) {
		this.socio = socio;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getPrazoExecucao() {
		return prazoExecucao;
	}

	public void setPrazoExecucao(String prazoExecucao) {
		this.prazoExecucao = prazoExecucao;
	}

	public Integer getDias() {
		return dias;
	}

	public void setDias(Integer dias) {
		this.dias = dias;
	}

	public Boolean getTemNF() {
		return temNF;
	}

	public void setTemNF(Boolean temNF) {
		this.temNF = temNF;
	}

	public TipoDiaria getTipo() {
		return tipo;
	}

	public void setTipo(TipoDiaria tipo) {
		this.tipo = tipo;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public String getIcone() {
		return icone;
	}

	public void setIcone(String icone) {
		this.icone = icone;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Double getValorDiaria() {
		return valorDiaria;
	}

	public void setValorDiaria(Double valorDiaria) {
		this.valorDiaria = valorDiaria;
	}

	public Double getBv() {
		return bv;
	}

	public void setBv(Double bv) {
		this.bv = bv;
	}

	public Double getNf() {
		return nf;
	}

	public void setNf(Double nf) {
		this.nf = nf;
	}

	public Praca getPraca() {
		return praca;
	}

	public void setPraca(Praca praca) {
		this.praca = praca;
	}

	public Contato getContato() {
		return contato;
	}

	public void setContato(Contato contato) {
		this.contato = contato;
	}

	public Boolean getEmpresaRodape() {
		return empresaRodape;
	}

	public void setEmpresaRodape(Boolean empresaRodape) {
		this.empresaRodape = empresaRodape;
	}

	public Boolean getSocioRodape() {
		return socioRodape;
	}

	public void setSocioRodape(Boolean socioRodape) {
		this.socioRodape = socioRodape;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Double getAcrescimo() {
		return acrescimo;
	}

	public void setAcrescimo(Double acrescimo) {
		this.acrescimo = acrescimo;
	}

	public Double getDesconto() {
		return desconto;
	}

	public void setDesconto(Double desconto) {
		this.desconto = desconto;
	}
}
