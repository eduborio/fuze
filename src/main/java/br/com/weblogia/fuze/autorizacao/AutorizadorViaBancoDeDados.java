package br.com.weblogia.fuze.autorizacao;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.weblogia.fuze.repositorios.PermissaoDeAcessoRepositorio;
import br.com.weblogia.fuze.repositorios.RecursoRepositorio;

@RequestScoped
public class AutorizadorViaBancoDeDados implements Autorizador{

	private static final long serialVersionUID = -8150410651666565757L;

	private @Inject RecursoRepositorio recursos;
	private @Inject PermissaoDeAcessoRepositorio permissoes;

	@Override
	public boolean temPermicao(UserRole role, String url) {
		
		String coringa1 = urlCoringa(url,1);
		String coringa2 = urlCoringa(url,2);
		System.out.println(url);
		System.out.println(coringa1);
		System.out.println(coringa2);
		
		if(temPermissao(role,url))
			return true;
		
		if(temPermissao(role,coringa1))
			return true;
		
		if(temPermissao(role,coringa2))
			return true;
		
		return false;
		
		
	}

	private boolean temPermissao(UserRole role, String url) {
		Recurso recurso = recursos.buscaPorUrl(url);
		
		if(recurso==null)
			return false;
		
		if(role==null)
			return false;
		
		PermissaoDeAcesso permissao = permissoes.buscaPorRoleERecurso(role, recurso);
		
		if(permissao==null)
			return false;
		
		return permissao.isPermissao();
		
	}

	public RecursoRepositorio getRecursos() {
		return recursos;
	}

	public void setRecursos(RecursoRepositorio recursos) {
		this.recursos = recursos;
	}
	
	@SuppressWarnings("unused")
	private int contaBarras(String url){
		int result = 0;
		
		if(url!=null)
			result = url.length() - url.replace("/", "").length();
		
		return result;
	}
	
	private String urlCoringa(String url,int barrasPraCoringa){
		int index = 0;
		int indexSegundaBarra = 0;
		int cont = 0;
		
		
		for(char ch : url.toCharArray()){
			if(ch == '/')
				cont++;
			
			index++;	

			if(cont==barrasPraCoringa){
				indexSegundaBarra = index;
			}
		}
		
		return url.substring(0,indexSegundaBarra)+"/**";
	}
	
}
