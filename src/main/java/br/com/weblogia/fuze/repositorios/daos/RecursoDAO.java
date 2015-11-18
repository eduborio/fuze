package br.com.weblogia.fuze.repositorios.daos;


import javax.enterprise.context.RequestScoped;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import br.com.weblogia.fuze.autorizacao.Recurso;
import br.com.weblogia.fuze.repositorios.RecursoRepositorio;

@RequestScoped
public class RecursoDAO extends DAO<Recurso> implements RecursoRepositorio{

    public RecursoDAO(){
        super(Recurso.class);
    }

	@Override
	public Recurso buscaPorUrl(String url) {
		StringBuilder jq = new StringBuilder();
		jq.append(" From Recurso rec ");
		jq.append(" where rec.url = :url ");
		
		Query query = entityManager.createQuery(jq.toString());
		query.setParameter("url", url);
		
		Recurso recurso = null;
		
		try{
			recurso = (Recurso) query.getSingleResult();
		}catch(NoResultException e){
			return recurso; 
		}
		return recurso;
	}
}
