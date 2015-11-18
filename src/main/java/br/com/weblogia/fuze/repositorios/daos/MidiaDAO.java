package br.com.weblogia.fuze.repositorios.daos;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.persistence.Query;

import br.com.weblogia.fuze.domain.Midia;
import br.com.weblogia.fuze.repositorios.MidiaRepositorio;

@SuppressWarnings("unchecked")
@RequestScoped
public class MidiaDAO extends DAO<Midia> implements MidiaRepositorio{

    public MidiaDAO(){
        super(Midia.class);
    }

    @Override
    public List<Midia> buscaMidiaPorDescricao(String descricao) {
        StringBuilder hql = new StringBuilder();
        hql.append(" From Midia midia "); 
        hql.append(" where midia.descricao like :descricao "); 


        hql.append(" order by midia.descricao ");


        Query query = entityManager.createQuery(hql.toString());
        query.setParameter("descricao", "%" + descricao + "%");


        return query.getResultList();
    }
}
