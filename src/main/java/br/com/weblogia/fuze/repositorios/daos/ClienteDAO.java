package br.com.weblogia.fuze.repositorios.daos;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.persistence.Query;

import br.com.weblogia.fuze.domain.Cliente;
import br.com.weblogia.fuze.repositorios.ClienteRepositorio;

@SuppressWarnings("unchecked")
@RequestScoped
public class ClienteDAO extends DAO<Cliente> implements ClienteRepositorio{

    public ClienteDAO(){
        super(Cliente.class);
    }

    @Override
    public List<Cliente> buscaClientePorNome(String nome) {
        StringBuilder hql = new StringBuilder();
        hql.append(" From Cliente cliente "); 
        hql.append(" where cliente.nome like :nome "); 

        hql.append(" order by cliente.nome ");


        Query query = entityManager.createQuery(hql.toString());
        query.setParameter("nome", "%" + nome + "%");


        return query.getResultList();
    }
}
