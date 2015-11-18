package br.com.weblogia.fuze.controllers;


import javax.inject.Inject;
import javax.transaction.Transactional;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.weblogia.fuze.autorizacao.Usuario;
import br.com.weblogia.fuze.repositorios.UserRoleRepositorio;
import br.com.weblogia.fuze.repositorios.UsuarioRepositorio;

@Controller
public class UsuariosController {
	
	private @Inject Result result;
	private @Inject Validator validator;
	private @Inject UsuarioRepositorio usuarios;
	private @Inject UserRoleRepositorio roles;
	
	@Get
	public void list(int pagina){
		result.include("usuarioList",usuarios.buscaTodos(pagina));
		result.include("registros",usuarios.buscaTotalDeRegistrosDaLista());
		result.include("pagina",pagina);
	}
	
	@Get
	public void pesquisar(String pesquisa) {
		result.include("usuarioList", usuarios.buscaUsuarioPorLogin(pesquisa));
		result.include("roleList",roles.buscaTodos());
		result.of(this).list(0);
	}
	
	
	public void novo(){
		result.include("usuario",new Usuario());
		result.include("roleList",roles.buscaTodos());
	}
	
	@Get
	@Path("/usuarios/{id}")
	public void edit(Long id) {
    	Usuario usuario = usuarios.buscaPorId(id);
    	usuario.setConfirmacao(usuario.getSenha());
    	
    	result.include("usuario", usuario);
    	result.include("roleList", roles.buscaTodos());
    	result.of(this).novo();
	}
	
	@Post
	@Transactional
	public void salvar(final Usuario usuario){
		
		validator.addIf(usuario.getLogin() == null,new SimpleMessage("validacao","Login deve ser informado!"));	
		validator.addIf(usuario.getNome() == null,new SimpleMessage("validacao","Nome deve ser informado!"));	
		validator.addIf(usuario.getSenha() == null,new SimpleMessage("validacao","Senha deve ser informada!"));	
		validator.addIf(! usuario.senhaConfere(),new SimpleMessage("validacao","Senha não confere!"));	
		
		if( validator.hasErrors()) {
	    	result.include("usuario", usuario);
	    	result.include("roleList", roles.buscaTodos());
			validator.onErrorUsePageOf(this).novo();
		}
		
		if(usuario.getId() == null) {
			usuarios.salva(usuario);
		}else {
			usuarios.atualiza(usuario);
		}
		result.redirectTo("list");
	}
}
