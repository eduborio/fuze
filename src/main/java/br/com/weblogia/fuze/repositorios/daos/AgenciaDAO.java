package br.com.weblogia.fuze.repositorios.daos;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.persistence.Query;

import br.com.weblogia.fuze.domain.Agencia;
import br.com.weblogia.fuze.repositorios.AgenciaRepositorio;

@SuppressWarnings("unchecked")
@RequestScoped
public class AgenciaDAO extends DAO<Agencia> implements AgenciaRepositorio{

    public AgenciaDAO(){
        super(Agencia.class);
    }

    @Override
    public List<Agencia> buscaAgenciaPorNome(String nome) {
        StringBuilder hql = new StringBuilder();
        hql.append(" From Agencia agencia "); 
        hql.append(" where agencia.nome like :nome "); 


        hql.append(" order by agencia.nome ");


        Query query = entityManager.createQuery(hql.toString());
        query.setParameter("nome", "%" + nome + "%");


        return query.getResultList();
    }
}
