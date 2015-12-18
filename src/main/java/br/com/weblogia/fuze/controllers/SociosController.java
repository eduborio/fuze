package br.com.weblogia.fuze.controllers;

import javax.inject.Inject;
import javax.transaction.Transactional;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.weblogia.fuze.domain.Cliente;
import br.com.weblogia.fuze.domain.Socio;
import br.com.weblogia.fuze.repositorios.SocioRepositorio;

@Controller
public class SociosController {
	
	private @Inject  SocioRepositorio socios;
	private @Inject  Result result;
	
	public void list(int pagina){
		result.include("registros",socios.buscaTotalDeRegistrosDaLista());
		result.include("pagina",pagina);
		result.include("socioList",socios.buscaTodos(pagina));
	}
	
	public void novo(){
		result.include("cliente",new Cliente());
	}
	
	@Path("/socios/{id}")
	public void edit(Long id){
		Socio socio = socios.buscaPorId(id);
		result.include("socio",socio);
		result.of(this).novo();
	}
	
	@Post
	@Transactional
	public void salvar(Socio socio){
		
		if(socio.getId()==null){
			socios.salva(socio);
		}else{
			socios.atualiza(socio);
		}
		
		result.redirectTo("list");
	}

}