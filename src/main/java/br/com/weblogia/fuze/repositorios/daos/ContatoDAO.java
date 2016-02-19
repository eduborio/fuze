package br.com.weblogia.fuze.repositorios.daos;

import java.util.List;

import br.com.weblogia.fuze.controllers.Contato;
import br.com.weblogia.fuze.repositorios.ContatoRepositorio;

import javax.enterprise.context.RequestScoped;
import javax.persistence.Query;

@SuppressWarnings("unchecked")
@RequestScoped
public class ContatoDAO extends DAO<Contato> implements ContatoRepositorio{

    public ContatoDAO(){
        super(Contato.class);
    }

    @Override
    public List<Contato> buscaContatoPorNome(String nome) {
        StringBuilder hql = new StringBuilder();
        hql.append(" From Contato contato "); 
        hql.append(" where contato.nome like :nome "); 
        hql.append(" order by contato.nome ");

        Query query = entityManager.createQuery(hql.toString());
        query.setParameter("nome", "%" + nome + "%");

        return query.getResultList();
    }

	@Override
	public void remover(Contato contato) {
		entityManager.remove(contato);
	}
}
