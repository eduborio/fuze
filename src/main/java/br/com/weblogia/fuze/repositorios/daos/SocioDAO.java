package br.com.weblogia.fuze.repositorios.daos;

import java.util.List;

import br.com.weblogia.fuze.domain.Socio;
import br.com.weblogia.fuze.repositorios.SocioRepositorio;

import javax.enterprise.context.RequestScoped;
import javax.persistence.Query;

@SuppressWarnings("unchecked")
@RequestScoped
public class SocioDAO extends DAO<Socio> implements SocioRepositorio{

    public SocioDAO(){
        super(Socio.class);
    }

    @Override
    public List<Socio> buscaSocioPorNome(String nome) {
        StringBuilder hql = new StringBuilder();
        hql.append(" From Socio socio "); 
        hql.append(" where socio.nome like :nome "); 


        hql.append(" order by socio.nome ");


        Query query = entityManager.createQuery(hql.toString());
        query.setParameter("nome", "%" + nome + "%");


        return query.getResultList();
    }
}
