package br.com.weblogia.fuze.repositorios.daos;

import br.com.weblogia.fuze.autorizacao.PermissaoDeAcesso;
import br.com.weblogia.fuze.autorizacao.Recurso;
import br.com.weblogia.fuze.autorizacao.UserRole;
import br.com.weblogia.fuze.repositorios.PermissaoDeAcessoRepositorio;

import javax.enterprise.context.RequestScoped;
import javax.persistence.NoResultException;
import javax.persistence.Query;


@RequestScoped
public class PermissaoDeAcessoDAO extends DAO<PermissaoDeAcesso> implements PermissaoDeAcessoRepositorio{

    public PermissaoDeAcessoDAO(){
        super(PermissaoDeAcesso.class);
    }

	@Override
	public PermissaoDeAcesso buscaPorRoleERecurso(UserRole role, Recurso recurso) {
		StringBuilder jq = new StringBuilder();
		jq.append(" From PermissaoDeAcesso p ");
		jq.append(" where p.role.id = :roleId ");
		jq.append(" and p.recurso.id = :recursoId ");
		
		Query query = entityManager.createQuery(jq.toString());
		query.setParameter("roleId", role.getId());
		query.setParameter("recursoId", recurso.getId());
		
		PermissaoDeAcesso permissao = null;
		
		try{
			permissao = (PermissaoDeAcesso) query.getSingleResult();
		}catch(NoResultException e){
			return permissao; 
		}
		return permissao;
	}
}
