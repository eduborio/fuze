package br.com.weblogia.fuze.controllers;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.weblogia.fuze.anotacoes.NaoPrecisaAutorizacao;
import br.com.weblogia.fuze.autorizacao.UserRole;
import br.com.weblogia.fuze.autorizacao.Usuario;
import br.com.weblogia.fuze.repositorios.UsuarioRepositorio;

@Controller
@NaoPrecisaAutorizacao
public class LoginController {
	
	
	private @Inject Usuario usuario;
	
	private @Inject Result result;
	
	private @Inject UsuarioRepositorio usuarios; 
	
	public void login(){
		
	}
	
	@Post
	public void logar(String login, String senha){
		
		if(login.equals("admin") && senha.equals("du19216878")){
			UserRole role = new UserRole();
			role.setNome("SuperUsuario");
			usuario.setLogado(true);
			usuario.setLogin(login);
			usuario.setRole(role);
		}else{
			Usuario carregaUsuario = usuarios.buscaUsuarioPorLogin(login);
			
			if(carregaUsuario!=null){
				if(carregaUsuario.getSenha().equals(senha)){
					usuario.setId(carregaUsuario.getId());
					usuario.setLogado(true);
					usuario.setLogin(login);
					usuario.setNome(carregaUsuario.getNome());
					usuario.setRole(carregaUsuario.getRole());
				}
			}
		}
		
		if(usuario.getLastUrlAttempt()!=null){
			result.redirectTo(usuario.getLastUrlAttempt());
		}else{
			result.redirectTo("/");
		}
	}
	
	public void negado(){
		result.include("usuario",usuario);
	}
	
	public void sair(){
		usuario.setLogado(false);
		result.redirectTo("/login/login");
	}

}
