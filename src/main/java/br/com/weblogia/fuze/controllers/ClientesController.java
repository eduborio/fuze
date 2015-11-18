package br.com.weblogia.fuze.controllers;

import javax.inject.Inject;
import javax.transaction.Transactional;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.weblogia.fuze.domain.Cliente;
import br.com.weblogia.fuze.repositorios.ClienteRepositorio;

@Controller
public class ClientesController {
	
	private @Inject  ClienteRepositorio clientes;
	private @Inject  Result result;
	
	public void list(int pagina){
		result.include("registros",clientes.buscaTotalDeRegistrosDaLista());
		result.include("pagina",pagina);
		result.include("clienteList",clientes.buscaTodos(pagina));
	}
	
	public void novo(){
		result.include("cliente",new Cliente());
	}
	
	@Path("/clientes/{id}")
	public void edit(Long id){
		Cliente cliente = clientes.buscaPorId(id);
		result.include("cliente",cliente);
		result.of(this).novo();
	}
	
	@Post
	@Transactional
	public void salvar(Cliente cliente){
		
		if(cliente.getId()==null){
			clientes.salva(cliente);
		}else{
			clientes.atualiza(cliente);
		}
		
		result.redirectTo("list");
	}
	
	
	

}