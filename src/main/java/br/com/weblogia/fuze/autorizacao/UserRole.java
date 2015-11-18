package br.com.weblogia.fuze.autorizacao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name="papeis")
public class UserRole implements Role {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	private String nome;
	
	private String descricao;
	
	@OneToMany
	private List<PermissaoDeAcesso> permissoes = new ArrayList<PermissaoDeAcesso>();

	@Override
	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<PermissaoDeAcesso> getPermissoes() {
		return permissoes;
	}

	public void setPermissoes(List<PermissaoDeAcesso> permissoes) {
		this.permissoes = permissoes;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

}
