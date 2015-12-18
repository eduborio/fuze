package br.com.weblogia.fuze.controllers;

import static br.com.caelum.vraptor.view.Results.json;

import javax.inject.Inject;
import javax.transaction.Transactional;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.weblogia.fuze.domain.Agencia;
import br.com.weblogia.fuze.repositorios.AgenciaRepositorio;

@Controller
public class AgenciasController {
	
	private @Inject  AgenciaRepositorio agencias;
	private @Inject  Result result;
	
	public void list(int pagina){
		result.include("registros",agencias.buscaTotalDeRegistrosDaLista());
		result.include("pagina",pagina);
		result.include("agenciaList",agencias.buscaTodos(pagina));
	}
	
	public void novo(){
		result.include("agencia",new Agencia());
	}
	
	@Path("/agencias/{id}")
	public void edit(Long id){
		Agencia agencia = agencias.buscaPorId(id);
		result.include("agencia",agencia);
		result.of(this).novo();
	}
	
	@Post
	@Transactional
	public void salvar(Agencia agencia){
		
		if(agencia.getId()==null){
			agencias.salva(agencia);
		}else{
			agencias.atualiza(agencia);
		}
		
		result.redirectTo("list");
	}
	
	@Post
	@Transactional
	public void salvarPeloNome(String nome){
				
		Agencia agencia = new Agencia();
		agencia.setNome(nome);
		agencias.salva(agencia);
		
		result.use(json()).withoutRoot().
		from(agencia).excludeAll().include("id","nome").
		serialize();
	}

}