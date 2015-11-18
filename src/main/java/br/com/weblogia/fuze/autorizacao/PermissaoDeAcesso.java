package br.com.weblogia.fuze.autorizacao;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="permissoes")
public class PermissaoDeAcesso {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	private UserRole role;
	
	@ManyToOne
	private Recurso recurso;
	
	private boolean permissao;

	public boolean isPermissao() {
		return permissao;
	}

	public void setPermissao(boolean permissao) {
		this.permissao = permissao;
	}

}
