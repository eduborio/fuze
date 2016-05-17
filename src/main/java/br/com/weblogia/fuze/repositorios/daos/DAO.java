package br.com.weblogia.fuze.repositorios.daos;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import br.com.weblogia.fuze.autorizacao.Usuario;

public class DAO<T> {

	@Inject
	@PersistenceContext
	protected EntityManager entityManager;

	
	private final Class<T> classe;

	private @Inject Usuario usuario;

	public DAO(Class<T> classe) {
		this.classe = classe;
	}

	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	public void setUsuario(Usuario usuario){
		this.usuario = usuario;
	}
	
	public Usuario getUsuario(){
		return this.usuario;
	}
	
	public T buscaPorId(Long id) {

		T entity = entityManager.find(classe, id);
		return entity;

	}

	@Transactional
	public void salva(T t) {
		entityManager.persist(t);

	}

	@Transactional
	public void atualiza(T t) {
		entityManager.merge(t);
	}
	
	@SuppressWarnings("unchecked")
	public List<T> buscaTodos(int pagina) {


		StringBuilder jp = new StringBuilder();

		jp.append(" From ");
		jp.append(classe.getName());
		jp.append(" c ");
		
		jp.append(" order by c.id desc ");

		Query query = entityManager.createQuery(jp.toString());
		
		query.setFirstResult(pagina * 40);
		query.setMaxResults(40);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<T> buscaTodos() {

		StringBuilder jp = new StringBuilder();

		jp.append(" From ");
		jp.append(classe.getName());
		jp.append(" c ");
		jp.append(" where ");
		jp.append(" 1 = 1 ");
		
		jp.append(" order by c.id desc ");

		Query query = entityManager.createQuery(jp.toString());
		
		return query.getResultList();
	}

	public Long buscaTotalDeRegistrosDaLista() {

		StringBuilder jp = new StringBuilder();

		jp.append(" select ");
		jp.append("count(c.id) From ");
		jp.append(classe.getSimpleName());
		jp.append(" c ");
		
		Query query = entityManager.createQuery(jp.toString());
		
		return (Long) query.getSingleResult();
	}

	public EntityManager getEntityManager() {
		return this.entityManager;
	}

	
	
}