package br.com.weblogia.fuze.controllers;

import javax.inject.Inject;
import javax.transaction.Transactional;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.weblogia.fuze.domain.Praca;
import br.com.weblogia.fuze.repositorios.PracaRepositorio;

@Controller
public class PracasController {
	
	private @Inject  PracaRepositorio pracas;
	private @Inject  Result result;
	
	public void list(int pagina){
		result.include("registros",pracas.buscaTotalDeRegistrosDaLista());
		result.include("pagina",pagina);
		result.include("pracaList",pracas.buscaTodos(pagina));
	}
	
	public void novo(){
		result.include("praca",new Praca());
	}
	
	@Path("/pracas/{id}")
	public void edit(Long id){
		Praca praca = pracas.buscaPorId(id);
		result.include("praca",praca);
		result.of(this).novo();
	}
	
	@Post
	@Transactional
	public void salvar(Praca praca){
		
		if(praca.getId()==null){
			pracas.salva(praca);
		}else{
			pracas.atualiza(praca);
		}
		
		result.redirectTo("list");
	}

}