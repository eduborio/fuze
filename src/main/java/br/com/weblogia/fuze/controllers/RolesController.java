package br.com.weblogia.fuze.controllers;

import javax.inject.Inject;
import javax.transaction.Transactional;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.weblogia.fuze.autorizacao.UserRole;
import br.com.weblogia.fuze.repositorios.UserRoleRepositorio;

@Controller
public class RolesController {
	
	private @Inject Result result;
	private @Inject UserRoleRepositorio roles;
	
	@Transactional
	public void list(int pagina){
		result.include("roleList",roles.buscaTodos(pagina));
		result.include("registros",roles.buscaTotalDeRegistrosDaLista());
		result.include("pagina",pagina);
	}
	
	public void novo(){
		result.include("role",new UserRole());
	}
	
	@Post
	@Transactional
	public void salvar(UserRole role){
		roles.salva(role);
		result.redirectTo("list");
	}

}
