package br.com.weblogia.fuze.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="configuracoes")
public class Configuracoes implements Serializable {
	
	private static final long serialVersionUID = -5976348766062101859L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private Double diariaCwb;
	
	private Double diariaSp;
	
	private Double bv;
	
	private Double nf;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public double getDiariaCwb() {
		return diariaCwb;
	}

	public void setDiariaCwb(double diariaCwb) {
		this.diariaCwb = diariaCwb;
	}

	public double getDiariaSp() {
		return diariaSp;
	}

	public void setDiariaSp(double diariaSp) {
		this.diariaSp = diariaSp;
	}

	public double getBv() {
		return bv;
	}

	public void setBv(double bv) {
		this.bv = bv;
	}

	public double getNf() {
		return nf;
	}

	public void setNf(double nf) {
		this.nf = nf;
	}

}
