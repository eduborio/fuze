package br.com.weblogia.fuze.autorizacao;

import javax.enterprise.context.SessionScoped;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;


@SessionScoped
@Entity
@Table(name="usuarios")
public class Usuario implements Autorizavel {
	
	private static final long serialVersionUID = -5976348766062101859L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	private UserRole role;
	
	private String nome;

	@Transient
	private boolean estaLogado;
	
	@Transient
	private String lastUrl;
	
	private String login;
	private String senha;
	
	@Transient
	private String confirmacao;
	
	

	@Override
	public UserRole getRole() {
		return role;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Override
	public boolean isLogado() {
		return estaLogado;
	}

	public void setLogado(boolean logado) {
		this.estaLogado = logado;
	}

	@Override
	public String getLastUrlAttempt() {
		return lastUrl;
	}

	@Override
	public void setLastUrlAttempt(String url) {
		this.lastUrl = url;
	}

	public String getLastUrl() {
		return lastUrl;
	}

	public void setLastUrl(String lastUrl) {
		this.lastUrl = lastUrl;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public void setRole(UserRole role) {
		this.role = role;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getConfirmacao() {
		return confirmacao;
	}

	public void setConfirmacao(String confirmacao) {
		this.confirmacao = confirmacao;
	}
	
	public boolean senhaConfere() {
		return (this.senha.equals(this.confirmacao));
	}

}
