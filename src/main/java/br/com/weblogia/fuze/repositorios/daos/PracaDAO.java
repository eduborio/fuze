package br.com.weblogia.fuze.repositorios.daos;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.persistence.Query;

import br.com.weblogia.fuze.domain.Praca;
import br.com.weblogia.fuze.repositorios.PracaRepositorio;

@SuppressWarnings("unchecked")
@RequestScoped
public class PracaDAO extends DAO<Praca> implements PracaRepositorio{

    public PracaDAO(){
        super(Praca.class);
    }

    @Override
    public List<Praca> buscaPracaPorDescricao(String descricao) {
        StringBuilder hql = new StringBuilder();
        hql.append(" From Praca praca "); 
        hql.append(" where praca.descricao like :descricao "); 


        hql.append(" order by praca.descricao ");


        Query query = entityManager.createQuery(hql.toString());
        query.setParameter("descricao", "%" + descricao + "%");


        return query.getResultList();
    }
}
