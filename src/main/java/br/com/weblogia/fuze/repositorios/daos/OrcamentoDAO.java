package br.com.weblogia.fuze.repositorios.daos;

import java.util.List;

import br.com.weblogia.fuze.domain.Orcamento;
import br.com.weblogia.fuze.repositorios.OrcamentoRepositorio;

import javax.enterprise.context.RequestScoped;
import javax.persistence.Query;

@SuppressWarnings("unchecked")
@RequestScoped
public class OrcamentoDAO extends DAO<Orcamento> implements OrcamentoRepositorio{

    public OrcamentoDAO(){
        super(Orcamento.class);
    }

    @Override
    public List<Orcamento> buscaOrcamentoPorDescricao(String descricao) {
        StringBuilder hql = new StringBuilder();
        hql.append(" From Orcamento orcamento "); 
        hql.append(" where orcamento.descricao like :descricao "); 


        hql.append(" order by orcamento.descricao ");


        Query query = entityManager.createQuery(hql.toString());
        query.setParameter("descricao", "%" + descricao + "%");

        return query.getResultList();
    }
}
