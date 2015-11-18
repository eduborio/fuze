package br.com.weblogia.fuze.controllers;

import javax.inject.Inject;
import javax.transaction.Transactional;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.weblogia.fuze.domain.Midia;
import br.com.weblogia.fuze.repositorios.MidiaRepositorio;

@Controller
public class MidiasController {
	
	private @Inject  MidiaRepositorio midias;
	private @Inject  Result result;
	
	public void list(int pagina){
		result.include("registros",midias.buscaTotalDeRegistrosDaLista());
		result.include("pagina",pagina);
		result.include("midiaList",midias.buscaTodos(pagina));
	}
	
	public void novo(){
		result.include("midia",new Midia());
	}
	
	@Path("/midias/{id}")
	public void edit(Long id){
		Midia midia = midias.buscaPorId(id);
		result.include("midia",midia);
		result.of(this).novo();
	}
	
	@Post
	@Transactional
	public void salvar(Midia midia){
		
		if(midia.getId()==null){
			midias.salva(midia);
		}else{
			midias.atualiza(midia);
		}
		
		result.redirectTo("list");
	}

}