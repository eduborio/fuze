package br.com.weblogia.fuze.controllers;

import javax.inject.Inject;
import javax.transaction.Transactional;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.weblogia.fuze.domain.Configuracoes;
import br.com.weblogia.fuze.repositorios.ConfiguracoesRepositorio;

@Controller
public class ConfigController {
	
	private @Inject  ConfiguracoesRepositorio cfg;
	private @Inject  Result result;
	
	public void novo(){
		result.include("cinfiguracoes",new Configuracoes());
	}
	
	@Path("/config/{id}")
	public void edit(Long id){
		Configuracoes configuracoes = cfg.buscaPorId(id);
		result.include("configuracoes",configuracoes);
		result.of(this).novo();
	}
	
	@Post
	@Transactional
	public void salvar(Configuracoes configuracoes){
		
		if(configuracoes.getId()==null){
			cfg.salva(configuracoes);
		}else{
			cfg.atualiza(configuracoes);
		}
		
		result.redirectTo("/");
	}
	
	
	

}