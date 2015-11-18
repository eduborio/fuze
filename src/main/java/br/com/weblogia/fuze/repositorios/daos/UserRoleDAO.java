package br.com.weblogia.fuze.repositorios.daos;

import java.util.List;

import br.com.weblogia.fuze.autorizacao.UserRole;
import br.com.weblogia.fuze.repositorios.UserRoleRepositorio;

import javax.enterprise.context.RequestScoped;
import javax.persistence.Query;

@SuppressWarnings("unchecked")
@RequestScoped
public class UserRoleDAO extends DAO<UserRole> implements UserRoleRepositorio{

    public UserRoleDAO(){
        super(UserRole.class);
    }

    @Override
    public List<UserRole> buscaUserRolePorNome(String nome) {
        StringBuilder hql = new StringBuilder();
        hql.append(" From UserRole u "); 
        hql.append(" where u.nome like :nome "); 
        hql.append(" and u.empresa = :empresa ");


        hql.append(" order by u.nome ");


        Query query = entityManager.createQuery(hql.toString());
        query.setParameter("nome", "%" + nome + "%");

        return query.getResultList();
    }
}
