package br.com.weblogia.fuze.controllers;

import static br.com.caelum.vraptor.view.Results.json;

import javax.inject.Inject;
import javax.transaction.Transactional;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.weblogia.fuze.repositorios.ContatoRepositorio;

@Controller
public class ContatosController {
	
	private @Inject  ContatoRepositorio contatos;
	private @Inject  Result result;
	
	public void list(int pagina){
		result.include("registros",contatos.buscaTotalDeRegistrosDaLista());
		result.include("pagina",pagina);
		result.include("contatoList",contatos.buscaTodos(pagina));
	}
	
	public void novo(){
		result.include("contato",new Contato());
	}
	
	@Path("/contatos/{id}")
	public void edit(Long id){
		Contato contato = contatos.buscaPorId(id);
		result.include("contato",contato);
		result.of(this).novo();
	}
	
	@Post
	@Transactional
	public void salvar(Contato contato){
		
		if(contato.getId()==null){
			contatos.salva(contato);
		}else{
			contatos.atualiza(contato);
		}
		
		result.redirectTo("list");
	}
	
	@Post
	@Transactional
	public void salvarPeloNome(String nome){
				
		Contato contato = new Contato();
		contato.setNome(nome);
		contatos.salva(contato);
		
		result.use(json()).withoutRoot().
		from(contato).excludeAll().include("id","nome").
		serialize();
	}

}