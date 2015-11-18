package br.com.weblogia.fuze.repositorios.daos;

import java.util.List;

import br.com.weblogia.fuze.autorizacao.Usuario;
import br.com.weblogia.fuze.repositorios.UsuarioRepositorio;

import javax.enterprise.context.RequestScoped;
import javax.persistence.NoResultException;
import javax.persistence.Query;

@SuppressWarnings("unchecked")
@RequestScoped
public class UsuarioDAO extends DAO<Usuario> implements UsuarioRepositorio{

    public UsuarioDAO(){
        super(Usuario.class);
    }

    @Override
    public Usuario buscaUsuarioPorLogin(String login) {
        StringBuilder hql = new StringBuilder();
        hql.append(" From Usuario usuario "); 
        hql.append(" where usuario.login = :login "); 

        Query query = entityManager.createQuery(hql.toString());
        query.setParameter("login", login);
        
        Usuario usuario = null;
        
        try{
        	usuario = (Usuario) query.getSingleResult(); 
        }catch(NoResultException e){
        	return usuario;
        }

        return usuario;
    }

    @Override
    public List<Usuario> buscaUsuarioPorNome(String nome) {
        StringBuilder hql = new StringBuilder();
        hql.append(" From Usuario usuario "); 
        hql.append(" where usuario.nome like :nome "); 
        hql.append(" order by usuario.nome ");

        Query query = entityManager.createQuery(hql.toString());
        query.setParameter("nome", "%" + nome + "%");

        return query.getResultList();
    }
}
